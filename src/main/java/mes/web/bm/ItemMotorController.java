package mes.web.bm;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
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

import org.apache.commons.codec.binary.Base64;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
import mes.domain.bm.ItemMotorVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.ItemMotorService;
import mes.web.cm.CustomerExcelReader;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ItemMotorController {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemMotorController.class);
	
	@Inject
	private ItemMotorService itemMotorService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeService;
	
	@Value("${file.itemStandardPath}")
	private String file_Item_Standard_Path;	
	
	@Value("${file.specialOrderPath}")
	private String specialOrderPath;	
	
	@Value("${file.specifyPath}")
	private String specifyPath;	
	
	@Value("${file.itemMotorExcelUpload}") 
	private String itemMotorExcelUpload;
	
	@Value("${file.itemMotorBasicForm}") 
	private String itemMotorBasicForm;
	
	@Value("${file.bomMatchExcelUpload}") 
	private String bomMatchExcelUpload;
	
	@Value("${file.bomMatchBasicForm}") 
	private String bomMatchBasicForm;
	
	
	@Value("${file.eBomExcelUpload}") 
	private String eBomExcelUpload;
	
	@Value("${file.eBomBasicForm}") 
	private String eBomBasicForm;
	
	// 모터 정보
	
	// 품목정보관리(부품) 페이지  bmsc0050
	@RequestMapping(value = "/bmsc0030", method = RequestMethod.GET)
	public String baseInfoFtMain(Locale locale, Model model) throws Exception {
		try {
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate);
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			//사용여부 공통코드
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", itemList );
			
			//부품구분 공통코드
			commonCodeVo.setBaseGroupCd("035"); // 부품구분
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("partGubun", itemList );
			
			//부품단위 공통코드
			commonCodeVo.setBaseGroupCd("036"); // 부품단위
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("partUnit", itemList );
			
			//부품단위 공통코드
			commonCodeVo.setBaseGroupCd("077"); // 부품타입
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("partType", itemList );
			
			//수입검사여부 공통코드
			commonCodeVo.setBaseGroupCd("050"); // 수입검사여부
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspectYn",itemList );
			
			commonCodeVo.setBaseGroupCd("050"); // 수입검사여부
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("importYn", itemList);
			
			commonCodeVo.setBaseGroupCd("092"); // 제품군
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemType", itemList);
			
			commonCodeVo.setBaseGroupCd("093"); // 개발구분
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemJustGubun", itemList);
			
			commonCodeVo.setBaseGroupCd("094"); // 내수/수출
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("exportCd", itemList);
			
			commonCodeVo.setBaseGroupCd("095"); // 품목상태
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("stateCd", itemList);
			
			commonCodeVo.setBaseGroupCd("096"); // 결제방식
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("payMethodCd", itemList);
			
			commonCodeVo.setBaseGroupCd("097"); // LH/RH
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("lhrhCd", itemList);
			
			commonCodeVo.setBaseGroupCd("098"); // 거래처
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("accCd", itemList);
			
			commonCodeVo.setBaseGroupCd("099"); // 모델
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemModel", itemList);
			
			commonCodeVo.setBaseGroupCd("100"); // 장소
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("locationCd", itemList);
			
			commonCodeVo.setBaseGroupCd("073"); // 저장위치
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("savelocCd", itemList);
			
			commonCodeVo.setBaseGroupCd("109"); // 선입선출
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemFifoGubun", itemList);
			
			commonCodeVo.setBaseGroupCd("110"); // 자재/부자재
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemGubun", itemList);
			
			commonCodeVo.setBaseGroupCd("036"); // 단위
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemUnit", itemList);
			
			commonCodeVo.setBaseGroupCd("112"); // 구분(사출/봉제)
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("mainGubun", itemList);
			
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
			
			String userNm = Utils.getUserNm();
			model.addAttribute("userNm", userNm );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0030";
	}
	
	@RequestMapping(value = "/bmsc0180", method = RequestMethod.GET)
	public String itemMotorBase(Locale locale, Model model) throws Exception {
		try {
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate);
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			//사용여부 공통코드
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", itemList );
			
			//부품구분 공통코드
			commonCodeVo.setBaseGroupCd("035"); // 부품구분
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("partGubun", itemList );
			
			//부품단위 공통코드
			commonCodeVo.setBaseGroupCd("036"); // 부품단위
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("partUnit", itemList );
			
			//부품단위 공통코드
			commonCodeVo.setBaseGroupCd("077"); // 부품타입
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("partType", itemList );
			
			//수입검사여부 공통코드
			commonCodeVo.setBaseGroupCd("050"); // 수입검사여부
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspectYn",itemList );
			
			commonCodeVo.setBaseGroupCd("050"); // 수입검사여부
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("importYn", itemList);
			
			commonCodeVo.setBaseGroupCd("092"); // 제품군
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemType", itemList);
			
			commonCodeVo.setBaseGroupCd("093"); // 개발구분
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemJustGubun", itemList);
			
			commonCodeVo.setBaseGroupCd("094"); // 내수/수출
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("exportCd", itemList);
			
			commonCodeVo.setBaseGroupCd("095"); // 품목상태
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("stateCd", itemList);
			
			commonCodeVo.setBaseGroupCd("096"); // 결제방식
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("payMethodCd", itemList);
			
			commonCodeVo.setBaseGroupCd("097"); // LH/RH
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("lhrhCd", itemList);
			
			commonCodeVo.setBaseGroupCd("098"); // 거래처
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("accCd", itemList);
			
			commonCodeVo.setBaseGroupCd("099"); // 모델
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemModel", itemList);
			
			commonCodeVo.setBaseGroupCd("100"); // 장소
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("locationCd", itemList);
			
			commonCodeVo.setBaseGroupCd("073"); // 저장위치
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("savelocCd", itemList);
			
			commonCodeVo.setBaseGroupCd("109"); // 선입선출
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemFifoGubun", itemList);
			
			commonCodeVo.setBaseGroupCd("110"); // 자재/부자재
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemGubun", itemList);
			
			commonCodeVo.setBaseGroupCd("036"); // 단위
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemUnit", itemList);
			
			commonCodeVo.setBaseGroupCd("112"); // 구분(사출/봉제)
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("mainGubun", itemList);
			
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
			
			String userNm = Utils.getUserNm();
			model.addAttribute("userNm", userNm );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0180";
	}
	
	@RequestMapping(value = "/bmsc0450", method = RequestMethod.GET)
	public String bmsc0450(Locale locale, Model model) throws Exception {
		try {
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate);
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			//사용여부 공통코드
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", itemList );
			
			//부품구분 공통코드
			commonCodeVo.setBaseGroupCd("035"); // 부품구분
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("partGubun", itemList );
			
			//부품단위 공통코드
			commonCodeVo.setBaseGroupCd("036"); // 부품단위
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("partUnit", itemList );
			
			//부품단위 공통코드
			commonCodeVo.setBaseGroupCd("077"); // 부품타입
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("partType", itemList );
			
			//수입검사여부 공통코드
			commonCodeVo.setBaseGroupCd("050"); // 수입검사여부
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspectYn",itemList );
			
			commonCodeVo.setBaseGroupCd("050"); // 수입검사여부
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("importYn", itemList);
			
			commonCodeVo.setBaseGroupCd("092"); // 제품군
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemType", itemList);
			
			commonCodeVo.setBaseGroupCd("093"); // 개발구분
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemJustGubun", itemList);
			
			commonCodeVo.setBaseGroupCd("094"); // 내수/수출
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("exportCd", itemList);
			
			commonCodeVo.setBaseGroupCd("095"); // 품목상태
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("stateCd", itemList);
			
			commonCodeVo.setBaseGroupCd("096"); // 결제방식
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("payMethodCd", itemList);
			
			commonCodeVo.setBaseGroupCd("097"); // LH/RH
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("lhrhCd", itemList);
			
			commonCodeVo.setBaseGroupCd("098"); // 거래처
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("accCd", itemList);
			
			commonCodeVo.setBaseGroupCd("099"); // 모델
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemModel", itemList);
			
			commonCodeVo.setBaseGroupCd("100"); // 장소
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("locationCd", itemList);
			
			commonCodeVo.setBaseGroupCd("073"); // 저장위치
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("savelocCd", itemList);
			
			commonCodeVo.setBaseGroupCd("109"); // 선입선출
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemFifoGubun", itemList);
			
			commonCodeVo.setBaseGroupCd("110"); // 자재/부자재
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemGubun", itemList);
			
			commonCodeVo.setBaseGroupCd("036"); // 단위
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemUnit", itemList);
			
			commonCodeVo.setBaseGroupCd("112"); // 구분(사출/봉제)
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("mainGubun", itemList);
			
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
			
			String userNm = Utils.getUserNm();
			model.addAttribute("userNm", userNm );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0450";
	}
	
	@RequestMapping(value = "/bmsc0410", method = RequestMethod.GET)
	public String bmsc0410(Locale locale, Model model) throws Exception {
		try {
			
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate);
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			//사용여부 공통코드
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", itemList );
			
			//부품구분 공통코드
			commonCodeVo.setBaseGroupCd("035"); // 부품구분
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("partGubun", itemList );
			
			//부품단위 공통코드
			commonCodeVo.setBaseGroupCd("036"); // 부품단위
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("partUnit", itemList );
			
			//부품단위 공통코드
			commonCodeVo.setBaseGroupCd("077"); // 부품타입
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("partType", itemList );
			
			//수입검사여부 공통코드
			commonCodeVo.setBaseGroupCd("050"); // 수입검사여부
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspectYn",itemList );
			
			commonCodeVo.setBaseGroupCd("050"); // 수입검사여부
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("importYn", itemList);
			
			commonCodeVo.setBaseGroupCd("092"); // 제품군
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemType", itemList);
			
			commonCodeVo.setBaseGroupCd("093"); // 개발구분
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemJustGubun", itemList);
			
			commonCodeVo.setBaseGroupCd("094"); // 내수/수출
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("exportCd", itemList);
			
			commonCodeVo.setBaseGroupCd("095"); // 품목상태
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("stateCd", itemList);
			
			commonCodeVo.setBaseGroupCd("096"); // 결제방식
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("payMethodCd", itemList);
			
			commonCodeVo.setBaseGroupCd("097"); // LH/RH
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("lhrhCd", itemList);
			
			commonCodeVo.setBaseGroupCd("098"); // 거래처
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("accCd", itemList);
			
			commonCodeVo.setBaseGroupCd("099"); // 모델
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemModel", itemList);
			
			commonCodeVo.setBaseGroupCd("100"); // 장소
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("locationCd", itemList);
			
			commonCodeVo.setBaseGroupCd("073"); // 저장위치
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("savelocCd", itemList);
			
			commonCodeVo.setBaseGroupCd("109"); // 선입선출
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemFifoGubun", itemList);
			
			commonCodeVo.setBaseGroupCd("110"); // 자재/부자재
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemGubun", itemList);
			
			commonCodeVo.setBaseGroupCd("036"); // 단위
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemUnit", itemList);
			
			commonCodeVo.setBaseGroupCd("112"); // 구분(사출/봉제)
			commonCodeVo.setUseYn("001");
			itemList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("mainGubun", itemList);
			
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
			
			String userNm = Utils.getUserNm();
			model.addAttribute("userNm", userNm );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0410";
	}
	
	// 품목정보관리(부품) 전체 조회
	@RequestMapping(value = "/itemMotorList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemMotorList(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("품목정보관리(부품) 목록조회: " + itemMotorVo);
		try {
			List<ItemMotorVo> itemMotorList = itemMotorService.itemMotorList(itemMotorVo);
			jsonData.put("data", itemMotorList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}


	// 품목정보관리(부품) 상세 조회
	@RequestMapping(value = "/bm/itemMotorRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> baseInfoFtRead(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("품목정보관리(부품) 상세 정보 : " +itemMotorVo);
		try {
			itemMotorVo = itemMotorService.itemMotorRead(itemMotorVo);
			logger.info("검색 후 : " + itemMotorVo);
			jsonData.put("data", itemMotorVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}


	// 품목정보관리(부품) 등록
	@RequestMapping(value = "/bm/itemMotorCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMotorCreate(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목정보관리(부품) 등록: " + itemMotorVo);
		try {
			itemMotorVo.setRegId(Utils.getUserId());
			itemMotorService.itemMotorCreate(itemMotorVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//품목정보관리(부품) 엑셀등록
	@RequestMapping(value="bm/itemMotorAdmExcelCreate", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> itemPartAdmCreate(@RequestBody List<Map<String, Object>> itemPartAdmList) throws Exception{
		ItemMotorVo itemMotorVo = new ItemMotorVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목정보관리(모터) 등록 :"+itemMotorVo);
		try {
			for(Map<String, Object> m :itemPartAdmList) {
				
				itemMotorVo.setItemCd(m.get("itemCd").toString());
				itemMotorVo.setItemNm(m.get("itemNm").toString());
				itemMotorVo.setItemRev(m.get("itemRev").toString());
				itemMotorVo.setItemGubun(m.get("itemGubun").toString());
				itemMotorVo.setItemSeries(m.get("itemSeries").toString());
				itemMotorVo.setFrameSize(m.get("frameSize").toString());
				itemMotorVo.setItemCapa(m.get("itemCapa").toString());
				itemMotorVo.setItemEncdr(m.get("itemEncdr").toString());
				itemMotorVo.setItemType(m.get("itemType").toString());
				itemMotorVo.setIpClass(m.get("ipClass").toString());
				itemMotorVo.setSerialNo(m.get("serialNo").toString());
				itemMotorVo.setItemVoltage(m.get("itemVoltage").toString());
				itemMotorVo.setItemOutput(m.get("itemOutput").toString());
				itemMotorVo.setItemSize(m.get("itemSize").toString());
				itemMotorVo.setItemGubun2(m.get("itemGubun2").toString());
				itemMotorVo.setUnitCost(Integer.parseInt(m.get("unitCost").toString()));
				itemMotorVo.setUseYn(m.get("useYn").toString());
				itemMotorVo.setItemDesc(m.get("itemDesc").toString());
				
				if(itemMotorService.overlapItemCd(itemMotorVo) == 0) {
					itemMotorVo.setRegId(Utils.getUserId());
					itemMotorService.itemMotorCreate(itemMotorVo);
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
	

	// 품목정보관리(부품) 수정
	@RequestMapping(value = "/bm/itemMotorUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMotorUpdate(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
			itemMotorVo.setUpdId(Utils.getUserId());
			logger.info("품목정보관리(부품) 수정: " + itemMotorVo);
			itemMotorService.itemMotorUpdate(itemMotorVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
	// 제품명 검색 (조건 : 작지번호)
	@RequestMapping(value = "/bm/getItemNm", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getItemNm(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
			String itemNmVal = itemMotorService.getItemNm(itemMotorVo);
			
			jsonData.put("data", itemNmVal);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// E-BOM
	
	//E-BOM 조회
	/*
	 * @RequestMapping(value = "bm/itemMotorEBomList", method = RequestMethod.GET)
	 * public @ResponseBody Map<String, Object> itemMotorEBomList(ItemMotorVo
	 * itemMotorVo) throws Exception { Map<String, Object> jsonData = new
	 * HashMap<String, Object>();
	 * 
	 * logger.info("E-BOM 목록조회: " + itemMotorVo); try { List<ItemMotorVo> list =
	 * null; if(itemMotorVo.getItemCd()==null && itemMotorVo.getItemCdArr()==null) {
	 * list = new ArrayList<ItemMotorVo>(); }else { list =
	 * itemMotorService.itemMotorEBomList(itemMotorVo); } jsonData.put("data",
	 * list); jsonData.put("result", "ok"); } catch (Exception e) {
	 * e.printStackTrace(); jsonData.put("result", "error"); jsonData.put("message",
	 * Utils.getErrorMessage()); }
	 * 
	 * return jsonData; }
	 */
	
	//E-BOM 초기화
	@RequestMapping(value = "bm/itemMotorEBomReset", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemMotorEBomReset(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		List<ItemMotorVo> list = new ArrayList<ItemMotorVo>();	
		
		jsonData.put("data", list);
			jsonData.put("result", "ok");

		return jsonData;
	}
	
	// E-BOM 등록
	@RequestMapping(value = "/bm/itemMotorEBomCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMotorEBomCreate(@RequestBody List<Map<String, Object>> eBomList) throws Exception {
		logger.info("E-BOM 등록");
		Map<String, Object> jsonData = new HashMap<String, Object>();		
		ItemMotorVo itemMotorVo = new ItemMotorVo();
		try {
			
			//중복제거
			List<String> eBomDistinctList = new ArrayList<String>();
			for(Map<String, Object> m : eBomList) {
				if(m.get("partCd").toString()!="") {
					if(!eBomDistinctList.contains(m.get("partCd").toString()+m.get("partRev").toString())){
						eBomDistinctList.add(m.get("partCd").toString()+m.get("partRev").toString());
					}else {
						jsonData.put("result", "distinct" );
						jsonData.put("data", m.get("partCd").toString() );
						
						return jsonData;
					}
				}
			}
			
			itemMotorVo.setRegId(Utils.getUserId());	
			itemMotorVo.setItemCd(eBomList.get(0).get("itemCd").toString());
			itemMotorVo.setItemRev(eBomList.get(0).get("itemRev").toString());
			int partSeq = 1;
			itemMotorService.itemMotorEBomDelete(itemMotorVo);
			
			for(Map<String, Object> m : eBomList) {
				if(m.get("partCd").toString()!="") {
					itemMotorVo.setPartCd(m.get("partCd").toString());
					itemMotorVo.setPartRev(m.get("partRev").toString());
					itemMotorVo.setPartSeq(Integer.toString(partSeq));
					itemMotorVo.setPartConsumpt(Float.parseFloat(m.get("partConsumpt").toString()));
					itemMotorService.itemMotorEBomCreate(itemMotorVo);
					partSeq++;
					jsonData.put("result", "ok" );	
				}else {
					jsonData.put("result", "ok" );		
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
			
		return jsonData;
	}
	
	
	// E-BOM 등록
	@RequestMapping(value = "/bm/itemMotorEbomExcelCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMotorEbomExcelCreate(@RequestBody List<Map<String, Object>> eBomList) throws Exception {
		logger.info("E-BOM 등록");
		Map<String, Object> jsonData = new HashMap<String, Object>();		
		ItemMotorVo itemMotorVo = new ItemMotorVo();
		try {
			
			itemMotorVo.setRegId(Utils.getUserId());	
			itemMotorVo.setItemCd(eBomList.get(0).get("itemCd").toString());
			itemMotorVo.setItemRev(eBomList.get(0).get("itemRev").toString());
			int partSeq = 1;
			
			//중복제거
			List<String> eBomDistinctList = new ArrayList<String>();
			for(Map<String, Object> m : eBomList) {
				if(!eBomDistinctList.contains(m.get("partCd").toString()+m.get("partRev").toString())){
					eBomDistinctList.add(m.get("partCd").toString()+m.get("partRev").toString());
				}else {
					jsonData.put("result", "distinct" );
					jsonData.put("data", m.get("partCd").toString() );
				}
			}
			
			for(Map<String, Object> m : eBomList) {
				if(m.get("partCd").toString()!="") {
					itemMotorVo.setPartCd(m.get("partCd").toString());
					itemMotorVo.setPartRev(m.get("partRev").toString());
					itemMotorVo.setPartSeq(Integer.toString(partSeq));
					itemMotorVo.setPartConsumpt(Float.parseFloat(m.get("partConsumpt").toString()));
					itemMotorService.itemMotorEBomCreate(itemMotorVo);
					partSeq++;
					
				}
			}
			
			jsonData.put("result", "ok" );	
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
			
		return jsonData;
	}
	
	
	//구매자재관리(발주관리) 부품정보 팝업모달
	@RequestMapping(value="bm/itemPartAllList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemPartAllList(ItemMotorVo itemMotorVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목정보관리 목록 조회 : "+ itemMotorVo);
		try {
			if(itemMotorVo.getValue().equals("1")) {
				if(itemMotorVo.getItemCd()==null || itemMotorVo.getItemCd().equals("")) {
					List<ItemMotorVo> list = new ArrayList<ItemMotorVo>();
					jsonData.put("data", list);
				}else {
					List<ItemMotorVo> listAll = itemMotorService.itemPartAllList(itemMotorVo);
					jsonData.put("data", listAll);
				}
			}else {
				List<ItemMotorVo> listAll = itemMotorService.itemPartAllList(itemMotorVo);
				jsonData.put("data", listAll);
			}
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	/*
	
	// E-BOM 수정
	@RequestMapping(value = "/bm/itemMotorEBomUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMotorEBomUpdate(@RequestBody List<Map<String, Object>> eBomList) throws Exception {
		logger.info("E-BOM 수정");
		Map<String, Object> jsonData = new HashMap<String, Object>();		
		ItemMotorVo itemMotorVo = new ItemMotorVo();
		try {
			itemMotorVo.setUpdId(Utils.getUserId());	
			int partSeq = 1;
			itemMotorVo.setItemCd(eBomList.get(0).get("itemCd").toString());
			itemMotorVo.setItemRev(eBomList.get(0).get("itemRev").toString());
			itemMotorService.itemMotorEBomDelete(itemMotorVo);
			for(Map<String, Object> m : eBomList) {
				
				itemMotorVo.setPartCd(m.get("partCd").toString());
				itemMotorVo.setPartRev(m.get("partRev").toString());
				itemMotorVo.setPartSeq(Integer.toString(partSeq));
				itemMotorVo.setPartConsumpt(m.get("partConsumpt").toString());			
				
				itemMotorService.itemMotorEBomCreate(itemMotorVo);
				partSeq++;
			}
		jsonData.put("result", "ok" );	
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	*/
	
	
	
	// M-BOM 조회
	@RequestMapping(value = "bm/itemMotorMBomList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemMotorMBomList(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("E-BOM 목록조회: " + itemMotorVo);
		try {
			List<ItemMotorVo> list = null;
			if(itemMotorVo.getItemCd()==null) {
				list = new ArrayList<ItemMotorVo>();
			}else {
				list = itemMotorService.itemMotorMBomList(itemMotorVo);
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
	
	// M-BOM 등록
	@RequestMapping(value = "/bm/itemMotorMBomCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMotorMBomCreate(ItemMotorVo itemMotorVo) throws Exception {
		logger.info("M-BOM 등록");
		Map<String, Object> jsonData = new HashMap<String, Object>();		
		try {
			
			itemMotorService.itemMotorMBomDelete(itemMotorVo);
			
			itemMotorVo.setRegId(Utils.getUserId());	
			itemMotorService.itemMotorMBomCreate(itemMotorVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
			
		return jsonData;
	}
	
	// M-BOM 수정
	@RequestMapping(value = "/bm/itemMotorMBomUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMotorMBomUpdate(ItemMotorVo itemMotorVo) throws Exception {
		logger.info("M-BOM 수정");
		Map<String, Object> jsonData = new HashMap<String, Object>();		
		try {
			itemMotorVo.setUpdId(Utils.getUserId());	
			itemMotorService.itemMotorMBomUpdate(itemMotorVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
			
		return jsonData;
	}
		
	
	//M-BOM 초기화
	@RequestMapping(value = "bm/itemMotorMBomReset", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemMotorMBomReset(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		List<ItemMotorVo> list = new ArrayList<ItemMotorVo>();	
		
		jsonData.put("data", list);
			jsonData.put("result", "ok");

		return jsonData;
	}
	

	//모터사진 이미지 경로조회
	@RequestMapping(value = "/bm/itemMotorImgRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemMotorImgRead(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("이미지조회");
		try {
		
			ItemMotorVo vo=itemMotorService.itemMotorImgRead(itemMotorVo);
			if (vo.getImageFile1() != null) {
				String imageFile1 = new String(Base64.encodeBase64(vo.getImageFile1()));
				String imageFile1Nm = vo.getImageFile1Nm();
				jsonData.put("imageFile1", imageFile1);
				jsonData.put("imageFile1Nm", imageFile1Nm);
			}
			if (vo.getImageFile2() != null) {
				String imageFile2 = new String(Base64.encodeBase64(vo.getImageFile2()));
				String imageFile2Nm = vo.getImageFile2Nm();
				jsonData.put("imageFile2", imageFile2);
				jsonData.put("imageFile2Nm", imageFile2Nm);
			}
			if (vo.getImageFile3() != null) {
				String imageFile3 = new String(Base64.encodeBase64(vo.getImageFile3()));
				String imageFile3Nm = vo.getImageFile3Nm();
				jsonData.put("imageFile3", imageFile3);
				jsonData.put("imageFile3Nm", imageFile3Nm);
			}
			if (vo.getImageFile4() != null) {
				String imageFile4 = new String(Base64.encodeBase64(vo.getImageFile4()));
				String imageFile4Nm = vo.getImageFile4Nm();
				jsonData.put("imageFile4", imageFile4);
				jsonData.put("imageFile4Nm", imageFile4Nm);
			}
			jsonData.put("data", vo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	 
	//모터사진 업로드(DB에 바로 저장)
	@RequestMapping(value = "/bm/itemMotorImgUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMotorImgUpload(ItemMotorVo itemMotorVo,
			MultipartHttpServletRequest multi) throws Exception {
		logger.info("업로드 컨트롤러 시작");
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
			logger.info("모터이미지 vo="+itemMotorVo);
			//이미지 번호
			String value=multi.getParameter("value");
			MultipartFile mFile = multi.getFile("imgAdd" + value);
			logger.info("mFile : "+mFile);
			logger.info("mFile.getBytes() : "+mFile.getBytes());
			
			String fileName = mFile.getOriginalFilename(); // 원본 파일 명
			logger.info("fileName : "+fileName);
			
			if (mFile == null || mFile.isEmpty()) {

			} else {
				
				switch(value) {
				case "1" :
					itemMotorVo.setImageFile1(mFile.getBytes());
					itemMotorVo.setImageFile1Nm(fileName);
					break;
				case "2" :
					itemMotorVo.setImageFile2(mFile.getBytes());
					itemMotorVo.setImageFile2Nm(fileName);
					break;
				case "3" :
					itemMotorVo.setImageFile3(mFile.getBytes());
					itemMotorVo.setImageFile3Nm(fileName);
					break;
				case "4" :
					itemMotorVo.setImageFile4(mFile.getBytes());
					itemMotorVo.setImageFile4Nm(fileName);
					break;
				}
			}
			itemMotorService.itemMotorImgUpload(itemMotorVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}

		return jsonData;
	}
	
	//불러오기 모터사진 업로드
	@RequestMapping(value = "/bm/itemMotorImgCallUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMotorImgCallUpload(ItemMotorVo itemMotorVo) throws Exception {
		logger.info("업로드 컨트롤러 시작");
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
			logger.info("불러오기 업로드 : " +itemMotorVo);
			itemMotorVo.setRegId(Utils.getUserId());
			itemMotorService.itemMotorImgCallUpload(itemMotorVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}

		return jsonData;
	}
	
	//모터사진 Delete
	@RequestMapping(value = "/bm/itemMotorImageDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMotorImageDelete(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("파일 삭제 vo:"+itemMotorVo);
		try {
			
			itemMotorVo.setUpdId(Utils.getUserId());		
			itemMotorService.itemMotorImgDelete(itemMotorVo);
		
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
			logger.info(""+Utils.getErrorMessage());
		}
		
		return jsonData;
	}

	
	//코드 시퀀스
	@RequestMapping(value = "/bm/itemMotorSeq", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMotorSeq() throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			String sequence = itemMotorService.itemMotorSeq();
			logger.info("검색 후 CDSEQ : " + sequence);
			jsonData.put("itemCd", sequence);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//revision 시퀀스
	@RequestMapping(value = "/bm/itemMotorRevSeq", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> baseInfoCdSeq(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			String sequence = itemMotorService.itemMotorRevSeq(itemMotorVo);
			logger.info("검색 후 REVSEQ : " + sequence);
			jsonData.put("itemRev", sequence);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// BOM-MAT 상세 조회
	@RequestMapping(value = "/bm/itemBomMapRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemBomMapRead(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			List<ItemMotorVo> itemBomMapList = itemMotorService.itemBomMapRead(itemMotorVo);
			jsonData.put("data", itemBomMapList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}


	// BOM-MAT 등록
	@RequestMapping(value = "/bm/itemBomMapCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemBomMapCreate(@RequestBody List<Map<String, Object>> bomMatList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ItemMotorVo itemMotorVo = new ItemMotorVo();
		try {
			
			itemMotorVo.setItemCd(bomMatList.get(0).get("itemCd").toString());
			itemMotorVo.setItemRev(bomMatList.get(0).get("itemRev").toString());
			itemMotorVo.setPrcssCd(bomMatList.get(0).get("prcssCd").toString());
			itemMotorVo.setRegId(Utils.getUserId());	
			
			itemMotorService.itemBomMapDelete(itemMotorVo);
			logger.info("bom-mat 삭제 성공");
			
			for(Map<String, Object> m : bomMatList) {
				
				if(m.get("partCd").toString() == null || m.get("partCd").toString().equals("")) {
					jsonData.put("result", "ok" );	
					
				}else {
					itemMotorVo.setPartCd(m.get("partCd").toString());
					itemMotorVo.setPartRev(m.get("partRev").toString());
					
					//중복검사 
					if(itemMotorService.overlapPartCd(itemMotorVo)==0) {
						itemMotorService.itemBomMapCreate(itemMotorVo);
						jsonData.put("result", "ok" );	
					}else {
						jsonData.put("result", "exist");
						jsonData.put("data", itemMotorVo.getPartCd());
					}
				}
				
			}
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//품목정보관리(부품) 엑셀등록
	@RequestMapping(value="bm/bomMatchExcelCreate", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> bomMatchExcelCreate(@RequestBody List<Map<String, Object>> itemPartAdmList) throws Exception{
		ItemMotorVo itemMotorVo = new ItemMotorVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("BOM-MAT 등록 :"+itemMotorVo);
		try {
			for(Map<String, Object> m :itemPartAdmList) {
				
				itemMotorVo.setItemCd(m.get("itemCd").toString());
				itemMotorVo.setItemRev(m.get("itemRev").toString());
				itemMotorVo.setPrcssCd(m.get("prcssCd").toString());
				itemMotorVo.setPartCd(m.get("partCd").toString());
				itemMotorVo.setPartCd(m.get("partCd").toString());
				itemMotorVo.setPartRev(m.get("partRev").toString());
				
				
				if(itemMotorService.overlapPartCd(itemMotorVo) == 0) {
					itemMotorVo.setRegId(Utils.getUserId());
					itemMotorService.itemBomMapCreate(itemMotorVo);
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
		
	// BOM-MAT 수정
	@RequestMapping(value = "/bm/itemBomMapUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemBomMapUpdate(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
			itemMotorVo.setUpdId(Utils.getUserId());
			logger.info("품목정보관리(부품) 수정: " + itemMotorVo);
			itemMotorService.itemMotorUpdate(itemMotorVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// BOM-MAT(E-BOM 조회(공통제외)
	@RequestMapping(value = "bm/itemBomMapEbomList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemBomMapEbomList(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("E-BOM 목록조회: " + itemMotorVo);
		try {
			List<ItemMotorVo> list = new ArrayList<ItemMotorVo>();
			if(itemMotorVo.getItemCd()==null) {
				jsonData.put("data", list);
			}else {
				list = itemMotorService.itemMotorEBomList(itemMotorVo);
				
				//소모품 제외한 항목 bom-mat 
				List<ItemMotorVo> ebomList = new ArrayList<ItemMotorVo>();
				for(int i=0; i<list.size(); i++) {
					if(!list.get(i).getPartType().equals("004")) {
						ebomList.add(list.get(i));
					}
				}
				jsonData.put("data", ebomList);
				
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작업표준서 목록조회
	@RequestMapping(value = "/bm/itemWorkStandardList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemWorkStandardList(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			List<ItemMotorVo> itemWorkStandardList = itemMotorService.itemWorkStandardList(itemMotorVo);
			jsonData.put("data", itemWorkStandardList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 작업표준서 업로드
	@RequestMapping(value = "/bm/itemWorkStandardUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> uploadFile(ItemMotorVo itemMotorVo, MultipartHttpServletRequest multi) throws Exception {
		logger.info("작업표준서업로드 컨트롤러 시작 : " +itemMotorVo);
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			String workStandard = itemMotorService.workStandardSeq(itemMotorVo);
			itemMotorVo.setWorkStandardSeq(workStandard);
			MultipartFile mFile = multi.getFile("fileNm_" + workStandard); 
			
			String fileName = mFile.getOriginalFilename(); // 원본 파일 명
			
			logger.info("파일명"+fileName);
			
			String path = file_Item_Standard_Path+"/"+ itemMotorVo.getItemSeq() +"/" + workStandard;
			logger.info("path >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "+path);
			
			
			//(DB에 바로저장)
			String pos = (fileName.substring(fileName.lastIndexOf(".")+1)).toUpperCase();

			if(pos.equals("GIF") || pos.equals("JPEG") || pos.equals("JPG") || pos.equals("PNG") ||pos.equals("BMP")) {
				itemMotorVo.setWorkStandard(mFile.getBytes());
				logger.info("DB에 바로 저장 되었습니다.!");
			}
			
			//(서버 폴더에 저장)
			File dir=new File(path);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			String newFileName="";
			if (mFile == null || mFile.isEmpty()) {

			} else {
				
				newFileName=itemMotorVo.getItemSeq()+ workStandard + "."+fileName.substring(fileName.lastIndexOf(".")+1);
				mFile.transferTo(new File(path+"/"+newFileName));
				
				itemMotorVo.setRegId(Utils.getUserId());
				itemMotorVo.setWorkStandardNm(fileName);
				itemMotorService.itemWorkStandardCreate(itemMotorVo);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}

		return jsonData;
	}
	
	
	//불러오기 작업표준서 업로드
	@RequestMapping(value = "/bm/itemWorkStandardCallCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemWorkStandardCallCreate(ItemMotorVo itemMotorVo, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(itemMotorVo.getArrayData());
			ItemMotorVo itemMotorTempVo = new ItemMotorVo();
			
			for(int i=0;i<jsonArray.size();i++){
	
				jsonObj.put(i, jsonArray.get(i));
				JSONObject jsonObjDtl = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
				
				if(jsonObjDtl.get("workStandardNm") != null && jsonObjDtl.get("workStandardNm") !="") {
					
					//파일 업로드
					String dFile =  jsonObjDtl.get("workStandardNm").toString();
					String newFileName = jsonObjDtl.get("prcssCd").toString()+"."+ dFile.substring(dFile.lastIndexOf(".") + 1);

					//로컬에 저장 시
//					String path=file_Item_Standard_Path+jsonObjDtl.get("itemCdTo").toString()+"\\"+jsonObjDtl.get("itemRevTo").toString()+ "\\" + newFileName;
//					logger.info("path >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "+path);
					
					//서버에 저장시
					String path = file_Item_Standard_Path+"/"+jsonObjDtl.get("itemCdTo").toString()+"/"+jsonObjDtl.get("itemRevTo").toString()+"/"+newFileName;
					logger.info("path3 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> "+path);
					
					String path2 = file_Item_Standard_Path+"/"+jsonObjDtl.get("itemCd").toString()+"/"+jsonObjDtl.get("itemRev").toString()+"/"+newFileName;
					
					File dir=new File(path2);
					if(!dir.exists()) {
						dir.mkdirs();
					}
					
					//file: 원본파일, newFile: 복사할 파일
					File file = new File(path);
					File newFile = new File(path2);
					//파일 복사
					Files.copy(file.toPath(), newFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
					//파일 업로드 끝
					
					itemMotorTempVo.setItemCd(jsonObjDtl.get("itemCd").toString());					//신규 itemCd
					itemMotorTempVo.setItemCdTo(jsonObjDtl.get("itemCdTo").toString());				//기존 itemCd
					itemMotorTempVo.setItemRev(jsonObjDtl.get("itemRev").toString());				//itemRev
					itemMotorTempVo.setPrcssCd(jsonObjDtl.get("prcssCd").toString());				//prcssCd
					itemMotorTempVo.setWorkStandardNm(jsonObjDtl.get("workStandardNm").toString());	//workStandardNm
					itemMotorService.itemWorkStandardCallCreate(itemMotorTempVo);
				}
			};
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		} 
		return jsonData;
	}
	
	// 작업표준서 download
	@RequestMapping(value = "/bm/itemWorkStandardDownload", method = RequestMethod.GET)
	public @ResponseBody void downloadFile(HttpServletResponse res, HttpServletRequest req,	ItemMotorVo itemMotorVo) throws Exception {
		ItemMotorVo vo = new ItemMotorVo();
		try {
			//파일명 가져오기
			vo = itemMotorService.itemWorkStandardRead(itemMotorVo);
			logger.info("vo >>>>>>>>>>>>> : " +vo );
			String dFile =  vo.getWorkStandardNm();
			logger.info("dFile >>>>>>>>>> : " +dFile);
			String newFileName = vo.getItemSeq() + vo.getWorkStandardSeq() + "."+ dFile.substring(dFile.lastIndexOf(".") + 1);
			logger.info("newFileName >>>>>>>>>> : " +newFileName);

			String path=file_Item_Standard_Path+"/"+vo.getItemSeq()+"/"+ vo.getWorkStandardSeq() + "/" + newFileName;
			logger.info("path >>>>>>>>>> : " +path);	
			
			File file = new File(path);
			String userAgent = req.getHeader("User-Agent");
			logger.info("userAgent >>>>>>>>>> : " +userAgent);

			boolean ie = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);

			if (ie) {
				dFile = URLEncoder.encode(dFile, "UTF-8").replaceAll("\\+", "%20");
			} else {
				dFile = new String(dFile.getBytes("UTF-8"), "ISO-8859-1");
			}

			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment; fileName=" + dFile + ";");

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
	
	// 작업표준서 삭제
	@RequestMapping(value = "/bm/itemWorkStandardDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemWorkStandardDelete(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			itemMotorService.itemWorkStandardDelete(itemMotorVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//특주,사양서 목록조회
	@RequestMapping(value = "/bm/itemMotorFileList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemMotorFileList(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			List<ItemMotorVo> list = itemMotorService.itemMotorFileList(itemMotorVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	

	//특주,사양서 시퀀스
	@RequestMapping(value = "/bm/itemMotorFileSeq", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemMotorFileSeq(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			String seq = itemMotorService.itemMotorFileSeq(itemMotorVo);
			String userNm = Utils.getUserNm();
			
			jsonData.put("fileSeq", seq);
			jsonData.put("userNm", userNm);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	
	//특주,사양서 등록
	@RequestMapping(value = "/bm/itemMotorFileCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMotorFileCreate(ItemMotorVo itemMotorVo,
			MultipartHttpServletRequest multi, HttpServletRequest request) throws Exception {
		logger.info("특주,사양서 등록: " +itemMotorVo);
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			String fileSeq = itemMotorService.itemMotorFileSeq(itemMotorVo);
			
			MultipartFile mFile=null;
			
			if(itemMotorVo.getFileType().equals("001")) {
				mFile = multi.getFile("specialOrderFileNm"); 
			}else {
				mFile = multi.getFile("specifyFileNm"); 
				
			}
			
			String fileName = mFile.getOriginalFilename(); // 원본 파일 명
			String path = specialOrderPath+"/"+itemMotorVo.getItemCd()+"/"+itemMotorVo.getItemRev()+"/"+itemMotorVo.getFileType();
		
			//(서버 폴더에 저장)
			File dir=new File(path);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			String newFileName="";
			if (mFile == null || mFile.isEmpty()) {

			} else {
				
				newFileName=fileSeq+"."+fileName.substring(fileName.lastIndexOf(".")+1);
				mFile.transferTo(new File(path+"/"+newFileName));
				
				itemMotorVo.setRegId(Utils.getUserId());
				itemMotorVo.setFileSeq(fileSeq);
				itemMotorVo.setFileNm(fileName);
				itemMotorService.itemMotorFileCreate(itemMotorVo);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}

		return jsonData;
	}
	
	
	
	//불러오기 특주, 사양서 업로드
	@RequestMapping(value = "/bm/itemMotorFileCallCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMotorFileCallCreate(ItemMotorVo itemMotorVo, HttpServletRequest request) throws Exception {
		logger.info("특주,사양서 불러오기 등록");
		Map<String, Object> jsonData = new HashMap<>();
		try {
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObj = new JSONObject();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(itemMotorVo.getArrayData2());
			ItemMotorVo itemMotorTempVo = new ItemMotorVo();
			
			for(int i=0;i<jsonArray.size();i++){
	
				jsonObj.put(i, jsonArray.get(i));
				JSONObject jsonObjDtl = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
				
					String dFile = jsonObjDtl.get("fileNm").toString();
					String newFileName = jsonObjDtl.get("fileSeq").toString()+ "." + dFile.substring(dFile.lastIndexOf(".") + 1);
					//로컬 저장 시
//					String path = specialOrderPath+jsonObjDtl.get("itemCdTo").toString()+"\\"+jsonObjDtl.get("itemRevTo").toString()+ "\\" +jsonObjDtl.get("fileType").toString()+ "\\" +newFileName;
					
					//서버 저장 시
					String path = specialOrderPath+"/"+jsonObjDtl.get("itemCdTo").toString()+"/"+jsonObjDtl.get("itemRevTo").toString()+"/"+jsonObjDtl.get("fileType").toString()+"/"+newFileName;
					String path2 = specialOrderPath+"/"+jsonObjDtl.get("itemCd").toString()+"/"+jsonObjDtl.get("itemRev").toString()+"/"+jsonObjDtl.get("fileType").toString()+"/"+newFileName;
					logger.info("path : " +path);
					logger.info("path2 : " +path2);
					
					File dir=new File(path2);
					if(!dir.exists()) {
						dir.mkdirs();
					}
					
					//file: 원본파일, newFile: 복사할 파일
					File file = new File(path);
					File newFile = new File(path2);
					//파일 복사
					Files.copy(file.toPath(), newFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
				
					//파일 업로드 끝
					itemMotorTempVo.setItemCd(jsonObjDtl.get("itemCd").toString());					//신규 itemCd
					itemMotorTempVo.setItemCdTo(jsonObjDtl.get("itemCdTo").toString());				//기존 itemCd
					itemMotorTempVo.setItemRev(jsonObjDtl.get("itemRev").toString());				//itemRev
					
					itemMotorTempVo.setFileType(jsonObjDtl.get("fileType").toString());				//fileType
					itemMotorTempVo.setFileSeq(jsonObjDtl.get("fileSeq").toString());				//fileSeq
					itemMotorTempVo.setFileNm(jsonObjDtl.get("fileNm").toString());					//사진 이름
					itemMotorTempVo.setFileContent(jsonObjDtl.get("fileContent").toString());		//내용
					itemMotorTempVo.setFileDate(jsonObjDtl.get("fileDate").toString());				//일자
					itemMotorTempVo.setRegId(jsonObjDtl.get("regNm").toString());					//등록자
					itemMotorService.itemMotorFileCreate(itemMotorTempVo);
			};
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		} 
		return jsonData;
	}
	

	//특주,사양서 다운로드
	 @RequestMapping(value="bm/itemMotorFileDownload", method = RequestMethod.GET)
	 public @ResponseBody Map<String, Object> itemMotorFileDownload(
			 HttpServletResponse res , HttpServletRequest req,
			 ItemMotorVo itemMotorVo,
			 @RequestParam(value="itemCd") String itemCd,
			 @RequestParam(value="itemRev") String itemRev,
			 @RequestParam(value="fileType") String fileType,
			 @RequestParam(value="fileSeq") String fileSeq
			 ) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			ItemMotorVo vo = itemMotorService.itemMotorFileRead(itemMotorVo);
			
			String dFile = vo.getFileNm();
			String newFileName = itemMotorVo.getFileSeq()+ "." + dFile.substring(dFile.lastIndexOf(".") + 1);
//			String path = specialOrderPath+"/"+itemMotorVo.getItemCd()+"/"+itemMotorVo.getItemRev()+ "/" + newFileName;;
			String path = specialOrderPath+"/"+itemMotorVo.getItemCd()+"/"+itemMotorVo.getItemRev()+"/"+itemMotorVo.getFileType()+ "/" + newFileName;
			fileDownload(res, req, dFile, path);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonData;
	 }
	
	//특주,사양서 삭제
	@RequestMapping(value = "/bm/itemMotorFileDelete", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemMotorFileDelete(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			itemMotorService.itemMotorFileDelete(itemMotorVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	
	
	//작업지시선택 - 자재투입내역
	// 자재투입내역 리스트 조회
	@RequestMapping(value = "/bm/workOrderMatrlRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> workOrderMatrlRead(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			logger.info("자재투입내역");
			List<ItemMotorVo> itemBomMapList = itemMotorService.workOrderMatrlRead(itemMotorVo);
			jsonData.put("data", itemBomMapList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//엑셀 업로드 시작------------------------------------------------------------------
	
	//모터정보 엑셀업로드 목록조회
	@RequestMapping(value = "bm/itemMotorExcelDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemMotorExcelDataList(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info(itemMotorVo.getUrl());
		
		if(itemMotorVo.getUrl()==null || itemMotorVo.getUrl().equals("")) {
			List<ItemMotorVo> bomMatchAdmList = new ArrayList<ItemMotorVo>();
			jsonData.put("data", bomMatchAdmList);
		}else {
			CustomerExcelReader excelReader = new CustomerExcelReader();
			List<ItemMotorVo> bomMatchAdmList = excelReader.itemMotorFileload(itemMotorVo.getUrl(), logger);
			jsonData.put("data", bomMatchAdmList);
			
			logger.info("견적관리 엑셀조회:"+bomMatchAdmList);				
			File file = new File(itemMotorVo.getUrl());
			logger.info(itemMotorVo.getUrl());

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
		
	//모터정보 엑셀 업로드
	@RequestMapping(value= "bm/itemMotorExcelUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMotorExcelUpload(Model model,@RequestParam("excelfile") MultipartFile file) {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		String url = null;
		String fileName = "";
		try {
			// 파일 정보
			String originFilename = file.getOriginalFilename();
			String extName = originFilename;
			Long size = file.getSize();
			String path = itemMotorExcelUpload;
			
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

	
	//BOM-MAT 엑셀업로드 목록조회
	@RequestMapping(value = "bm/bomMatchExcelDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> bomMatchExcelDataList(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info(itemMotorVo.getUrl());
		
		if(itemMotorVo.getUrl()==null || itemMotorVo.getUrl().equals("")) {
			List<ItemMotorVo> itemMotorAdmList = new ArrayList<ItemMotorVo>();
			jsonData.put("data", itemMotorAdmList);
		}else {
			CustomerExcelReader excelReader = new CustomerExcelReader();
			List<ItemMotorVo> itemPartAdmList = excelReader.bomMatchFileload(itemMotorVo.getUrl(), logger);
			jsonData.put("data", itemPartAdmList);
			
			logger.info("견적관리 엑셀조회:"+itemPartAdmList);				
			File file = new File(itemMotorVo.getUrl());
			logger.info(itemMotorVo.getUrl());

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
	
	//BOM-MAT 엑셀 업로드
	@RequestMapping(value= "bm/bomMatchExcelUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bomMatchExcelUpload(Model model,@RequestParam("excelfile2") MultipartFile file) {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("엑셀업로드 컨트롤러 구동");
		String url = null;
		String fileName = "";
		try {
			// 파일 정보
			String originFilename = file.getOriginalFilename();
			String extName = originFilename;
			Long size = file.getSize();
			String path = bomMatchExcelUpload;
			
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
	
	//Ebom 엑셀업로드 목록조회
	@RequestMapping(value = "bm/eBomExcelDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> eBomExcelDataList(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info(itemMotorVo.getUrl());
		
		if(itemMotorVo.getUrl()==null || itemMotorVo.getUrl().equals("")) {
			List<ItemMotorVo> itemMotorAdmList = new ArrayList<ItemMotorVo>();
			jsonData.put("data", itemMotorAdmList);
		}else {
			CustomerExcelReader excelReader = new CustomerExcelReader();
			List<ItemMotorVo> itemPartAdmList = excelReader.eBomFileload(itemMotorVo.getUrl(), logger);
			jsonData.put("data", itemPartAdmList);
			
			logger.info("견적관리 엑셀조회:"+itemPartAdmList);				
			File file = new File(itemMotorVo.getUrl());
			logger.info(itemMotorVo.getUrl());

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
	
	//Ebom 엑셀 업로드
	@RequestMapping(value= "bm/eBomExcelUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> eBomExcelUpload(Model model,@RequestParam("excelfile3") MultipartFile file) {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("엑셀업로드 컨트롤러 구동");
		String url = null;
		String fileName = "";
		try {
			// 파일 정보
			String originFilename = file.getOriginalFilename();
			String extName = originFilename;
			Long size = file.getSize();
			String path = eBomExcelUpload;
			
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
	//엑셀 업로드 끝------------------------------------------------------------------
	
	//엑셀 다운로드 시작---------------------------------------------------------------
	
	//모터정보 기본양식 다운로드
	 @RequestMapping(value="bm/itemMotorBasicForm", method = RequestMethod.GET)
	 public @ResponseBody Map<String, Object> itemMotorBasicForm(
			 HttpServletResponse res , HttpServletRequest req,
			 ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			String saveFile = "basicMotor.xlsx"; 
			String filePath = itemMotorBasicForm+"/basicMotor.xlsx";
		
			fileDownload(res, req, saveFile, filePath);
			
			logger.info("파일 다운");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonData;
	 }
	 
	 //BOM-MSY 기본양식 다운로드
	 @RequestMapping(value="bm/bomMatchBasicForm", method = RequestMethod.GET)
	 public @ResponseBody Map<String, Object>bomMatchBasicForm(
			 HttpServletResponse res , HttpServletRequest req,
			 ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			String saveFile = "basicBomMatch.xlsx"; 
			String filePath = bomMatchBasicForm+"/basicBomMatch.xlsx";
		
			fileDownload(res, req, saveFile, filePath);
			
			logger.info("파일 다운");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonData;
	 }
	 
	//eBOM 기본양식 다운로드
	 @RequestMapping(value="bm/eBomBasicForm", method = RequestMethod.GET)
	 public @ResponseBody Map<String, Object>eBomBasicForm(
			 HttpServletResponse res , HttpServletRequest req,
			 ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			String saveFile = "basicEbom.xlsx"; 
			String filePath = eBomBasicForm+"/basicEbom.xlsx";
		
			fileDownload(res, req, saveFile, filePath);
			
			logger.info("파일 다운");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonData;
	 }

     
	 
	 //모터정보 파일 다운로드
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
	//엑셀 다운로드 끝----------------------------------------------------------------
	 
	//자재출고 BOM조회
	@RequestMapping(value = "bm/itemMotorEBomOutList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemMotorEBomOutList(ItemMotorVo itemMotorVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		logger.info("자재출고 E-BOM 목록조회: " + itemMotorVo);
		try {
			List<ItemMotorVo> list = itemMotorService.itemMotorEBomOutList(itemMotorVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	
} 
