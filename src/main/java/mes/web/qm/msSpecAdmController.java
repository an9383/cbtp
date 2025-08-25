package mes.web.qm;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.ItemMotorVo;
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.qm.FaultyAttachDataVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.qm.FaultyAttachDataService;
import mes.service.tm.StockPaymentAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class msSpecAdmController {

	private static final Logger logger = LoggerFactory.getLogger(msSpecAdmController.class);
	
	@Value("${file.faultyAttachDataPath}") 
	private String faultyAttachDataPath;
	
	@Inject
	private FaultyAttachDataService faultyAttachDataService;
	
	@Inject
	private CommonCodeAdmService systemCommonCodeService;	
	
	//MS-SPEC 규격집 메인
	@RequestMapping(value = "/qmsc0090", method = RequestMethod.GET)
	public String msSpecAdmMain(Locale locale, Model model) throws Exception {
		logger.info("MS-SPEC 규격집 메인");
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
			
			String userNumber = Utils.getUserNumber();
			String userNm = Utils.getUserNm();
			String departmentNm = Utils.getUserDepartmentNm();
			model.addAttribute("userNumber" , userNumber);
			model.addAttribute("userNm" , userNm);
			model.addAttribute("departmentNm" , departmentNm);
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "qm/qmsc0090";
	}

	
}
