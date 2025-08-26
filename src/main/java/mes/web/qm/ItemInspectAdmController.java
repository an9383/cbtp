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

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.fileupload.MultipartStream.ItemInputStream;
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

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.bm.LocationAdmVo;
import mes.domain.bs.DeliveryProcDtlVo;
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.io.ItemUnitcostHisAdmVo;
import mes.domain.io.PurchaseOrderAdmVo;
import mes.domain.qm.ItemFaultyAdmVo;
import mes.domain.qm.ItemInspectAdmVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.domain.wm.ItemWhsAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.LocationAdmService;
import mes.service.io.InOutWhsAdmService;
import mes.service.qm.ItemFaultyJdgAdmService;
import mes.service.qm.ItemInspectAdmService;
import mes.service.tm.StockPaymentAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;


@Controller
public class ItemInspectAdmController {
	private static final Logger logger = LoggerFactory.getLogger(ItemInspectAdmController.class);

	@Inject
	private ItemInspectAdmService itemInspectAdmService;
	
	@Inject
	private InOutWhsAdmService inOutWhsAdmService;
	
	@Inject
	private StockPaymentAdmService stockPaymentAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private LocationAdmService locationAdmService;
	
	
	@Value("${file.itemInspectAdm}")
	private String file_itemInspect_adm_Path;
	
	
	//수입검사관리대장(사출) 메인
	@RequestMapping(value = "/qmsc0010", method = RequestMethod.GET)
	public String qmsc0010(Locale locale, Model model,HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("userNm", Utils.getUserNm());
		model.addAttribute("userNumber", Utils.getUserNumber());
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
	
		commonCodeVo.setBaseGroupCd("052"); // 특이사항
		List<CommonCodeAdmVo> inspectDescList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectDesc", inspectDescList);
		
		commonCodeVo.setBaseGroupCd("053"); // QA판정
		List<CommonCodeAdmVo> qaEvalList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", qaEvalList);
		
		commonCodeVo.setBaseGroupCd("054"); // 검사수준
		List<CommonCodeAdmVo> inspectLvlList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectLvl", inspectLvlList);
		
		CommonCodeAdmVo commonCodeVo2 = new CommonCodeAdmVo();
		commonCodeVo2.setBaseGroupCd("116"); // 수입검사성적서&검사기준서 내용
		commonCodeVo2.setEtc1("수입검사");
		List<CommonCodeAdmVo> contentsList = commonCodeAdmService.CommonCodeList(commonCodeVo2);
		model.addAttribute("contents", contentsList);
		
		commonCodeVo.setBaseGroupCd("127"); // 검사입력방식
		List<CommonCodeAdmVo> inputMethodList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inputMethod", inputMethodList);
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> judgeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("judge", judgeList);

		commonCodeVo.setBaseGroupCd("128"); // 실행여부
		List<CommonCodeAdmVo> silhangList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("silhang", silhangList);
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		
		return "qm/qmsc0010";
	}
	
	//수입검사관리대장(봉제) 메인
	@RequestMapping(value = "/qmsc0190", method = RequestMethod.GET)
	public String qmsc0190(Locale locale, Model model,HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
	
		commonCodeVo.setBaseGroupCd("052"); // 특이사항
		List<CommonCodeAdmVo> inspectDescList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectDesc", inspectDescList);
		
		commonCodeVo.setBaseGroupCd("053"); // QA판정
		List<CommonCodeAdmVo> qaEvalList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", qaEvalList);
		
		commonCodeVo.setBaseGroupCd("054"); // 검사수준
		List<CommonCodeAdmVo> inspectLvlList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectLvl", inspectLvlList);
		
		CommonCodeAdmVo commonCodeVo2 = new CommonCodeAdmVo();
		commonCodeVo2.setBaseGroupCd("116"); // 수입검사성적서&검사기준서 내용
		commonCodeVo2.setEtc1("수입검사");
		List<CommonCodeAdmVo> contentsList = commonCodeAdmService.CommonCodeList(commonCodeVo2);
		model.addAttribute("contents", contentsList);
		
		commonCodeVo.setBaseGroupCd("127"); // 검사입력방식
		List<CommonCodeAdmVo> inputMethodList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inputMethod", inputMethodList);
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> judgeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("judge", judgeList);		

		commonCodeVo.setBaseGroupCd("145"); // cavityCnt
		List<CommonCodeAdmVo> cavityCntList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("cavityCnt", cavityCntList);
		
		commonCodeVo.setBaseGroupCd("128"); // 실행여부
		List<CommonCodeAdmVo> silhangList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("silhang", silhangList);
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		
		return "qm/qmsc0190";
	}
	
