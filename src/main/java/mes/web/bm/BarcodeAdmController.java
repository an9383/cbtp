package mes.web.bm;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mes.domain.bm.AttachDataVo;
import mes.domain.bm.BarcodeAdmVo;
import mes.domain.bm.CommonCodeAdmVo;
import mes.service.bm.AttachDataService;
import mes.service.bm.BarcodeAdmService;
import mes.service.bm.CommonCodeAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;


@Controller
public class BarcodeAdmController {
	private static final Logger logger = LoggerFactory.getLogger(BarcodeAdmController.class);
	
	@Inject
	private BarcodeAdmService barcodeAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeService;
	
	//바코드정보관리 페이지
	@RequestMapping(value = "/bmsc0140")
	public String bmsc0140GET(Model model, HttpServletRequest request) throws Exception {
		
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6) );
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd") );
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		commonCodeVo.setBaseGroupCd("079"); // 품목구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> itemList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemList);
		
		commonCodeVo.setBaseGroupCd("112"); // 구분(사출/봉제)
		commonCodeVo.setUseYn("001");
		itemList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", itemList);
		
		return "bm/bmsc0140";
	}
	
	//자재 목록 조회
	@RequestMapping(value = "bm/barcodeAdmPartList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> barcodeAdmPartList(BarcodeAdmVo barcodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("관련 자료 조회 = "+ barcodeAdmVo);
		try {
			List<BarcodeAdmVo> barcodeAdmPartList= barcodeAdmService.barcodeAdmPartList(barcodeAdmVo);
			jsonData.put("data", barcodeAdmPartList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//제품 목록 조회
	@RequestMapping(value = "bm/barcodeAdmItemList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> barcodeAdmItemList(BarcodeAdmVo barcodeAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("관련 자료 조회 = "+ barcodeAdmVo);
		try {
			List<BarcodeAdmVo> barcodeAdmItemList= barcodeAdmService.barcodeAdmItemList(barcodeAdmVo);
			jsonData.put("data", barcodeAdmItemList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
}
