package mes.web.bm;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
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

import io.jsonwebtoken.io.IOException;
import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.DealCorpAdmVo;
import mes.domain.bm.LocationAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.LocationAdmService;
import mes.web.cm.CustomerExcelReader;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class LocationAdmController {
	private static final Logger logger = LoggerFactory.getLogger(LocationAdmController.class);
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private LocationAdmService locationAdmService;
	
	@Value("${file.locationAdmUpload}") 
	private String locationAdmUpload;
	
	@Value("${file.locationBasicForm}")
	private String locationBasicForm;

	// 창고정보 페이지 
	@RequestMapping(value = "/bmsc0110", method = RequestMethod.GET)
	public String baseInfoWhMain(Locale locale, Model model) throws Exception {
		try {
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("067"); // 구역코드
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("area", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("073"); // 창고코드
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("locCd", commonCodeList);
			
			commonCodeVo.setBaseGroupCd("112"); // 구분(사출/노브)
			commonCodeVo.setUseYn("001");
			commonCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("mainGubun", commonCodeList);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0110";
	}
	
	//창고정보 전체 조회
	@RequestMapping(value = "bm/locationAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> locationAdmList(LocationAdmVo locationAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("창고정보 목록조회: " + locationAdmVo);
		try {
			List<LocationAdmVo> locationAdmList = locationAdmService.locationAdmList(locationAdmVo);
			jsonData.put("data", locationAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//창고정보 전체 조회(구분/창고/구역별 조회)
	@RequestMapping(value = "bm/locationAdmList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> locationAdmList2(LocationAdmVo locationAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("창고정보 목록조회: " + locationAdmVo);
		try {
			List<LocationAdmVo> locationAdmList = locationAdmService.locationAdmList2(locationAdmVo);
			jsonData.put("data", locationAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	
	// 창고정보 상세 조회
	@RequestMapping(value = "/bm/locationAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> locationAdmRead(LocationAdmVo locationAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("창고정보 상세 정보 : " +locationAdmVo);
		try {
			if(locationAdmVo.getMainGubun()==null||locationAdmVo.getMainGubun().equals("")) {
				List<LocationAdmVo> list = new ArrayList<LocationAdmVo>();
				jsonData.put("data", list);
			}else {
				List<LocationAdmVo> list = locationAdmService.locationAdmRead(locationAdmVo);
				jsonData.put("data", list);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	//창고정보등록
	@RequestMapping(value = "/bm/locationAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> locationAdmCreate(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		LocationAdmVo locationAdmVo = new LocationAdmVo();
		logger.info("창고정보 등록: " + locationAdmVo);
		try {
			
		    String date = DateUtil.getToday("yyyymmdd"); 
		    String seq = "";
		    locationAdmVo.setLocCd(list.get(0).get("locCd").toString());
		    
		    for(Map<String, Object> m : list) {
		    	if(m.get("areaCd").toString()==null || m.get("areaCd").toString().equals("")) {
					
				}else {
					  
					seq=locationAdmService.locNoSeq(date);
					locationAdmVo.setLocNo(date+"-"+seq);
//					locationAdmVo.setLocNo(m.get("locNo").toString());
					locationAdmVo.setMainGubun(m.get("mainGubun").toString());
					locationAdmVo.setAreaCd(m.get("areaCd").toString());
					locationAdmVo.setFloorNm(m.get("floorNm").toString());
					locationAdmVo.setLocDesc(m.get("locDesc").toString());
					locationAdmVo.setUseYn(m.get("useYn").toString());
					locationAdmVo.setRegId(Utils.getUserId());
					 
					locationAdmService.locationAdmCreate(locationAdmVo);
					logger.info("창고정보 등록 성공");
				}
		    	
				jsonData.put("result", "ok" );

		    }
			
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//창고정보수정
	@RequestMapping(value = "/bm/locationAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> locationAdmUpdate(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		LocationAdmVo locationAdmVo = new LocationAdmVo();
		logger.info("창고정보 수정: "+locationAdmVo);
		try {
			
		    locationAdmVo.setLocCd(list.get(0).get("locCd").toString());
		    locationAdmVo.setMainGubun(list.get(0).get("mainGubun").toString());  
		    
		    for(Map<String, Object> m : list) {
		    	if(m.get("areaCd").toString()==null || m.get("areaCd").toString().equals("")) {
					
				}else {
					locationAdmVo.setLocNo(m.get("locNo").toString());
					locationAdmVo.setAreaCd(m.get("areaCd").toString());
					locationAdmVo.setFloorNm(m.get("floorNm").toString());
					locationAdmVo.setLocDesc(m.get("locDesc").toString());
					locationAdmVo.setUseYn(m.get("useYn").toString());
					locationAdmVo.setUpdId(Utils.getUserId());
					 
					locationAdmService.locationAdmUpdate(locationAdmVo);
					logger.info("창고정보 등록 성공");
				}
		    	
				jsonData.put("result", "ok" );

		    }
			
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//창고정보관리 업로드
	@RequestMapping(value= "bm/locationAdmUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> locationAdmUpload(Model model,@RequestParam("excelfile") MultipartFile file) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		String url = null;
		String fileName = "";
		try {
			// 파일 정보
			String originFilename = file.getOriginalFilename();
			String extName = originFilename;
			Long size = file.getSize();
			String path = locationAdmUpload;
			
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
	 @RequestMapping(value="bm/locationBasicForm", method = RequestMethod.GET)
	 public @ResponseBody Map<String, Object> locationBasicForm(
			 HttpServletResponse res , HttpServletRequest req,
			 LocationAdmVo locationAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			  String saveFile = "basicLoc.xlsx"; 
			  String filePath = locationBasicForm+"/basicLoc.xlsx";
			 
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
	
	
	
	
	//창고정보관리 엑셀조회
	@RequestMapping(value = "bm/locationExcelDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> locationExcelDataList(LocationAdmVo locationAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("어디있는거니 값들아???"+locationAdmVo.getUrl());
		
		if(locationAdmVo.getUrl()==null || locationAdmVo.getUrl().equals("")) {
			List<LocationAdmVo> locationAdmList = new ArrayList<LocationAdmVo>();
			jsonData.put("data", locationAdmList);
		}else {
			CustomerExcelReader excelReader = new CustomerExcelReader();
			List<LocationAdmVo> locationAdmList = excelReader.locationFileload(locationAdmVo.getUrl(), logger);
			logger.info("창고정보 엑셀 조회list 값:"+locationAdmList);
			jsonData.put("data", locationAdmList);
			
			logger.info("창고정보 엑셀조회:"+locationAdmList);				
			File file = new File(locationAdmVo.getUrl());
			logger.info(locationAdmVo.getUrl());

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
	
	//창고정보관리 엑셀등록
	@RequestMapping(value="bm/locationExcelCreate", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> locationExcelCreate(@RequestBody List<Map<String, Object>> locationAdmList) throws Exception{
		LocationAdmVo locationAdmVo = new LocationAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("창고정보관리 등록 :" + locationAdmVo);
		
		String date = DateUtil.getToday("yyyymmdd"); 
	    String seq = "";
//	    locationAdmVo.setLocCd(list.get(0).get("locCd").toString());
	    
		try {
			for(Map<String, Object> m :locationAdmList) {
				
				if(m.get("areaCd").toString() == null || m.get("areaCd").toString().equals("")) {
					
				}else {
					seq = locationAdmService.locNoSeq(date);
					locationAdmVo.setLocNo(date + "-" + seq);
					locationAdmVo.setLocCd(m.get("locCd").toString());
					locationAdmVo.setAreaCd(m.get("areaCd").toString());
					locationAdmVo.setFloorNm(m.get("floorNm").toString());
					locationAdmVo.setLocDesc(m.get("locDesc").toString());
					locationAdmVo.setUseYn(m.get("useYn").toString());
					locationAdmVo.setRegId(Utils.getUserId());
					 
					locationAdmService.locationAdmCreate(locationAdmVo);
					jsonData.put("result", "ok");
					logger.info("창고정보 등록 성공");
				}
					
//				locationAdmVo.setLocCd(m.get("locCd").toString());
//				locationAdmVo.setAreaCd(m.get("areaCd").toString());
//				locationAdmVo.setFloorCd(m.get("floorCd").toString());
//				locationAdmVo.setUseYn(m.get("useYn").toString());
//				locationAdmVo.setLocDesc(m.get("locDesc").toString());
				//중복 체크
//				if(locationAdmService.overlapDealCordCd(locationAdmVo) == 0) {
//					
//					locationAdmVo.setRegId(Utils.getUserId());
//					locationAdmService.locationAdmCreate(locationAdmVo);
//				}else {
//					jsonData.put("result", "exist");
//					
//				}
//				locationAdmService.locationAdmCreate(locationAdmVo);
			}
			
						
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//삭제
	@RequestMapping(value = "/bm/locationAdmDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> locationAdmDelete(LocationAdmVo locationAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("삭제 : " + locationAdmVo);
		try {
			locationAdmService.locationAdmDelete(locationAdmVo);
		    jsonData.put("result", "ok" );
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
}
