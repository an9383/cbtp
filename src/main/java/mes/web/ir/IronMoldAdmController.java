package mes.web.ir;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.ir.IronMoldAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.ir.IronMoldAdmService;
import mes.web.ut.Utils;

@Controller
public class IronMoldAdmController {

	private static final Logger logger = LoggerFactory.getLogger(IronMoldAdmController.class);
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private IronMoldAdmService ironMoldAdmService;
	
	//철형타수이력 메인
	@RequestMapping(value = "/irsc0010", method = RequestMethod.GET)
	public String irsc0010(Locale locale, Model model) throws Exception {
		logger.info("철형타수이력 메인");
		try {
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("095"); // 상태
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> equipCodeList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("stateCd", equipCodeList);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "ir/irsc0010";
	}
	
	//철형타수이력 목록조회
	@RequestMapping(value = "/ir/ironShotList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> ironShotList(IronMoldAdmVo ironMoldAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("철형타수이력 목록조회 : " + ironMoldAdmVo);
		try {
			List<IronMoldAdmVo> ironShotList = ironMoldAdmService.ironShotList(ironMoldAdmVo);
			jsonData.put("data", ironShotList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//철형타수이력 일 조회
	@RequestMapping(value = "/ir/ironDayList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> ironDayList(IronMoldAdmVo ironMoldAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("철형타수이력 일 조회 : " + ironMoldAdmVo);
		try {
			List<IronMoldAdmVo> ironDayList = ironMoldAdmService.ironDayList(ironMoldAdmVo);
			jsonData.put("data", ironDayList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//철형타수이력 월 조회
	@RequestMapping(value = "/ir/ironMonthList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> ironMonthList(IronMoldAdmVo ironMoldAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("철형타수이력 월 조회 : " + ironMoldAdmVo);
		try {
			List<IronMoldAdmVo> ironMonthList = ironMoldAdmService.ironMonthList(ironMoldAdmVo);
			jsonData.put("data", ironMonthList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//철형타수이력 년 조회
	@RequestMapping(value = "/ir/ironYearList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> ironYearList(IronMoldAdmVo ironMoldAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("철형타수이력 년 조회 : " + ironMoldAdmVo);
		try {
			List<IronMoldAdmVo> ironYearList = ironMoldAdmService.ironYearList(ironMoldAdmVo);
			jsonData.put("data", ironYearList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
}
