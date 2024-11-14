package mes.web.po;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.po.WorkOrderEquipDailyCheckVo;
import mes.service.bm.EquipCodeAdmService;
import mes.service.po.WorkOrderEquipDailyCheckService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class WorkOrderEquipDailyCheckController {

	@Inject
	private WorkOrderEquipDailyCheckService checkService;

	@Inject
	private EquipCodeAdmService equipCodeAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(WorkOrderEquipDailyCheckController.class);
	
	// 설비일상점검현황
	@RequestMapping(value = "/posc0040", method = RequestMethod.GET)
	public String posc0040(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		
		EquipCodeAdmVo equipVo = new EquipCodeAdmVo();
		equipVo.setMainGubun("001");	//설비
		equipVo.setPrcNm("002");		//사출
		equipVo.setEquipGubun("001");	//주생산설비
		List<EquipCodeAdmVo> List = equipCodeAdmService.equipCodeAdmList(equipVo);
		model.addAttribute("equipList", List);
		
		return "po/posc0040";
	}
		
		
	
	//일상점검 목록조회
	@RequestMapping(value = "po/workOrderEquipDailyCheckList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> listAll(WorkOrderEquipDailyCheckVo checkVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			List<WorkOrderEquipDailyCheckVo> list =  checkService.listAll(checkVo);
			jsonData.put("result", "ok");
			jsonData.put("data", list);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	
	//일상점검 상세조회
	@RequestMapping(value = "po/workOrderEquipDailyCheckRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> read(WorkOrderEquipDailyCheckVo checkVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			WorkOrderEquipDailyCheckVo readVo =  checkService.read(checkVo);
			jsonData.put("result", "ok");
			jsonData.put("checkPass", readVo.getCheckPass());
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//일상점검 설비별 목록조회
	@RequestMapping(value = "po/workOrderEquipDailyCheckByEquipCd", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderEquipDailyCheckByEquipCd(WorkOrderEquipDailyCheckVo checkVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<WorkOrderEquipDailyCheckVo> list =  checkService.workOrderEquipDailyCheckByEquipCd(checkVo);
			jsonData.put("result", "ok");
			jsonData.put("data", list);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//일상점검 총 점검
	@RequestMapping(value = "po/getTotalPass", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getTotalPass(WorkOrderEquipDailyCheckVo checkVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			WorkOrderEquipDailyCheckVo passVo = new WorkOrderEquipDailyCheckVo();
			//설비
			checkVo.setMainGubun("001");
			passVo =  checkService.getTotalPass(checkVo);
			logger.info("vo"+passVo);
			jsonData.put("equipTotalPass", passVo.getTotalPass());
	
			//금형
			checkVo.setMainGubun("002");
			passVo =  checkService.getTotalPass(checkVo);
			logger.info("vo"+passVo);
			jsonData.put("moldTotalPass", passVo.getTotalPass());
			
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	//일상점검 변경
	@RequestMapping(value = "po/equipCheckChange", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCheckChange(@RequestBody List<Map<String, Object>> list) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderEquipDailyCheckVo vo = new WorkOrderEquipDailyCheckVo();
		try {
			
			vo.setWorkOrdNo(list.get(0).get("workOrdNo").toString());
			vo.setMainGubun(list.get(0).get("mainGubun").toString());
			vo.setEquipCd(list.get(0).get("equipCd").toString());
			
			for(Map<String, Object> m : list) {
				
				vo.setCheckSeq(m.get("checkSeq").toString());
				vo.setCheckPass(m.get("checkPass").toString());
				vo.setCheckResult(m.get("checkResult").toString());
				vo.setCheckDate(DateUtil.getToday("yyyymmdd"));
				vo.setCheckChargr(Utils.getUserNumber());
				
				WorkOrderEquipDailyCheckVo readVo =  checkService.read(vo);
				if(readVo==null) {
					vo.setToday(DateUtil.getToday("yyyymmdd"));
					vo.setDcNo(vo.getToday()+"-"+checkService.getDcNo(vo));
					vo.setRegId(Utils.getUserNumber());
					checkService.create(vo);
					
				}else {
					vo.setDcNo(readVo.getDcNo());
					vo.setUpdId(Utils.getUserNumber());
					checkService.update(vo);
				}
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	
	
}
