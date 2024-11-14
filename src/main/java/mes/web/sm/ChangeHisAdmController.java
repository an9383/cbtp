package mes.web.sm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.AttachDataVo;
import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.sm.ChangeHisAdmVo;
import mes.domain.sm.MatrlUserVo;
import mes.domain.sm.SystemAccessLogVo;
import mes.service.bm.AttachDataService;
import mes.service.bm.CommonCodeAdmService;
import mes.service.sm.ChangeHisAdmService;
import mes.service.sm.SystemAccessLogService;
import mes.web.bm.ItemPartAdmController;
import mes.web.cm.Constants;
import mes.web.sm.ChangeHisAdmController;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ChangeHisAdmController {
	
	@Inject
	private ChangeHisAdmService changeHisAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeService;
	
	@Inject
	private AttachDataService attachDataService;
	
	private static final Logger logger = LoggerFactory.getLogger(ChangeHisAdmController.class);
	
	//변경이력관리 사출 메인
	@RequestMapping(value = "/smsc0090", method = RequestMethod.GET)
	public String changeHisAdmMain(Model model) throws Exception {
		try {
			model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));		
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("144"); //변경관련표준
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> changeHisAdmList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("changeAdmStd", changeHisAdmList);
			model.addAttribute("changeAdmStdLength", changeHisAdmList.size());
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "sm/smsc0090";
	}
	
	//변경이력관리 봉제 메인
		@RequestMapping(value = "/smsc0100", method = RequestMethod.GET)
		public String changeHisAdmMain2(Model model) throws Exception {
			try {
				model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
				model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
				model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));		
				
				CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
				
				commonCodeVo.setBaseGroupCd("144"); //변경관련표준
				commonCodeVo.setUseYn("001");
				List<CommonCodeAdmVo> changeHisAdmList = commonCodeService.CommonCodeList(commonCodeVo);
				model.addAttribute("changeAdmStd", changeHisAdmList);
				model.addAttribute("changeAdmStdLength", changeHisAdmList.size());
			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "sm/smsc0100";
		}
	
	//List
	@RequestMapping(value="sm/changeHisAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> changeHisAdmList(ChangeHisAdmVo changeHisAdmVo) throws Exception{
	    Map<String, Object> jsonData = new HashMap<String, Object>();
	    try {
	        List<ChangeHisAdmVo> changeHisAdmList = changeHisAdmService.changeHisAdmList(changeHisAdmVo);
	        jsonData.put("data", changeHisAdmList);
	        jsonData.put("result", "ok");
	    } catch (Exception e) {
	        e.printStackTrace();
	        jsonData.put("result", "error");
	        jsonData.put("message", Utils.getErrorMessage());
	    }
	    return jsonData;
	}

	//Read - 마스터
	@RequestMapping(value="sm/changeHisAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> changeHisAdmRead(ChangeHisAdmVo changeHisAdmVo) throws Exception{
	    Map<String, Object> jsonData = new HashMap<String, Object>();
	    try {
	        changeHisAdmVo = changeHisAdmService.changeHisAdmRead(changeHisAdmVo);
	        jsonData.put("data", changeHisAdmVo);
	        jsonData.put("result", "ok");
	    } catch (Exception e) {
	        e.printStackTrace();
	        jsonData.put("result", "error");
	        jsonData.put("message", Utils.getErrorMessage());
	    }
	    return jsonData;
	}
	
	//Create - 마스터
	@RequestMapping(value="sm/changeHisAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> changeHisAdmCreate(ChangeHisAdmVo changeHisAdmVo) throws Exception{
	    Map<String, Object> jsonData = new HashMap<String, Object>();
	    try {
	        changeHisAdmVo.setRegId(Utils.getUserNumber());
	        String mstIdx = changeHisAdmService.changeHisAdmCreate(changeHisAdmVo);
	        jsonData.put("result", "ok");
	        jsonData.put("mstIdx", mstIdx);
	    } catch (Exception e) {
	        e.printStackTrace();
	        jsonData.put("result", "error");
	        jsonData.put("message", Utils.getErrorMessage());
	    }
	    return jsonData;
	}

	//Create - 서브
	@RequestMapping(value="sm/changeHisAdmSubCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> changeHisAdmSubCreate(ChangeHisAdmVo changeHisAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			changeHisAdmVo.setRegId(Utils.getUserNumber());
			changeHisAdmService.changeHisAdmSubCreate(changeHisAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//Update - 마스터
	@RequestMapping(value="sm/changeHisAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> changeHisAdmUpdate(ChangeHisAdmVo changeHisAdmVo) throws Exception{
	    Map<String, Object> jsonData = new HashMap<String, Object>();
	    try {
	        changeHisAdmVo.setUpdId(Utils.getUserNumber());
	        changeHisAdmService.changeHisAdmUpdate(changeHisAdmVo);
	        jsonData.put("result", "ok");
	    } catch (Exception e) {
	        e.printStackTrace();
	        jsonData.put("result", "error");
	        jsonData.put("message", Utils.getErrorMessage());
	    }
	    return jsonData;
	}

	//Update - 서브
	@RequestMapping(value="sm/changeHisAdmSubUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> changeHisAdmSubUpdate(ChangeHisAdmVo changeHisAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			if (changeHisAdmService.changeHisAdmSubRead(changeHisAdmVo) != null) {
				changeHisAdmVo.setUpdId(Utils.getUserNumber());
				changeHisAdmService.changeHisAdmSubUpdate(changeHisAdmVo);
			} else {
				changeHisAdmVo.setRegId(Utils.getUserNumber());
				changeHisAdmService.changeHisAdmSubCreate(changeHisAdmVo);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//Delete - 전체
	@RequestMapping(value="sm/changeHisAdmDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> changeHisAdmDelete(ChangeHisAdmVo changeHisAdmVo, AttachDataVo attachDataVo) throws Exception{
	    Map<String, Object> jsonData = new HashMap<String, Object>();
	    try {
	    	//Delete - 마스터
	    	changeHisAdmService.changeHisAdmDelete(changeHisAdmVo);

	    	//Delete - 서브
	        changeHisAdmService.changeHisAdmSubDelete(changeHisAdmVo);
	        
	        //첨부파일 삭제
	        attachDataService.attachDataDelete(attachDataVo);
	        
	        jsonData.put("result", "ok");
	    } catch (Exception e) {
	        e.printStackTrace();
	        jsonData.put("result", "error");
	        jsonData.put("message", Utils.getErrorMessage());
	    }
	    return jsonData;
	}
	
}
