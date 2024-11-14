package mes.web.qm;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mes.domain.bm.BaseInfoAdmVo;
import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.LocationAdmVo;
import mes.domain.bs.DeliveryOrderAdmVo;
import mes.domain.qm.ItemCompleteAdmVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.service.bm.BaseInfoAdmService;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.ItemPartAdmService;
import mes.service.bm.LocationAdmService;
import mes.service.bs.DeliveryOrderAdmService;
import mes.service.qm.ItemCompleteAdmService;
import mes.service.qm.ItemCompleteFaultyService;
import mes.service.tm.StockPaymentAdmService;
import mes.service.wm.ItemWhsAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ItemCompleteAdmController {

	@Inject
	private static final Logger logger = LoggerFactory.getLogger(ItemCompleteAdmController.class);
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private ItemCompleteAdmService  itemCompleteAdmService;
	
	@Inject
	private ItemCompleteFaultyService itemCompleteFaultyService;
	
	@Inject
	private DeliveryOrderAdmService  deliveryOrderAdmService;
	
	@Inject
	private StockPaymentAdmService  stockPaymentAdmService;
	
	@Inject
	private ItemWhsAdmService itemWhsAdmService;
	
	@Inject
	private ItemPartAdmService itemPartAdmService;
	
	@Inject
	private BaseInfoAdmService baseInfoAdmService;
	
	@Inject
	private LocationAdmService locationAdmService;
	
	@Value("${file.itemCompleteAdm}")
	private String file_itemComplete_adm_Path;
	
	//출하검사관리대장(사출) 메인
	@RequestMapping(value = "/qmsc0030", method = RequestMethod.GET)
	public String qmsc0030(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		List<CommonCodeAdmVo> list = commonCodeAdmService.CommonCodeList(commonCodeVo);
		commonCodeVo.setBaseGroupCd("072"); // 판정
		
		model.addAttribute("judgmentCode", list);
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		list = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", list);
		
		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo();
		baseInfoAdmVo.setBaseInfoGubun("002");
		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		model.addAttribute("baseInfoAdmList", baseInfoAdmList); //불량유형
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		list = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("judge", list);

		commonCodeVo.setBaseGroupCd("128"); // 실행여부
		list = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("silhang", list);
		
		commonCodeVo.setBaseGroupCd("145"); // CAVITY
		list = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("cavity", list);
		
		CommonCodeAdmVo commonCodeVo2 = new CommonCodeAdmVo();
		commonCodeVo2.setBaseGroupCd("116"); // 수입검사성적서&검사기준서 내용
		commonCodeVo2.setEtc1("출하검사");
		list = commonCodeAdmService.CommonCodeList(commonCodeVo2);
		model.addAttribute("contents", list);
		
		
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		
		return "qm/qmsc0030";
	}
	
	//출하검사관리대장(봉제) 메인
	@RequestMapping(value = "/qmsc0200", method = RequestMethod.GET)
	public String qmsc0200(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		List<CommonCodeAdmVo> list = commonCodeAdmService.CommonCodeList(commonCodeVo);
		commonCodeVo.setBaseGroupCd("072"); // 판정
		
		model.addAttribute("judgmentCode", list);
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		list = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", list);
		
		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo();
		baseInfoAdmVo.setBaseInfoGubun("002");
		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		model.addAttribute("baseInfoAdmList", baseInfoAdmList); //불량유형
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		list = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("judge", list);

		commonCodeVo.setBaseGroupCd("128"); // 실행여부
		list = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("silhang", list);
		
		commonCodeVo.setBaseGroupCd("145"); // CAVITY
		list = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("cavity", list);
		
		CommonCodeAdmVo commonCodeVo2 = new CommonCodeAdmVo();
		commonCodeVo2.setBaseGroupCd("116"); // 수입검사성적서&검사기준서 내용
		commonCodeVo2.setEtc1("출하검사");
		list = commonCodeAdmService.CommonCodeList(commonCodeVo2);
		model.addAttribute("contents", list);
		
		
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		
		return "qm/qmsc0200";
	}
	
	//출하검사관리대장(정밀가공) 메인
	@RequestMapping(value = "/qmsc0320", method = RequestMethod.GET)
	public String qmsc0320(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		List<CommonCodeAdmVo> list = commonCodeAdmService.CommonCodeList(commonCodeVo);
		commonCodeVo.setBaseGroupCd("072"); // 판정
		
		model.addAttribute("judgmentCode", list);
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		list = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", list);
		
		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo();
		baseInfoAdmVo.setBaseInfoGubun("002");
		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		model.addAttribute("baseInfoAdmList", baseInfoAdmList); //불량유형
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		list = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("judge", list);

		commonCodeVo.setBaseGroupCd("128"); // 실행여부
		list = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("silhang", list);
		
		commonCodeVo.setBaseGroupCd("145"); // CAVITY
		list = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("cavity", list);
		
		CommonCodeAdmVo commonCodeVo2 = new CommonCodeAdmVo();
		commonCodeVo2.setBaseGroupCd("116"); // 수입검사성적서&검사기준서 내용
		commonCodeVo2.setEtc1("출하검사");
		list = commonCodeAdmService.CommonCodeList(commonCodeVo2);
		model.addAttribute("contents", list);
		
		
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		
		return "qm/qmsc0320";
	}
	
	//출하검사결과조회(사출) 메인
	@RequestMapping(value = "/qmsc0130", method = RequestMethod.GET)
	public String qmsc0130(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> qaEvalList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", qaEvalList);
		
		commonCodeVo.setBaseGroupCd("062"); // 승인여부
		List<CommonCodeAdmVo> approvalCode = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("approval", approvalCode);
		
		ItemCompleteAdmVo itemCompleteAdmVo = new ItemCompleteAdmVo();
		itemCompleteAdmVo.setStartDate(DateUtil.getDay("yyyy-mm-dd", -6));
		itemCompleteAdmVo.setEndDate(DateUtil.getToday("yyyy-mm-dd"));
		itemCompleteAdmVo.setApprovalYn("001");
		itemCompleteAdmVo.setMainGubun("001");
		List<ItemCompleteAdmVo> testResultCompleteList =  itemCompleteAdmService.inspResultAdmList(itemCompleteAdmVo);
		model.addAttribute("testResultList", testResultCompleteList);
		
		return "qm/qmsc0130";
	}
	
	//출하검사결과조회(봉제) 메인
	@RequestMapping(value = "/qmsc0230", method = RequestMethod.GET)
	public String qmsc0230(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> qaEvalList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", qaEvalList);
		
		commonCodeVo.setBaseGroupCd("062"); // 승인여부
		List<CommonCodeAdmVo> approvalCode = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("approval", approvalCode);
		
		ItemCompleteAdmVo itemCompleteAdmVo = new ItemCompleteAdmVo();
		itemCompleteAdmVo.setStartDate(DateUtil.getDay("yyyy-mm-dd", -6));
		itemCompleteAdmVo.setEndDate(DateUtil.getToday("yyyy-mm-dd"));
		itemCompleteAdmVo.setApprovalYn("001");
		itemCompleteAdmVo.setMainGubun("002");
		List<ItemCompleteAdmVo> testResultCompleteList =  itemCompleteAdmService.inspResultAdmList(itemCompleteAdmVo);
		model.addAttribute("testResultList", testResultCompleteList);
		
		return "qm/qmsc0230";
	}
	
	//출하검사결과조회(정밀가공) 메인
	@RequestMapping(value = "/qmsc0350", method = RequestMethod.GET)
	public String qmsc0350(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> qaEvalList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", qaEvalList);
		
		commonCodeVo.setBaseGroupCd("062"); // 승인여부
		List<CommonCodeAdmVo> approvalCode = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("approval", approvalCode);
		
		ItemCompleteAdmVo itemCompleteAdmVo = new ItemCompleteAdmVo();
		itemCompleteAdmVo.setStartDate(DateUtil.getDay("yyyy-mm-dd", -6));
		itemCompleteAdmVo.setEndDate(DateUtil.getToday("yyyy-mm-dd"));
		itemCompleteAdmVo.setApprovalYn("001");
		itemCompleteAdmVo.setMainGubun("002");
		List<ItemCompleteAdmVo> testResultCompleteList =  itemCompleteAdmService.inspResultAdmList(itemCompleteAdmVo);
		model.addAttribute("testResultList", testResultCompleteList);
		
		return "qm/qmsc0350";
	}
	
	//완제품관리 목록조회
	@RequestMapping(value="qm/itemCompleteAdmDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemCompleteAdmDataList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("완제품검사 관리대장 vo:"+itemCompleteAdmVo);
		try {
			List<ItemCompleteAdmVo> itemCompleteAdmList =  itemCompleteAdmService.listAll(itemCompleteAdmVo);
				
			jsonData.put("data", itemCompleteAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//완제품관리 생산lot별 목록조회
	@RequestMapping(value="qm/itemCompleteAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemCompleteAdmList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("완제품검사 관리대장 vo:"+itemCompleteAdmVo);
		try {
			List<ItemCompleteAdmVo> list = new ArrayList<ItemCompleteAdmVo>();
			if(itemCompleteAdmVo.getContDtlNo()!=null && !itemCompleteAdmVo.getContDtlNo().equals("")) {
				list =  itemCompleteAdmService.itemCompleteAdmList(itemCompleteAdmVo);
			}
				
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//완제품관리 상세조회
	@RequestMapping(value="qm/itemCompleteAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemCompleteAdmRead(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			itemCompleteAdmVo =  itemCompleteAdmService.read(itemCompleteAdmVo);
			jsonData.put("data", itemCompleteAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	
	// 완제품검사 마스터 등록
	@RequestMapping(value = "qm/itemCompleteMasterCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemCompleteMasterCreate(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("완제품검사 마스터 등록 vo :"+itemCompleteAdmVo );
		try {
			itemCompleteAdmVo.setDate(DateUtil.getToday("yyyymmdd"));
			itemCompleteAdmVo.setDoNo(itemCompleteAdmService.getDoNo(itemCompleteAdmVo));
			itemCompleteAdmVo.setRegId(Utils.getUserNumber());
			itemCompleteAdmService.itemCompleteMasterCreate(itemCompleteAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 완제품검산 마스터 수정
	@RequestMapping(value = "qm/itemCompleteMasterUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemCompleteMasterUpdate(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("완제품검사 마스터 수정 vo :"+itemCompleteAdmVo );
		try {
			itemCompleteAdmVo.setUpdId(Utils.getUserNumber());
			itemCompleteAdmService.itemCompleteMasterUpdate(itemCompleteAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	
	// 완제품검사관리 등록
	@RequestMapping(value = "qm/itemCompleteAllCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemInspectAllCreate(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ItemCompleteAdmVo itemCompleteAdmVo = new ItemCompleteAdmVo();
		try {
			
			itemCompleteAdmVo.setDoNo(list.get(0).get("doNo").toString());
			itemCompleteAdmService.deleteComplete(itemCompleteAdmVo);
			itemCompleteAdmService.itemCompleteFaultyTypeDelete(itemCompleteAdmVo); //불량유형 삭제
			
			for(Map<String, Object> m : list) {
				itemCompleteAdmVo.setDoSeq(itemCompleteAdmService.getDoSeq(itemCompleteAdmVo));
				itemCompleteAdmVo.setWorkOrdNo(m.get("workOrdNo").toString());
				itemCompleteAdmVo.setPairQty(m.get("pairQty").toString());
				itemCompleteAdmVo.setFaultyQty(m.get("faultyQty").toString());
				itemCompleteAdmVo.setJudgment(m.get("judgment").toString());
				itemCompleteAdmVo.setRegId(Utils.getUserId());
				
				itemCompleteAdmService.createComplete(itemCompleteAdmVo);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	//완제품관리 수정
	@RequestMapping(value="qm/itemCompleteAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemCompleteAdmUpdate(MultipartHttpServletRequest multi,  ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("완제품관리 수정:" + itemCompleteAdmVo);
			
//			uploadFile(multi, itemCompleteAdmVo);
			itemCompleteAdmVo.setUpdId(Utils.getUserId());
			itemCompleteAdmService.updateComplete(itemCompleteAdmVo);	
//			String fileName = itemCompleteAdmService.read(itemCompleteAdmVo).getShipReport().toString();
			
			jsonData.put("result", "ok");
//			jsonData.put("data", fileName);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	// 완제품검사관리 삭제
	@RequestMapping(value = "qm/itemCompleteAllDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemCompleteAllDelete(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			itemCompleteAdmService.deleteComplete(itemCompleteAdmVo);
			itemCompleteAdmService.itemCompleteFaultyTypeDelete(itemCompleteAdmVo); //불량유형 삭제
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//완제품관리 승인 수정
	@RequestMapping(value="qm/itemCompleteStatusUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemCompleteStatusUpdate(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		LocationAdmVo locationAdmVo = new LocationAdmVo();
		logger.info("완제품관리 승인 수정:" + itemCompleteAdmVo);	
		try {
			itemCompleteAdmVo.setUpdId(Utils.getUserId());		
			itemCompleteAdmService.updateStatus(itemCompleteAdmVo);	
			
			List<ItemCompleteAdmVo> list = itemCompleteAdmService.itemCompleteAdmList(itemCompleteAdmVo);
			
			//승인버튼 클릭
			if(itemCompleteAdmVo.getApprovalYn().equals("001")) {
				//각 판정이 합격인 경우
				for(int i=0; i<list.size(); i++) {
					//품질창고 이동출고
					StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
					String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
					
					stockPaymentAdmVo.setSpNo(spNo);
					stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
					stockPaymentAdmVo.setSpType(list.get(i).getItemGubun());
					stockPaymentAdmVo.setSpCd(list.get(i).getItemSeq());
					stockPaymentAdmVo.setSpGubun("002");
					stockPaymentAdmVo.setSpSubGubun("이동출고");
					stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
					stockPaymentAdmVo.setSpQty(list.get(i).getFairQty());
					stockPaymentAdmVo.setBarcodeNo(list.get(i).getWorkOrdNo());
					stockPaymentAdmVo.setSourceNo(list.get(i).getDoNo());
					locationAdmVo.setMainGubun(list.get(i).getMainGubun());
					locationAdmVo.setLocCd(list.get(i).getMainGubun().equals("001")?"016":"017");		
					LocationAdmVo list0 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
					stockPaymentAdmVo.setLocationCd(list0.getLocCd());
					stockPaymentAdmVo.setLocationNo(list0.getLocNo());
					stockPaymentAdmVo.setRegId(Utils.getUserId());
					stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
					
					if(list.get(i).getJudgment()!=null && list.get(i).getJudgment().equals("001")) {
						//제품창고 이동입고
						stockPaymentAdmVo.setSpNo(spNo);
						stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
						stockPaymentAdmVo.setSpType(list.get(i).getItemGubun());
						stockPaymentAdmVo.setSpCd(list.get(i).getItemSeq());
						stockPaymentAdmVo.setSpGubun("001");
						stockPaymentAdmVo.setSpSubGubun("이동입고");
						stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
						stockPaymentAdmVo.setSpQty(list.get(i).getPairQty());
						stockPaymentAdmVo.setBarcodeNo(list.get(i).getWorkOrdNo());
						stockPaymentAdmVo.setSourceNo(list.get(i).getDoNo());
						locationAdmVo.setMainGubun(list.get(i).getMainGubun());
						locationAdmVo.setLocCd(list.get(i).getMainGubun().equals("001")?"002":"007");	
						LocationAdmVo list1 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
						stockPaymentAdmVo.setLocationCd(list1.getLocCd());
						stockPaymentAdmVo.setLocationNo(list1.getLocNo());
						stockPaymentAdmVo.setRegId(Utils.getUserId());
						stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
					}else {
						//제품창고 이동입고
						stockPaymentAdmVo.setSpNo(spNo);
						stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
						stockPaymentAdmVo.setSpType(list.get(i).getItemGubun());
						stockPaymentAdmVo.setSpCd(list.get(i).getItemSeq());
						stockPaymentAdmVo.setSpGubun("001");
						stockPaymentAdmVo.setSpSubGubun("이동입고");
						stockPaymentAdmVo.setSpDate(DateUtil.getToday("yyyymmdd"));
						stockPaymentAdmVo.setSpQty(list.get(i).getFaultyQty());
						stockPaymentAdmVo.setBarcodeNo(list.get(i).getWorkOrdNo());
						stockPaymentAdmVo.setSourceNo(list.get(i).getDoNo());
						locationAdmVo.setMainGubun(list.get(i).getMainGubun());
						locationAdmVo.setLocCd(list.get(i).getMainGubun().equals("001")?"005":"009");	
						LocationAdmVo list1 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
						stockPaymentAdmVo.setLocationCd(list1.getLocCd());
						stockPaymentAdmVo.setLocationNo(list1.getLocNo());
						stockPaymentAdmVo.setRegId(Utils.getUserId());
						stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
						
					}
				}
			
			//승인취소버튼 클릭
			}else if(itemCompleteAdmVo.getApprovalYn().equals("002")) {
				//제품출고 안된 경우만 가능!!
				//예외처리 구간
				if(true) {
					StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
					stockPaymentAdmVo.setSourceNo(itemCompleteAdmVo.getDoNo());
					stockPaymentAdmService.stockPaymentAdmDelete(stockPaymentAdmVo);
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
	
	//완제품관리 불량내역 등록/수정
	@RequestMapping(value="qm/itemFaultyCauseCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemFaultyCauseCreate(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("완제품관리 불량내역 등록:"+itemCompleteAdmVo);		
			itemCompleteAdmService.deleteFaulty(itemCompleteAdmVo);
		
			itemCompleteAdmVo.setRegId(Utils.getUserId());
			itemCompleteAdmService.createFaulty(itemCompleteAdmVo);	
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
//	//완제품관리 불량내역 수정
//	@RequestMapping(value="qm/itemFaultyCauseUpdate", method = RequestMethod.POST)
//	public @ResponseBody Map<String, Object> itemFaultyCauseUpdate(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		try {
//			logger.info("완제품관리 불량내역 수정:"+itemCompleteAdmVo);
//			
//			itemCompleteAdmVo.setUpdId(Utils.getUserId());
//			itemCompleteAdmService.updateFaulty(itemCompleteAdmVo);	
//
//			jsonData.put("result", "ok");
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//		
//	}
//	

	
	// 성적서 파일 다운로드
	@RequestMapping(value = "qm/completeDownloadFile", method = RequestMethod.GET)
	public @ResponseBody void completeDownloadFile(HttpServletResponse res, HttpServletRequest req, 
		    @RequestParam(value = "workOrdNo") String workOrdNo,
		    @RequestParam(value = "itemSeq") String itemSeq
		   ) throws Exception {
		try {
			 ItemCompleteAdmVo itemCompleteAdmVo = new  ItemCompleteAdmVo();
			 itemCompleteAdmVo.setWorkOrdNo(workOrdNo);
			 itemCompleteAdmVo.setItemSeq(itemSeq);
			 
			String dFile =  itemCompleteAdmService.read(itemCompleteAdmVo).getShipReport().toString();			
					
			String newFileName = itemCompleteAdmVo.getWorkOrdNo().toString()  +"." +dFile.substring(dFile.lastIndexOf(".")+1);

			String path = file_itemComplete_adm_Path +"/"+ itemCompleteAdmVo.getWorkOrdNo().toString() + "/" 
						+ itemCompleteAdmVo.getItemSeq().toString() + "/" + newFileName;

			File file = new File(path);
			String userAgent = req.getHeader("User-Agent");

			boolean ie = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);

			if (ie) {
				dFile = URLEncoder.encode(dFile, "UTF-8").replaceAll("\\+", "%20");
			} else {
				dFile = new String(dFile.getBytes("UTF-8"), "ISO-8859-1");
			}

			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment; fileName=\"" + dFile + "\";");

			FileInputStream fis = new FileInputStream(file);
			BufferedInputStream bis = new BufferedInputStream(fis);
			ServletOutputStream so = res.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(so);

			byte[] data = new byte[2048];
			int input = 0;
			while ((input = bis.read(data)) != -1) {
				bos.write(data, 0, input);
				bos.flush();
			}
			if (bos != null)
				bos.close();
			if (bis != null)
				bis.close();
			if (so != null)
				so.close();
			if (fis != null)
				fis.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//완제품관리 파일삭제
	@RequestMapping(value="qm/itemCompleteImageDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemCompleteImageDelete(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			itemCompleteAdmService.completeFileDelete(itemCompleteAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//성적서 업로드
	public void uploadFile(MultipartHttpServletRequest multi, ItemCompleteAdmVo itemCompleteAdmVo) throws Exception {
		
		try {
			String workOrdNo = multi.getParameter("workOrdNo").toString();
			String itemSeq = multi.getParameter("itemSeq").toString();
			
			String newFileName = "";
			String path = file_itemComplete_adm_Path+ "/" + workOrdNo + "/" + itemSeq;
			
			File dir = new File(path);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			MultipartFile mFile = multi.getFile("fileNm");
			String fileName = mFile.getOriginalFilename();
			itemCompleteAdmVo.setShipReport(fileName);
			
			newFileName = workOrdNo + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
			
			try {
				mFile.transferTo(new File(path + "/" + newFileName));
			} catch (Exception e) {
				e.printStackTrace();
			
			}
		} catch (Exception e) {
			
		}
	}
	
	
	//완제품검사 불량유형조회
	@RequestMapping(value="qm/itemCompleteFaultyTypeList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemCompleteFaultyTypeList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ItemCompleteAdmVo> list =  itemCompleteAdmService.itemCompleteFaultyTypeList(itemCompleteAdmVo);
				
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//완제품검사 불량유형조회
	@RequestMapping(value="qm/itemCompleteFaultyTypeRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemCompleteFaultyTypeRead(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ItemCompleteAdmVo> list =  itemCompleteAdmService.itemCompleteFaultyTypeRead(itemCompleteAdmVo);
				
			if(list==null || list.size()==0) {
				list = new ArrayList<ItemCompleteAdmVo>();
			}
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	// 완제품검사 불량유형등록
	@RequestMapping(value = "io/itemCompleteFaultyTypeCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemCompleteFaultyTypeCreate(@RequestBody List<Map<String, Object>> faultyTypeList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ItemCompleteAdmVo itemCompleteAdmVo = new ItemCompleteAdmVo();
		 
		try {
			
			itemCompleteAdmVo.setDoNo(faultyTypeList.get(0).get("doNo").toString());
			itemCompleteAdmService.itemCompleteFaultyTypeDelete(itemCompleteAdmVo);
			
			itemCompleteAdmVo.setDoSeq(faultyTypeList.get(0).get("doSeq").toString());
			itemCompleteAdmVo.setWorkOrdNo(faultyTypeList.get(0).get("workOrdNo").toString());
			itemCompleteAdmVo.setPairQty(faultyTypeList.get(0).get("pairQty").toString());
			itemCompleteAdmVo.setFaultyQty(faultyTypeList.get(0).get("faultyQty").toString());
			itemCompleteAdmVo.setJudgment(faultyTypeList.get(0).get("judgment").toString());
			itemCompleteAdmVo.setRegId(Utils.getUserId());
			itemCompleteAdmVo.setUpdId(Utils.getUserId());
			
			itemCompleteAdmService.updateComplete(itemCompleteAdmVo);
			
			
			for(Map<String, Object> m : faultyTypeList) {
				
				if(m.get("faultyTypeCd")!=null && !m.get("faultyTypeCd").toString().equals("0")) {
					itemCompleteAdmVo.setFaultyTypeCd(m.get("faultyTypeCd").toString());
					itemCompleteAdmVo.setFaultyTypeQty(m.get("faultyTypeQty").toString());
					itemCompleteAdmVo.setFaultyTypeDate(m.get("faultyTypeDate").toString()); 
					itemCompleteAdmVo.setFaultyTypeDesc(m.get("faultyTypeDesc").toString());
					
					itemCompleteAdmService.itemCompleteFaultyTypeCreate(itemCompleteAdmVo);
				}
			}
			
			//총합격수량, 총불량수량
			ItemCompleteAdmVo qtyVo = itemCompleteAdmService.itemInspectQtyRead(itemCompleteAdmVo);
			
			jsonData.put("result", "ok");
			jsonData.put("totalPairQty", qtyVo.getPairQty());
			jsonData.put("totalFaultyQty", qtyVo.getFaultyQty());
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	//출하등록
	/*
	 * @RequestMapping(value="qm/itemOutCreate" , method = RequestMethod.POST)
	 * public @ResponseBody Map<String, Object> itemOutCreate(@RequestBody
	 * List<Map<String, Object>> list) throws Exception{ Map<String, Object>
	 * jsonData = new HashMap<String, Object>(); ItemWhsAdmVo itemWhsAdmVo = new
	 * ItemWhsAdmVo(); ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
	 * DeliveryOrderAdmVo deliveryProcDtlVo = new DeliveryOrderAdmVo();
	 * StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
	 * logger.info("출하등록 : "+ list); try { String spNo =
	 * stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
	 * 
	 * for(Map<String, Object> m :list) {
	 * 
	 * //출고의뢰상세 수정 deliveryProcDtlVo.setDoNo(m.get("doNo").toString());
	 * deliveryProcDtlVo.setDoNoSev(m.get("doSeq").toString());
	 * deliveryProcDtlVo.setDoSeq(Integer.parseInt(m.get("doSeq").toString()));
	 * deliveryProcDtlVo.setDoStatus("003");
	 * deliveryProcDtlVo.setOutputQty(m.get("outputQty").toString());
	 * deliveryProcDtlVo.setOutputDate(m.get("outputDate").toString());
	 * deliveryOrderAdmService.deliveryOrderDtlUpdate(deliveryProcDtlVo);
	 * logger.info("출고요청상세 테이블 수정완료!!!!");
	 * 
	 * itemWhsAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
	 * itemWhsAdmVo.setOutQty(Integer.parseInt(m.get("outputQty").toString()));
	 * itemWhsAdmVo.setOutDate(m.get("outputDate").toString());
	 * 
	 * //출고단가적용일 기준으로 출고단가값 가져오기
	 * itemPartAdmVo.setItemSeq(m.get("itemSeq").toString());
	 * itemPartAdmVo.setExportDate(deliveryProcDtlVo.getOutputDate());
	 * 
	 * double exportCost =
	 * Double.parseDouble(itemPartAdmService.getExportCost(itemPartAdmVo));//단가
	 * double outQty = itemWhsAdmVo.getOutQty(); //수량 double supplyPrice =
	 * exportCost*outQty; //공급가액 double vat = supplyPrice*0.1; //부가세 double total =
	 * supplyPrice+vat; //합계
	 * 
	 * logger.info("출고일:"+deliveryProcDtlVo.getOutputDate());
	 * logger.info("단가:"+exportCost); logger.info("수량:"+outQty);
	 * logger.info("공급가액"+supplyPrice); logger.info("부가세:"+vat);
	 * logger.info("합계:"+total);
	 * 
	 * 
	 * itemWhsAdmVo.setExportCost(Double.toString(exportCost)); //단가
	 * itemWhsAdmVo.setSupplyPrice(Double.toString(supplyPrice)); //공급가액
	 * itemWhsAdmVo.setVat(Double.toString(vat)); //부가세
	 * itemWhsAdmVo.setTotal(Double.toString(total)); //합계
	 * itemWhsAdmVo.setUpdId(Utils.getUserId());
	 * itemWhsAdmService.itemOutWhsAdmUpdate(itemWhsAdmVo);
	 * logger.info("제품입출고 테이블 수정완료!!!!");
	 * 
	 * 
	 * //수불테이블 Create logger.info("수불테이블 등록 시작"); stockPaymentAdmVo.setSpNo(spNo);
	 * stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo)
	 * ); stockPaymentAdmVo.setSpType(m.get("itemGubun").toString());
	 * stockPaymentAdmVo.setSpCd(m.get("itemSeq").toString());
	 * stockPaymentAdmVo.setSpGubun("002"); stockPaymentAdmVo.setSpSubGubun("제품출고");
	 * stockPaymentAdmVo.setSpDate(itemWhsAdmVo.getOutDate());
	 * stockPaymentAdmVo.setSpQty(Integer.toString(itemWhsAdmVo.getOutQty()));
	 * stockPaymentAdmVo.setBarcodeNo(itemWhsAdmVo.getBarcodeNo());
	 * stockPaymentAdmVo.setSourceNo(itemWhsAdmVo.getBarcodeNo());
	 * 
	 * 
	 * stockPaymentAdmVo.setLocationNo(itemWhsAdmService.getLocInfo(itemWhsAdmVo).
	 * getLocationNo());
	 * stockPaymentAdmVo.setLocationCd(itemWhsAdmService.getLocInfo(itemWhsAdmVo).
	 * getInLoc());
	 * stockPaymentAdmVo.setAreaCd(itemWhsAdmService.getLocInfo(itemWhsAdmVo).
	 * getInArea());
	 * stockPaymentAdmVo.setFloorCd(itemWhsAdmService.getLocInfo(itemWhsAdmVo).
	 * getInFloor()); stockPaymentAdmVo.setRegId(Utils.getUserId());
	 * 
	 * stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
	 * logger.info("수불테이블 등록 끝");
	 * 
	 * }
	 * 
	 * jsonData.put("result", "ok");
	 * 
	 * } catch (Exception e) { e.printStackTrace(); jsonData.put("result", "error");
	 * jsonData.put("message", Utils.getErrorMessage() ); } return jsonData; }
	 */
	
	
	
	//******************모니터링*********************
	// 완제품검사 품질경향 분석 목록조회(일별)
	@RequestMapping(value="qm/qualityTrendAnlyDayList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> qualityTrendAnlyDayList2(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			List<ItemCompleteAdmVo> list = itemCompleteAdmService.qualityTrendAnlyDayList(itemCompleteAdmVo);
			jsonData.put("result", "ok");
			jsonData.put("data", list);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	// 완제품검사 품질경향 분석 목록조회 
	@RequestMapping(value="qm/qualityTrendAnlyList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> qualityTrendAnlyList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			List<ItemCompleteAdmVo> list = itemCompleteAdmService.qualityTrendAnlyList(itemCompleteAdmVo);
			jsonData.put("result", "ok");
			jsonData.put("data", list);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	
	// 완제품검사 품질경향 분석 목록조회 
	@RequestMapping(value="qm/qualityTrendAnlyList11", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> qualityTrendAnlyList11(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			List<ItemCompleteAdmVo> list = itemCompleteAdmService.qualityTrendAnlyList11(itemCompleteAdmVo);
			jsonData.put("result", "ok");
			jsonData.put("data", list);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	// 완제품검사 원인별 불량누적현황 목록조회 
	@RequestMapping(value="qm/faultyStatusList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> faultyStatusList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			List<ItemCompleteAdmVo> list = itemCompleteAdmService.faultyStatusList(itemCompleteAdmVo);
			
			int faultyTypeCount = itemCompleteAdmService.faultyTypeCount(itemCompleteAdmVo);
			jsonData.put("result", "ok");
			jsonData.put("data", list);
			jsonData.put("faultyTypeCount", faultyTypeCount);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//기간별 완제품검사 결과조회
	@RequestMapping(value="qm/testResultCompleteList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> testResultCompleteList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("완제품검사 결과조회 vo:"+itemCompleteAdmVo);
		try {
			List<ItemCompleteAdmVo> itemCompleteAdmList =  itemCompleteAdmService.testResultCompleteList(itemCompleteAdmVo);				
			jsonData.put("data", itemCompleteAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//검사항목결과관리 연계번호 조회
	@RequestMapping(value="qm/inspResultAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inspResultAdmList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("검사항목결과관리 연계번호 조회: " + itemCompleteAdmVo);
		try {
			List<ItemCompleteAdmVo> inspResultAdmList =  itemCompleteAdmService.inspResultAdmList(itemCompleteAdmVo);				
			jsonData.put("data", inspResultAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
}
