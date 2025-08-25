package mes.web.bs;

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

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bs.AchieveAdmVo;
import mes.domain.bs.ObjectiveAdmVo;
import mes.domain.po.WorkOrderVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bs.ObjectiveAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
@RequestMapping
public class ObjectiveAdmController {
	
	@Inject
	private ObjectiveAdmService objectiveAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(ObjectiveAdmController.class);
	
	@RequestMapping(value="/bssc0010",method = RequestMethod.GET)
	public String bssc0010(Model model) throws Exception{
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("069"); // KPI
		List<CommonCodeAdmVo> kpiList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("kpiCode", kpiList);
		
		return "bs/bssc0010";
	};
	
	//목표관리 목록 조회
	@RequestMapping(value = "bs/objectiveAdmDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> objectiveAdmDataList(ObjectiveAdmVo objectiveAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("목표관리 목록 조회: " + objectiveAdmVo);
		try {
			
			List<ObjectiveAdmVo> list = objectiveAdmService.listAll(objectiveAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
			);
		}
		return jsonData;
	}
	
	//목표관리 모달 조회
	@RequestMapping(value = "bs/objectiveAdmReadDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> objectiveAdmReadDataList(ObjectiveAdmVo objectiveAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("목표관리 모달 조회: " + objectiveAdmVo);
		try {
			
			List<ObjectiveAdmVo> list = objectiveAdmService.read(objectiveAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
			);
		}
		return jsonData;
	}
	
	// 목표관리 등록
	@RequestMapping(value = "bs/objectiveAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> objectiveAdmCreate(@RequestBody List<Map<String, Object>> objectiveAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ObjectiveAdmVo objectiveAdmVo = new ObjectiveAdmVo();
		logger.info("목표관리 등록: " + objectiveAdmList);
		try {		
			objectiveAdmVo.setObjYear(objectiveAdmList.get(0).get("objYear").toString());
			objectiveAdmVo.setObjGubun(objectiveAdmList.get(0).get("objGubun").toString());
			objectiveAdmService.delete(objectiveAdmVo);
			for(Map<String, Object> m : objectiveAdmList) {		
				objectiveAdmVo = new ObjectiveAdmVo();
				objectiveAdmVo.setObjYear(m.get("objYear").toString());
				objectiveAdmVo.setKpi(m.get("kpi").toString());
				objectiveAdmVo.setObjGubun(m.get("objGubun").toString());
				objectiveAdmVo.setWeight(m.get("weight").toString());
				objectiveAdmVo.setRegId(Utils.getUserId());
				
				objectiveAdmVo.setObjMonth("01");
				objectiveAdmVo.setObjQty(m.get("jan").toString());
				objectiveAdmService.create(objectiveAdmVo);
				objectiveAdmVo.setObjMonth("02");
				objectiveAdmVo.setObjQty(m.get("feb").toString());
				objectiveAdmService.create(objectiveAdmVo);
				objectiveAdmVo.setObjMonth("03");
				objectiveAdmVo.setObjQty(m.get("mar").toString());
				objectiveAdmService.create(objectiveAdmVo);
				objectiveAdmVo.setObjMonth("04");
				objectiveAdmVo.setObjQty(m.get("apr").toString());
				objectiveAdmService.create(objectiveAdmVo);
				objectiveAdmVo.setObjMonth("05");
				objectiveAdmVo.setObjQty(m.get("may").toString());
				objectiveAdmService.create(objectiveAdmVo);
				objectiveAdmVo.setObjMonth("06");
				objectiveAdmVo.setObjQty(m.get("jun").toString());
				objectiveAdmService.create(objectiveAdmVo);
				objectiveAdmVo.setObjMonth("07");
				objectiveAdmVo.setObjQty(m.get("jul").toString());
				objectiveAdmService.create(objectiveAdmVo);
				objectiveAdmVo.setObjMonth("08");
				objectiveAdmVo.setObjQty(m.get("aug").toString());
				objectiveAdmService.create(objectiveAdmVo);
				objectiveAdmVo.setObjMonth("09");
				objectiveAdmVo.setObjQty(m.get("sep").toString());
				objectiveAdmService.create(objectiveAdmVo);
				objectiveAdmVo.setObjMonth("10");
				objectiveAdmVo.setObjQty(m.get("oct").toString());
				objectiveAdmService.create(objectiveAdmVo);
				objectiveAdmVo.setObjMonth("11");
				objectiveAdmVo.setObjQty(m.get("nov").toString());
				objectiveAdmService.create(objectiveAdmVo);
				objectiveAdmVo.setObjMonth("12");
				objectiveAdmVo.setObjQty(m.get("dec").toString());
				objectiveAdmService.create(objectiveAdmVo);
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


