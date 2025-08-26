
package mes.web.wm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.wm.AdvPlanScheduleVo;
import mes.service.wm.AdvPlanScheduleService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class APSController {
	private static final Logger logger = LoggerFactory.getLogger(APSController.class);
	
	@Inject
	private AdvPlanScheduleService advPlanScheduleService;

	// APS 제조실행계획(레이저) 페이지
	@RequestMapping(value = "/wmsc1000", method = RequestMethod.GET)
	public String wmsc1000(Locale locale, Model model) throws Exception {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc1000";
	}
	
	// APS 제조실행계획(후가공) 페이지
	@RequestMapping(value = "/wmsc2000", method = RequestMethod.GET)
	public String wmsc2000(Locale locale, Model model) throws Exception {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc2000";
	}

	// APS 제조실행계획(정밀가공) 페이지
	@RequestMapping(value = "/wmsc0400", method = RequestMethod.GET)
	public String wmsc0400(Locale locale, Model model) throws Exception {
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc0400";
	}
	
	// APS 미배정된 수주목록 조회
	@RequestMapping(value = "wm/advPlanScheduleNonAssignLst", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> advPlanScheduleNonAssignLst(AdvPlanScheduleVo advPlanScheduleVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("APS 미배정된 수주목록 조회 : "+advPlanScheduleVo);
		try {
			List<AdvPlanScheduleVo> advPlanScheduleVoList = advPlanScheduleService.advPlanScheduleNonAssignLst(advPlanScheduleVo);
			jsonData.put("data", advPlanScheduleVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// APS 기간별 목록조회
	@RequestMapping(value = "wm/advPlanScheduleLstByDate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> advPlanScheduleLstByDate(AdvPlanScheduleVo advPlanScheduleVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("APS 기간별 목록조회 : "+advPlanScheduleVo);
		try {
			List<AdvPlanScheduleVo> advPlanScheduleVoList = advPlanScheduleService.advPlanScheduleLstByDate(advPlanScheduleVo);
			jsonData.put("data", advPlanScheduleVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// APS 기간별 현황 목록조회
	@RequestMapping(value = "wm/advPlanScheduleStatusLstByDate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> advPlanScheduleStatusLstByDate(AdvPlanScheduleVo advPlanScheduleVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("APS 기간별 현황 목록조회 : "+advPlanScheduleVo);
		try {
			List<AdvPlanScheduleVo> advPlanScheduleVoList = advPlanScheduleService.advPlanScheduleStatusLstByDate(advPlanScheduleVo);
			jsonData.put("data", advPlanScheduleVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// APS 특정일자 목록조회
	@RequestMapping(value = "wm/advPlanScheduleLstOneByDate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> advPlanScheduleLstOneByDate(AdvPlanScheduleVo advPlanScheduleVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("APS 특정일자 목록조회 : "+advPlanScheduleVo);
		try {
			List<AdvPlanScheduleVo> advPlanScheduleVoList = advPlanScheduleService.advPlanScheduleLstOneByDate(advPlanScheduleVo);
			jsonData.put("data", advPlanScheduleVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// APS 특정기간에 존재하는 목록조회
	@RequestMapping(value = "wm/advPlanScheduleLstByStartEndDate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> advPlanScheduleLstByStartEndDate(AdvPlanScheduleVo advPlanScheduleVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("APS 특정기간에 존재하는 목록조회 : "+advPlanScheduleVo);
		try {
			List<AdvPlanScheduleVo> advPlanScheduleVoList = advPlanScheduleService.advPlanScheduleLstByStartEndDate(advPlanScheduleVo);
			jsonData.put("data", advPlanScheduleVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// APS 상세조회
	@RequestMapping(value = "wm/advPlanScheduleSel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> advPlanScheduleSel(AdvPlanScheduleVo advPlanScheduleVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("APS 상세조회 : "+advPlanScheduleVo);
		try {
			advPlanScheduleVo = advPlanScheduleService.advPlanScheduleSel(advPlanScheduleVo);
			jsonData.put("data", advPlanScheduleVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// APS 수정
	@RequestMapping(value = "wm/advPlanScheduleUpd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> advPlanScheduleUpd(AdvPlanScheduleVo advPlanScheduleVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("APS 수정 : "+advPlanScheduleVo);
		try {
			List<AdvPlanScheduleVo> advPlanScheduleVoUpdateList = new ArrayList<AdvPlanScheduleVo>();
			advPlanScheduleVo.setUpdId(Utils.getUserNumber());
			advPlanScheduleVoUpdateList.add(advPlanScheduleVo);
			advPlanScheduleService.advPlanScheduleUpd(advPlanScheduleVoUpdateList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// APS 등록/수정
	@RequestMapping(value = "wm/advPlanScheduleIU", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> advPlanScheduleIU(@RequestParam(value="jsonArray") String jsonString) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("APS 등록/수정");
		try {
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(jsonString);
			
			List<AdvPlanScheduleVo> advPlanScheduleVoInsertList = new ArrayList<AdvPlanScheduleVo>();
			List<AdvPlanScheduleVo> advPlanScheduleVoUpdateList = new ArrayList<AdvPlanScheduleVo>();
			for(int i=0;i<jsonArray.size();i++){
				jsonObj.put(i, jsonArray.get(i));
				JSONObject jsonObjDtl = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
				
				AdvPlanScheduleVo advPlanScheduleEmptyVo = new AdvPlanScheduleVo();
				advPlanScheduleEmptyVo.setIdx(jsonObjDtl.get("idx").toString());
				advPlanScheduleEmptyVo.setContDtlNo(jsonObjDtl.get("contDtlNo").toString());
				advPlanScheduleEmptyVo.setWorkOrdNo(jsonObjDtl.get("workOrdNo").toString());
				advPlanScheduleEmptyVo.setPlanEquipCd(jsonObjDtl.get("planEquipCd").toString());
				advPlanScheduleEmptyVo.setPlanQty(jsonObjDtl.get("planQty").toString());
				advPlanScheduleEmptyVo.setPlanStartDate(jsonObjDtl.get("planStartDate").toString());
				advPlanScheduleEmptyVo.setPlanEndDate(jsonObjDtl.get("planEndDate").toString());
				advPlanScheduleEmptyVo.setPlanState(jsonObjDtl.get("planState").toString());
				
				if(advPlanScheduleEmptyVo.getIdx() == null || advPlanScheduleEmptyVo.getIdx().equals("")) {
					advPlanScheduleEmptyVo.setRegId(Utils.getUserNumber());
					advPlanScheduleVoInsertList.add(advPlanScheduleEmptyVo);
				} else {
					advPlanScheduleEmptyVo.setUpdId(Utils.getUserNumber());
					advPlanScheduleVoUpdateList.add(advPlanScheduleEmptyVo);
				}
			};
			
			// APS 등록할 항목이 있을 경우
			if(advPlanScheduleVoInsertList.size() != 0) {
				advPlanScheduleService.advPlanScheduleIns(advPlanScheduleVoInsertList); // APS 등록
			}
			
			// APS 수정할 항목이 있을 경우
			if(advPlanScheduleVoUpdateList.size() != 0) {
				advPlanScheduleService.advPlanScheduleUpd(advPlanScheduleVoUpdateList); // APS 수정
			}
			
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// APS 삭제
	@RequestMapping(value = "wm/advPlanScheduleDel", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> advPlanScheduleDel(AdvPlanScheduleVo advPlanScheduleVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("APS 삭제 : "+advPlanScheduleVo);
		try {
			advPlanScheduleService.advPlanScheduleDel(advPlanScheduleVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}

