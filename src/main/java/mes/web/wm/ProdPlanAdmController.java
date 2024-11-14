package mes.web.wm;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale	;
import java.util.Map;
import java.util.TimeZone;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
import mes.domain.bs.DaySalesPlanAdmVo;
import mes.domain.bs.MonSalesPlanAdmVo;
import mes.domain.sm.MatrlUserVo;
import mes.domain.wm.DayProdPlanAdmVo;
import mes.domain.wm.MonProdPlanAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.EquipCodeAdmService;
import mes.service.bm.ItemPartAdmService;
import mes.service.sm.MatrlUserService;
import mes.service.wm.ProdPlanAdmService;
import mes.web.cm.CustomerExcelReader;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ProdPlanAdmController {
	

	private static final Logger logger = LoggerFactory.getLogger(ProdPlanAdmController.class);

	@Inject
	private CommonCodeAdmService commonCodeService;
	
	@Inject
	private MatrlUserService matrlUserService;
	
	@Inject
	private EquipCodeAdmService equipCodeAdmService;
	
	@Inject
	private ProdPlanAdmService prodPlanAdmService;
	
	@Inject
	private ItemPartAdmService itemPartAdmService;
	
	@Value("${file.prodPlanExcelUpload}") 
	private String filePath;
	
	// 월생산계획관리 메인
	@RequestMapping(value = "/wmsc0170", method = RequestMethod.GET)
	public String wmsc0170(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		return "wm/wmsc0170";
	}
	
	
	// 일생산계획관리(사출) 메인
	@RequestMapping(value = "/wmsc0180", method = RequestMethod.GET)
	public String wmsc0180(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("userNumber", Utils.getUserNumber());

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("112"); // 구분
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> mainGubunList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", mainGubunList);
		
		commonCodeVo.setBaseGroupCd("091"); // 품목구분
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> itemGubunList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemGubunList);
		
		commonCodeVo.setBaseGroupCd("060"); // 긴급여부
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> workEmerYnList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("workEmerYn", workEmerYnList);
		
		MatrlUserVo matrlUserVo = new MatrlUserVo();
		List<MatrlUserVo> userList = matrlUserService.listAll(matrlUserVo);
		model.addAttribute("userList", userList);
		
		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001");
		equipCodeAdmVo.setPrcNm("002");
		equipCodeAdmVo.setEquipGubun("001");
		List<EquipCodeAdmVo> equipList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", equipList);
		
		return "wm/wmsc0180";
	}
	
	// 일생산계획관리(봉제) 메인
	@RequestMapping(value = "/wmsc0181", method = RequestMethod.GET)
	public String wmsc0181(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("userNumber", Utils.getUserNumber());

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("112"); // 구분
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> mainGubunList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", mainGubunList);
		
		commonCodeVo.setBaseGroupCd("091"); // 품목구분
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> itemGubunList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemGubunList);
		
		commonCodeVo.setBaseGroupCd("060"); // 긴급여부
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> workEmerYnList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("workEmerYn", workEmerYnList);
		
		MatrlUserVo matrlUserVo = new MatrlUserVo();
		List<MatrlUserVo> userList = matrlUserService.listAll(matrlUserVo);
		model.addAttribute("userList", userList);
		
		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001");
		equipCodeAdmVo.setPrcNm("001");
		equipCodeAdmVo.setEquipGubun("001");
		List<EquipCodeAdmVo> equipList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", equipList);
		
		return "wm/wmsc0181";
	}
	
	// 일생산계획관리(정밀가공) 메인
	@RequestMapping(value = "/wmsc0410", method = RequestMethod.GET)
	public String wmsc0410(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("userNumber", Utils.getUserNumber());

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("112"); // 구분
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> mainGubunList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", mainGubunList);
		
		commonCodeVo.setBaseGroupCd("091"); // 품목구분
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> itemGubunList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemGubunList);
		
		commonCodeVo.setBaseGroupCd("060"); // 긴급여부
		commonCodeVo.setUseYn("001"); 
		List<CommonCodeAdmVo> workEmerYnList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("workEmerYn", workEmerYnList);
		
		MatrlUserVo matrlUserVo = new MatrlUserVo();
		List<MatrlUserVo> userList = matrlUserService.listAll(matrlUserVo);
		model.addAttribute("userList", userList);
		
		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001");
		equipCodeAdmVo.setPrcNm("001");
		equipCodeAdmVo.setEquipGubun("001");
		List<EquipCodeAdmVo> equipList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", equipList);
		
		return "wm/wmsc0410";
	}
	
	
	
	
	// 월생산계획관리 목록조회
	@RequestMapping(value="wm/monProdPlanAdmList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> monProdPlanAdmList(MonProdPlanAdmVo monProdPlanAdmVo,
				@RequestParam(value="urlData")String urlData)throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			List<MonProdPlanAdmVo> list = new ArrayList<MonProdPlanAdmVo>();
			
			if(urlData == null || urlData.equals("")) {
				list = prodPlanAdmService.monProdPlanAdmList(monProdPlanAdmVo);
				
			}else {
				CustomerExcelReader excelReader = new CustomerExcelReader();
				list = excelReader.monProdPlanAdmFileload(urlData, logger);
				logger.info("list:"+list);
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


	// 월생산계획관리 등록
	@RequestMapping(value="wm/monProdPlanAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> monProdPlanAdmCreate(@RequestBody List<Map<String, Object>> list) throws Exception{
		MonProdPlanAdmVo monProdPlanAdmVo = new MonProdPlanAdmVo();
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("월생산계획list: " + list);
		try {
			if (list.size() > 0) {
				monProdPlanAdmVo.setProdYear(list.get(0).get("prodYear").toString());
				monProdPlanAdmVo.setProdMon(list.get(0).get("prodMon").toString());
				for(Map<String, Object> m :list) {
						
					monProdPlanAdmVo.setItemSeq(m.get("itemSeq").toString());
					
					monProdPlanAdmVo.setSafyStockQty(m.get("safyStockQty").toString());
					monProdPlanAdmVo.setInitStockQty(m.get("initStockQty").toString());	
					monProdPlanAdmVo.setSalesOrderQty(m.get("salesOrderQty").toString());	
					monProdPlanAdmVo.setProdTotalQty(m.get("prodTotalQty").toString());
					monProdPlanAdmVo.setEndStockQty(m.get("endStockQty").toString());	
					monProdPlanAdmVo.setUnitCost(m.get("unitCost").toString());	
					
					monProdPlanAdmVo.setSafyStockAmt(m.get("safyStockAmt").toString());
					monProdPlanAdmVo.setInitStockAmt(m.get("initStockAmt").toString());	
					monProdPlanAdmVo.setSalesOrderAmt(m.get("salesOrderAmt").toString());	
					monProdPlanAdmVo.setProdTotalAmt(m.get("prodTotalAmt").toString());
					monProdPlanAdmVo.setEndStockAmt(m.get("endStockAmt").toString());	
					
					
					if (prodPlanAdmService.monProdPlanAdmRead(monProdPlanAdmVo) == 0) {
						monProdPlanAdmVo.setConfirmYn("002");
						monProdPlanAdmVo.setRegId(Utils.getUserId());
						prodPlanAdmService.monProdPlanAdmCreate(monProdPlanAdmVo);
					} else {
						monProdPlanAdmVo.setUpdId(Utils.getUserId());
						prodPlanAdmService.monProdPlanAdmUpdate(monProdPlanAdmVo);
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
	
	
	// 월생산계획관리 수정
	@RequestMapping(value = "wm/monProdPlanAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> monProdPlanAdmUpdate(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		MonProdPlanAdmVo monProdPlanAdmVo = new MonProdPlanAdmVo();
		logger.info("월생산계획list : "+list);
		try {
			
			if(list.size()>0) {
				monProdPlanAdmVo.setProdYear(list.get(0).get("prodYear").toString());
				monProdPlanAdmVo.setProdMon(list.get(0).get("prodMon").toString());
				for(Map<String, Object> m :list) {
					monProdPlanAdmVo.setItemSeq(m.get("itemSeq").toString());	
					monProdPlanAdmVo.setConfirmYn(m.get("confirmYn").toString());
					monProdPlanAdmVo.setUpdId(Utils.getUserId());
					
					prodPlanAdmService.monProdPlanAdmUpdate(monProdPlanAdmVo);
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
	
	
	
	
	// 일생산계획관리 목록조회
	@RequestMapping(value="wm/dayProdPlanAdmList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> dayProdPlanAdmList(DayProdPlanAdmVo dayProdPlanAdmVo,
			@RequestParam(value="urlData")String urlData)throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			List<DayProdPlanAdmVo> list = new ArrayList<DayProdPlanAdmVo>();
			
			if(urlData == null || urlData.equals("")) {
				logger.info("vo:"+dayProdPlanAdmVo);
				list = prodPlanAdmService.dayProdPlanAdmList(dayProdPlanAdmVo);
				
			}else {
				CustomerExcelReader excelReader = new CustomerExcelReader();
				list = excelReader.dayProdPlanAdmFileload(urlData, logger);
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
	@RequestMapping(value = "wm/dayProdPlanAdmRead2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> dayProdPlanAdmRead2(DayProdPlanAdmVo dayProdPlanAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("일판매계획 상세조회2 : "+dayProdPlanAdmVo);
		try {

			List<DayProdPlanAdmVo> list = prodPlanAdmService.dayProdPlanAdmRead2(dayProdPlanAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 일생산계획관리 등록
	@RequestMapping(value="wm/dayProdPlanAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dayProdPlanAdmCreate(@RequestBody List<Map<String, Object>> list) throws Exception{
		DayProdPlanAdmVo dayProdPlanAdmVo = new DayProdPlanAdmVo();
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("일생산계획list:"+list);
		try {
			
			if(list.size()>0) {
				dayProdPlanAdmVo.setProdYear(list.get(0).get("prodYear").toString());
				dayProdPlanAdmVo.setProdMon(list.get(0).get("prodMon").toString());
				for(Map<String, Object> m :list) {
						
					dayProdPlanAdmVo.setItemSeq(m.get("itemSeq").toString());
					dayProdPlanAdmVo.setProdDay(m.get("prodDay").toString());
					dayProdPlanAdmVo.setProdDayQty(m.get("prodDayQty").toString());
					dayProdPlanAdmVo.setProdSumQty(m.get("prodSumQty").toString());
					/* dayProdPlanAdmVo.setProdMonQty(m.get("prodMonQty").toString()); */
					
					
					if(prodPlanAdmService.dayProdPlanAdmRead(dayProdPlanAdmVo)==0) {
						
						dayProdPlanAdmVo.setConfirmYn("002");
						dayProdPlanAdmVo.setRegId(Utils.getUserId());
						
						prodPlanAdmService.dayProdPlanAdmCreate(dayProdPlanAdmVo);
					}else {
						
						dayProdPlanAdmVo.setUpdId(Utils.getUserId());
						prodPlanAdmService.dayProdPlanAdmUpdate(dayProdPlanAdmVo);
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
		
	
	
	// 일생산계획관리 수정
	@RequestMapping(value = "wm/dayProdPlanAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> dayProdPlanAdmUpdate(@RequestBody List<Map<String, Object>> list) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		DayProdPlanAdmVo dayProdPlanAdmVo = new DayProdPlanAdmVo();
		logger.info("일생산계획list : "+list);
		try {
			
			if(list.size()>0) {
				dayProdPlanAdmVo.setProdYear(list.get(0).get("prodYear").toString());
				dayProdPlanAdmVo.setProdMon(list.get(0).get("prodMon").toString());
				for(Map<String, Object> m :list) {
					dayProdPlanAdmVo.setProdDay(m.get("prodDay").toString());	
					dayProdPlanAdmVo.setItemSeq(m.get("itemSeq").toString());	
					dayProdPlanAdmVo.setConfirmYn(m.get("confirmYn").toString());
					dayProdPlanAdmVo.setUpdId(Utils.getUserId());
					
					prodPlanAdmService.dayProdPlanAdmUpdate(dayProdPlanAdmVo);
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
	
	
	
	//제품/반제품의 공정목록 조회
	@RequestMapping(value = "bm/workOrderProgressBomList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderProgressBomList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("개발관리 조회 : "+itemPartAdmVo);   
		try {
			List<ItemPartAdmVo> list = new ArrayList<ItemPartAdmVo>();
			if(itemPartAdmVo.getItemSeqList()!=null && itemPartAdmVo.getItemSeqList().length>0) {
				list = itemPartAdmService.itemMotorEbomList(itemPartAdmVo);	
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
	
	//***************엑셀 업로드***************
	
	//엑셀 업로드
	@RequestMapping(value= "wm/prodPlanAdmExcelUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prodPlanAdmExcelUpload(Model model,MultipartHttpServletRequest multi, @RequestParam("excelfile") MultipartFile file) {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		String url = null;
		String fileName = "";
		try {
			// 파일 정보
			String originFilename = file.getOriginalFilename();
			String extName = originFilename;
			Long size = file.getSize();
			String path = filePath + multi.getParameter("case").toString();
			
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
