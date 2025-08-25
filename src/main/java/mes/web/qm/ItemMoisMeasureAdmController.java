package mes.web.qm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.qm.ItemMoisMeasureAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.InspAdmService;
import mes.service.qm.ItemMoisMeasureAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ItemMoisMeasureAdmController {
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private ItemMoisMeasureAdmService itemMoisMeasureAdmService;
	
	@Inject
	private InspAdmService inspAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(ItemMoisMeasureAdmController.class);

	//수분측정 메인
	@RequestMapping(value = "/qmsc0150", method = RequestMethod.GET)
	public String qmsc0150GET(Locale locale, Model model, HttpSession session) throws Exception {
		logger.info("수분측정 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));	
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("072"); // 판정
		List<CommonCodeAdmVo> moisPassList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("moisPass", moisPassList);
		
		commonCodeVo.setBaseGroupCd("131"); // 판정
		List<CommonCodeAdmVo> moisTempList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("moisTemp", moisTempList);
		
		return "qm/qmsc0150";
	}
	
	
	
	//수분측정 목록조회
	@RequestMapping(value = "qm/itemMoisMeasureList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemMoisMeasureList(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수분측정 목록조회 : "+itemMoisMeasureAdmVo);
		try {
			List<ItemMoisMeasureAdmVo> list = itemMoisMeasureAdmService.itemMoisMeasureList(itemMoisMeasureAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//수분측정 상세목록조회
	@RequestMapping(value = "qm/itemMoisMeasureDtlList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemMoisMeasureDtlList(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수분측정 상세목록조회 : "+itemMoisMeasureAdmVo);
		try {
			List<ItemMoisMeasureAdmVo> list = new ArrayList<ItemMoisMeasureAdmVo>();
			if(itemMoisMeasureAdmVo.getWorkOrdNo()!=null && !itemMoisMeasureAdmVo.getWorkOrdNo().equals("")) {
				list = itemMoisMeasureAdmService.itemMoisMeasureDtlList(itemMoisMeasureAdmVo);
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
	
	//수분측정 상세조회
	@RequestMapping(value = "qm/itemMoisMeasureRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemMoisMeasureRead(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수분측정 목록조회 : "+itemMoisMeasureAdmVo);
		try {
			ItemMoisMeasureAdmVo vo = itemMoisMeasureAdmService.itemMoisMeasureRead(itemMoisMeasureAdmVo);
			jsonData.put("data", vo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//수분측정 등록
	@RequestMapping(value = "qm/itemMoisMeasureCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMoisMeasureCreate(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수분측정 등록 : "+itemMoisMeasureAdmVo);
		try {
			itemMoisMeasureAdmVo.setRegId(Utils.getUserId());
			itemMoisMeasureAdmService.itemMoisMeasureCreate(itemMoisMeasureAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//수분측정 수정
	@RequestMapping(value = "qm/itemMoisMeasureUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMoisMeasureUpdate(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수분측정 수정 : "+itemMoisMeasureAdmVo);
		try {
			itemMoisMeasureAdmVo.setUpdId(Utils.getUserId());
			itemMoisMeasureAdmService.itemMoisMeasureUpdate(itemMoisMeasureAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//수분측정 삭제
	@RequestMapping(value = "qm/itemMoisMeasureDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemMoisMeasureDelete(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수분측정 삭제 : "+itemMoisMeasureAdmVo);
		try {
			itemMoisMeasureAdmService.itemMoisMeasureDelete(itemMoisMeasureAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}
