package mes.web.wm;

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

import mes.domain.bm.DealCorpAdmVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.po.WorkOrderMatrlVo;
import mes.domain.po.WorkOrderPrcssVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.DealCorpAdmService;
import mes.service.bm.EquipCodeAdmService;
import mes.service.bm.ItemPartAdmService;
import mes.service.po.WorkOrderPrcssService;
import mes.web.ut.Utils;

@Controller
public class LotTrackingController {
	
	@Inject
	private CommonCodeAdmService commonCodeService;
	@Inject
	private EquipCodeAdmService equipCodeAdmService;
	@Inject
	private WorkOrderPrcssService workOrderPrcssService;
	@Inject
	private DealCorpAdmService dealCorpAdmService;
	@Inject
	private ItemPartAdmService itemPartAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(LotTrackingController.class);
	
	//===================================== LOT추적상세 =========================================
	//LOT추적상세 메인
	@RequestMapping(value = "/wmsc0200", method = RequestMethod.GET)
	public String wmsc0200Main(Locale locale, Model model) throws Exception {
		logger.info("LOT추적상세");
		try {
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc0200";
	}
		
	//생산LOT현황 메인
	@RequestMapping(value = "/wmsc0080", method = RequestMethod.GET)
	public String wmsc0080Main(Locale locale, Model model) throws Exception {
		logger.info("생산LOT현황 메인");
		try {
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc0080";
	}
	
	//투입LOT현황 메인
	@RequestMapping(value = "/wmsc0090", method = RequestMethod.GET)
	public String wmsc0090Main(Locale locale, Model model) throws Exception {
		logger.info("투입LOT현황 메인");
		try {
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "wm/wmsc0090";
	}
	
	// LOT추적(레이저) 목록조회
	@RequestMapping(value = "/wm/lotTrackingListLaser", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> lotTrackingListLaser(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("LOT추적(레이저) 목록조회: " + workOrderPrcssVo);
		try {
			List<WorkOrderPrcssVo> lotTrackList = new ArrayList<WorkOrderPrcssVo>();
			lotTrackList = workOrderPrcssService.lotTrackList1(workOrderPrcssVo);
			jsonData.put("data", lotTrackList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// ===================================== LOT추적 =========================================
	//LOT추적(사출) 메인
	@RequestMapping(value = "/wmsc0210", method = RequestMethod.GET)
	public String wmsc0210Main(Locale locale, Model model) throws Exception {
		logger.info("LOT추적(사출)");
		
		DealCorpAdmVo dealCorpAdmVo = new DealCorpAdmVo(); // 출고처
		List<DealCorpAdmVo> itemCusList = dealCorpAdmService.listAll(dealCorpAdmVo);
		model.addAttribute("itemCusList", itemCusList );
		
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setItemGubun("001");
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);
		
		return "wm/wmsc0210";
	}
	
	//LOT추적(봉제) 메인
	@RequestMapping(value = "/wmsc0280", method = RequestMethod.GET)
	public String wmsc0280(Locale locale, Model model) throws Exception {
		logger.info("LOT추적(봉제)");
		
		DealCorpAdmVo dealCorpAdmVo = new DealCorpAdmVo(); // 출고처
		List<DealCorpAdmVo> itemCusList = dealCorpAdmService.listAll(dealCorpAdmVo);
		model.addAttribute("itemCusList", itemCusList );
		
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setItemGubun("001");
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);
		
		return "wm/wmsc0280";
	}
	
	//LOT추적 목록조회
	@RequestMapping(value = "/wm/lotTrackingList5", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> lotTrackingList5(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("작업지시번호 목록조회: " + workOrderPrcssVo);
		try {
			//5.출하 LOT추적
			List<WorkOrderPrcssVo> lotTrackList5 = new ArrayList<WorkOrderPrcssVo>();
			if(workOrderPrcssVo.getLotTrackGubun()!=null && !workOrderPrcssVo.getLotTrackGubun().equals("")) {
				lotTrackList5 = workOrderPrcssService.lotTrackList5(workOrderPrcssVo);
			}
			
			jsonData.put("data", lotTrackList5);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//LOT추적 자재LOT 재고현황
	@RequestMapping(value = "/wm/lotTrackStockPaymentList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> lotTrackStockPaymentList2(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("LOT추적 자재LOT 재고현황 목록조회: " + workOrderPrcssVo);
		try {
			List<WorkOrderMatrlVo> lotTrackList = workOrderPrcssService.lotTrackStockPaymentList2(workOrderPrcssVo);
			jsonData.put("data", lotTrackList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//LOT추적 생산LOT 재고현황
	@RequestMapping(value = "/wm/lotTrackStockPaymentList1", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> lotTrackStockPaymentList1(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("LOT추적 생산LOT 재고현황 목록조회: " + workOrderPrcssVo);
		try {
			List<WorkOrderMatrlVo> lotTrackList = workOrderPrcssService.lotTrackStockPaymentList1(workOrderPrcssVo);
			jsonData.put("data", lotTrackList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}