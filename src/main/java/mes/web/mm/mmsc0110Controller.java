package mes.web.mm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bs.DeliveryOrderAdmVo;
import mes.domain.cm.BbsVo;
import mes.domain.po.WorkOrderVo;
import mes.service.bs.DeliveryOrderAdmService;
import mes.service.cm.BbsService;
import mes.service.mm.mmsc0110Service;
import mes.web.home.HomeController;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class mmsc0110Controller {

	@Inject
	private DeliveryOrderAdmService deliveryOrderAdmService;

	@Inject
	private BbsService bbsService;
	
	@Inject
	private mmsc0110Service mmsc0110Service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	//수주접수(전체)
	@RequestMapping(value = "mm/counList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> countBiz() throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		DeliveryOrderAdmVo deliveryOrderAdmVo = new DeliveryOrderAdmVo();
		try {
			
			String date = DateUtil.getToday("yyyymmdd");
			
			int countBizAll = mmsc0110Service.countBizOrederAdmAll();	//수주접수(전체)
			int countBizToday = mmsc0110Service.countBizOrederAdmToday(date);
			int countPurchase = mmsc0110Service.countPurchaseOrderDtl();
			int countInOut = mmsc0110Service.countInOutWhsAdm();
			int countWorkOrder = mmsc0110Service.countWorkOrderPrcssAdm();
		
			
			//자재미출고
			List<DeliveryOrderAdmVo> deliveryOrderAdmList = deliveryOrderAdmService.deliveryOrderAdmList(deliveryOrderAdmVo);
			List<DeliveryOrderAdmVo> deliveryOrderAdmList2 = new ArrayList<DeliveryOrderAdmVo>();
			
			for(int i=0; i<deliveryOrderAdmList.size(); i++) {
				if(deliveryOrderAdmList.get(i).getDoStatus().equals("001") || deliveryOrderAdmList.get(i).getDoStatus().equals("002")) {
					deliveryOrderAdmList2.add(deliveryOrderAdmList.get(i));
				}
			}
			
			jsonData.put("countBizAll", countBizAll);
			jsonData.put("countBizToday", countBizToday);
			jsonData.put("countPurchase", countPurchase);
			jsonData.put("countInOut", countInOut);
			jsonData.put("countWorkOrder", countWorkOrder);
			jsonData.put("countUnOut", deliveryOrderAdmList2.size());
			
			
			int workOrdQty1 = mmsc0110Service.countWorkOrdQty1(date);
			int workOrdQty2 = mmsc0110Service.countWorkOrdQty2(date);
			
			//생산량
			List<WorkOrderVo> list = mmsc0110Service.countWorkOrdOutputQty(date);
			int workOrdOutPutQty1 = 0;
			int workOrdOutPutQty2 = 0;
			
			for(int i=0; i<list.size(); i++) {
				if(list.get(i).getItemGubun().equals("001")) {
					workOrdOutPutQty1+=Float.parseFloat(list.get(i).getOutputQty());
				}else if(list.get(i).getItemGubun().equals("002")) {
					workOrdOutPutQty2+=Float.parseFloat(list.get(i).getOutputQty());
				}
			}
			
			float faultyQty1 = mmsc0110Service.countFaultyRate1(date);	//불량개수(소형)
			float faultyQty2 = mmsc0110Service.countFaultyRate2(date);	//불량개수(중형)
			
			
			
			String faultyRate1 = String.format("%.2f", (faultyQty1/workOrdOutPutQty1)*100)+"%";	//불량율(소형)
			String faultyRate2 = String.format("%.2f", (faultyQty2/workOrdOutPutQty2)*100)+"%";	//불량율(중형)
			
			String achieveRate1 = String.format("%.2f", ((workOrdOutPutQty1-faultyQty1)/workOrdOutPutQty1)*100)+"%";	//달성율(소형)
			String achieveRate2 = String.format("%.2f", ((workOrdOutPutQty2-faultyQty2)/workOrdOutPutQty2)*100)+"%";	//달성율(중형)
			
			
			jsonData.put("workOrdQty1", workOrdQty1);
			jsonData.put("workOrdQty2", workOrdQty2);
			jsonData.put("workOrdOutPutQty1", workOrdOutPutQty1);
			jsonData.put("workOrdOutPutQty2", workOrdOutPutQty2);
			jsonData.put("faultyRate1", faultyRate1);
			jsonData.put("faultyRate2", faultyRate2);
			jsonData.put("achieveRate1", achieveRate1);
			jsonData.put("achieveRate2", achieveRate2);
			
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	// 게시판 리스트 출력
	@RequestMapping(value = "mm/bbsList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> BbsList(BbsVo bbsVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			List<BbsVo> bbsList = bbsService.bbsTop10List();
				
			jsonData.put("data", bbsList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	//미출고현황 건수
	@RequestMapping(value="bs/countUndeliveryOrderAdm" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> undeliveryOrderAdmList(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고의뢰등록 목록조회 : "+ deliveryOrderAdmVo);
		try {
			
			List<DeliveryOrderAdmVo> deliveryOrderAdmList = deliveryOrderAdmService.deliveryOrderAdmList(deliveryOrderAdmVo);
			List<DeliveryOrderAdmVo> deliveryOrderAdmList2 = new ArrayList<DeliveryOrderAdmVo>();
			
			for(int i=0; i<deliveryOrderAdmList.size(); i++) {
				if(deliveryOrderAdmList.get(i).getDoStatus().equals("001") || deliveryOrderAdmList.get(i).getDoStatus().equals("002")) {
					deliveryOrderAdmList2.add(deliveryOrderAdmList.get(i));
				}
			}
			jsonData.put("data", deliveryOrderAdmList2.size());
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
}
