package mes.web.po;

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
import org.springframework.web.context.annotation.RequestScope;

import mes.domain.po.WorkOrderFuzzVo;
import mes.service.po.WorkOrderFuzzService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class WorkOrderFuzzController {

	@Inject
	private WorkOrderFuzzService workOrderFuzzService;
	
	private static final Logger logger = LoggerFactory.getLogger(WorkOrderFuzzController.class);
	
	//퍼즈기록일지 목록조회
	@RequestMapping(value = "/po/workOrderFuzzList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderFuzzList(WorkOrderFuzzVo workOrderFuzzVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("퍼지기록일지 목록조회: "+workOrderFuzzVo);
		try {
			List<WorkOrderFuzzVo> list = workOrderFuzzService.workOrderFuzzList(workOrderFuzzVo);
			logger.info("list:"+list);
			
			jsonData.put("result", "ok");
			jsonData.put("data", list);
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	// 퍼징기록일지 등록
	@RequestMapping(value = "/po/workOrderFuzzCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workOrderFuzzCreate( @RequestBody List<Map<String, Object>> workOrderFuzzList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderFuzzVo fuzzVo = new WorkOrderFuzzVo();
		try {
			
			if(workOrderFuzzList.size()>0) {
				fuzzVo.setWorkOrdNo(workOrderFuzzList.get(0).get("workOrdNo").toString());
				
				for (Map<String, Object> m : workOrderFuzzList) {
					fuzzVo.setWorkOrdNo(m.get("workOrdNo").toString());
					fuzzVo.setFuzzNum(m.get("fuzzNum").toString());
					fuzzVo.setFuzzGubun(m.get("fuzzGubun").toString());
					fuzzVo.setFuzzStartTime(m.get("fuzzStartTime").toString());
					fuzzVo.setFuzzEndTime(m.get("fuzzEndTime").toString());
					fuzzVo.setFuzzCnt(m.get("fuzzCnt").toString());
					
					if(workOrderFuzzService.workOrderFuzzRead(fuzzVo)!=null) {
						workOrderFuzzService.workOrderFuzzUpdate(fuzzVo);
					}else {
						workOrderFuzzService.workOrderFuzzCreate(fuzzVo);
					}
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
	
	//퍼즈기록일지 총 퍼징횟수
	@RequestMapping(value = "/po/getTotalFuzzCnt", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getTotalFuzzCnt(WorkOrderFuzzVo workOrderFuzzVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("퍼지기록일지 목록조회: "+workOrderFuzzVo);
		try {
			String totalFuzzCnt = workOrderFuzzService.getTotalFuzzCnt(workOrderFuzzVo);
			
			jsonData.put("result", "ok");
			jsonData.put("data", totalFuzzCnt);
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//퍼징/런너 이력관리 조회
	@RequestMapping(value = "/po/frHistAdmRead" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> frHistAdmRead(WorkOrderFuzzVo workOrderFuzzVo)throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			workOrderFuzzVo.setFrHistGb("F");
			WorkOrderFuzzVo vo = workOrderFuzzService.frHistAdmRead(workOrderFuzzVo);
			if(vo!=null) {
				jsonData.put("fuzzQty",vo.getFrHistCnt());
			}else {
				jsonData.put("fuzzQty",0);
			}
			
			workOrderFuzzVo.setFrHistGb("R");
			vo = workOrderFuzzService.frHistAdmRead(workOrderFuzzVo);
			if(vo!=null) {
				jsonData.put("runnerQty",vo.getFrHistCnt());
			}else {
				jsonData.put("runnerQty",0);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//퍼징/런너 이력관리 등록
	@RequestMapping(value = "/po/frHistAdmCreate" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> frHistAdmCreate(WorkOrderFuzzVo workOrderFuzzVo)throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			workOrderFuzzVo.setToday(DateUtil.getToday("yyyymmdd"));
			String frHistNo = workOrderFuzzService.getFrHistNo(workOrderFuzzVo);
			int frHistSq = workOrderFuzzService.getFrHistSq(workOrderFuzzVo);
			
			workOrderFuzzVo.setFrHistNo(DateUtil.getToday("yyyymmdd")+"-"+frHistNo);
			workOrderFuzzVo.setFrHistSq(Integer.toString(frHistSq));
			workOrderFuzzVo.setRegId(Utils.getUserNumber());
			workOrderFuzzService.frHistAdmCreate(workOrderFuzzVo);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	
}
