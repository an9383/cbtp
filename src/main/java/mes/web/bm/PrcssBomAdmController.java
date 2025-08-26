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

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.DealCorpAdmVo;
import mes.domain.bm.PrcssBomAdmVo;
import mes.domain.bm.PrcssBomDtlVo;
import mes.domain.bm.PrcssCodeAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.PrcssBomAdmService;
import mes.web.cm.CustomerExcelReader;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class PrcssBomAdmController {
	
	@Inject
	private PrcssBomAdmService prcssBomAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(PrcssBomAdmController.class);

	@Value("${file.prcssBomExcelUpload}") 
	private String prcssBomExcelUpload;
	
	@Value("${file.prcssBomBasicForm}") 
	private String prcssBomBasicForm;
	
	
	//개발관리(봉제) 메인
	@RequestMapping(value = "/bmsc0190", method = RequestMethod.GET)
	public String prcssCodeBomMainINJ(Locale locale, Model model) throws Exception {
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate);
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", bomCommonList );
			
			commonCodeVo.setBaseGroupCd("107"); // MAKER
			bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("bomMaker", bomCommonList );
			
			commonCodeVo.setBaseGroupCd("108"); // 개발단계
			bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("devStep", bomCommonList );
			
			commonCodeVo.setBaseGroupCd("091"); // 제품/상품/반제품
			commonCodeVo.setUseYn("001");
			bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemGubun", bomCommonList);
			
			commonCodeVo.setBaseGroupCd("112"); // 사출/봉제
			commonCodeVo.setUseYn("001");
			bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("mainGubun", bomCommonList);
			
			commonCodeVo.setBaseGroupCd("095"); // 상태
			commonCodeVo.setUseYn("001");
			bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("stateCd", bomCommonList);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0190";
	}
	
	//BOM관리(정밀가공)
	@RequestMapping(value = "/bmsc0420", method = RequestMethod.GET)
	public String bmsc0420(Locale locale, Model model) throws Exception {
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate);
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", bomCommonList );
			
			commonCodeVo.setBaseGroupCd("107"); // MAKER
			bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("bomMaker", bomCommonList );
			
			commonCodeVo.setBaseGroupCd("108"); // 개발단계
			bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("devStep", bomCommonList );
			
			commonCodeVo.setBaseGroupCd("091"); // 제품/상품/반제품
			commonCodeVo.setUseYn("001");
			bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemGubun", bomCommonList);
			
			commonCodeVo.setBaseGroupCd("112"); // 사출/봉제
			commonCodeVo.setUseYn("001");
			bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("mainGubun", bomCommonList);
			
			commonCodeVo.setBaseGroupCd("095"); // 상태
			commonCodeVo.setUseYn("001");
			bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("stateCd", bomCommonList);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0420";
	}

	//개발관리(사출) 메인
	@RequestMapping(value = "/bmsc0050", method = RequestMethod.GET)
	public String prcssCodeBomMain(Locale locale, Model model) throws Exception {
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate);
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", bomCommonList );
			
			commonCodeVo.setBaseGroupCd("107"); // MAKER
			bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("bomMaker", bomCommonList );
			
			commonCodeVo.setBaseGroupCd("108"); // 개발단계
			bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("devStep", bomCommonList );
			
			commonCodeVo.setBaseGroupCd("091"); // 제품/상품/반제품
			commonCodeVo.setUseYn("001");
			bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemGubun", bomCommonList);
			
			commonCodeVo.setBaseGroupCd("112"); // 사출/봉제
			commonCodeVo.setUseYn("001");
			bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("mainGubun", bomCommonList);
			
			commonCodeVo.setBaseGroupCd("095"); // 상태
			commonCodeVo.setUseYn("001");
			bomCommonList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("stateCd", bomCommonList);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0050";
	}
	
	
	//공정BOM 목록조회
	@RequestMapping(value = "bm/prcssBomAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssCodeBomDataList(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정BOM 목록조회: "+prcssBomAdmVo);
		try {
			List<PrcssBomAdmVo> prcssCodeBomList = prcssBomAdmService.prcssBomAdmList();
			jsonData.put("data", prcssCodeBomList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//공정BOM 상세 조회
	@RequestMapping(value = "/bm/prcssBomAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssCodeBomView(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정BOM 세부목록조회: "+prcssBomAdmVo);
		try {
			prcssBomAdmVo = prcssBomAdmService.prcssBomAdmRead(prcssBomAdmVo);
			jsonData.put("data", prcssBomAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
			
		return jsonData;
	}
	
	//공정BOM 상세목록조회
	@RequestMapping(value = "bm/prcssBomDtlList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssBomDtlList(PrcssBomDtlVo prcssBomDtlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정BOM 목록조회: "+prcssBomDtlVo);
		try {
			List<PrcssBomDtlVo> prcssCodeBomDtlList = prcssBomAdmService.prcssBomDtlList(prcssBomDtlVo);
			jsonData.put("data", prcssCodeBomDtlList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//공정BOM 초기화
	@RequestMapping(value = "bm/prcssBomDtlReset", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssBomDtlReset(PrcssBomDtlVo prcssBomDtlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		List<PrcssBomDtlVo> list = new ArrayList<PrcssBomDtlVo>();	
		
		jsonData.put("data", list);
			jsonData.put("result", "ok");

		return jsonData;
	}
	
	//공정BOM 등록
	@RequestMapping(value ="bm/prcssBomCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssCodeBomCreate(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정BOM 등록: " + prcssBomAdmVo);
		try {
			prcssBomAdmVo.setRegId(Utils.getUserId());
			prcssBomAdmService.prcssBomAdmCreate(prcssBomAdmVo);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
		
	//공정BOM 수정
	@RequestMapping(value ="bm/prcssBomUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssBomUpdate(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정BOM 수정: " + prcssBomAdmVo);
		try {
			prcssBomAdmVo.setUpdId(Utils.getUserId());
			prcssBomAdmService.prcssBomAdmUpdate(prcssBomAdmVo);
			jsonData.put("result", "ok" );
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	
	// 공정BOM 시퀀스
	@RequestMapping(value = "/bm/prcssBomCd", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssBomSeq(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			String bomCd = prcssBomAdmService.prcssBomCd();
			jsonData.put("bomCd", bomCd);
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//공정BOM 삭제
	@RequestMapping(value = "/bm/prcssBomDtlDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssBomDtlDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정BOM 삭제: "+prcssBomAdmVo);
		try {
			prcssBomAdmVo.setUpdId(Utils.getUserId().toString());
			prcssBomAdmService.prcssBomDtlDelete(prcssBomAdmVo);		
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//공정BOM 상세 시퀀스
	@RequestMapping(value = "/bm/prcssBomDtlSeq", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssBomDtlSeq(PrcssBomDtlVo prcssBomDtlVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			int
			sequence = prcssBomAdmService.prcssBomDtlSeq(prcssBomDtlVo);
			logger.info("검색 후 BOSEQ : " + sequence);
			jsonData.put("bomDtlSeq", sequence);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	

	//견적관리 엑셀조회
	@RequestMapping(value = "bm/prcssBomExcelDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssBomExcelDataList(DealCorpAdmVo dealCorpAdmVo) throws Exception {
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
	
	@RequestMapping(value= "bm/prcssBomExcelUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssBomExcelUpload(Model model,@RequestParam("excelfile") MultipartFile file) {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		String url = null;
		String fileName = "";
		try {
			// 파일 정보
			String originFilename = file.getOriginalFilename();
			String extName = originFilename;
			Long size = file.getSize();
			String path = prcssBomExcelUpload;
			
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
	 @RequestMapping(value="bm/prcssBomBasicForm", method = RequestMethod.GET)
	 public @ResponseBody Map<String, Object> prcssBomBasicForm(
			 HttpServletResponse res , HttpServletRequest req,
			 DealCorpAdmVo dealCorpAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			  String saveFile = "basicPrcssBom.xlsx"; 
			  String filePath = prcssBomBasicForm + "/basicPrcssBom.xlsx";
			 
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
	 
	//기본정보 삭제
	@RequestMapping(value = "/bm/prcssBomDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssBomDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			prcssBomAdmService.prcssBomDelete(prcssBomAdmVo);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//공정매칭 삭제
	@RequestMapping(value = "/bm/prcssMbomDtlDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssMbomDtlDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			prcssBomAdmService.prcssMbomDtlDelete(prcssBomAdmVo);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//BOM 삭제
	@RequestMapping(value = "/bm/prcssEbomDtlDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssEbomDtlDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			prcssBomAdmService.prcssEbomDtlDelete(prcssBomAdmVo);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//개발관리 공정매칭 목록조회
	@RequestMapping(value = "bm/prcssCodeMbomList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssCodeMbomList(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("개발관리 공정매칭 목록조회: "+prcssBomAdmVo);
		try {
			List<PrcssBomAdmVo> prcssCodeMbomList = prcssBomAdmService.prcssCodeMbomList(prcssBomAdmVo);
			jsonData.put("data", prcssCodeMbomList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//개발관리 BOM 목록조회
	@RequestMapping(value = "bm/prcssCodeEbomList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssCodeEbomList(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("개발관리 BOM 목록조회: " + prcssBomAdmVo);
		try {
			List<PrcssBomAdmVo> prcssCodeEbomList = prcssBomAdmService.prcssCodeEbomList(prcssBomAdmVo);
			jsonData.put("data", prcssCodeEbomList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//개발관리 공정매칭 등록
	@RequestMapping(value = "/bm/prcssMbomCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssMbomCreate(@RequestBody List<Map<String, Object>> prcssMbomList) throws Exception {
		PrcssBomAdmVo prcssBomAdmVo = new PrcssBomAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("개발관리 공정매칭 등록: " + prcssBomAdmVo);
		try {
			prcssBomAdmVo.setBomCd(prcssMbomList.get(0).get("bomCd").toString());
			prcssBomAdmService.prcssMbomDelete(prcssBomAdmVo);
			for(Map<String, Object> list : prcssMbomList) {
				if(list.get("bomCd") != null) {
					prcssBomAdmVo.setBomCd(list.get("bomCd").toString());
					prcssBomAdmVo.setMasterPrcssCd(list.get("masterPrcssCd").toString());
					prcssBomAdmVo.setSubPrcssCd(list.get("subPrcssCd").toString());
					prcssBomAdmVo.setRegId(Utils.getUserId());
					
					prcssBomAdmService.prcssMbomCreate(prcssBomAdmVo);
					jsonData.put("result", "ok");
				}else {
					jsonData.put("result", "ok");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//개발관리 BOM 등록
	@RequestMapping(value = "/bm/prcssEbomCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssEbomCreate(@RequestBody List<Map<String, Object>> prcssMbomList) throws Exception {
		PrcssBomAdmVo prcssBomAdmVo = new PrcssBomAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("개발관리 BOM 등록: " + prcssBomAdmVo);
		try {
			prcssBomAdmVo.setBomCd(prcssMbomList.get(0).get("bomCd").toString());
			prcssBomAdmService.prcssEbomDelete(prcssBomAdmVo);
			for(Map<String, Object> list : prcssMbomList) {
				if(list.get("bomCd") != null) {
					prcssBomAdmVo.setBomCd(list.get("bomCd").toString());
					prcssBomAdmVo.setMasterPrcssCd(list.get("masterPrcssCd").toString());
					prcssBomAdmVo.setSubPrcssCd(list.get("subPrcssCd").toString());
					prcssBomAdmVo.setItemSeq(list.get("itemSeq").toString());
					prcssBomAdmVo.setItemConsumpt(list.get("itemConsumpt").toString());
					prcssBomAdmVo.setRegId(Utils.getUserId());
					
					prcssBomAdmService.prcssEbomCreate(prcssBomAdmVo);
					jsonData.put("result", "ok");
				}else {
					jsonData.put("result", "ok");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
		
}
