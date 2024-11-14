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
import java.util.Arrays;
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
import mes.domain.bm.ItemMotorVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.io.ItemUnitcostHisAdmVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.ItemPartAdmService;
import mes.service.io.ItemUnitcostHisAdmService;
import mes.web.cm.CustomerExcelReader;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ItemPartAdmController {
	
	@Inject
	private ItemPartAdmService itemPartAdmService;
	 
	@Inject
	private CommonCodeAdmService commonCodeService;
	
	@Inject
	private ItemUnitcostHisAdmService itemUnitcostHisAdmService;

	private static final Logger logger = LoggerFactory.getLogger(ItemPartAdmController.class);
	
	@Value("${file.inspectPath}")
	private String file_Inspect_Path;
	
	@Value("${file.itemAttachPath}")
	private String file_Item_Attach_Path;
	 
	@Value("${file.itemPartBasicForm}")
	private String itemPartBasicForm;
	
	@Value("${file.itemPartExcelUpload}") 
	private String itemPartExcelUpload;

	
	//제품정보관리(사출)
	@RequestMapping(value="bmsc0020")
	public String main(Locale locale, Model model) throws Exception{
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate);
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			//사용여부 공통코드
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
//			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", itemList );
			
			//수입검사여부 공통코드
			commonCodeVo.setBaseGroupCd("050"); // 수입검사여부
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspectYn",itemList );
			
			commonCodeVo.setBaseGroupCd("091"); // 제품/상품/재공품
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemGubun", itemList);
			
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
			
			commonCodeVo.setBaseGroupCd("036"); // 단위
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemUnit", itemList);
			
			commonCodeVo.setBaseGroupCd("112"); // 구분(사출/봉제)
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("mainGubun", itemList);
			
			commonCodeVo.setBaseGroupCd("095"); // 상태
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("stateCd", itemList);
			
			
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
			
			String userNm = Utils.getUserNm();
			model.addAttribute("userNm", userNm );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0020";
	}
	
	//제품정보관리(후가공)
	@RequestMapping(value="bmsc0200")
	public String mainSewing(Locale locale, Model model) throws Exception{
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate);
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			//사용여부 공통코드
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
//					commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", itemList );
			
			//수입검사여부 공통코드
			commonCodeVo.setBaseGroupCd("050"); // 수입검사여부
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspectYn",itemList );
			
			commonCodeVo.setBaseGroupCd("091"); // 제품/상품/재공품
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemGubun", itemList);
			
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
			
			commonCodeVo.setBaseGroupCd("036"); // 단위
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemUnit", itemList);
			
			commonCodeVo.setBaseGroupCd("112"); // 구분(사출/봉제)
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("mainGubun", itemList);
			
			commonCodeVo.setBaseGroupCd("095"); // 상태
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("stateCd", itemList);
			
			commonCodeVo.setBaseGroupCd("148"); // 생산구분
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("prodGubun", itemList);
			
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
			
			String userNm = Utils.getUserNm();
			model.addAttribute("userNm", userNm );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0200";
	}
	
	//제품정보관리(정밀가공)
	@RequestMapping(value="bmsc0400")
	public String bmsc0400(Locale locale, Model model) throws Exception{
		try {
			Date date = new Date();
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
			String formattedDate = dateFormat.format(date);
			model.addAttribute("serverTime", formattedDate);
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			//사용여부 공통코드
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
//						commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", itemList );
			
			//수입검사여부 공통코드
			commonCodeVo.setBaseGroupCd("050"); // 수입검사여부
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("inspectYn",itemList );
			
			commonCodeVo.setBaseGroupCd("091"); // 제품/상품/재공품
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemGubun", itemList);
			
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
			
			commonCodeVo.setBaseGroupCd("036"); // 단위
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("itemUnit", itemList);
			
			commonCodeVo.setBaseGroupCd("112"); // 구분(사출/봉제)
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("mainGubun", itemList);
			
			commonCodeVo.setBaseGroupCd("095"); // 상태
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("stateCd", itemList);
			
			commonCodeVo.setBaseGroupCd("148"); // 생산구분
			commonCodeVo.setUseYn("001");
			itemList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("prodGubun", itemList);
			
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
			
			String userNm = Utils.getUserNm();
			model.addAttribute("userNm", userNm );
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "bm/bmsc0400";
	}

	//품목정보관리(스페어)
	@RequestMapping(value = "/bmsc0170", method = RequestMethod.GET)
	public String bmsc0170(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		commonCodeVo.setBaseGroupCd("112"); // 구분(사출/봉제)
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> itemList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", itemList);
		
		commonCodeVo.setBaseGroupCd("036"); // 단위
		commonCodeVo.setUseYn("001");
		itemList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemUnit", itemList);
		
		String userNm = Utils.getUserNm();
		model.addAttribute("userNm", userNm );
		
		return "bm/bmsc0170";
	}

	//품목정보관리(부품) 목록조회
	@RequestMapping(value="bm/itemPartAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemPartAdmList(ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목정보관리 목록 조회 : " + itemPartAdmVo);
		try {
			
			List<ItemPartAdmVo> listAll = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
			jsonData.put("data", listAll);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//품목정보관리(부품) 초기화 
	@RequestMapping(value="bm/itemPartAdmTempList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemPartAdmTempList(ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목정보관리 초기화 : " + itemPartAdmVo);
		try {
			List<ItemPartAdmVo> listAll = new ArrayList<ItemPartAdmVo>();
			jsonData.put("data", listAll);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//품목정보관리(부품) 상세조회
	@RequestMapping(value="bm/itemPartDtlList" , method = RequestMethod.GET)
	public @ResponseBody Map<String , Object> itemPartDtlList(ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목정보관리 상세 조회 : "+itemPartAdmVo);
		try {
			ItemPartAdmVo dao = itemPartAdmService.itemPartDtlList(itemPartAdmVo);
			jsonData.put("data", dao);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	} 
	
	//부품수입검사기준서 조회
	@RequestMapping(value="bm/itemPartInspectList" , method = RequestMethod.GET)
	public @ResponseBody Map<String , Object> itemPartInspectList(ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부품수입검사기준서 조회 : "+itemPartAdmVo);
		try {
			List<ItemPartAdmVo> itemPartInspectList = itemPartAdmService.itemPartInspectList(itemPartAdmVo);
			jsonData.put("data", itemPartInspectList);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부품수입검사기준서 상세조회
	@RequestMapping(value="bm/itemPartInspectRead" , method = RequestMethod.GET)
	public @ResponseBody Map<String , Object> itemPartInspectRead(ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부품수입검사기준서 상세조회 : "+itemPartAdmVo);
		try {
			
			ItemPartAdmVo itemPartInspectRead = itemPartAdmService.itemPartInspectRead(itemPartAdmVo);
			jsonData.put("data", itemPartInspectRead);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	} 

	
	//부품관련자료 조회
	@RequestMapping(value="bm/itemPartAttachDataList" , method = RequestMethod.GET)
	public @ResponseBody Map<String , Object> itemPartAttachDataList(ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부품관련자료 조회 : "+itemPartAdmVo);
		try {
			List<ItemPartAdmVo> itemPartAttachDataList = itemPartAdmService.itemPartAttachDataList(itemPartAdmVo);
			jsonData.put("data", itemPartAttachDataList);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	} 
		
	
	//품목정보관리(부품) 등록
	@RequestMapping(value="bm/itemPartAdmCreate", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> itemPartAdmCreate(ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목정보관리 등록 :"+itemPartAdmVo);
		try {
			if(itemPartAdmService.overlapPartCd(itemPartAdmVo) == 0) {
				itemPartAdmVo.setRegId(Utils.getUserId());
				itemPartAdmService.itemPartAdmCreate(itemPartAdmVo);
				jsonData.put("result", "ok");
			}else {
				jsonData.put("result", "exist");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//품목정보관리(부품) Revison 등록
	@RequestMapping(value="bm/itemPartRevCreate", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> itemPartRevCreate(ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목정보관리 리비전 등록 :"+itemPartAdmVo);
		try {
			itemPartAdmVo.setRegId(Utils.getUserId());
			itemPartAdmService.itemPartAdmCreate(itemPartAdmVo);
			logger.info("등록 후 Vo:"+itemPartAdmVo);
			
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//품목정보관리(부품) 엑셀등록
	@RequestMapping(value="bm/itemPartAdmExcelCreate", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> itemPartAdmCreate(@RequestBody List<Map<String, Object>> itemPartAdmList) throws Exception{
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목정보관리(부품) 등록 :"+itemPartAdmVo);
		try {
			
			int count=0;
			String partCdList="";
			
			for(Map<String, Object> m :itemPartAdmList) {
				
				itemPartAdmVo.setItemSeq(m.get("itemSeq").toString());
				itemPartAdmVo.setItemRev(m.get("itemRev").toString());
				
				if(itemPartAdmService.overlapPartCd(itemPartAdmVo) > 0) {
					partCdList.concat("/" + itemPartAdmVo.getItemCd());
					logger.info(partCdList);
					count++;
				}
			}
			logger.info("count : " + count);
			
			if(count==0) {
				logger.info("create query start");
				for(Map<String, Object> m :itemPartAdmList) {
					
					itemPartAdmVo.setItemCd(m.get("itemCd").toString());
					itemPartAdmVo.setItemRev(m.get("itemRev").toString());
					
					//중복체크함 
					if(itemPartAdmService.overlapPartCd(itemPartAdmVo) == 0) {
						itemPartAdmVo.setItemNm(m.get("itemNm").toString());
						itemPartAdmVo.setItemGubun(m.get("itemGubun").toString());
						itemPartAdmVo.setItemType(m.get("itemType").toString());
						itemPartAdmVo.setItemSpec(m.get("itemSpec").toString());
						itemPartAdmVo.setUseYn(m.get("useYn").toString());
						itemPartAdmVo.setItemDesc(m.get("itemDesc").toString());
						itemPartAdmVo.setRegId(Utils.getUserId());
						
						itemPartAdmService.itemPartAdmCreate(itemPartAdmVo);
						
						//자재이력관리 Create
						ItemUnitcostHisAdmVo vo = new ItemUnitcostHisAdmVo();
						vo.setPartCd(itemPartAdmVo.getItemCd());
						vo.setPartRev(itemPartAdmVo.getItemRev());
						vo.setStartDate(DateUtil.getToday("yyyymmddhhmmss"));
						vo.setRegId(Utils.getUserId());
						
						int partSeq = itemUnitcostHisAdmService.getPartSeq(vo);
						vo.setPartSeq(partSeq);
						
						itemUnitcostHisAdmService.itemUnitcostHisAdmCreate(vo);
					}
					
					jsonData.put("result", "ok");
				}
			}else {
				jsonData.put("result", "exist");
				jsonData.put("partCd", partCdList);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//부품수입검사기준서 등록
	@RequestMapping(value="bm/itemPartInspectCreate", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> itemPartInspectCreate(MultipartHttpServletRequest multi, ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부품수입검사기준서 등록 :"+itemPartAdmVo);
		try {
			
			String newFileName="";
			String PartCd = itemPartAdmVo.getItemCd();
			String path = file_Inspect_Path+"/"+PartCd;
			
			File dir= new File(path);
			
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			MultipartFile mFile = multi.getFile("file");
			String fileName=mFile.getOriginalFilename();
			int partSeq = itemPartAdmService.getInspectPartSeq(itemPartAdmVo);
			
			if(!(fileName == null||fileName =="")) {
				newFileName = PartCd + "_" + partSeq + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
				itemPartAdmVo.setFileNm(fileName);
				
				try {
					mFile.transferTo(new File(path + "/" + newFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			itemPartAdmVo.setRegId(Utils.getUserId());
//			itemPartAdmVo.setPartSeq(partSeq);
			itemPartAdmService.itemPartInspectCreate(itemPartAdmVo);
			logger.info("등록 후 Vo:" + itemPartAdmVo);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//부품관련자료 등록
	@RequestMapping(value="bm/itemPartAttachDataCreate", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> itemPartAttachDataCreate(MultipartHttpServletRequest multi, ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부품관련자료 등록 :"+itemPartAdmVo);
		try {
			
			String newFileName = "";
			String itemSeq = itemPartAdmVo.getItemSeq();
			String path = file_Item_Attach_Path + "/" + itemSeq;
			
			File dir= new File(path);
			
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			MultipartFile mFile = multi.getFile("file");
			String fileName = mFile.getOriginalFilename();
			String itemAttachSeq = itemPartAdmService.getAttachPartSeq(itemPartAdmVo);
			
			if(!(fileName == null || fileName == "")) {
				newFileName = itemSeq + "_" + itemAttachSeq + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
				itemPartAdmVo.setFileNm(fileName);
				
				try {
					mFile.transferTo(new File(path + "/" + newFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			itemPartAdmVo.setRegId(Utils.getUserId());
			itemPartAdmVo.setItemAttachSeq(itemAttachSeq);
			itemPartAdmService.itemPartAttachDataCreate(itemPartAdmVo);
			logger.info("등록 후 Vo:" + itemPartAdmVo);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	//품목정보관리(부품) 수정
	@RequestMapping(value="bm/itemPartAdmUpdate", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> itemPartAdmUpdate(ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("품목정보관리 수정 :"+itemPartAdmVo);
		try {
			itemPartAdmVo.setUpdId(Utils.getUserId());
			itemPartAdmService.itemPartAdmUpdate(itemPartAdmVo);
			logger.info("수정 후 Vo:"+itemPartAdmVo);
			
//			ItemUnitcostHisAdmVo vo = new ItemUnitcostHisAdmVo();
//			vo.setPartCd(itemPartAdmVo.getPartCd());
//			vo.setPartRev(itemPartAdmVo.getPartRev()); 
//			
//			int lastUnitCost = itemUnitcostHisAdmService.getLastUnitCost(vo);
//			logger.info(""+lastUnitCost);
//			if(itemPartAdmVo.getUnitCost()!=lastUnitCost) {
//				int partSeq = itemUnitcostHisAdmService.getPartSeq(vo);
//				
//				//이전 이력 종료일 Update
//				vo.setPartSeq(partSeq-1);
//				vo.setEndDate(DateUtil.getToday("yyyymmddhhmmss"));
//				vo.setUpdId(Utils.getUserId());
//				itemUnitcostHisAdmService.itemUnitcostHisAdmUpdate(vo);
//				
//				//자재이력관리 Create
//				vo.setUnitCost(itemPartAdmVo.getUnitCost());
//				vo.setStartDate(DateUtil.getToday("yyyymmddhhmmss"));
//				vo.setRegId(Utils.getUserId());
//				vo.setPartSeq(partSeq);
//				
//				itemUnitcostHisAdmService.itemUnitcostHisAdmCreate(vo);
//				
//				
//				
//			}
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	//부품수입검사기준서 삭제
	@RequestMapping(value = "/bm/itemPartInspectDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemPartAdmDelete(ItemPartAdmVo itemPartAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부품수입검사기준서 삭제: "+itemPartAdmVo);
		try {
			itemPartAdmService.itemPartInspectDelete(itemPartAdmVo);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	

	//부품수입검사기준서 삭제
	@RequestMapping(value = "/bm/itemPartAttachDataDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemPartAttachDataDelete(ItemPartAdmVo itemPartAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부품관련자료 삭제: "+itemPartAdmVo);
		try {
			itemPartAdmService.itemPartAttachDataDelete(itemPartAdmVo);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	 //파일 다운로드
	 @RequestMapping(value="bm/itemPartInspectFileDownload", method = RequestMethod.GET)
	 public @ResponseBody Map<String, Object> itemPartInspectDownloadFile(
			 HttpServletResponse res , HttpServletRequest req,
			 ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			String saveFile = itemPartAdmService.getFileNm(itemPartAdmVo);
			String newFile = itemPartAdmVo.getItemSeq() + "_" + itemPartAdmVo.getItemAttachSeq() + "." + saveFile.substring(saveFile.lastIndexOf(".") + 1);
			String filePath = file_Inspect_Path + "/" + itemPartAdmVo.getItemSeq() + "/" + newFile;
			
			fileDownload(res, req, saveFile, filePath);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonData;
	  }
	 
	
	 //파일 다운로드
	 @RequestMapping(value="bm/itemPartAttachFileDownload", method = RequestMethod.GET)
	 public @ResponseBody Map<String, Object> itemPartAttachDownloadFile(
			 HttpServletResponse res , HttpServletRequest req,
			 ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			String saveFile = itemPartAdmService.getAttachFileNm(itemPartAdmVo);
			String newFile = itemPartAdmVo.getItemSeq() + "_" + itemPartAdmVo.getItemAttachSeq() + "." + saveFile.substring(saveFile.lastIndexOf(".") + 1);
			String filePath = file_Item_Attach_Path + "/" + itemPartAdmVo.getItemSeq() + "/" + newFile;
			
			fileDownload(res, req, saveFile, filePath);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonData;
	  }
	 
	 //기본양식 다운로드
	 @RequestMapping(value="bm/itemPartBasicForm", method = RequestMethod.GET)
	 public @ResponseBody Map<String, Object> itemPartBasicFormDownload(
			 HttpServletResponse res , HttpServletRequest req,
			 ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			  String saveFile = "basic.xlsx"; 
			  String filePath = itemPartBasicForm+"/basic.xlsx";
			 
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

	
	//itemRev값 가져오기
	@RequestMapping(value="bm/getPartRev" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getPartRev(ItemPartAdmVo itemPartAdmVo)throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			ItemPartAdmVo itemRev = itemPartAdmService.getPartRev(itemPartAdmVo);
					
			jsonData.put("data", itemRev);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonData;
	}
	
	
	//부품수입검사기준서 시퀀스 가져오기
	@RequestMapping(value = "/bm/getPartSeq", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getPartSeq(ItemPartAdmVo itemPartAdmVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부품수입검사기준서 시퀀스 조회: "+itemPartAdmVo);
		try {
			String userNm = Utils.getUserNm();
			int getPartSeq = itemPartAdmService.getInspectPartSeq(itemPartAdmVo);
			
			jsonData.put("seq", getPartSeq);
			jsonData.put("name", userNm);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData; 
	}
	
	//제품내역 조회
	@RequestMapping(value="bm/itemInformationList" , method = RequestMethod.GET)
	public @ResponseBody Map<String , Object> itemInformationList(ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("제품내역 조회 : "+itemPartAdmVo);
		try {
			List<ItemPartAdmVo> itemInformationList = itemPartAdmService.itemInformationList(itemPartAdmVo);
			jsonData.put("data", itemInformationList);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//견적관리 엑셀조회
	@RequestMapping(value = "bm/itemPartExcelDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemPartExcelDataList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
//		logger.info(itemPartAdmVo.getUrl());
		
//		if(itemPartAdmVo.getUrl()==null || itemPartAdmVo.getUrl().equals("")) {
//			List<ItemPartAdmVo> itemPartAdmList = new ArrayList<ItemPartAdmVo>();
//			jsonData.put("data", itemPartAdmList);
//		}else {
//			CustomerExcelReader excelReader = new CustomerExcelReader();
//			List<ItemPartAdmVo> itemPartAdmList = excelReader.itemPartFileload(itemPartAdmVo.getUrl(), logger);
//			jsonData.put("data", itemPartAdmList);
//			
//			logger.info("견적관리 엑셀조회:"+itemPartAdmList);				
//			File file = new File(itemPartAdmVo.getUrl());
//			logger.info(itemPartAdmVo.getUrl());
//
//			if( file.exists() ){
//	    		if(file.delete()){
//	    			logger.info("파일삭제 성공");    			
//	    		}else{
//	    			logger.info("파일삭제 실패");
//	    		}
//	    	}else{
//	    		logger.info("파일이 존재하지 않습니다.");
//	    	}
//			
//		}
		return jsonData;
	}
	
	//엑셀 업로드
	@RequestMapping(value= "bm/itemPartExcelUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemPartExcelUpload(Model model,@RequestParam("excelfile") MultipartFile file) {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		String url = null;
		String fileName = "";
		try {
			// 파일 정보
			String originFilename = file.getOriginalFilename();
			String extName = originFilename;
			Long size = file.getSize();
			String path = itemPartExcelUpload;
			
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
	
	//단가이력 등록
	@RequestMapping(value="bm/itemCostListCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemCostListCreate(ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("단가이력 등록 :" + itemPartAdmVo);
		try {
			//seq 추가
			String itemSeq = itemPartAdmService.getItemCostSeq(itemPartAdmVo);
			itemPartAdmVo.setItemCostSeq(itemSeq);
			itemPartAdmVo.setRegId(Utils.getUserId());
			itemPartAdmService.itemCostListCreate(itemPartAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//변경사유 수정
	@RequestMapping(value="bm/itemReasonCreate", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> itemReasonCreate(ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("변경사유 수정 : " + itemPartAdmVo);
		try {
//			String itemSeq = itemPartAdmService.getItemCostSeq(itemPartAdmVo);
//			itemPartAdmVo.setItemCostSeq(itemSeq);
			itemPartAdmVo.setUpdId(Utils.getUserId());
			itemPartAdmService.itemReasonCreate(itemPartAdmVo);
			logger.info("수정 후 Vo : " + itemPartAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//시퀀스 가져오기
	@RequestMapping(value = "/bm/getItemCdSeq", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getItemCdSeq() throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			String itemCdSeq = itemPartAdmService.getItemCdSeq();
			jsonData.put("itemCdSeq", itemCdSeq);
			jsonData.put("result", "ok");
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData; 
	}
	
	//삭제
	@RequestMapping(value="bm/itemInfoAdmDelete", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> itemInfoAdmDelete(ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			itemPartAdmService.itemInfoAdmDelete(itemPartAdmVo);
			itemPartAdmService.itemPartAttachDataDelete(itemPartAdmVo);
			itemPartAdmService.itemPartCostDataDelete(itemPartAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//단가이력 삭제
	@RequestMapping(value="bm/itemCostDtlDelete", method = RequestMethod.POST)
	@ResponseBody Map<String, Object> itemCostDtlDelete(ItemPartAdmVo itemPartAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			itemPartAdmService.itemPartCostDataDelete(itemPartAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//***********개발관리*************
	//BOM 조회
	@RequestMapping(value = "bm/itemMotorEbomList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemMotorEbomList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("개발관리 조회 : "+itemPartAdmVo);   
		try {
			
			List<ItemPartAdmVo> list = itemPartAdmService.itemMotorEbomList(itemPartAdmVo);	
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//BOM 상세조회
	@RequestMapping(value = "bm/itemMotorEbomDelete", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemMotorEbomDelete(ItemPartAdmVo itemPartAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("개발관리 삭제 : "+itemPartAdmVo);   
		try {
			
			ItemPartAdmVo vo = itemPartAdmService.itemMotorEbomRead(itemPartAdmVo);	
			
			//DB에 등록 O
			if(vo!=null) {
				//Lvl이 1인 경우
				if(itemPartAdmVo.getItemLvl().equals("1")) {
					itemPartAdmService.itemMotorEbomDelete(itemPartAdmVo);
					
					jsonData.put("result", "ok");
				}
				//Lvl이 1이 아닌 경우
				else {
					itemPartAdmVo.setUpperItemSeq("0"); 
					List<ItemPartAdmVo> list = itemPartAdmService.ebomOverlapList(itemPartAdmVo);
					if(list.size()>0) {
						jsonData.put("result", "over");
					}else {
						jsonData.put("result", "ok");
					}
				}
				
				logger.info("개발관리 EBOM 삭제 성공!");
				
				//jsonData.put("count", count);
				
			}else {
				jsonData.put("result", "ok");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//BOM 상세조회
	@RequestMapping(value = "bm/itemMotorEbomDelete2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemMotorEbomDelete2(ItemPartAdmVo itemPartAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("개발관리 삭제2 : "+itemPartAdmVo);   
		try {
			itemPartAdmService.itemMotorEbomDelete(itemPartAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
		
	//BOM 등록
	@RequestMapping(value = "bm/itemMotorEbomCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> inOutWhsAdmCreate(@RequestBody List<Map<String, Object>> itemMotorEbomlist) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		logger.info("개발관리 등록 : "+itemPartAdmVo);   
		try {
			for(Map<String, Object> m : itemMotorEbomlist) {
				
				itemPartAdmVo.setItemSeq(m.get("itemSeq").toString());
				itemPartAdmVo.setUpperItemSeq(m.get("upperItemSeq").toString());
				itemPartAdmVo.setItemConsumpt(m.get("itemConsumpt").toString());
				itemPartAdmVo.setPrcssCd("");
				
				ItemPartAdmVo vo = itemPartAdmService.itemMotorEbomRead(itemPartAdmVo);
				
				if (vo==null) {	//개발관리 등록
					itemPartAdmVo.setRegId(Utils.getUserId());
					itemPartAdmService.itemMotorEbomCreate(itemPartAdmVo);
				}else {	//개발관리 수정
					itemPartAdmVo.setUpdId(Utils.getUserId());
					itemPartAdmService.itemMotorEbomUpdate(itemPartAdmVo);
				}
				
				//반제품/상품일 경우 상위시퀀스 0인 데이터 생성해주기(반제품/상품 단독으로 조회할 경우  조회됨)
				if(m.get("itemGubun")!=null && 
						( m.get("itemGubun").equals("반제품") || m.get("itemGubun").equals("상품"))){
					itemPartAdmVo.setUpperItemSeq("0");
					itemPartAdmVo.setItemConsumpt("1");
					itemPartAdmVo.setRegId(Utils.getUserId());
					if(itemPartAdmService.itemMotorEbomRead(itemPartAdmVo)==null) {
						itemPartAdmService.itemMotorEbomCreate(itemPartAdmVo);
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

	//품목정보관리(제품) 이미지 업로드(DB에 바로 저장)
	@RequestMapping(value = "/bm/itemInfoImageUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemInfoImageUpload(ItemPartAdmVo itemPartAdmVo,
			MultipartHttpServletRequest multi) throws Exception {
		logger.info("품목정보관리(제품) 이미지 업로드");
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
			//이미지 번호
			String value = multi.getParameter("value");
			MultipartFile mFile = multi.getFile("imgAdd" + value);
			
			String fileName = mFile.getOriginalFilename(); // 원본 파일 명
			
			String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
			String[] imageList = {"tif","pjp","xbm","jxl","svgz","jpg","jpeg","ico","tiff","gif","svg","jfif","webp","png","bmp","pjpeg","avif","TIF","PJP","XBM","JXL","SVGZ","JPG","JPEG","ICO","TIFF","GIF","SVG","JFIF","WEBP","PNG","BMP","PJPEG","AVIF"};
			Long size = mFile.getSize();
			if(!Arrays.asList(imageList).contains(extension)) {
				jsonData.put("result", "extensionError");
	  		} else if (size > (1 * 1024 * 1024)) {
	  			jsonData.put("result", "sizeError");
			} else if (mFile == null || mFile.isEmpty()) {

			} else {
				switch(value) {
				case "1" :
					itemPartAdmVo.setImageFile1(mFile.getBytes());
					itemPartAdmVo.setImageFile1Nm(fileName);
					break;
				case "2" :
					itemPartAdmVo.setImageFile2(mFile.getBytes());
					itemPartAdmVo.setImageFile2Nm(fileName);
					break;
				case "3" :
					itemPartAdmVo.setImageFile3(mFile.getBytes());
					itemPartAdmVo.setImageFile3Nm(fileName);
					break;
				case "4" :
					itemPartAdmVo.setImageFile4(mFile.getBytes());
					itemPartAdmVo.setImageFile4Nm(fileName);
					break;
				}
				itemPartAdmService.itemInfoImageUpload(itemPartAdmVo);
				jsonData.put("result", "ok");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}

		return jsonData;
	}
	
	//품목정보관리 이미지 Delete
	@RequestMapping(value = "/bm/itemInfoImageDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemInfoImageDelete(ItemPartAdmVo itemPartAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("파일 삭제 vo:" + itemPartAdmVo);
		try {
			itemPartAdmVo.setUpdId(Utils.getUserId());		
			itemPartAdmService.itemInfoImageDelete(itemPartAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
			logger.info("" + Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//품목정보관리(제품) 이미지 경로조회
	@RequestMapping(value = "/bm/itemInfoImageRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemInfoImageRead(ItemPartAdmVo itemPartAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("이미지조회");
		try {
			ItemPartAdmVo vo = itemPartAdmService.itemInfoImageRead(itemPartAdmVo);
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
	
	//원단위 관리
	//기준정보
	@RequestMapping(value = "/bm/basicInfoList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> basicInfoList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			List<ItemPartAdmVo> list = new ArrayList<ItemPartAdmVo>();
			if(itemPartAdmVo.getItemInfo()!=null && !itemPartAdmVo.getItemInfo().equals("")) {
				list = itemPartAdmService.basicInfoList(itemPartAdmVo);
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
	
	//원단위 정보
	@RequestMapping(value = "/bm/wonUnitList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> wonUnitList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			logger.info("원단위 정보");
			List<ItemPartAdmVo> list = new ArrayList<ItemPartAdmVo>();
			if(itemPartAdmVo.getItemSeq()!=null && !itemPartAdmVo.getItemSeq().equals("")) {
				list = itemPartAdmService.wonUnitList(itemPartAdmVo);
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
	
	

}
