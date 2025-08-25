package mes.web.mt;

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

import mes.domain.mt.ProdTargetVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.mt.ProdTargetService;

@Controller
public class ProdTargetController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProdTargetController.class);
	
	@Inject
	private ProdTargetService prodTargetService;
	@Inject
	private CommonCodeAdmService commonCodeAdmService;

	// 생산목표대비실적(레이저) 페이지
	@RequestMapping(value = "/mtsc1020", method = RequestMethod.GET)
	public String mtsc1020(Locale locale, Model model) throws Exception {
		try {
			logger.info("생산목표대비실적(레이저)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc1020";
	}

	// 생산목표대비실적(후가공) 페이지
	@RequestMapping(value = "/mtsc2020", method = RequestMethod.GET)
	public String mtsc2020(Locale locale, Model model) throws Exception {
		try {
			logger.info("생산목표대비실적(후가공)");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "mt/mtsc2020";
	}
	
	// 생산목표대비실적(레이저) 리스트
	@RequestMapping(value = "mt/prodTargetTotalList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prodTargetTotalList(ProdTargetVo prodTargetVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ProdTargetVo> prodTargetList = prodTargetService.prodTargetTotalList(prodTargetVo);
			jsonData.put("data", prodTargetList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 생산목표대비실적(후가공) 리스트
	@RequestMapping(value = "mt/prodTargetFinishList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prodTargetFinishList(ProdTargetVo prodTargetVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ProdTargetVo> prodTargetFinishList = prodTargetService.prodTargetFinishList(prodTargetVo);
			jsonData.put("data", prodTargetFinishList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
}