package mes.web.ml;

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
public class MoldRepairHistAdmController {

	private static final Logger logger = LoggerFactory.getLogger(MoldRepairHistAdmController.class);
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	// 금형수리이력관리 페이지
	@RequestMapping(value = "/mlsc0020", method = RequestMethod.GET)
	public String mlsc0020(Model model, HttpServletRequest request) throws Exception {
		logger.info("금형수리이력관리 메인");			
		try {
			model.addAttribute("serverDateTo", DateUtil.getDay("yyyy-mm-dd", -6) );
			model.addAttribute("serverDateFrom", DateUtil.getToday("yyyy-mm-dd") );
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("066"); // 수리상태
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> repairStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("repairStatus", repairStatusList );
			
			commonCodeVo.setBaseGroupCd("123"); // 설비수리교체점검구분
			commonCodeVo.setUseYn("001");
			repairStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("equipGubun", repairStatusList );
			
			commonCodeVo.setBaseGroupCd("130"); // 금형수리교체점검이력구분
			commonCodeVo.setUseYn("001");
			repairStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("resultQuality", repairStatusList );
			
			String userNm = Utils.getUserNm();
			model.addAttribute("userNm", userNm);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "ml/mlsc0020";
		
	}
	
	// 철형수리이력관리 페이지
		@RequestMapping(value = "/mlsc0130", method = RequestMethod.GET)
		public String mlsc0130(Model model, HttpServletRequest request) throws Exception {
			logger.info("철형형수리이력관리 메인");			
			try {
				model.addAttribute("serverDateTo", DateUtil.getDay("yyyy-mm-dd", -6) );
				model.addAttribute("serverDateFrom", DateUtil.getToday("yyyy-mm-dd") );
				
				CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
				
				commonCodeVo.setBaseGroupCd("066"); // 수리상태
				commonCodeVo.setUseYn("001");
				List<CommonCodeAdmVo> repairStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("repairStatus", repairStatusList );
				
				commonCodeVo.setBaseGroupCd("123"); // 설비수리교체점검구분
				commonCodeVo.setUseYn("001");
				repairStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("equipGubun", repairStatusList );
				
				commonCodeVo.setBaseGroupCd("130"); // 금형수리교체점검이력구분
				commonCodeVo.setUseYn("001");
				repairStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
				model.addAttribute("resultQuality", repairStatusList );
				
				String userNm = Utils.getUserNm();
				model.addAttribute("userNm", userNm);
				
			} catch(Exception e) {
				e.printStackTrace();
			}
			return "ml/mlsc0130";
			
		}

	
}
