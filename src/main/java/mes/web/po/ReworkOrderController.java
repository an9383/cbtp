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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.po.WorkOrderPrcssVo;
import mes.domain.po.WorkOrderVo;
import mes.domain.qm.ItemJajuFaultyVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.po.ReworkOrderService;
import mes.service.po.WorkOrderPrcssService;
import mes.service.po.WorkOrderService;
import mes.service.qm.ItemJajuFaultyService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ReworkOrderController {
	
	@Inject
	private CommonCodeAdmService commonCodeService;
	
	@Inject
	private WorkOrderService workOrderService;
	
	@Inject
	private WorkOrderPrcssService workOrderPrcssService;
	
	@Inject
	private ReworkOrderService reworkOrderService;
	
	@Inject
	private ItemJajuFaultyService itemJajuFaultyService;
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(ReworkOrderController.class);
	
	//생산관리(재작업관리)
	@RequestMapping(value = "/wmsc0110", method = RequestMethod.GET)
	public String wmsc0110(Locale locale, Model model) throws Exception {
		
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		return "wm/wmsc0110";
		
	}
	
	
	//작업지시 목록조회
	@RequestMapping(value = "/po/reworkOrderDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> reworkOrderDataList(WorkOrderVo workOrderVo, ItemJajuFaultyVo itemJajuFaultyVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("재작업지시 목록조회: "+workOrderVo);
		try {
			/*
			 * List<ItemJajuFaultyVo> listAll = new ArrayList<ItemJajuFaultyVo>();
			 * 
			 * List<ItemJajuFaultyVo> itemJajuFaultyList =
			 * itemJajuFaultyService.itemJajuFaultyList(itemJajuFaultyVo); for(int i=0;
			 * i<itemJajuFaultyList.size(); i++) {
			 * if(itemJajuFaultyList.get(i).getFaultyPcs()=="001") {
			 * listAll.add(itemJajuFaultyList.get(i)); } }
			 */
			
			
		    List<WorkOrderVo> workOrderDataList = reworkOrderService.listAll(workOrderVo); 
		    jsonData.put("data",workOrderDataList);
			 
			
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//모달 목록조회
	@RequestMapping(value = "/po/reworkOrderModalDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> reworkOrderModalDataList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("재작업지시 목록조회: "+workOrderPrcssVo);
		try {
			List<WorkOrderPrcssVo> workOrderDataList = reworkOrderService.reworkOrdList(workOrderPrcssVo);
			jsonData.put("data", workOrderDataList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	// 작업지시 등록
	@RequestMapping(value = "po/reworkOrderCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> reworkOrderCreate(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		WorkOrderVo workOrderVo = new WorkOrderVo();
		WorkOrderPrcssVo workOrderPrcssVo2 = new WorkOrderPrcssVo();
		logger.info("재작업지시 등록: " + workOrderPrcssVo);
		try {			
			//workOrderPrcssVo2 = workOrderPrcssService.workOrdPrcssReadDtl(workOrderPrcssVo);
			int seq = Integer.parseInt(workOrderService.getWorkOrdNoSeq(DateUtil.getToday("yyyyMMdd").toString()));
			/*
			 * workOrderPrcssVo2.setWorkOrdNo(DateUtil.getToday("yyyyMMdd").toString() + "-"
			 * + String.format("%03d",seq)); workOrderPrcssVo2.setWorkOrdSeq("1");
			 * workOrderPrcssVo2.setOrdDate(workOrderPrcssVo.getOrdDate().toString());
			 * workOrderPrcssVo2.setWorkChargr(workOrderPrcssVo.getWorkChargr().toString());
			 * workOrderPrcssVo2.setOutputQty("0"); workOrderPrcssVo2.setFairQty("0");
			 * workOrderPrcssVo2.setFaultyQty("0"); workOrderPrcssVo2.setEtcQty("0");
			 * workOrderPrcssVo2.setOutQty("0"); workOrderPrcssVo2.setRemainQty("0");
			 * workOrderPrcssVo2.setRegId(Utils.getUserId());
			 * 
			 * workOrderPrcssService.create(workOrderPrcssVo2);
			 */
			//기존작지번호 수정
			workOrderVo.setWorkOrdNo(workOrderPrcssVo.getWorkOrdNo().toString());
			workOrderVo = workOrderService.workOrdRead(workOrderVo);
			workOrderVo.setLastYn("N");
			workOrderVo.setUpdId(Utils.getUserId());
			reworkOrderService.lastYnUpdate(workOrderVo); 
			
			
			//새 작지번호 생성 
			workOrderVo.setOutputQty("0");
			workOrderVo.setFaultyQty("0");
			workOrderVo.setLastYn("Y");
			workOrderVo.setReworkYn("Y");
			workOrderVo.setOrdDate(workOrderPrcssVo.getOrdDate().toString());
			workOrderVo.setWorkStatusCd("W");
			workOrderVo.setRegId(Utils.getUserId());
			workOrderVo.setPreWorkOrdNo(workOrderPrcssVo.getWorkOrdNo().toString());
			workOrderVo.setWorkOrdNo(DateUtil.getToday("yyyyMMdd").toString() + "-" + String.format("%03d",seq));
			workOrderVo.setUpperWorkOrdNo(workOrderPrcssVo.getMinorPrcssCd());
			workOrderVo.setOrdLotNo(DateUtil.getToday("yyyyMMdd").toString() + "-" + String.format("%03d",seq));
			workOrderVo.setWorkOrdQty(workOrderPrcssVo.getWorkOrdQty().toString());
			workOrderService.create(workOrderVo);
			
			jsonData.put("result", "ok");
		
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	



}