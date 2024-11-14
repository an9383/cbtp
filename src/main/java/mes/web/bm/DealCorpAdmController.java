package mes.web.bm;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

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
import org.springframework.web.servlet.ModelAndView;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.DealCorpAdmVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.DealCorpAdmService;
import mes.web.cm.CustomerExcelReader;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class DealCorpAdmController {
	@Inject
	private DealCorpAdmService dealCorpAdmService;
	
	@Inject
	private CommonCodeAdmService systemCommonCodeService;	
	
	@Value("${file.dealCorpPath}")
	private String file_DealCorp_Path;
	
	@Value("${file.dealCorpBasicForm}")
	private String dealCorpBasicForm;
	
	@Value("${file.dealCorpExcelUpload}") 
	private String dealCorpExcelUpload;
	
	private static final Logger logger = LoggerFactory.getLogger(DealCorpAdmController.class);

	//거래처정보관리 메인
	@RequestMapping(value = "/bmsc0010", method = RequestMethod.GET)
	public String dealCorpAdmMain(Locale locale, Model model) throws Exception {
		logger.info("거래처정보관리 메인");
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo systemCommonCodeVo = new CommonCodeAdmVo();
			
			systemCommonCodeVo.setBaseGroupCd("001"); // 사용여부
			List<CommonCodeAdmVo>  dealCorpList = systemCommonCodeService.CommonCodeList(systemCommonCodeVo);
			model.addAttribute("useYn", dealCorpList );
			
			systemCommonCodeVo.setBaseGroupCd("102"); // 거래회사구분
			dealCorpList = systemCommonCodeService.CommonCodeList(systemCommonCodeVo);
			model.addAttribute("dealGubun_com", dealCorpList );
			
			systemCommonCodeVo.setBaseGroupCd("105"); // 첨부파일 종류
			dealCorpList = systemCommonCodeService.CommonCodeList(systemCommonCodeVo);
			model.addAttribute("visitContent", dealCorpList );
			
			systemCommonCodeVo.setBaseGroupCd("104"); // 회사구분
			dealCorpList = systemCommonCodeService.CommonCodeList(systemCommonCodeVo);
			model.addAttribute("companyGubun", dealCorpList );
			
			String userNm = Utils.getUserNm();
			model.addAttribute("userNm" , userNm);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "bm/bmsc0010";
	}

	//거래처정보관리 목록조회
	@RequestMapping(value = "/bm/dealCorpDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> dealCorpDataList(DealCorpAdmVo dealCorpAdmVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보관리 목록조회: " + dealCorpAdmVo);
		try {
			List<DealCorpAdmVo> dealCorpAdmData = dealCorpAdmService.listAll(dealCorpAdmVo);
			jsonData.put("data", dealCorpAdmData);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//거래처정보관리 목록조회(전체)
	@RequestMapping(value = "/bm/dealCorpDataJustList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> dealCorpDataJustList(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보관리 목록조회: " + dealCorpAdmVo);
		try {
			List<DealCorpAdmVo> dealCorpAdmData = dealCorpAdmService.dealCorpDataJustList(dealCorpAdmVo);
			jsonData.put("data", dealCorpAdmData);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//거래처정보관리 상세조회
	@RequestMapping(value = "/bm/dealCorpDataRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> dealCorpDataRead(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보관리 상세조회: "+dealCorpAdmVo);
		try {
			dealCorpAdmVo = dealCorpAdmService.read(dealCorpAdmVo);
			jsonData.put("data", dealCorpAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}

	//거래처정보관리 등록
	@RequestMapping(value = "/bm/dealCorpCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dealCorpCreate(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보관리 등록: " + dealCorpAdmVo);
		try {
			if(dealCorpAdmService.overlapDealCorpNm(dealCorpAdmVo)==0) {
				dealCorpAdmVo.setRegId(Utils.getUserId()); // 로그인한 사용자 ID 가져오기
				dealCorpAdmService.create(dealCorpAdmVo);
				jsonData.put("data", dealCorpAdmVo);
				jsonData.put("result", "ok");
			}else {
				jsonData.put("result", "exist");
			}

		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//품목정보관리(부품) 엑셀등록
	@RequestMapping(value="bm/dealCorpExcelCreate", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> dealCorpExcelCreate(@RequestBody List<Map<String, Object>> dealCorpAdmList) throws Exception{
		DealCorpAdmVo dealCorpAdmVo = new DealCorpAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보 등록 :"+dealCorpAdmVo);
		try {
			for(Map<String, Object> m :dealCorpAdmList) {
					
				dealCorpAdmVo.setDealCorpCd(m.get("dealCorpCd").toString());
				dealCorpAdmVo.setDealCorpNm(m.get("dealCorpNm").toString());
				dealCorpAdmVo.setInitial(m.get("initial").toString());
				dealCorpAdmVo.setPresidentNm(m.get("presidentNm").toString());
				dealCorpAdmVo.setCountry(m.get("country").toString());
				dealCorpAdmVo.setCorpNo(m.get("corpNo").toString());
				dealCorpAdmVo.setRegistNo(m.get("registNo").toString());
				dealCorpAdmVo.setBizCond(m.get("bizCond").toString());
				dealCorpAdmVo.setBizType(m.get("bizType").toString());
				dealCorpAdmVo.setAddrNo(m.get("addrNo").toString());
				dealCorpAdmVo.setAddrBase(m.get("addrBase").toString());
				dealCorpAdmVo.setAddrDtl(m.get("addrDtl").toString());
				dealCorpAdmVo.setTelNo(m.get("telNo").toString());
				dealCorpAdmVo.setFaxNo(m.get("faxNo").toString());
				dealCorpAdmVo.setEmailAddr(m.get("emailAddr").toString());
				dealCorpAdmVo.setTax(m.get("tax").toString());
				dealCorpAdmVo.setOfficeCharger(m.get("officeCharger").toString());
				dealCorpAdmVo.setBizCharger(m.get("bizCharger").toString());
				dealCorpAdmVo.setDealGubun(m.get("dealGubun").toString());
				dealCorpAdmVo.setUseYn(m.get("useYn").toString());
				dealCorpAdmVo.setDealCorpDesc(m.get("dealCorpDesc").toString());
				
				
				if(dealCorpAdmService.overlapDealCordCd(dealCorpAdmVo) == 0) {
					
					dealCorpAdmVo.setRegId(Utils.getUserId());
					dealCorpAdmService.create(dealCorpAdmVo);
					jsonData.put("result", "ok");
				}else {
					jsonData.put("result", "exist");
					
				}
			}
			
						
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//거래처정보관리 수정
	@RequestMapping(value = "/bm/dealCorpUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dealCorpUpdate(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("거래처정보관리 수정: "+dealCorpAdmVo);
		try {
			dealCorpAdmVo.setUpdId(Utils.getUserId()); // 로그인한 사용자 ID 가져오기
			
			dealCorpAdmService.update(dealCorpAdmVo);
			jsonData.put("data", dealCorpAdmVo);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	
	//거래처정보관리 메인
	@RequestMapping(value = "/cmsc0020", method = RequestMethod.GET)
	public String dealCorpAdmPop(Locale locale, Model model) throws Exception {
		logger.info("거래처정보관리 팝업");
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate );
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "cm/cmsc0020";
	}	
	
	//방문관련자료 목록조회
	@RequestMapping(value = "/bm/dealCorpVisitList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dealCorpVisitList(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("방문관련자료 조회: " + dealCorpAdmVo);
		try {
			
			List<DealCorpAdmVo> dealCorpVisitList;
			if(dealCorpAdmVo.getDealCorpCd() == null || dealCorpAdmVo.getDealCorpCd().equals("")) {
				dealCorpVisitList = new ArrayList<DealCorpAdmVo>();
			}else {
				dealCorpAdmVo.setRegId(Utils.getUserId());
				dealCorpVisitList = dealCorpAdmService.dealCorpVisitList(dealCorpAdmVo);

			}
			jsonData.put("data", dealCorpVisitList);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//방문관련자료 등록
	@RequestMapping(value = "/bm/dealCorpVisitCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dealCorpVisitCreate(MultipartHttpServletRequest multi, DealCorpAdmVo dealCorpAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("방문관련자료 등록: " + dealCorpAdmVo);
		try {
			String newFileName = "";
			String dealCorpCd = dealCorpAdmVo.getDealCorpCd();
			String visitSeq = dealCorpAdmVo.getVisitSeq();
			String path = file_DealCorp_Path + "/" + dealCorpCd;
			
			File dir = new File(path);
			
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			MultipartFile mFile = multi.getFile("file");
			String fileName = mFile.getOriginalFilename();
			
			if(!(fileName == null || fileName == "")) {
				newFileName = dealCorpCd + "_" + visitSeq + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
				dealCorpAdmVo.setFileNm(fileName);
				
				try {
					mFile.transferTo(new File(path + "/" + newFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			dealCorpAdmVo.setRegId(Utils.getUserId());
			dealCorpAdmVo.setVisitSeq(dealCorpAdmService.dealCorpVisitSeq(dealCorpAdmVo));
			
			dealCorpAdmService.dealCorpVisitCreate(dealCorpAdmVo);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//방문관련자료 삭제
	@RequestMapping(value = "/bm/dealCorpVisitDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dealCorpVisitDelete(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("방문관련자료 삭제: " + dealCorpAdmVo);
		try {
			dealCorpAdmService.dealCorpVisitDelete(dealCorpAdmVo);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	 //파일 다운로드
	 @RequestMapping(value="bm/downloadFile", method = RequestMethod.GET)
	 public @ResponseBody Map<String, Object> downloadFile(
			 HttpServletResponse res , HttpServletRequest req,
			 DealCorpAdmVo dealCorpAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			//String dFile = attchFileNm;
			String dFile = dealCorpAdmService.getFileNm(dealCorpAdmVo);
			logger.info(dFile);
			logger.info("visitSeq:" + dealCorpAdmVo.getVisitSeq());
			String newFileName = dealCorpAdmVo.getDealCorpCd() + "_" + dealCorpAdmVo.getVisitSeq() + "." + dFile.substring(dFile.lastIndexOf(".") + 1);
	
			String path = file_DealCorp_Path + dealCorpAdmVo.getDealCorpCd() + "/" + newFileName;
			logger.info(path);
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
		return jsonData;
	  }
	 
	//방문관련자료 시퀀스 가져오기
	@RequestMapping(value = "/bm/dealCorpVisitSeq", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> dealCorpVisitSeq(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("방문관련자료 시퀀스 조회: "+dealCorpAdmVo);
		try {
			String name=Utils.getUserNm();
			String dealCorpVisitSeq = dealCorpAdmService.dealCorpVisitSeq(dealCorpAdmVo);
			jsonData.put("seq", dealCorpVisitSeq);
			jsonData.put("name", name);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//견적관리 엑셀조회
	@RequestMapping(value = "bm/dealCorpExcelDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> dealCorpExcelDataList(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info(dealCorpAdmVo.getUrl());
		
		if(dealCorpAdmVo.getUrl()==null || dealCorpAdmVo.getUrl().equals("")) {
			List<DealCorpAdmVo> dealCorpAdmList = new ArrayList<DealCorpAdmVo>();
			jsonData.put("data", dealCorpAdmList);
		}else {
			CustomerExcelReader excelReader = new CustomerExcelReader();
			List<DealCorpAdmVo> dealCorpAdmList = excelReader.dealCorpFileload(dealCorpAdmVo.getUrl(), logger);
			logger.info("거래처 엑셀조회 list 값:"+dealCorpAdmList);
			jsonData.put("data", dealCorpAdmList);
			
			logger.info("견적관리 엑셀조회:"+dealCorpAdmList);				
			File file = new File(dealCorpAdmVo.getUrl());
			logger.info(dealCorpAdmVo.getUrl());

			if( file.exists() ){
	    		if(file.delete()){
	    			logger.info("파일삭제 성공");    			
	    		}else{
	    			logger.info("파일삭제 실패");
	    		}
	    	}else{
	    		logger.info("파일이 존재하지 않습니다.");
	    	}
			
		}
		return jsonData;
	}
	
	@RequestMapping(value= "bm/dealCorpExcelUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dealCorpExcelUpload(Model model,@RequestParam("excelfile") MultipartFile file) {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		String url = null;
		String fileName = "";
		try {
			// 파일 정보
			String originFilename = file.getOriginalFilename();
			String extName = originFilename;
			Long size = file.getSize();
			String path = dealCorpExcelUpload;
			
			// 서버에서 저장 할 파일 이름
			TimeZone tz = TimeZone.getTimeZone("Asia/Seoul");
			Calendar calendar = Calendar.getInstance(tz);
			fileName += calendar.get(Calendar.YEAR);
			fileName += calendar.get(Calendar.MONTH)+1;
			fileName += calendar.get(Calendar.DATE);
			fileName += calendar.get(Calendar.HOUR);
			fileName += calendar.get(Calendar.MINUTE);
			fileName += calendar.get(Calendar.SECOND);
			
			String[] originalFileName = extName.split("\\.");
			if(originalFileName[1].equals("xlsx")) {
				fileName += ".xlsx";		
			} else if(originalFileName[1].equals("xls")) {
				fileName += ".xls";		
			}
			
			String saveFileName = fileName;
			
			logger.info("originFilename : " + originFilename);
			logger.info("extensionName : " + extName);
			logger.info("size : " + size);
			logger.info("saveFileName : " + saveFileName);
			
			logger.info("path : " + path);
			
			File Folder = new File(path);
			
			if (!Folder.exists()) {
				try{
				    Folder.mkdirs(); //폴더 생성합니다.
				    logger.info("폴더가 생성되었습니다.");
			        } 
			        catch(Exception e){
				    e.getStackTrace();
				}        
		         }else {
		        	 logger.info("이미 폴더가 생성되어 있습니다.");
			}
			
			boolean result = false;
			byte[] data = file.getBytes();
			
			logger.info("writeFile path ===> " +path);
			
			FileOutputStream fos = new FileOutputStream(path + "/" + saveFileName);
			logger.info("data ==> " + data);
			fos.write(data);
			fos.close();
			
			url = path + saveFileName;
			logger.info(url);
			jsonData.put("data", url);
			jsonData.put("result", "ok");
		}
		catch (IOException e) {
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();	
			throw new RuntimeException(e);
		}
		
		return jsonData;
			
	}
	//기본양식 다운로드
	 @RequestMapping(value="bm/dealCorpBasicForm", method = RequestMethod.GET)
	 public @ResponseBody Map<String, Object> dealCorpBasicForm(
			 HttpServletResponse res , HttpServletRequest req,
			 DealCorpAdmVo dealCorpAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			  String saveFile = "basicDealCorp.xlsx"; 
			  String filePath = dealCorpBasicForm+"/basicDealCorp.xlsx";
			 
			/*
			 * String saveFile = "테이블_설계서_코모텍_v0.1_2020120"; String newFile =
			 * "1000011300_4.xlsx"; String filePath = file_Item_Attach_Path +
			 * "\\1000011300\\100\\" + newFile;
			 */
			fileDownload(res, req, saveFile, filePath);
			
			logger.info("파일 다운");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonData;
	  }
	 
	 //파일 다운로드
	 public void fileDownload( HttpServletResponse res , HttpServletRequest req, String saveFile, String filePath) throws Exception{
		try {
			
			String dFile = saveFile;
			String path = filePath;
			logger.info(path);
			File file = new File(path);
		
			String userAgent = req.getHeader("User-Agent");

			boolean ie = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);

			if (ie) {
				logger.info("익스");
				dFile = URLEncoder.encode(dFile, "UTF-8").replaceAll("\\+", "%20");
			} else {
				logger.info("크롬");
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
	 
	 // 삭제
	 @RequestMapping(value = "bm/dealCorpDataDelete", method = RequestMethod.POST)
	 public @ResponseBody Map<String, Object> dealCorpDataDelete(DealCorpAdmVo dealCorpAdmVo) throws Exception {
	 	Map<String, Object> jsonData = new HashMap<String, Object>();
	 	logger.info("삭제");
	 	try {
	 		dealCorpAdmService.dealCorpDataDelete(dealCorpAdmVo);
	 		dealCorpAdmService.dealCorpVisitDelete(dealCorpAdmVo);
	 		jsonData.put("result", "ok");
	 	} catch (Exception e) {
	 		logger.info("삭제 오류");
	 		e.printStackTrace();
	 		jsonData.put("result", "error");
	 		jsonData.put("message", Utils.getErrorMessage());
	 	}
	 	return jsonData;
	 }

	
}
