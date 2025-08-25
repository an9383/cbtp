package mes.web.em;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.em.EquipInspectBaseAdmVo;
import mes.domain.em.EquipPrdcInspectAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.em.EquipInspectBaseAdmService;
import mes.service.em.EquipPrdcInspectAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class EquipPrdcInspectAdmController {

	@Inject
	private EquipPrdcInspectAdmService equipPrdcInspctAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private EquipInspectBaseAdmService equipInspectBaseAdmService;
		
	private static final Logger logger = LoggerFactory.getLogger(EquipPrdcInspectAdmController.class);

	//설비일상점검 메인 페이지
	@RequestMapping(value = "/emsc0030", method = RequestMethod.GET)
	public String inspctResultGet(Model model, HttpServletRequest request) throws Exception {
		
		logger.info("설비일상점검 메인");
		String today = DateUtil.getToday("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();		
		cal.set(Integer.parseInt(today.substring(0,4)),Integer.parseInt(today.substring(5,7))-1,Integer.parseInt(today.substring(8,10)));
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		model.addAttribute("serverDate", today);
		model.addAttribute("lastDay", cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		
	//	systemCommonCodeVo.setBaseGroupCd("017"); // 설비그룹
	//	List<SystemCommonCodeVo> systemCommonCodeList = systemCommonCodeService.listAll(systemCommonCodeVo);
	//	model.addAttribute("equipGroup", systemCommonCodeList );
		
		commonCodeVo.setBaseGroupCd("057"); // 설비일상점검결과
		List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspctResult", commonCodeList );

		return "em/emsc0030";
	}
	
	
	//설비일상점검 목록 조회
	@RequestMapping(value = "/em/equipPrdcInspctDataListDtl", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipPrdcInspctDataListDtl(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("설비일상점검 빈 목록 조회" + equipPrdcInspectAdmVo);
		EquipInspectBaseAdmVo equipInspectBaseAdmVo = new EquipInspectBaseAdmVo();
		List<EquipInspectBaseAdmVo> equipInspectBaseAdmList = new ArrayList<EquipInspectBaseAdmVo>();
		try {			
			equipInspectBaseAdmVo.setEquipCd(equipPrdcInspectAdmVo.getEquipCd().toString());
			equipPrdcInspectAdmVo.setInspectRegDate(equipPrdcInspectAdmVo.getInspectRegDate() + String.format("%02d",equipPrdcInspectAdmVo.getInspectDay()));
			equipPrdcInspectAdmVo = equipPrdcInspctAdmService.read(equipPrdcInspectAdmVo);
			if(equipPrdcInspectAdmVo == null) {
				 equipInspectBaseAdmList = equipInspectBaseAdmService.listDtl(equipInspectBaseAdmVo);
			} else {
				
				EquipInspectBaseAdmVo equipInspectBaseAdmVo2 = new EquipInspectBaseAdmVo();
				if(equipPrdcInspectAdmVo.getInspectResult1() != null) {
					equipInspectBaseAdmVo2 = new EquipInspectBaseAdmVo();
					equipInspectBaseAdmVo2.setInspcetBase(equipPrdcInspectAdmVo.getInspectBase1().toString());
					equipInspectBaseAdmVo2.setInspcetItem(equipPrdcInspectAdmVo.getInspectItem1().toString());
					equipInspectBaseAdmVo2.setInspectResult(equipPrdcInspectAdmVo.getInspectResult1().toString());
					equipInspectBaseAdmList.add(equipInspectBaseAdmVo2);
				}
				if(equipPrdcInspectAdmVo.getInspectResult2() != null) {
					equipInspectBaseAdmVo2 = new EquipInspectBaseAdmVo();
					equipInspectBaseAdmVo2.setInspcetBase(equipPrdcInspectAdmVo.getInspectBase2().toString());
					equipInspectBaseAdmVo2.setInspcetItem(equipPrdcInspectAdmVo.getInspectItem2().toString());
					equipInspectBaseAdmVo2.setInspectResult(equipPrdcInspectAdmVo.getInspectResult2().toString());
					equipInspectBaseAdmList.add(equipInspectBaseAdmVo2);
				}
				if(equipPrdcInspectAdmVo.getInspectResult3() != null) {
					equipInspectBaseAdmVo2 = new EquipInspectBaseAdmVo();
					equipInspectBaseAdmVo2.setInspcetBase(equipPrdcInspectAdmVo.getInspectBase3().toString());
					equipInspectBaseAdmVo2.setInspcetItem(equipPrdcInspectAdmVo.getInspectItem3().toString());
					equipInspectBaseAdmVo2.setInspectResult(equipPrdcInspectAdmVo.getInspectResult3().toString());
					equipInspectBaseAdmList.add(equipInspectBaseAdmVo2);
				}
				if(equipPrdcInspectAdmVo.getInspectResult4() != null) {
					equipInspectBaseAdmVo2 = new EquipInspectBaseAdmVo();
					equipInspectBaseAdmVo2.setInspcetBase(equipPrdcInspectAdmVo.getInspectBase4().toString());
					equipInspectBaseAdmVo2.setInspcetItem(equipPrdcInspectAdmVo.getInspectItem4().toString());
					equipInspectBaseAdmVo2.setInspectResult(equipPrdcInspectAdmVo.getInspectResult4().toString());
					equipInspectBaseAdmList.add(equipInspectBaseAdmVo2);
				}
				if(equipPrdcInspectAdmVo.getInspectResult5() != null) {
					equipInspectBaseAdmVo2 = new EquipInspectBaseAdmVo();
					equipInspectBaseAdmVo2.setInspcetBase(equipPrdcInspectAdmVo.getInspectBase5().toString());
					equipInspectBaseAdmVo2.setInspcetItem(equipPrdcInspectAdmVo.getInspectItem5().toString());
					equipInspectBaseAdmVo2.setInspectResult(equipPrdcInspectAdmVo.getInspectResult5().toString());
					equipInspectBaseAdmList.add(equipInspectBaseAdmVo2);
				}
				if(equipPrdcInspectAdmVo.getInspectResult6() != null) {
					equipInspectBaseAdmVo2 = new EquipInspectBaseAdmVo();
					equipInspectBaseAdmVo2.setInspcetBase(equipPrdcInspectAdmVo.getInspectBase6().toString());
					equipInspectBaseAdmVo2.setInspcetItem(equipPrdcInspectAdmVo.getInspectItem6().toString());
					equipInspectBaseAdmVo2.setInspectResult(equipPrdcInspectAdmVo.getInspectResult6().toString());
					equipInspectBaseAdmList.add(equipInspectBaseAdmVo2);
				}
				if(equipPrdcInspectAdmVo.getInspectResult7() != null) {
					equipInspectBaseAdmVo2 = new EquipInspectBaseAdmVo();
					equipInspectBaseAdmVo2.setInspcetBase(equipPrdcInspectAdmVo.getInspectBase7().toString());
					equipInspectBaseAdmVo2.setInspcetItem(equipPrdcInspectAdmVo.getInspectItem7().toString());
					equipInspectBaseAdmVo2.setInspectResult(equipPrdcInspectAdmVo.getInspectResult7().toString());
					equipInspectBaseAdmList.add(equipInspectBaseAdmVo2);
				}
				if(equipPrdcInspectAdmVo.getInspectResult8() != null) {
					equipInspectBaseAdmVo2 = new EquipInspectBaseAdmVo();
					equipInspectBaseAdmVo2.setInspcetBase(equipPrdcInspectAdmVo.getInspectBase8().toString());
					equipInspectBaseAdmVo2.setInspcetItem(equipPrdcInspectAdmVo.getInspectItem8().toString());
					equipInspectBaseAdmVo2.setInspectResult(equipPrdcInspectAdmVo.getInspectResult8().toString());
					equipInspectBaseAdmList.add(equipInspectBaseAdmVo2);
				}				
			}
			
			logger.info("설비일상점검 빈 목록 조회" + equipInspectBaseAdmList);
			jsonData.put("data", equipInspectBaseAdmList);
			jsonData.put("result", "ok");
		}
		catch (Exception e) {
			logger.info("설비일상점검 빈 목록 조회 에러 발생");
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "fail");
		}

	
		return jsonData;
	}	
	
	//설비일상점검 목록 조회
	@RequestMapping(value = "/em/equipPrdcInspctDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipPrdcInspctDataList(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo1) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("설비일상점검 빈 목록 조회" + equipPrdcInspectAdmVo1);
		
		try {			
			List<EquipPrdcInspectAdmVo> equipPrdcInspectAdmList = equipPrdcInspctAdmService.listAll(equipPrdcInspectAdmVo1);
			logger.info("설비일상점검 빈 목록 조회" + equipPrdcInspectAdmList);
			jsonData.put("data", equipPrdcInspectAdmList);
			jsonData.put("result", "ok");
		}
		catch (Exception e) {
			logger.info("설비일상점검 빈 목록 조회 에러 발생");
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "fail");
		}

	
		return jsonData;
	}	
	
	
	//설비일상점검 상세 조회
	@RequestMapping(value = "/em/equipPrdcInspctAdmDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipPrdcInspctAdmDataList(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("설비일상점검 상세 조회");
		try {
			logger.info("설비일상점검 상세 조회");
			equipPrdcInspectAdmVo.setInspectRegDate(equipPrdcInspectAdmVo.getInspectRegDate() + String.format("%02d",equipPrdcInspectAdmVo.getInspectDay()));			
			equipPrdcInspectAdmVo = equipPrdcInspctAdmService.read(equipPrdcInspectAdmVo);		
			jsonData.put("data", equipPrdcInspectAdmVo);
			jsonData.put("result", "ok");
		}
		catch (Exception e) {
			logger.info("설비일상점검 상세 조회 에러 발생");
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "fail");
		}
		
		return jsonData;
	}
	
	//설비일상점검 등록
	@RequestMapping(value = "/em/equipPrdcInspctAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipPrdcInspctAdmCreate(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("설비일상점검 등록" + equipPrdcInspectAdmVo);
		try {
			equipPrdcInspectAdmVo.setRegId(Utils.getUserId());
			equipPrdcInspectAdmVo.setInspectRegDate(equipPrdcInspectAdmVo.getInspectRegDate() + String.format("%02d",equipPrdcInspectAdmVo.getInspectDay()));	
			equipPrdcInspctAdmService.delete(equipPrdcInspectAdmVo);
			equipPrdcInspctAdmService.create(equipPrdcInspectAdmVo);
			jsonData.put("result", "ok");
			
		} catch(Exception e) {
			logger.info("설비일상점검 등록 에러 발생");
			jsonData.put("result", "fail");
			jsonData.put("message", "시스템오류가 발생했습니다.");
			e.printStackTrace();
		}
		
		return jsonData;
	}
	
	//설비일상점검 수정
	@RequestMapping(value = "/em/equipPrdcInspctAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipPrdcInspctAdmUpdate(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("설비일상점검 수정");
		try {
			equipPrdcInspectAdmVo.setRegId(Utils.getUserId());
			equipPrdcInspectAdmVo.setInspectRegDate(equipPrdcInspectAdmVo.getInspectRegDate() + String.format("%02d",equipPrdcInspectAdmVo.getInspectDay()));		
			equipPrdcInspctAdmService.delete(equipPrdcInspectAdmVo);
			equipPrdcInspctAdmService.create(equipPrdcInspectAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			jsonData.put("result", "fail");
			jsonData.put("message", "시스템오류가 발생했습니다.");
			e.printStackTrace();
		}
		
		return jsonData;
	}
	
	
	
	
}