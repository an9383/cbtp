package mes.web.mt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.poi.xddf.usermodel.text.CapsType;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.mt.FinishOperInfoVo;
import mes.domain.po.WorkOrderAdmVo;
import mes.service.mt.FinishOperInfoService;
import mes.service.po.WorkOrderAdmService;
import mes.web.ut.Utils;

@Controller
public class FinishOperInfoController {

	private static final Logger logger = LoggerFactory.getLogger(FinishOperInfoController.class);

	@Inject
	private FinishOperInfoService finishOperInfoService;  

	@Inject
	private WorkOrderAdmService workOrderAdmService;  
	
	//후가공 상세조회
	@RequestMapping(value = "mt/finishOperInfoRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> read(FinishOperInfoVo finishOperInfoVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("후가공 상세조회 : "+finishOperInfoVo);
		try {
			
			FinishOperInfoVo vo = finishOperInfoService.read(finishOperInfoVo);
			
			jsonData.put("result", "ok");
			jsonData.put("data", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//후가공 등록
	@RequestMapping(value = "mt/finishOperInfoCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> create(FinishOperInfoVo finishOperInfoVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("후가공 등록 : "+finishOperInfoVo);
		try {
			
			FinishOperInfoVo vo = finishOperInfoService.read(finishOperInfoVo);
			finishOperInfoVo.setRegId(Utils.getUserNumber());
			
			if(vo!=null) {
				finishOperInfoService.update(finishOperInfoVo);
			}else {
				finishOperInfoService.create(finishOperInfoVo);
			}
			
			//생산실적 테이블 수정
			WorkOrderAdmVo workOrderAdmVo = new WorkOrderAdmVo();
			workOrderAdmVo.setWorkOrdNo(finishOperInfoVo.getWorkOrdNo());				
			int inputCount = Integer.parseInt(finishOperInfoVo.getPackInputCount());	//실적
			int outputCount = Integer.parseInt(finishOperInfoVo.getPackOutputCount());	//양품
			int faultyCount = Integer.parseInt(finishOperInfoVo.getPackFaultyCount());	//불량
			int capUnit = Integer.parseInt(finishOperInfoVo.getCapUnit());	//캡핑 수량
			
			workOrderAdmVo.setOutputQty(Integer.toString(inputCount*capUnit));	//실적
			workOrderAdmVo.setFairQty(Integer.toString(outputCount*capUnit));	//양품
			workOrderAdmVo.setFaultyQty(Integer.toString(faultyCount*capUnit));	//불량
			workOrderAdmVo.setUpdId(Utils.getUserNumber());
			workOrderAdmService.workOrderAdmUpd(workOrderAdmVo);
			
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	
	//후가공 설비상태 및 정보 리스트
	@RequestMapping(value = "mt/finishOperInfoEquipList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> finishOperInfoEquipList(FinishOperInfoVo finishOperInfoVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("후가공 상세조회 : "+finishOperInfoVo);
		try {
			
			List<FinishOperInfoVo> finishOperInfoEquipList = finishOperInfoService.finishOperInfoEquipList(finishOperInfoVo);
			
			jsonData.put("result", "ok");
			jsonData.put("data", finishOperInfoEquipList);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//후가공 리스트
	@RequestMapping(value = "mt/finishOperInfoList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> finishOperInfoList(FinishOperInfoVo finishOperInfoVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("후가공 상세조회 : "+finishOperInfoVo);
		try {
			
			List<FinishOperInfoVo> finishOperInfoList = finishOperInfoService.finishOperInfoList(finishOperInfoVo);
			
			jsonData.put("result", "ok");
			jsonData.put("data", finishOperInfoList);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//후가공 리스트
	@RequestMapping(value = "mt/finishOperInfoDtlList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> finishOperInfoDtlList(FinishOperInfoVo finishOperInfoVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("후가공 상세조회 : "+finishOperInfoVo);
		try {
			
			List<FinishOperInfoVo> finishOperInfoDtlList = finishOperInfoService.finishOperInfoDtlList(finishOperInfoVo);
			
			jsonData.put("result", "ok");
			jsonData.put("data", finishOperInfoDtlList);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//후가공 템프테이블 조회
	@RequestMapping(value = "mt/finishTempInfoList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> finishTempInfoList(FinishOperInfoVo finishOperInfoVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("후가공 템프테이블 조회 : "+finishOperInfoVo);
		try {
			
			FinishOperInfoVo vo = finishOperInfoService.finishTempInfoList(finishOperInfoVo);
			
			jsonData.put("result", "ok");
			jsonData.put("data", vo);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}
