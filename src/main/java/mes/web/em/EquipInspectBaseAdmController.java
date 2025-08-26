package mes.web.em;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.em.EquipInspectBaseAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.EquipCodeAdmService;
import mes.service.em.EquipInspectBaseAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class EquipInspectBaseAdmController {

	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private EquipCodeAdmService equipCodeAdmService;
	
	@Inject
	private EquipInspectBaseAdmService equipInspectBaseAdmService;
		
	private static final Logger logger = LoggerFactory.getLogger(EquipInspectBaseAdmController.class);

	//설비일상점검 메인
	@RequestMapping(value = "/emsc0060", method = RequestMethod.GET)
	public String emsc0060GET(Model model, HttpServletRequest request) throws Exception {
		
		model.addAttribute("serverDateTo", DateUtil.getDay("yyyy-mm-dd", -6) );
		model.addAttribute("serverDateFrom", DateUtil.getToday("yyyy-mm-dd") );
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("056"); // 점검주기
		List<CommonCodeAdmVo> cycleList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("cycle", cycleList );
		
		commonCodeVo.setBaseGroupCd("030"); // 설비구분
		List<CommonCodeAdmVo> equipGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("equipGubunList", equipGubunList );
		
		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		List<EquipCodeAdmVo> equipCodeAdmList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipCodeList", equipCodeAdmList );
		logger.info("설비일상점검 메인");
		
		return "em/emsc0060";
	}
	
	//설비일상점검 조회
	@RequestMapping(value = "/em/equipInspectBaseAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipInspectBaseAdmList(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception {
		
		logger.info("설비일상점검 조회");
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		try {			
			List<EquipInspectBaseAdmVo> equipInspectBaseAdmList = equipInspectBaseAdmService.listAll(equipInspectBaseAdmVo);
			jsonData.put("result", "ok");
			jsonData.put("data", equipInspectBaseAdmList);
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;		
	}
	
	//설비일상점검 상세조회
	@RequestMapping(value = "/em/equipInspectBaseAdmReadAdm", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipInspectBaseAdmReadAdm(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception {
		
		logger.info("설비일상점검 상세조회");		
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		
		try {	
			equipInspectBaseAdmVo = equipInspectBaseAdmService.readAdm(equipInspectBaseAdmVo);					
			jsonData.put("data", equipInspectBaseAdmVo);
		
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;		
	}
	
	//설비일상점검 상세리스트 조회
	@RequestMapping(value = "/em/equipInspectBaseAdmReadDtl", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipInspectBaseAdmReadDtl(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception {
		
		logger.info("설비일상점검 상세리스트 조회");		
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		
		try {	
			List<EquipInspectBaseAdmVo> equipInspectBaseAdmList = equipInspectBaseAdmService.listDtl(equipInspectBaseAdmVo);					
			jsonData.put("data", equipInspectBaseAdmList);
		
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;		
	}
	
	
	//설비일상점검 Adm 등록
	@RequestMapping(value = "/em/equipInspectBaseAdmCreateAdm", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipInspectBaseAdmCreateAdm(@RequestBody List<Map<String, Object>> equipInspectBaseAdmList) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("설비 수리이력코드 등록");
		EquipInspectBaseAdmVo equipInspectBaseAdmVo = new EquipInspectBaseAdmVo();
		EquipInspectBaseAdmVo equipInspectBaseAdmVo2 = new EquipInspectBaseAdmVo();	
		try {			
			equipInspectBaseAdmVo.setEquipCd(equipInspectBaseAdmList.get(0).get("equipCd").toString());
			equipInspectBaseAdmVo2 = equipInspectBaseAdmService.readAdm(equipInspectBaseAdmVo);			
			if(equipInspectBaseAdmVo2 == null) {					
				int seq = Integer.parseInt(equipInspectBaseAdmService.inspcetSeq(equipInspectBaseAdmVo));			
				for(Map<String, Object> m : equipInspectBaseAdmList) {		
					equipInspectBaseAdmVo = new EquipInspectBaseAdmVo();
					
					equipInspectBaseAdmVo.setEquipCd(m.get("equipCd").toString());					
					equipInspectBaseAdmVo.setInspcetSeq(Integer.toString(seq));
					equipInspectBaseAdmVo.setInspcetItem(m.get("inspcetItem").toString());
					equipInspectBaseAdmVo.setInspcetBase(m.get("inspcetBase").toString());
					equipInspectBaseAdmVo.setRegId(Utils.getUserId());
					
					equipInspectBaseAdmService.createDtl(equipInspectBaseAdmVo);	
					seq++;
				}
				equipInspectBaseAdmVo.setEquipCd(equipInspectBaseAdmList.get(0).get("equipCd").toString());			
				equipInspectBaseAdmVo.setInspcetCycle(equipInspectBaseAdmList.get(0).get("inspcetCycle").toString());
				equipInspectBaseAdmVo.setInspcetDept(equipInspectBaseAdmList.get(0).get("inspcetDept").toString());
				equipInspectBaseAdmVo.setInspcetChargr(equipInspectBaseAdmList.get(0).get("inspcetChargr").toString());
				equipInspectBaseAdmVo.setInspcetDesc(equipInspectBaseAdmList.get(0).get("inspcetDesc").toString());
				equipInspectBaseAdmVo.setInspctRegDate(equipInspectBaseAdmList.get(0).get("inspctRegDate").toString());
				equipInspectBaseAdmService.createAdm(equipInspectBaseAdmVo);	
			
				jsonData.put("result", "ok");
			} else {
				jsonData.put("result", "fail");
				jsonData.put("message", "중복된 설비명 입니다.");
			}				
		
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	//설비일상점검 Adm 수정
	@RequestMapping(value = "/em/equipInspectBaseAdmUpdateAdm", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipInspectBaseAdmUpdateAdm(@RequestBody List<Map<String, Object>> equipInspectBaseAdmList) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("설비일상점검 Adm 수정");		
		try {	
			EquipInspectBaseAdmVo equipInspectBaseAdmVo = new EquipInspectBaseAdmVo();
			equipInspectBaseAdmVo.setEquipCd(equipInspectBaseAdmList.get(0).get("equipCd").toString());
			//equipInspectBaseAdmVo.setPrcssCd(equipInspectBaseAdmList.get(0).get("prcssCd").toString());
			equipInspectBaseAdmVo.setInspcetCycle(equipInspectBaseAdmList.get(0).get("inspcetCycle").toString());
			equipInspectBaseAdmVo.setInspcetDept(equipInspectBaseAdmList.get(0).get("inspcetDept").toString());
			equipInspectBaseAdmVo.setInspcetChargr(equipInspectBaseAdmList.get(0).get("inspcetChargr").toString());
			equipInspectBaseAdmVo.setInspcetDesc(equipInspectBaseAdmList.get(0).get("inspcetDesc").toString());
			equipInspectBaseAdmVo.setInspctRegDate(equipInspectBaseAdmList.get(0).get("inspctRegDate").toString());
			equipInspectBaseAdmVo.setUpdId(Utils.getUserId());
			equipInspectBaseAdmService.updateAdm(equipInspectBaseAdmVo);		
			equipInspectBaseAdmService.delete(equipInspectBaseAdmVo);	
			int seq = Integer.parseInt(equipInspectBaseAdmService.inspcetSeq(equipInspectBaseAdmVo));			
			for(Map<String, Object> m : equipInspectBaseAdmList) {		
				equipInspectBaseAdmVo = new EquipInspectBaseAdmVo();
				
				equipInspectBaseAdmVo.setEquipCd(m.get("equipCd").toString());				
				equipInspectBaseAdmVo.setInspcetSeq(Integer.toString(seq));
				equipInspectBaseAdmVo.setInspcetItem(m.get("inspcetItem").toString());
				equipInspectBaseAdmVo.setInspcetBase(m.get("inspcetBase").toString());
				equipInspectBaseAdmVo.setRegId(Utils.getUserId());
				
				equipInspectBaseAdmService.createDtl(equipInspectBaseAdmVo);	
				seq++;
			}
			jsonData.put("result", "ok");		
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}	
	
	//설비일상점검 dtl 수정
//	@RequestMapping(value = "/em/equipInspectBaseAdmUpdateDtl", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> equipInspectBaseAdmUpdateDtl(@RequestBody List<Map<String, Object>> equipInspectBaseAdmList) throws Exception {
//		
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info("설비일상점검 dtl 수정");		
//		try {				
//			EquipInspectBaseAdmVo equipInspectBaseAdmVo = new EquipInspectBaseAdmVo();
//			equipInspectBaseAdmVo.setEquipCd(equipInspectBaseAdmList.get(0).get("equipCd").toString());
//			equipInspectBaseAdmService.delete(equipInspectBaseAdmVo);	
//			int seq = Integer.parseInt(equipInspectBaseAdmService.inspcetSeq(equipInspectBaseAdmVo));			
//			for(Map<String, Object> m : equipInspectBaseAdmList) {		
//				equipInspectBaseAdmVo = new EquipInspectBaseAdmVo();
//				
//				equipInspectBaseAdmVo.setEquipCd(m.get("equipCd").toString());				
//				equipInspectBaseAdmVo.setInspcetSeq(Integer.toString(seq));
//				equipInspectBaseAdmVo.setInspcetItem(m.get("inspcetItem").toString());
//				equipInspectBaseAdmVo.setInspcetBase(m.get("inspcetBase").toString());
//				equipInspectBaseAdmVo.setRegId(Utils.getUserId());
//				
//				equipInspectBaseAdmService.createDtl(equipInspectBaseAdmVo);	
//				seq++;
//			}
//			jsonData.put("result", "ok");		
//		}catch(Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//	}	
	
	
	
}