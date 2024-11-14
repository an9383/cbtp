package mes.web.wm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.ItemPartAdmVo;
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.io.ItemUnitcostHisAdmVo;
import mes.domain.wm.DailyWorkPlanAdmVo;
import mes.service.wm.DailyWorkPlanAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class DailyWorkPlanAdmController {

private static final Logger logger = LoggerFactory.getLogger(DailyWorkPlanAdmController.class);

	
	@Inject
	private DailyWorkPlanAdmService dailyWorkPlanAdmService;
	
	//일일작업계획 상세조회
	@RequestMapping(value = "wm/dailyWorkPlanAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> dailyWorkPlanAdmRead(DailyWorkPlanAdmVo dailyWorkPlanAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("일일작업계획 상세조회"+dailyWorkPlanAdmVo);
		try {
			
			List<DailyWorkPlanAdmVo> list = dailyWorkPlanAdmService.dailyWorkPlanAdmRead(dailyWorkPlanAdmVo);
			
			if(list==null || list.size()==0) {
				list = new ArrayList<DailyWorkPlanAdmVo>();
			}
			
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
	
	@RequestMapping(value = "wm/dailyWorkPlanAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dailyWorkPlanAdmCreate(@RequestBody List<Map<String, Object>> dailyWorkPlanAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		DailyWorkPlanAdmVo dailyWorkPlanAdmVo = new DailyWorkPlanAdmVo();
		
		logger.info("일일작업계획 등록 : "+dailyWorkPlanAdmVo);   
		 
		try {
			dailyWorkPlanAdmVo.setWorkOrdNo(dailyWorkPlanAdmList.get(0).get("workOrdNo").toString());
			
			dailyWorkPlanAdmService.dailyWorkPlanAdmDelete(dailyWorkPlanAdmVo);
			
			for(Map<String, Object> m : dailyWorkPlanAdmList) {
				
				dailyWorkPlanAdmVo.setMiddlePrcssCd(m.get("middlePrcssCd").toString());
				dailyWorkPlanAdmVo.setMinorPrcssCd(m.get("minorPrcssCd").toString());
				dailyWorkPlanAdmVo.setDailyWorkChargr(m.get("dailyWorkChargr").toString());
				dailyWorkPlanAdmVo.setDailyWorkDate(m.get("dailyWorkDate").toString());
				dailyWorkPlanAdmVo.setDailyWorkDesc(m.get("dailyWorkDesc").toString());
				dailyWorkPlanAdmVo.setRegId(Utils.getUserId());
				
				dailyWorkPlanAdmService.dailyWorkPlanAdmCreate(dailyWorkPlanAdmVo);
				logger.info("일일작업계획 등록 : "+dailyWorkPlanAdmVo);   
				
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
