package mes.web.sm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.sm.MatrlUserVo;
import mes.domain.sm.MenuInfoAdmVo;
import mes.domain.sm.MenuAuthVo;
import mes.service.sm.MatrlUserService;
import mes.service.sm.MenuInfoAdmService;
import mes.web.ut.Utils;

@Controller
public class MenuInfoAdmController {
	
	
	@Inject
	private MenuInfoAdmService menuInfoAdmService;
	@Inject
	private MatrlUserService matrlUserService;
	//smsc0020 화면
	private static final Logger logger = LoggerFactory.getLogger(MenuInfoAdmController.class);
	
	@RequestMapping(value = "/smsc0020", method = RequestMethod.GET)
	public String matrlUserMain(Model model) throws Exception {		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userDepart", Utils.getUserDepartmentNm());
		return "sm/smsc0020";
	}
	
	//상위메뉴 목록 조회
	@RequestMapping(value = "/sm/menuInfoDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> menuInfoDataList(MenuInfoAdmVo menuInfoAdmVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("상위메뉴 목록조회");
		List<MenuInfoAdmVo> menuInfoData = menuInfoAdmService.readUpperMenu(menuInfoAdmVo);
		jsonData.put("data", menuInfoData);
		
		return jsonData;
	}
	
	//하위메뉴 목록 조회
	@RequestMapping(value = "/sm/subMenuInfoDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> subMenuInfoDataList(MenuInfoAdmVo menuInfoAdmVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("하위메뉴 목록조회");
		menuInfoAdmVo.setUpperMenuId(menuInfoAdmVo.getMenuId());
		List<MenuInfoAdmVo> subMenuInfoData = menuInfoAdmService.readSubMenu(menuInfoAdmVo);
				
		jsonData.put("data", subMenuInfoData);
		
		return jsonData;
	}
	
	//목록 업데이트(수정)
	@RequestMapping(value = "/sm/menuInfoOrderUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> menuInfoOrderUpdate(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		MenuInfoAdmVo menuInfoAdmVo = new MenuInfoAdmVo();
		try {
			for(Map<String, Object> m :list) {
				menuInfoAdmVo.setMenuId(m.get("menuId").toString());
				menuInfoAdmVo.setUpperMenuId(m.get("upperMenuId").toString());
				menuInfoAdmVo.setMenuNm(m.get("menuNm").toString());
				menuInfoAdmVo.setMenuPath(m.get("menuPath").toString());
				menuInfoAdmVo.setMenuOrder(m.get("menuOrder").toString());
				menuInfoAdmVo.setUseYn(m.get("useYn").toString());
				menuInfoAdmVo.setUpdId(Utils.getUserNumber());		
				menuInfoAdmVo.setBeforeMenuId(m.get("beforeMenuId").toString());		
				menuInfoAdmService.update(menuInfoAdmVo);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}
		
		return jsonData;
		
	}

	//목록 업데이트(수정)
	@RequestMapping(value = "/sm/menuInfoUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> menuInfoUpdate(MenuInfoAdmVo menuInfoAdmVo, MatrlUserVo matrlUserVo, MenuAuthVo menuAuthVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("vo:"+menuInfoAdmVo);
		//menuInfoAdmVo.setMenuId(menuInfoAdmService.selectMenuIdSeq().toString());
		MenuInfoAdmVo updateCheckVo = new MenuInfoAdmVo(); 
		 updateCheckVo = menuInfoAdmService.updateCheck(menuInfoAdmVo);
		 if(updateCheckVo.getUpdateCheckCnt() != 0 && ( !menuInfoAdmVo.getMenuId().equals(menuInfoAdmVo.getBeforeMenuId()) ) ) { 
			 //예외처리
			 jsonData.put("message","동일한 메뉴ID가 존재합니다!");
			 jsonData.put("result","fail");
		 } else {
		 
			menuInfoAdmVo.setUpdId("updId");		
			menuInfoAdmService.update(menuInfoAdmVo);
			jsonData.put("result", "ok");
		}
		//TB_MENU_AUTH에 있는 정보 지우기 
		/*
		 * if(menuInfoAdmVo.getUseYn().equals("Y")) { matrlUserVo.setAdminCheck("Y"); //
		 * 조회할때 관리자 계정으로 선택된것의 DEPARTMENT_CD를 찾기위해 강제로 set MatrlUserVo userVo =
		 * matrlUserService.adminRead(matrlUserVo);
		 * menuInfoAdmVo.setUserNumber(userVo.getDepartmentCd());
		 * 
		 * menuInfoAdmService.menuAuthDelete(menuInfoAdmVo); //TB_MENU_AUTH에서 권한 삭제 }
		 * else {
		 * 
		 * menuAuthVo.setMenuId(menuInfoAdmVo.getMenuId());
		 * menuAuthVo.setDepartmentCd(menuInfoAdmVo.getUserNumber());
		 * menuAuthVo.setUserNumber("kkkk"); menuAuthVo.setUseYnCd("Y");
		 * menuAuthVo.setRegId(Utils.getUserId());
		 * menuAuthVo.setUpdId(Utils.getUserId());
		 * menuInfoAdmService.menuAuthCreate(menuAuthVo); }
		 */
		
		return jsonData;
	}
	
	//목록 등록
	@RequestMapping(value = "/sm/menuInfoCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> menuInfoCreate(MenuInfoAdmVo menuInfoAdmVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("등록");
		menuInfoAdmVo.setMenuOrder(menuInfoAdmService.menuInfoAdmSelByMenuOrder(menuInfoAdmVo));	//메뉴순서
		menuInfoAdmVo.setRegId("regId");
		menuInfoAdmVo.setUpdId("updId");
		menuInfoAdmService.create(menuInfoAdmVo);
		jsonData.put("result", "ok");
		return jsonData;
	
	}		
	
	//메뉴ID 생성
	@RequestMapping(value = "/sm/menuIdCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> menuIdCreate(ModelAndView mav) throws Exception {
		
		String seq = menuInfoAdmService.selectMenuIdSeq().toString();
		MenuInfoAdmVo menuInfoAdmVo = new MenuInfoAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		menuInfoAdmVo.setMenuId(seq);
		
		jsonData.put("data", menuInfoAdmVo);	
		
		return jsonData;
	
	}	
	
	// 메뉴 삭제
	@RequestMapping(value = "sm/menuInfoDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> menuInfoDelete(MenuInfoAdmVo menuInfoAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("메뉴 삭제");
		try {
			menuInfoAdmService.menuInfoDelete(menuInfoAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("메뉴 삭제 오류");
			e.printStackTrace();
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	
	
}