	//수입검사관리대장(정밀가공) 메인
	@RequestMapping(value = "/qmsc0300", method = RequestMethod.GET)
	public String qmsc0300(Locale locale, Model model,HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
	
		commonCodeVo.setBaseGroupCd("052"); // 특이사항
		List<CommonCodeAdmVo> inspectDescList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectDesc", inspectDescList);
		
		commonCodeVo.setBaseGroupCd("053"); // QA판정
		List<CommonCodeAdmVo> qaEvalList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", qaEvalList);
		
		commonCodeVo.setBaseGroupCd("054"); // 검사수준
		List<CommonCodeAdmVo> inspectLvlList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inspectLvl", inspectLvlList);
		
		CommonCodeAdmVo commonCodeVo2 = new CommonCodeAdmVo();
		commonCodeVo2.setBaseGroupCd("116"); // 수입검사성적서&검사기준서 내용
		commonCodeVo2.setEtc1("수입검사");
		List<CommonCodeAdmVo> contentsList = commonCodeAdmService.CommonCodeList(commonCodeVo2);
		model.addAttribute("contents", contentsList);
		
		commonCodeVo.setBaseGroupCd("127"); // 검사입력방식
		List<CommonCodeAdmVo> inputMethodList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("inputMethod", inputMethodList);
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> judgeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("judge", judgeList);		

		commonCodeVo.setBaseGroupCd("145"); // cavityCnt
		List<CommonCodeAdmVo> cavityCntList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("cavityCnt", cavityCntList);
		
		commonCodeVo.setBaseGroupCd("128"); // 실행여부
		List<CommonCodeAdmVo> silhangList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("silhang", silhangList);
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		
		return "qm/qmsc0300";
	}
	
	
	//수입검사결과조회(사출) 메인
	@RequestMapping(value = "/qmsc0140", method = RequestMethod.GET)
	public String qmsc0140(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> qaEvalList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", qaEvalList);
		
		commonCodeVo.setBaseGroupCd("062"); // 판정
		List<CommonCodeAdmVo> approvalCode = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("approval", approvalCode);
		
		return "qm/qmsc0140";
	}
	
	//수입검사결과조회(봉제) 메인
	@RequestMapping(value = "/qmsc0210", method = RequestMethod.GET)
	public String qmsc0210(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> qaEvalList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", qaEvalList);
		
		commonCodeVo.setBaseGroupCd("062"); // 판정
		List<CommonCodeAdmVo> approvalCode = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("approval", approvalCode);
		
		return "qm/qmsc0210";
	}
	
