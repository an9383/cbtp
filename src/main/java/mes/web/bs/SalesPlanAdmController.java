package mes.web.bs;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;

import javax.inject.Inject;

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

import mes.domain.bs.DaySalesPlanAdmVo;
import mes.domain.bs.MonSalesPlanAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bs.SalesPlanAdmService;
import mes.web.cm.CustomerExcelReader;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class SalesPlanAdmController {

	private static final Logger logger = LoggerFactory.getLogger(SalesPlanAdmController.class);

	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private SalesPlanAdmService salesPlanAdmService;
	
	@Value("${file.salesPlanExcelUpload}") 
	private String filePath;
	
	// 월판매계획관리 메인
	@RequestMapping(value = "/bssc0130", method = RequestMethod.GET)
	public String bssc0130(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		return "bs/bssc0130";
	}
	
	// 일판매계획관리 메인
	@RequestMapping(value = "/bssc0140", method = RequestMethod.GET)
	public String bssc0140(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		return "bs/bssc0140";
	}
	
	
	// 월판매계획관리 상세조회
	@RequestMapping(value = "bs/monSalesPlanAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> monSalesPlanAdmList(MonSalesPlanAdmVo monSalesPlanAdmVo
			, @RequestParam(value="urlData") String urlData) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("월판매계획vo : "+monSalesPlanAdmVo);
		try {

			List<MonSalesPlanAdmVo> list = new ArrayList<MonSalesPlanAdmVo>();
			
			if(urlData == null || urlData.equals("")) {
				if(monSalesPlanAdmVo.getSalesYear() != null && !monSalesPlanAdmVo.getSalesYear().equals("")) {
					String salesMon = monSalesPlanAdmVo.getSalesYear()+monSalesPlanAdmVo.getSalesMon()+"01";
					monSalesPlanAdmVo.setSalesMon(salesMon);
					list = salesPlanAdmService.monSalesPlanAdmList(monSalesPlanAdmVo);
				}
				
				
			}else {
				
				CustomerExcelReader excelReader = new CustomerExcelReader();
				list = excelReader.monSalesPlanAdmFileload(urlData,logger); 
				/*
				 * List<MonSalesPlanAdmVo> list2 = excelReader.monSalesPlanAdmFileload(urlData,
				 * logger); for(int i=0; i<list2.size(); i++) {
				 * if(list2.get(i).getItemSeq()!=null && list2.get(i).getItemSeq()!="") {
				 * list.add(list2.get(i)); } }
				 */
				
				logger.info("list:"+list);
				
				//File file = new File(urlData);

				/*
				 * if( file.exists() ){ if(file.delete()){ logger.info("파일삭제 성공"); }else{
				 * logger.info("파일삭제 실패"); } }else{ logger.info("파일이 존재하지 않습니다."); }
				 */
				
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
	
	// 월판매계획관리 상세조회
	@RequestMapping(value = "bs/bsMonProdPlanAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bsMonProdPlanAdmList(MonSalesPlanAdmVo monSalesPlanAdmVo
			, @RequestParam(value = "urlData") String urlData) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("월판매계획vo : " + monSalesPlanAdmVo);
		try {

			List<MonSalesPlanAdmVo> list = new ArrayList<MonSalesPlanAdmVo>();
			
			if(urlData == null || urlData.equals("")) {
				if(monSalesPlanAdmVo.getSalesYear() != null && !monSalesPlanAdmVo.getSalesYear().equals("")) {
					String salesMon = monSalesPlanAdmVo.getSalesYear()+monSalesPlanAdmVo.getSalesMon()+"01";
					monSalesPlanAdmVo.setSalesMon(salesMon);
					logger.info( "년:"+monSalesPlanAdmVo.getSalesYear());
					logger.info( "월:"+monSalesPlanAdmVo.getSalesMon());
					list = salesPlanAdmService.bsMonProdPlanAdmList(monSalesPlanAdmVo);
				}
			}else {
				
				CustomerExcelReader excelReader = new CustomerExcelReader();
				list = excelReader.monSalesPlanAdmFileload(urlData,logger); 
				logger.info("list:"+list);
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
	
	// 월판매계획관리 등록
	@RequestMapping(value="bs/monSalesPlanAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> monSalesPlanAdmCreate(@RequestBody List<Map<String, Object>> list) throws Exception{
		MonSalesPlanAdmVo monSalesPlanAdmVo = new MonSalesPlanAdmVo();
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("월판매계획list:"+list);
		try {
			
			if(list.size()>0) {
				monSalesPlanAdmVo.setSalesYear(list.get(0).get("salesYear").toString());
			 	monSalesPlanAdmVo.setSalesMon(list.get(0).get("salesMon").toString());
				for(Map<String, Object> m :list) {
						
					monSalesPlanAdmVo.setItemSeq(m.get("itemSeq").toString());
					monSalesPlanAdmVo.setSalesAvgQty(m.get("salesAvgQty").toString());
					//monSalesPlanAdmVo.setSalesTmQty(m.get("salesTmQty").toString());	
					monSalesPlanAdmVo.setSalesPlanQty(m.get("salesPlanQty").toString());	
					
					
					if(salesPlanAdmService.monSalesPlanAdmRead(monSalesPlanAdmVo)==0) {
						
						monSalesPlanAdmVo.setConfirmYn("002");
						monSalesPlanAdmVo.setRegId(Utils.getUserId());
						salesPlanAdmService.monSalesPlanAdmCreate(monSalesPlanAdmVo);
					}else {
						//monSalesPlanAdmVo.setConfirmYn("002");
						monSalesPlanAdmVo.setUpdId(Utils.getUserId());
						salesPlanAdmService.monSalesPlanAdmUpdate(monSalesPlanAdmVo);
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
	
	
	// 월판매계획관리 수정
	@RequestMapping(value = "bs/monSalesPlanAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> monSalesPlanAdmUpdate(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		MonSalesPlanAdmVo monSalesPlanAdmVo = new MonSalesPlanAdmVo();
		logger.info("월판매계획list : "+list);
		try {
			
			if(list.size()>0) {
				monSalesPlanAdmVo.setSalesYear(list.get(0).get("salesYear").toString());
			 	monSalesPlanAdmVo.setSalesMon(list.get(0).get("salesMon").toString());
				for(Map<String, Object> m :list) {
					monSalesPlanAdmVo.setItemSeq(m.get("itemSeq").toString());	
					monSalesPlanAdmVo.setConfirmYn(m.get("confirmYn").toString());
					monSalesPlanAdmVo.setUpdId(Utils.getUserId());
					
					salesPlanAdmService.monSalesPlanAdmUpdate(monSalesPlanAdmVo);
				}
			}
			
			jsonData.put("result", "ok");
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	// 일판매계획관리 상세조회
	@RequestMapping(value = "bs/daySalesPlanAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> daySalesPlanAdmList(DaySalesPlanAdmVo daySalesPlanAdmVo
			, @RequestParam(value="urlData") String urlData) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("일판매계획vo : "+daySalesPlanAdmVo);
		try {

			
			List<DaySalesPlanAdmVo> list = new ArrayList<DaySalesPlanAdmVo>();
			
			if(urlData == null || urlData.equals("")) {
				list = salesPlanAdmService.daySalesPlanAdmList(daySalesPlanAdmVo);
				
			}else {
				CustomerExcelReader excelReader = new CustomerExcelReader();
				list = excelReader.daySalesPlanAdmFileload(urlData, logger);
				
				jsonData.put("data", list);
				
				//File file = new File(urlData);

				/*
				 * if( file.exists() ){ if(file.delete()){ logger.info("파일삭제 성공"); }else{
				 * logger.info("파일삭제 실패"); } }else{ logger.info("파일이 존재하지 않습니다."); }
				 */
				
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
	
	
	// 일판매계획관리 상세조회2
	@RequestMapping(value = "bs/daySalesPlanAdmRead2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> daySalesPlanAdmRead2(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("일판매계획 상세조회2 : "+daySalesPlanAdmVo);
		try {

			List<DaySalesPlanAdmVo> list = salesPlanAdmService.daySalesPlanAdmRead2(daySalesPlanAdmVo);
			
			//월판매계획값
			logger.info("월계획:"+salesPlanAdmService.getSalesMonQty(daySalesPlanAdmVo));
			int salesMonQty = salesPlanAdmService.getSalesMonQty(daySalesPlanAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("salesMonQty", salesMonQty);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 일판매계획관리 등록
	@RequestMapping(value="bs/daySalesPlanAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> daySalesPlanAdmCreate(@RequestBody List<Map<String, Object>> list) throws Exception{
		DaySalesPlanAdmVo daySalesPlanAdmVo = new DaySalesPlanAdmVo();
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("일판매계획list:"+list);
		try {
			if(list.size()>0) {
				daySalesPlanAdmVo.setSalesYear(list.get(0).get("salesYear").toString());
				daySalesPlanAdmVo.setSalesMon(list.get(0).get("salesMon").toString());
				for(Map<String, Object> m :list) {
				
					daySalesPlanAdmVo.setItemSeq(m.get("itemSeq").toString());
					daySalesPlanAdmVo.setSalesDay(m.get("salesDay").toString());
					daySalesPlanAdmVo.setSalesDayQty(m.get("salesDayQty").toString());	
					daySalesPlanAdmVo.setSalesSumQty(m.get("salesSumQty").toString());	
					//daySalesPlanAdmVo.setSalesMonQty(m.get("salesMonQty").toString());	
					
					if(salesPlanAdmService.daySalesPlanAdmRead(daySalesPlanAdmVo)==0) {
						
						daySalesPlanAdmVo.setConfirmYn("002");
						daySalesPlanAdmVo.setRegId(Utils.getUserId());
						salesPlanAdmService.daySalesPlanAdmCreate(daySalesPlanAdmVo);
					}else {
						
						daySalesPlanAdmVo.setUpdId(Utils.getUserId());
						salesPlanAdmService.daySalesPlanAdmUpdate(daySalesPlanAdmVo);
					}
				}
			}
			jsonData.put("result", "ok");
				
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	

	
	// 일판매계획관리 수정
	@RequestMapping(value = "bs/daySalesPlanAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> daySalesPlanAdmUpdate(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		DaySalesPlanAdmVo daySalesPlanAdmVo = new DaySalesPlanAdmVo();
		logger.info("월판매계획list : "+list);
		try {
			
			if(list.size()>0) {
				daySalesPlanAdmVo.setSalesYear(list.get(0).get("salesYear").toString());
				daySalesPlanAdmVo.setSalesMon(list.get(0).get("salesMon").toString());
				
				for(Map<String, Object> m :list) {
					
					daySalesPlanAdmVo.setItemSeq(m.get("itemSeq").toString());	
					daySalesPlanAdmVo.setSalesDay(m.get("salesDay").toString());	
					daySalesPlanAdmVo.setConfirmYn(m.get("confirmYn").toString());
					daySalesPlanAdmVo.setUpdId(Utils.getUserId());
					
					salesPlanAdmService.daySalesPlanAdmUpdate(daySalesPlanAdmVo);
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
	
	
	
	//***************엑셀 업로드***************
	
	//엑셀 업로드
	@RequestMapping(value= "bs/salesPlanAdmExcelUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> salesPlanAdmExcelUpload(Model model,MultipartHttpServletRequest multi, @RequestParam("excelfile") MultipartFile file) {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		String url = null;
		String fileName = "";
		try {
			// 파일 정보
			String originFilename = file.getOriginalFilename();
			String extName = originFilename;
			Long size = file.getSize();
			String path = filePath+multi.getParameter("case").toString();
			
			// 서버에서 저장 할 파일 이름
//			TimeZone tz = TimeZone.getTimeZone("Asia/Seoul");
//			Calendar calendar = Calendar.getInstance(tz);
//			fileName += calendar.get(Calendar.YEAR);		
//			fileName += calendar.get(Calendar.MONTH)+1;
//			fileName += calendar.get(Calendar.DATE);
//			fileName += calendar.get(Calendar.HOUR);
//			fileName += calendar.get(Calendar.MINUTE);
//			fileName += calendar.get(Calendar.SECOND);
			
			// 서버에서 저장 할 파일 이름
			Date today = new Date();
			SimpleDateFormat nowDate = new SimpleDateFormat("yyyyMMddhhmmss");
			logger.info("현재시간 : " + nowDate.format(today));
			fileName += nowDate.format(today);
		
			fileName += "_" + Utils.getUserNumber();
			
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
			    }catch(Exception e){
				    e.getStackTrace();
				}        
		    }else {
		    	logger.info("이미 폴더가 생성되어 있습니다.");
			}
			
			boolean result = false;
			byte[] data = file.getBytes();
			
			logger.info("writeFile path ===> " + path);
			
			FileOutputStream fos = new FileOutputStream(path + "/" + saveFileName);
			logger.info("data ==> " + data);
			fos.write(data);
			fos.close();
			
			url = path +"/"+ saveFileName;
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
	
	
	
}
