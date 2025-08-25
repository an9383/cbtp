package mes.web.io;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.io.InOutWhsAdmVo;
import mes.domain.io.OutWhsAdmVo;
import mes.domain.io.PartReqAdmVo;
import mes.domain.io.PartReqVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.io.InOutWhsAdmService;
import mes.service.io.OutWhsAdmService;
import mes.service.io.PartReqService;
import mes.service.tm.StockPaymentAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class PartReqController {
	
	private static final Logger logger = LoggerFactory.getLogger(PartReqController.class);

	@Value("${file.returnPath}")
	private String file_purchase_Path;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private PartReqService partReqService;
	
	@Inject
	private OutWhsAdmService outWhsAdmService;
	
	@Inject
	private InOutWhsAdmService inOutWhsAdmService;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	
	
	//부품요청 메인
	@RequestMapping(value = "/iosc0170", method = RequestMethod.GET)
	public String iosc0170(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		return "io/iosc0170";
	}
	
	//부품요청 목록
	@RequestMapping(value = "io/partReqList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> partReqList(PartReqVo partReqVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("부품요청 목록조회 : "+partReqVo);
			List<PartReqVo> partReqList = partReqService.partReqList(partReqVo);
			jsonData.put("data", partReqList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부품요청 상세조회
	@RequestMapping(value = "io/partReqRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> partReqRead(PartReqVo partReqVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("부품요청 상세조회 : "+partReqVo);
			PartReqVo partReqRead = partReqService.partReqRead(partReqVo);
			jsonData.put("data", partReqRead);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부품요청 등록
	@RequestMapping(value = "io/partReqCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> partsRequestCreate(PartReqVo partReqVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			logger.info("부품요청 등록 : "+ partReqVo);
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(partReqVo.getArrayData());
			PartReqVo partReqDtlVo = new PartReqVo();
			PartReqAdmVo partReqAdmVo = new PartReqAdmVo();
			
			int partReqNo = partReqService.partReqNo(DateUtil.getToday("yyyyMMdd").toString());
			
			for(int i=0;i<jsonArray.size();i++){
				
				int partReqSeq = partReqService.partReqSeq(DateUtil.getToday("yyyyMMdd")+ "-" +  String.format("%03d",partReqNo));
				
				jsonObj.put(i, jsonArray.get(i));
				JSONObject jsonObjDtl = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
				partReqDtlVo.setPartReqNo(DateUtil.getToday("yyyyMMdd")+ "-" +  String.format("%03d",partReqNo));
				partReqDtlVo.setPartReqSeq(String.format("%d",partReqSeq));
				partReqDtlVo.setWorkOrdNo(jsonObjDtl.get("workOrdNo").toString());
				partReqDtlVo.setPrcssCd(jsonObjDtl.get("prcssCd").toString());
				partReqDtlVo.setPartCd(jsonObjDtl.get("partCd").toString());
				partReqDtlVo.setPartRev(jsonObjDtl.get("partRev").toString());
				partReqDtlVo.setReqQty(jsonObjDtl.get("reqQty").toString());				//요청 수량
				partReqDtlVo.setPartReqDate(DateUtil.getToday("yyyymmdd"));					//부품요청일(오늘 날짜)
				partReqDtlVo.setOutReqDate(jsonObjDtl.get("outReqDate").toString());		//출고요청일
				partReqDtlVo.setEmerYn(jsonObjDtl.get("emerYn").toString());				//긴급 여부
				partReqDtlVo.setReqStatus("001");											//요청상태(001 = 대기, 002 = 진행, 003 = 완료)
				partReqDtlVo.setPartReqChargr(jsonObjDtl.get("partReqChargr").toString());	//요청자
				partReqDtlVo.setPartReqGubun("001");										//구분자(001 = 작지, 002=일반)
				partReqDtlVo.setReqReason(jsonObjDtl.get("reqReason").toString());			//사유
				partReqDtlVo.setRegId(Utils.getUserId());
				
				partReqService.partReqCreate(partReqDtlVo);
			}
			JSONObject jsonObjDtl = (JSONObject) jsonParser.parse(jsonObj.get(0).toString());
			partReqAdmVo.setPartReqNo(DateUtil.getToday("yyyyMMdd")+ "-" +  String.format("%03d",partReqNo));
			partReqAdmVo.setPartReqDate(DateUtil.getToday("yyyymmdd"));
			partReqAdmVo.setPartReqChargr(jsonObjDtl.get("partReqChargr").toString());
			partReqAdmVo.setPartReqGubun("001");
			partReqAdmVo.setApprovalCd("001");
			partReqAdmVo.setRegId(Utils.getUserId());
			partReqService.partReqAdmCreate(partReqAdmVo);
			
			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부품요청 DTL삭제
	@RequestMapping(value = "io/partReqDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> partReqDelete(PartReqVo partReqVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			partReqService.partReqDelete(partReqVo);
			logger.info("부품요청 DTL 삭제 후" + partReqVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	//자재요청 메인
	@RequestMapping(value = "/iosc0220", method = RequestMethod.GET)
	public String iosc0220(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		return "io/iosc0220";
	}
	
	//자재요청요청 목록
	@RequestMapping(value = "io/matrlReqList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> matrlReqList(PartReqVo partReqVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("부품요청 목록조회 : "+partReqVo);
			List<PartReqVo> partReqList = partReqService.partReqAdmList(partReqVo);
			jsonData.put("data", partReqList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//자재요청 등록
	@RequestMapping(value = "io/matrlReqCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> matrlReqCreate(PartReqVo partReqVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			logger.info("자재요청 등록 : "+ partReqVo);
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(partReqVo.getArrayData());
			PartReqVo partReqDtlVo = new PartReqVo();
			PartReqAdmVo partReqAdmVo = new PartReqAdmVo();
			
			int partReqNo = partReqService.partReqNo(DateUtil.getToday("yyyyMMdd").toString());
			
			for(int i=0;i<jsonArray.size();i++){
				
				int partReqSeq = partReqService.partReqSeq(DateUtil.getToday("yyyyMMdd")+ "-" +  String.format("%03d",partReqNo));
				
				jsonObj.put(i, jsonArray.get(i));
				JSONObject jsonObjDtl = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
				
				partReqDtlVo.setPartReqNo(DateUtil.getToday("yyyyMMdd")+ "-" +  String.format("%03d",partReqNo));
				partReqDtlVo.setPartReqSeq(String.format("%d",partReqSeq));
				partReqDtlVo.setPartCd(jsonObjDtl.get("partCd").toString());
				partReqDtlVo.setPartRev(jsonObjDtl.get("partRev").toString());
				partReqDtlVo.setReqQty(jsonObjDtl.get("reqQty").toString());				//요청 수량
				partReqDtlVo.setPartReqDate(DateUtil.getToday("yyyymmdd"));					//부품요청일(오늘 날짜)
				partReqDtlVo.setOutReqDate(jsonObjDtl.get("outReqDate").toString());		//출고요청일
				partReqDtlVo.setEmerYn(jsonObjDtl.get("emerYn").toString());				//긴급 여부
				partReqDtlVo.setReqStatus("001");											//요청상태(001 = 대기, 002 = 진행, 003 = 완료)
				partReqDtlVo.setPartReqChargr(jsonObjDtl.get("partReqChargr").toString());	//요청자
				partReqDtlVo.setPartReqDept(jsonObjDtl.get("partReqDept").toString());		//부서
				partReqDtlVo.setPartReqGubun("002");										//구분자(001 = 작지, 002=일반)
				partReqDtlVo.setReqReason(jsonObjDtl.get("reqReason").toString());			//사유
				partReqDtlVo.setRegId(Utils.getUserId());
				
				partReqService.partReqCreate(partReqDtlVo);
			}
			
			JSONObject jsonObjDtl = (JSONObject) jsonParser.parse(jsonObj.get(0).toString());
			partReqAdmVo.setPartReqNo(DateUtil.getToday("yyyyMMdd")+ "-" +  String.format("%03d",partReqNo));
			partReqAdmVo.setPartReqDate(DateUtil.getToday("yyyymmdd"));
			partReqAdmVo.setPartReqChargr(jsonObjDtl.get("partReqChargr").toString());
			partReqAdmVo.setPartReqDept(jsonObjDtl.get("partReqDept").toString());		//부서
			partReqAdmVo.setPartReqDesc(jsonObjDtl.get("partReqDesc").toString());
			partReqAdmVo.setApprovalCd("002");
			partReqAdmVo.setPartReqGubun("002");
			partReqAdmVo.setRegId(Utils.getUserId());
			partReqService.partReqAdmCreate(partReqAdmVo);
			
			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부품요청 ADM삭제
	@RequestMapping(value = "io/partReqAdmDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> partReqAdmDelete(PartReqVo partReqVo, PartReqAdmVo partReqAdmVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			partReqService.partReqAdmDelete(partReqAdmVo);
			partReqService.partReqDelete(partReqVo);
			logger.info("부품요청 ADM 삭제 후" + partReqVo);
			logger.info("부품요청 ADM 삭제 후" + partReqAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	//자재요청 수정
	@RequestMapping(value = "io/matrlReqUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> matrlReqUpdate(PartReqVo partReqVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			logger.info("자재요청 등록 : "+ partReqVo);
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(partReqVo.getArrayData());
			PartReqVo partReqDtlVo = new PartReqVo();
			PartReqAdmVo partReqAdmVo = new PartReqAdmVo();
			
			jsonObj.put(0, jsonArray.get(0));
			JSONObject jsonObjDtl2 = (JSONObject) jsonParser.parse(jsonObj.get(0).toString());
			String partReqNo = jsonObjDtl2.get("partReqNo").toString();
			
			for(int i=0;i<jsonArray.size();i++){
				
				jsonObj.put(i, jsonArray.get(i));
				JSONObject jsonObjDtl = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
				
				int partReqSeq = partReqService.partReqSeq(partReqNo);
				
				if (jsonObjDtl.get("partReqSeq").toString().isEmpty()) {
					logger.info("-------------나는 값을 가지고 있지 않은 테이블이야---------------");
					//추가된 테이블 등록 부분
					partReqDtlVo.setPartReqNo(jsonObjDtl.get("partReqNo").toString());
					partReqDtlVo.setPartReqSeq(String.format("%d",partReqSeq));
					partReqDtlVo.setPartCd(jsonObjDtl.get("partCd").toString());
					partReqDtlVo.setPartRev(jsonObjDtl.get("partRev").toString());
					partReqDtlVo.setReqQty(jsonObjDtl.get("reqQty").toString());				//요청 수량
					partReqDtlVo.setPartReqDate(DateUtil.getToday("yyyymmdd"));				//부품요청일(오늘 날짜)
					partReqDtlVo.setOutReqDate(jsonObjDtl.get("outReqDate").toString());		//출고요청일
					partReqDtlVo.setEmerYn(jsonObjDtl.get("emerYn").toString());				//긴급 여부
					partReqDtlVo.setReqStatus("001");											//요청상태(001 = 대기, 002 = 진행, 003 = 완료)
					partReqDtlVo.setPartReqChargr(jsonObjDtl.get("partReqChargr").toString());	//요청자
					partReqDtlVo.setPartReqDept(jsonObjDtl.get("partReqDept").toString());		//부서
					partReqDtlVo.setPartReqGubun("002");										//구분자(001 = 작지, 002=일반)
					partReqDtlVo.setReqReason(jsonObjDtl.get("reqReason").toString());			//사유
					partReqDtlVo.setRegId(Utils.getUserId());
					logger.info("partReqDtlVo 값을 가지고 있지 않은 테이블---------- "+partReqDtlVo);
					partReqService.partReqCreate(partReqDtlVo);
					
				}else {
					logger.info("***************나는 값을 가지고 있는 테이블이야*******************");
					//기존 테이블 수정 부분
					partReqDtlVo.setPartReqNo(jsonObjDtl.get("partReqNo").toString());
					partReqDtlVo.setPartReqSeq(jsonObjDtl.get("partReqSeq").toString());
					partReqDtlVo.setPartCd(jsonObjDtl.get("partCd").toString());
					partReqDtlVo.setPartRev(jsonObjDtl.get("partRev").toString());
					partReqDtlVo.setReqQty(jsonObjDtl.get("reqQty").toString());				//요청 수량
					partReqDtlVo.setPartReqDate(jsonObjDtl.get("partReqDate").toString());		//부품요청일(오늘 날짜) ****
					partReqDtlVo.setOutReqDate(jsonObjDtl.get("outReqDate").toString());		//출고요청일
					partReqDtlVo.setEmerYn(jsonObjDtl.get("emerYn").toString());				//긴급 여부
					partReqDtlVo.setReqStatus("001");											//요청상태(001 = 대기, 002 = 진행, 003 = 완료)
					partReqDtlVo.setPartReqChargr(jsonObjDtl.get("partReqChargr").toString());	//요청자
					partReqDtlVo.setPartReqDept(jsonObjDtl.get("partReqDept").toString());		//부서
					partReqDtlVo.setPartReqGubun("002");										//구분자(001 = 작지, 002=일반)
					partReqDtlVo.setReqReason(jsonObjDtl.get("reqReason").toString());			//사유
					partReqDtlVo.setRegId(Utils.getUserId());
					logger.info("partReqDtlVo 값을 가지고 있는 테이블******** "+partReqDtlVo);
					partReqService.partReqUpdate(partReqDtlVo);
				}
			}
			
			JSONObject jsonObjDtl3 = (JSONObject) jsonParser.parse(jsonObj.get(0).toString());
			//ADM수정
			partReqAdmVo.setPartReqNo(jsonObjDtl3.get("partReqNo").toString());
			partReqAdmVo.setPartReqDate(DateUtil.getToday("yyyymmdd"));
			partReqAdmVo.setPartReqChargr(jsonObjDtl3.get("partReqChargr").toString());
			partReqAdmVo.setPartReqDept(jsonObjDtl3.get("partReqDept").toString());		//부서
			partReqAdmVo.setPartReqDesc(jsonObjDtl3.get("partReqDesc").toString());
			partReqAdmVo.setPartReqGubun("002");
			partReqAdmVo.setRegId(Utils.getUserId());
			partReqService.partReqAdmUpdate(partReqAdmVo);
			
			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//자재요청 승인처리
	@RequestMapping(value = "io/matrlReqApproval", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> matrlReqApproval(PartReqAdmVo partReqAdmVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			partReqAdmVo.setUpdId(Utils.getUserId());
			logger.info("승인처리" + partReqAdmVo);
			partReqService.partReqAdmUpdate(partReqAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//출고요청 
	
	//요청출고 DTL 목록 조회
	@RequestMapping(value = "io/partReqDtlOutList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> partReqDtlOutList(PartReqVo partReqVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("요청출고 DTL 목록 조회 : "+partReqVo);
			List<PartReqVo> partReqDtlOutList = partReqService.partReqDtlOutList(partReqVo);
			jsonData.put("data", partReqDtlOutList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//바코드 목록 조회
	@RequestMapping(value = "io/partReqBarcodeList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> partReqBarcodeList(PartReqVo partReqVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("바코드 목록조회 : "+partReqVo);
			List<PartReqVo> partReqBarcodeList = partReqService.partReqBarcodeList(partReqVo);
			
			jsonData.put("data", partReqBarcodeList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		}
	
	//바코드 상세조회
	@RequestMapping(value = "io/partReqBarcodeRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> partReqBarcodeRead(PartReqVo partReqVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("바코드 상세조회 : "+partReqVo);
			PartReqVo partReqBarcodeRead = partReqService.partReqBarcodeRead(partReqVo);
			partReqBarcodeRead.getRemainQty();
			logger.info("개수를 알려주겠니?????????????????? : "+partReqBarcodeRead.getRemainQty());
			
			if((Float.parseFloat(partReqBarcodeRead.getRemainQty())) == 0) {
				logger.debug("나는 값이 0이야 ");
				jsonData.put("count", 0);
			}else {
				jsonData.put("data", partReqBarcodeRead);
				jsonData.put("result", "ok");
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		}
	
	//바코드  등록
	@RequestMapping(value = "io/partReqBarcodeCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> partReqBarcodeCreate(PartReqVo partReqVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			logger.info("바코드 등록 : "+ partReqVo);
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(partReqVo.getArrayData());
			
			PartReqVo partReqDtlVo = new PartReqVo();		//요청 출고((reqStatus, 구분)Update)
			PartReqAdmVo partReqAdmVo = new PartReqAdmVo();	//요청 출고((reqStatus, 구분)Update)
			OutWhsAdmVo outWhsAdmVo = new OutWhsAdmVo();	//부품출고(Insert)
			InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();	//입출고관리(남은 수량  Update)
			
			StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();	//입출고관리(재고수불관리 Update)
			
			//요청출고
			for(int i=0;i<jsonArray.size();i++){
				jsonObj.put(i, jsonArray.get(i));
				JSONObject jsonObjDtl = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
				
				logger.info("totalQty : "+Integer.parseInt(jsonObjDtl.get("totalQty").toString()));
				logger.info("reqQty : "+Float.parseFloat(jsonObjDtl.get("reqQty").toString()));
				
				partReqDtlVo.setPartReqNo(jsonObjDtl.get("partReqNo").toString());
				partReqDtlVo.setPartReqSeq(jsonObjDtl.get("partReqSeq").toString());
				partReqDtlVo.setReqOutQty(jsonObjDtl.get("preOutQty").toString());
				
				//요청출고테이블 수정
				if(Float.parseFloat(jsonObjDtl.get("reqQty").toString()) <= Integer.parseInt(jsonObjDtl.get("totalQty").toString())) {
					partReqDtlVo.setReqStatus("003");	//요청상태(001 = 대기, 002 = 진행, 003 = 완료)
				}else{
					partReqDtlVo.setReqStatus("002");	//요청상태(001 = 대기, 002 = 진행, 003 = 완료)
				}
				partReqService.partReqUpdate(partReqDtlVo);

				
				//출고테이블
				if(jsonObjDtl.get("poNo").toString().equals("null") || jsonObjDtl.get("poNo").toString()==null) {
					String today = DateUtil.getToday("YYMMdd");
					String poNoSeq = inOutWhsAdmService.getPoNo(today);
					String poNo = "I"+today+"-"+poNoSeq;
					
					outWhsAdmVo.setPoNo(poNo);
					outWhsAdmVo.setPoSeq(0);
					outWhsAdmVo.setInSeq(0);
				}else {
					outWhsAdmVo.setPoNo(jsonObjDtl.get("poNo").toString());								//발주번호
					outWhsAdmVo.setPoSeq(Integer.parseInt(jsonObjDtl.get("poSeq").toString()));			//발주시퀀스
					outWhsAdmVo.setInSeq(Integer.parseInt(jsonObjDtl.get("inSeq").toString()));			//가입고 시퀀스
				}
				
				outWhsAdmVo.setOutSeq(outWhsAdmService.getOutSeq(outWhsAdmVo));	
				outWhsAdmVo.setBarcodeNo(jsonObjDtl.get("barcodeNo").toString());					//바코드
				outWhsAdmVo.setPreOutQty(Float.parseFloat(jsonObjDtl.get("preOutQty").toString()));	//가출고량
				outWhsAdmVo.setPartReqNo(jsonObjDtl.get("partReqNo").toString()+"-"+jsonObjDtl.get("partReqSeq").toString()); //요청번호
				outWhsAdmVo.setBarcodeNo(jsonObjDtl.get("barcodeNo").toString());					//바코드
				outWhsAdmVo.setLotNo(jsonObjDtl.get("barcodeNo").toString());
				outWhsAdmVo.setPartCd(jsonObjDtl.get("partCd").toString());							//부품코드
				outWhsAdmVo.setPartRev(jsonObjDtl.get("partRev").toString());						//부품리비전
				outWhsAdmVo.setStatusCd("O");														//자재상태
				outWhsAdmVo.setPreOutWhsDate(jsonObjDtl.get("preOutWhsDate").toString());			//가출고일
				outWhsAdmVo.setPreWorkCharger(jsonObjDtl.get("preWorkCharger").toString());	 		//가출고 담당자
				outWhsAdmVo.setLocationNo(jsonObjDtl.get("locationNo").toString());		//창고
				outWhsAdmVo.setAreaCd(jsonObjDtl.get("areaCd").toString());
				outWhsAdmVo.setFloorCd(jsonObjDtl.get("floorCd").toString());
				outWhsAdmVo.setLocationCd(jsonObjDtl.get("locationCd").toString());
				outWhsAdmVo.setInWhsDesc(jsonObjDtl.get("inWhsDesc").toString());					//비고
				outWhsAdmVo.setOutCase(jsonObjDtl.get("outCase").toString());
				
				logger.info("partRegGubun:=====>"+jsonObjDtl.get("partReqGubun").toString());
				
				
				if(jsonObjDtl.get("partReqGubun").toString().equals("001")) {
					logger.info("workOrdNo:=====>"+jsonObjDtl.get("workOrdNo").toString());
					outWhsAdmVo.setWorkOrdNo(jsonObjDtl.get("workOrdNo").toString());				//출고 작지번호
				}
				
				outWhsAdmVo.setRegId(Utils.getUserId());
				outWhsAdmService.preOutWhsAdmCreate(outWhsAdmVo);
				
				//출고테이블에 해당 바코드 여부확인
				//출고테이블 update
				/*if(outWhsAdmService.barcodeExsitCheck(outWhsAdmVo)>0) {	
					
					logger.info("존재함");
					
					outWhsAdmVo.setUpdId(Utils.getUserId());
					outWhsAdmService.updatePreOutQty(outWhsAdmVo);
					
				//출고테이블 create	
				}else {													
					
					logger.info("존재NONONONO");
					
					
				}
				*/
				//입고 테이블 update
				if(outWhsAdmVo.getPoNo()!=null && !outWhsAdmVo.getPoNo().equals("")) {
					outWhsAdmService.updateRemainQty(outWhsAdmVo);
				}
				

				//수불테이블 create
				String spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd")); //수불 전표번호
				
				stockPaymentAdmVo.setSpNo(spNo);
				stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
				stockPaymentAdmVo.setSpType("001");
				stockPaymentAdmVo.setSpCd(outWhsAdmVo.getPartCd());
				stockPaymentAdmVo.setSpRev(outWhsAdmVo.getPartRev());
				stockPaymentAdmVo.setSpGubun("002");
				stockPaymentAdmVo.setSpDate(outWhsAdmVo.getPreOutWhsDate());
				stockPaymentAdmVo.setSpQty(Float.toString(outWhsAdmVo.getPreOutQty()));
				stockPaymentAdmVo.setBarcodeNo(outWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setSourceNo(outWhsAdmVo.getBarcodeNo());
				stockPaymentAdmVo.setLocationCd(outWhsAdmVo.getLocationCd());
				stockPaymentAdmVo.setAreaCd(outWhsAdmVo.getAreaCd());
				stockPaymentAdmVo.setFloorCd(outWhsAdmVo.getFloorCd());
				stockPaymentAdmVo.setLocationNo(outWhsAdmVo.getLocationNo());
				stockPaymentAdmVo.setRegId(Utils.getUserId());
				
				stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
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