	//수입검사결과조회(정밀가공) 메인
	@RequestMapping(value = "/qmsc0330", method = RequestMethod.GET)
	public String qmsc0330(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> qaEvalList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("qaEval", qaEvalList);
		
		commonCodeVo.setBaseGroupCd("062"); // 판정
		List<CommonCodeAdmVo> approvalCode = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("approval", approvalCode);
		
		return "qm/qmsc0330";
	}
	
	
	// 수입검사 목록조회 
	@RequestMapping(value = "qm/itemInspectAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemInspectAdmList(ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			List<ItemInspectAdmVo> itemInspectAdmList = itemInspectAdmService.itemInspectAdmList(itemInspectAdmVo);
			jsonData.put("data", itemInspectAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수입검사 상세조회 
	@RequestMapping(value = "qm/itemInspectAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemInspectAdmRead(ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			ItemInspectAdmVo itemInspectAdmRead = itemInspectAdmService.itemInspectAdmRead(itemInspectAdmVo);
			jsonData.put("data", itemInspectAdmRead);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수입검사 등록 
	@RequestMapping(value = "qm/itemInspectAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemInspectAdmCreate(MultipartHttpServletRequest multi, ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("vo : " + itemInspectAdmVo);
			/*int preInWhsQty = itemInspectAdmVo.getPreInWhsQty();
			
			int pairCnt = itemInspectAdmVo.getPairCnt();
			
			int faultyCnt = preInWhsQty-pairCnt;
			
			if(preInWhsQty == (pairCnt+faultyCnt)){*/
			
		    uploadFile(multi, itemInspectAdmVo);
			itemInspectAdmVo.setRegId(Utils.getUserId());
			itemInspectAdmService.itemInspectAdmCreate(itemInspectAdmVo);
			
			itemInspectAdmVo.setStatusCd("I");
			itemInspectAdmVo.setApprovalCd("002");
			itemInspectAdmService.inOutWhsAdmUpdate(itemInspectAdmVo);
			
			/*
			 * if(itemInspectAdmVo.getInspectFileNm()!=null ||
			 * !itemInspectAdmVo.getInspectFileNm().equals("")) {
			 * itemInspectAdmVo.setPoStatus("002");
			 * itemInspectAdmService.poStatusUpdate(itemInspectAdmVo); }
			 */
			
//				ItemInspectAdmVo fileNameList = itemInspectAdmService.getInspectFileNm(itemInspectAdmVo);
//				jsonData.put("matrlFileNm", fileNameList.getMatrlFileNm());
//				jsonData.put("surfaceFileNm", fileNameList.getSurfaceFileNm());
//				jsonData.put("heatFileNm", fileNameList.getHeatFileNm());
//				jsonData.put("productFileNm", fileNameList.getProductFileNm());
//				jsonData.put("reportsFileNm", fileNameList.getReportsFileNm());
			
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수입검사 수정
	@RequestMapping(value = "qm/itemInspectAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemInspectAdmUpdate(MultipartHttpServletRequest multi, ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("vo:"+itemInspectAdmVo);
		try {
		/*	int preInWhsQty = itemInspectAdmVo.getPreInWhsQty();
			int pairCnt = itemInspectAdmVo.getPairCnt();
			int faultyCnt = itemInspectAdmVo.getFaultyCnt();
			
			
			if(preInWhsQty == (pairCnt+faultyCnt)){*/
			
				uploadFile(multi, itemInspectAdmVo);
				itemInspectAdmVo.setUpdId(Utils.getUserId());
				itemInspectAdmService.itemInspectAdmUpdate(itemInspectAdmVo);
				
				itemInspectAdmService.inOutWhsAdmUpdate(itemInspectAdmVo);
				
//				ItemInspectAdmVo fileNameList = itemInspectAdmService.getInspectFileNm(itemInspectAdmVo);
//				jsonData.put("matrlFileNm", fileNameList.getMatrlFileNm());
//				jsonData.put("surfaceFileNm", fileNameList.getSurfaceFileNm());
//				jsonData.put("heatFileNm", fileNameList.getHeatFileNm());
//				jsonData.put("productFileNm", fileNameList.getProductFileNm());
//				jsonData.put("reportsFileNm", fileNameList.getReportsFileNm());
				
				jsonData.put("result", "ok");
				
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//수입검사성적서 업로드
	public void uploadFile(MultipartHttpServletRequest multi, ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		
		try {
			String poNo = multi.getParameter("poNo").toString();
			String poSeq = multi.getParameter("poSeq").toString();
			String inSeq = multi.getParameter("inSeq").toString();
			
			String newFileName = "";
			String path = file_itemInspect_adm_Path+ "/" + poNo + "/" +poSeq;
			
			File dir = new File(path);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			for(int i=1; i<=5; i++) {
				MultipartFile mFile = multi.getFile("fileNm"+i);
				logger.info(mFile.getName());
				logger.info("파일 비어있니?"+mFile.isEmpty());
				if(mFile.isEmpty()) {
				
					switch (i) {
					case 1:
						itemInspectAdmVo.setMatrlFileNm("");
						break;
					case 2:
						itemInspectAdmVo.setSurfaceFileNm("");
						break;
					case 3:
						itemInspectAdmVo.setHeatFileNm("");
						break;
					case 4:
						itemInspectAdmVo.setProductFileNm("");
						break;
					case 5:
						itemInspectAdmVo.setReportsFileNm("");
						break;
					}
					
				}else {
					String fileName = mFile.getOriginalFilename();
					newFileName = inSeq+"_"+ i +"." +fileName.substring(fileName.lastIndexOf(".")+1);
					
					switch (i) {
					case 1:
						itemInspectAdmVo.setMatrlFileNm(fileName);
						break;
					case 2:
						itemInspectAdmVo.setSurfaceFileNm(fileName);
						break;
					case 3:
						itemInspectAdmVo.setHeatFileNm(fileName);
						break;
					case 4:
						itemInspectAdmVo.setProductFileNm(fileName);
						break;
					case 5:
						itemInspectAdmVo.setReportsFileNm(fileName);
						break;
					}
					
					try {
						mFile.transferTo(new File(path + "/" + newFileName));
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 수입검사성적서 파일 다운로드
	@RequestMapping(value = "qm/downloadFile", method = RequestMethod.GET)
	public @ResponseBody void downloadFile(HttpServletResponse res, HttpServletRequest req,
		    @RequestParam(value = "poNo") String poNo,
		    @RequestParam(value = "poSeq") String poSeq,
		    @RequestParam(value = "inSeq") String inSeq,
		    @RequestParam(value = "value") String value,
		    ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		try {

			ItemInspectAdmVo fileNmList = itemInspectAdmService.getInspectFileNm(itemInspectAdmVo);

			String dFile="";
			
			if(value.equals("1")) {
				dFile = fileNmList.getMatrlFileNm();
			}else if(value.equals("2")){
			    dFile = fileNmList.getSurfaceFileNm();
			}else if(value.equals("3")) {
				dFile = fileNmList.getHeatFileNm();
			}else if(value.equals("4")) {
				dFile = fileNmList.getProductFileNm();
			}else if(value.equals("5")) {
				dFile = fileNmList.getReportsFileNm();
			}
			
			String newFileName = inSeq+"_"+ value +"." +dFile.substring(dFile.lastIndexOf(".")+1);

			String path = file_itemInspect_adm_Path +"/"+ poNo + "/" + poSeq + "/" + newFileName;

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
	
	//수입검사성적서 파일 삭제
	@RequestMapping(value="qm/inspectFileDelete", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inspectFileDelete(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("vo:"+itemInspectAdmVo);
			itemInspectAdmService.inspectFileDelete(itemInspectAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	// 수입검사 승인상태 수정
	@RequestMapping(value="qm/poStatusUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> poStatusUpdate(@RequestBody List<Map<String, Object>> list) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		StockPaymentAdmVo stockPaymentAdmVo = new StockPaymentAdmVo();
		ItemInspectAdmVo itemInspectAdmVo = new ItemInspectAdmVo();
		logger.info("list:" + list);
		try {
			
			logger.info("itemInspectAdmVo : " + itemInspectAdmVo);
			itemInspectAdmVo.setInSlipNo(list.get(0).get("inSlipNo").toString());
			itemInspectAdmVo.setQaEval(list.get(0).get("qaEval").toString());
			itemInspectAdmVo.setApprovalYn("001");
			itemInspectAdmVo.setUpdId(Utils.getUserId());
			logger.info("itemInspectAdmVo:"+itemInspectAdmVo);
			itemInspectAdmService.itemInspectMasterUpdate(itemInspectAdmVo);
			
			
			for(Map<String, Object> m : list) {
				
				itemInspectAdmVo.setInSlipSeq(m.get("inSlipSeq").toString());
				String statusCd = itemInspectAdmService.statusCdCheck(itemInspectAdmVo);
			
				if(statusCd.equals("S")) {
			    	jsonData.put("result", "fail");
			    	jsonData.put("message", "우선 수입검사 등록을 해주세요.");

			    } else if(statusCd.equals("L")){
			    	jsonData.put("result", "fail");
			    	jsonData.put("message", "이미 승인되었습니다. 확인해주세요.");
			    	
			    } else {
			    	
	  				itemInspectAdmVo.setStatusCd("A"); //승인처리
	  				itemInspectAdmVo.setApprovalCd("001");
	  				itemInspectAdmService.inOutWhsAdmUpdate(itemInspectAdmVo);
	  				
  					inOutWhsAdmVo.setInSlipNo(itemInspectAdmVo.getInSlipNo());
					inOutWhsAdmVo.setInSlipSeq(itemInspectAdmVo.getInSlipSeq());
					inOutWhsAdmVo.setInWhsQty(m.get("inWhsQty").toString());
	  				inOutWhsAdmVo.setBarcodeNo(m.get("barcodeNo").toString());
	  				inOutWhsAdmVo.setInWhsDate(inOutWhsAdmService.inOutWhsAdmRead(inOutWhsAdmVo).getPreInWhsDate());
	  				inOutWhsAdmVo.setUpdId(Utils.getUserId());
	  				inOutWhsAdmVo.setItemInspectCheck("true");
	  				inOutWhsAdmVo.setInOutWhsCheck("false");
	  				inOutWhsAdmService.inOutWhsAdmCreate(inOutWhsAdmVo);
		  			
	  				String spNo = "";
	  				//1. 자재창고 -> 자재창고(양품) 입고
	  				if(m.get("inWhsQty")!=null && !m.get("inWhsQty").equals("0")) {
	  					spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
						stockPaymentAdmVo.setSpNo(spNo); 
						stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
						stockPaymentAdmVo.setSpType(m.get("itemGubun").toString());
						stockPaymentAdmVo.setSpCd(m.get("itemSeq").toString());
						stockPaymentAdmVo.setSpGubun("001");
						stockPaymentAdmVo.setSpSubGubun("자재입고");
						stockPaymentAdmVo.setSpDate(inOutWhsAdmVo.getInWhsDate());
						stockPaymentAdmVo.setSpQty(inOutWhsAdmVo.getInWhsQty());
						stockPaymentAdmVo.setBarcodeNo(inOutWhsAdmVo.getBarcodeNo());
						stockPaymentAdmVo.setSourceNo(m.get("barcodeNo").toString());
						stockPaymentAdmVo.setLocationCd(m.get("locationCd").toString());
						stockPaymentAdmVo.setLocationNo(m.get("locationNo").toString());
						stockPaymentAdmVo.setRegId(Utils.getUserId());
						stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);
	  				}
	  				
	  				//2. 부적합창고 -> 부적합창고 입고
	  				if(m.get("faultyCnt")!=null && !m.get("faultyCnt").equals("0")) {
		  				spNo = stockPaymentAdmService.getSpNo(DateUtil.getToday("yyyymmdd"));
						stockPaymentAdmVo.setSpNo(spNo);
						stockPaymentAdmVo.setSpSeq(stockPaymentAdmService.getSpSeq(stockPaymentAdmVo));
						stockPaymentAdmVo.setSpType(m.get("itemGubun").toString());
						stockPaymentAdmVo.setSpCd(m.get("itemSeq").toString());
						stockPaymentAdmVo.setSpGubun("001");
						stockPaymentAdmVo.setSpSubGubun("자재입고");
						stockPaymentAdmVo.setSpDate(inOutWhsAdmVo.getInWhsDate());
						stockPaymentAdmVo.setSpQty(m.get("faultyCnt").toString());
						stockPaymentAdmVo.setBarcodeNo(inOutWhsAdmVo.getBarcodeNo());
						stockPaymentAdmVo.setSourceNo(m.get("barcodeNo").toString());
						
						LocationAdmVo locationAdmVo = new LocationAdmVo();
						locationAdmVo.setMainGubun(m.get("mainGubun").toString());
						locationAdmVo.setLocCd(locationAdmVo.getMainGubun().equals("001")?"005":"009");	
						LocationAdmVo list0 = locationAdmService.locationAdmList(locationAdmVo).get(0);						
						stockPaymentAdmVo.setLocationCd(list0.getLocCd());
						stockPaymentAdmVo.setLocationNo(list0.getLocNo());
						stockPaymentAdmVo.setRegId(Utils.getUserId());
						stockPaymentAdmService.stockPaymentAdmCreate(stockPaymentAdmVo);		
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

	
	// 수입검사 불량유형조회 
	@RequestMapping(value = "qm/itemInspectFaultyTypeList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemInspectFaultyTypeList(ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수입검사 불량유형조회 vo:"+itemInspectAdmVo);

		try {
			List<ItemInspectAdmVo> list = itemInspectAdmService.itemInspectFaultyTypeList(itemInspectAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// 수입검사 불량유형조회 
	@RequestMapping(value = "qm/itemInspectFaultyTypeRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemInspectFaultyTypeRead(ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			List<ItemInspectAdmVo> list = itemInspectAdmService.itemInspectFaultyTypeRead(itemInspectAdmVo);
			
			if(list==null || list.size()==0) {
				list = new ArrayList<ItemInspectAdmVo>();
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
	
	// 수입검사 등록 
	@RequestMapping(value = "qm/itemInspectAllCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemInspectAllCreate(@RequestBody List<Map<String, Object>> faultyTypeList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ItemInspectAdmVo itemInspectAdmVo = new ItemInspectAdmVo();
		try {
			
			itemInspectAdmVo.setInSlipNo(faultyTypeList.get(0).get("inSlipNo").toString());
			itemInspectAdmService.itemInspectAdmDelete(itemInspectAdmVo);
			itemInspectAdmService.itemInspectFaultyTypeDelete(itemInspectAdmVo);	//불량유형 삭제
			
			for(Map<String, Object> m : faultyTypeList) {
				itemInspectAdmVo.setInSlipNo(m.get("inSlipNo").toString());
				itemInspectAdmVo.setInSlipSeq(m.get("inSlipSeq").toString());
				
				logger.info("listSize : "+itemInspectAdmService.countInspectAdmList(itemInspectAdmVo));
				if(itemInspectAdmService.countInspectAdmList(itemInspectAdmVo)==0) {
					itemInspectAdmVo.setItemSeq(m.get("itemSeq").toString());
					itemInspectAdmVo.setPairCnt(m.get("pairCnt").toString());
					itemInspectAdmVo.setFaultyCnt(m.get("faultyCnt").toString());
					itemInspectAdmVo.setQaEval(m.get("qaEval").toString());
					itemInspectAdmVo.setRegId(Utils.getUserId());
					
					itemInspectAdmService.itemInspectAdmCreate(itemInspectAdmVo);
					
					itemInspectAdmVo.setStatusCd("I");
					itemInspectAdmVo.setApprovalCd("002");
					itemInspectAdmService.inOutWhsAdmUpdate(itemInspectAdmVo);
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
	
	

	// 수입검사 삭제
	@RequestMapping(value = "qm/itemInspectAdmDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemInspectAdmDelete(ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			itemInspectAdmService.itemInspectAdmDelete(itemInspectAdmVo);
			itemInspectAdmService.itemInspectFaultyTypeDelete(itemInspectAdmVo);	//불량유형 삭제
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// 수입검사 불량유형등록
	@RequestMapping(value = "io/itemInspectFaultyTypeCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemInspectFaultyTypeCreate(@RequestBody List<Map<String, Object>> faultyTypeList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ItemInspectAdmVo itemInspectAdmVo = new ItemInspectAdmVo();
		InOutWhsAdmVo inOutWhsAdmVo = new InOutWhsAdmVo();
		try {
			
			itemInspectAdmVo.setInSlipNo(faultyTypeList.get(0).get("inSlipNo").toString());
			itemInspectAdmVo.setInSlipSeq(faultyTypeList.get(0).get("inSlipSeq").toString());
			itemInspectAdmVo.setItemSeq(faultyTypeList.get(0).get("itemSeq").toString());
			itemInspectAdmVo.setPairCnt(faultyTypeList.get(0).get("pairCnt").toString());
			itemInspectAdmVo.setFaultyCnt(faultyTypeList.get(0).get("faultyCnt").toString());
			itemInspectAdmVo.setQaEval(faultyTypeList.get(0).get("qaEval").toString());
			itemInspectAdmVo.setRegId(Utils.getUserId());
			itemInspectAdmVo.setUpdId(Utils.getUserId());
			
			inOutWhsAdmVo.setInSlipNo(itemInspectAdmVo.getInSlipNo());
			inOutWhsAdmVo.setInSlipSeq(itemInspectAdmVo.getInSlipSeq());
			
			//자재상태 체크
			String statusCd = inOutWhsAdmService.statusCdCheck(inOutWhsAdmVo);
			
			if(statusCd.equals("S")) {	//자재상태 : 가입고
				itemInspectAdmService.itemInspectAdmCreate(itemInspectAdmVo);
				itemInspectAdmVo.setStatusCd("I");
				itemInspectAdmVo.setApprovalCd("002");
				itemInspectAdmService.inOutWhsAdmUpdate(itemInspectAdmVo);
				
			}else if(statusCd.equals("I")){	//자재상태 : 수입검사
				itemInspectAdmService.itemInspectAdmUpdate(itemInspectAdmVo);
				itemInspectAdmService.inOutWhsAdmUpdate(itemInspectAdmVo);
				
			}else if(statusCd.equals("L")) {	//자재상태 : 입고
				jsonData.put("result", "fail");
				jsonData.put("message", "입고된 바코드입니다.");
				return jsonData;
			}
			
			itemInspectAdmService.itemInspectFaultyTypeDelete(itemInspectAdmVo);	//불량유형 삭제
			
			for(Map<String, Object> m : faultyTypeList) {
				
				itemInspectAdmVo.setFaultyTypeCd(m.get("faultyTypeCd").toString());
				itemInspectAdmVo.setFaultyTypeQty(m.get("faultyTypeQty").toString());
				itemInspectAdmVo.setFaultyTypeDate(m.get("faultyTypeDate").toString()); 
				itemInspectAdmVo.setFaultyTypeDesc(m.get("faultyTypeDesc").toString());
				
				itemInspectAdmService.itemInspectFaultyTypeCreate(itemInspectAdmVo);
			}
			
			//총합격수량, 총불량수량
			ItemInspectAdmVo qtyVo = itemInspectAdmService.itemInspectQtyRead(itemInspectAdmVo);
			
			jsonData.put("totalPairQty", qtyVo.getPairCnt());
			jsonData.put("totalFaultyQty", qtyVo.getFaultyCnt());
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	// 수입검사 불량유형삭제
	@RequestMapping(value = "qm/itemInspectFaultyTypeDelete", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemInspectFaultyTypeDelete(ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			itemInspectAdmService.itemInspectFaultyTypeDelete(itemInspectAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
		
	// 수입검사팝업 목록조회 
	@RequestMapping(value = "qm/itemInspectAdmPopUpList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemInspectAdmPopUpList(ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			List<ItemInspectAdmVo> itemInspectAdmList = itemInspectAdmService.itemInspectAdmPopUpList(itemInspectAdmVo);
			jsonData.put("data", itemInspectAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수입검사(반품) 목록조회 
	@RequestMapping(value = "qm/itemInspectReturnPopUpList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemInspectReturnPopUpList(ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			List<ItemInspectAdmVo> itemInspectReturnPopUpList = itemInspectAdmService.itemInspectReturnPopUpList(itemInspectAdmVo);
			jsonData.put("data", itemInspectReturnPopUpList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//이미지 업로드(DB에 바로 저장)
	@RequestMapping(value = "/qm/itemInspectImageUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemInspectImageUpload(ItemInspectAdmVo itemInspectAdmVo, MultipartHttpServletRequest multi) throws Exception {
		logger.info("업로드 컨트롤러 시작");
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("설비이미지 vo = " + itemInspectAdmVo);
			//이미지 번호
			String value = multi.getParameter("value");
			MultipartFile mFile = multi.getFile("imgAdd" + value);
			
			String fileName = mFile.getOriginalFilename(); // 원본 파일 명
			
			if (mFile == null || mFile.isEmpty()) {

			} else {
				switch(value) {
				case "1" :
					itemInspectAdmVo.setImageFile1(mFile.getBytes());
					itemInspectAdmVo.setImageFile1Nm(fileName);
					break;
				case "2" :
					itemInspectAdmVo.setImageFile2(mFile.getBytes());
					itemInspectAdmVo.setImageFile2Nm(fileName);
					break;
				case "3" :
					itemInspectAdmVo.setImageFile3(mFile.getBytes());
					itemInspectAdmVo.setImageFile3Nm(fileName);
					break;
				case "4" :
					itemInspectAdmVo.setImageFile4(mFile.getBytes());
					itemInspectAdmVo.setImageFile4Nm(fileName);
					break;
				}
			}
			itemInspectAdmService.itemInspectImageUpload(itemInspectAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}

		return jsonData;
	}
	
	//이미지 보여주기
	@RequestMapping(value = "/qm/itemInspectImgRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemInspectImgRead(ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("이미지조회");
		try {
			itemInspectAdmVo = itemInspectAdmService.itemInspectImgRead(itemInspectAdmVo);
			
			logger.info("이미지조회 vo:"+itemInspectAdmVo);
			if (itemInspectAdmVo.getImageFile1() != null) {
				String imageFile1 = new String(Base64.encodeBase64(itemInspectAdmVo.getImageFile1()));
				String imageFile1Nm = itemInspectAdmVo.getImageFile1Nm();
				logger.info(imageFile1Nm);
				logger.info(imageFile1);
				jsonData.put("imageFile1", imageFile1);
				jsonData.put("imageFile1Nm", imageFile1Nm);
			}
			if (itemInspectAdmVo.getImageFile2() != null) {
				String imageFile2 = new String(Base64.encodeBase64(itemInspectAdmVo.getImageFile2()));
				String imageFile2Nm = itemInspectAdmVo.getImageFile2Nm();
				jsonData.put("imageFile2", imageFile2);
				jsonData.put("imageFile2Nm", imageFile2Nm);
			}
			if (itemInspectAdmVo.getImageFile3() != null) {
				String imageFile3 = new String(Base64.encodeBase64(itemInspectAdmVo.getImageFile3()));
				String imageFile3Nm = itemInspectAdmVo.getImageFile3Nm();
				jsonData.put("imageFile3", imageFile3);
				jsonData.put("imageFile3Nm", imageFile3Nm);
			}
			if (itemInspectAdmVo.getImageFile4() != null) {
				String imageFile4 = new String(Base64.encodeBase64(itemInspectAdmVo.getImageFile4()));
				String imageFile4Nm = itemInspectAdmVo.getImageFile4Nm();
				jsonData.put("imageFile4", imageFile4);
				jsonData.put("imageFile4Nm", imageFile4Nm);
			}
			logger.info("vo:"+itemInspectAdmVo);
			jsonData.put("data", itemInspectAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	//이미지 Delete
	@RequestMapping(value = "/qm/itemInspectImageDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemInspectImageDelete(ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		logger.info("파일 삭제 vo : " + itemInspectAdmVo);
		Map<String, Object> jsonData = new HashMap<>();
		try {
			itemInspectAdmService.itemInspectImageDelete(itemInspectAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
			logger.info(""+Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	
	//******************모니터링*********************
	
	// 수입검사 품질경향 분석 목록조회(일별) 
	@RequestMapping(value="qm/qualityTrendAnlyDayList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> qualityTrendAnlyDayList(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			List<ItemInspectAdmVo> list = itemInspectAdmService.qualityTrendAnlyDayList(itemInspectAdmVo);
			jsonData.put("result", "ok");
			jsonData.put("data", list);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	// 수입검사 품질경향 분석 목록조회 
	@RequestMapping(value="qm/qualityTrendAnlyList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> qualityTrendAnlyList(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			List<ItemInspectAdmVo> list = itemInspectAdmService.qualityTrendAnlyList(itemInspectAdmVo);
			jsonData.put("result", "ok");
			jsonData.put("data", list);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
//	// 수입검사(월별)목록조회 
//	@RequestMapping(value="qm/qualityTrendAnlyList11", method = RequestMethod.GET)
//	public @ResponseBody Map<String, Object> qualityTrendAnlyList11(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
//		Map<String, Object> jsonData = new HashMap<String, Object>();
//		try {
//			
//			List<ItemInspectAdmVo> list = itemInspectAdmService.qualityTrendAnlyList11(itemInspectAdmVo);
//			jsonData.put("result", "ok");
//			jsonData.put("data", list);
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			jsonData.put("result", "error");
//			jsonData.put("message", Utils.getErrorMessage());
//		}
//		return jsonData;
//		
//	}
	
	// 수입검사 원인별 불량누적현황 목록조회 
	@RequestMapping(value="qm/faultyStatusList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> faultyStatusList(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			List<ItemInspectAdmVo> list = itemInspectAdmService.faultyStatusList(itemInspectAdmVo);
			
			int faultyTypeCount = itemInspectAdmService.faultyTypeCount(itemInspectAdmVo);
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
	

	// 수입검사 마스터 등록
	@RequestMapping(value = "qm/itemInspectMasterCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemInspectMasterCreate(ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수입검사 마스터 등록 vo :"+itemInspectAdmVo );
		try {
			
			itemInspectAdmService.itemInspectMasterCreate(itemInspectAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 수입검사 마스터 수정
	@RequestMapping(value = "qm/itemInspectMasterUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemInspectMasterUpdate(ItemInspectAdmVo itemInspectAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수입검사 마스터 수정 vo :"+itemInspectAdmVo );
		try {
			itemInspectAdmVo.setUpdId(Utils.getUserId());
			itemInspectAdmService.itemInspectMasterUpdate(itemInspectAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
}
	
