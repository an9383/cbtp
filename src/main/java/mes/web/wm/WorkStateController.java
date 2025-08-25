package mes.web.wm;

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

import mes.domain.bm.BaseInfoAdmVo;
import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.tm.StockPaymentAdmVo;
import mes.domain.wm.WorkStateVo;
import mes.service.bm.BaseInfoAdmService;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.EquipCodeAdmService;
import mes.service.bm.ItemPartAdmService;
import mes.service.wm.WorkStateService;
import mes.web.ut.Utils;

@Controller
public class WorkStateController {

	private static final Logger logger = LoggerFactory.getLogger(WorkStateController.class);

	@Inject
	private ItemPartAdmService itemPartAdmService;
	@Inject
	private EquipCodeAdmService equipCodeAdmService;
	@Inject
	private CommonCodeAdmService commonCodeService;
	@Inject
	private WorkStateService workStateService;
	@Inject
	private BaseInfoAdmService baseInfoAdmService;

	// ========================================== 기간별 생산 현황
	// ==========================================
	// 기간별 생산 현황(레이저) 메인
	@RequestMapping(value = "/wmsc0220", method = RequestMethod.GET)
	public String wmsc0220(Locale locale, Model model) throws Exception {

		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setMainGubun("001");
		itemPartAdmVo.setItemGubun("001");
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);

		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001"); // 설비
		equipCodeAdmVo.setPrcNm("002");

		List<EquipCodeAdmVo> EquipCodeAdmVoList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", EquipCodeAdmVoList);

		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo();
		baseInfoAdmVo.setBaseInfoGubun("003");
		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		model.addAttribute("baseInfoAdmList", baseInfoAdmList); // 공정불량유형
		model.addAttribute("baseInfoAdmListLength", baseInfoAdmList.size() + 1); // 공정불량유형

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("115"); // 비가동구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> commonCodeVoList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("noGubun", commonCodeVoList);
		model.addAttribute("noGubunLength", commonCodeVoList.size() + 1);

		return "wm/wmsc0220";
	}

	// 기간별 생산 현황(후가공) 메인
	@RequestMapping(value = "/wmsc0290", method = RequestMethod.GET)
	public String wmsc0290(Locale locale, Model model) throws Exception {

		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setMainGubun("001");
		itemPartAdmVo.setItemGubun("001");
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);

		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001"); // 설비
		equipCodeAdmVo.setPrcNm("002");

		List<EquipCodeAdmVo> EquipCodeAdmVoList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", EquipCodeAdmVoList);

		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo();
		baseInfoAdmVo.setBaseInfoGubun("003");
		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		model.addAttribute("baseInfoAdmList", baseInfoAdmList); // 공정불량유형
		model.addAttribute("baseInfoAdmListLength", baseInfoAdmList.size() + 1); // 공정불량유형

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("115"); // 비가동구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> commonCodeVoList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("noGubun", commonCodeVoList);
		model.addAttribute("noGubunLength", commonCodeVoList.size() + 1);

		return "wm/wmsc0290";
	}

	// 기간별 생산 현황(정밀가공) 메인
	@RequestMapping(value = "/wmsc0440", method = RequestMethod.GET)
	public String wmsc0440(Locale locale, Model model) throws Exception {

		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setMainGubun("001");
		itemPartAdmVo.setItemGubun("001");
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);

		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001"); // 설비
		equipCodeAdmVo.setPrcNm("002");

		List<EquipCodeAdmVo> EquipCodeAdmVoList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", EquipCodeAdmVoList);

		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo();
		baseInfoAdmVo.setBaseInfoGubun("003");
		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		model.addAttribute("baseInfoAdmList", baseInfoAdmList); // 공정불량유형
		model.addAttribute("baseInfoAdmListLength", baseInfoAdmList.size() + 1); // 공정불량유형

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("115"); // 비가동구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> commonCodeVoList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("noGubun", commonCodeVoList);
		model.addAttribute("noGubunLength", commonCodeVoList.size() + 1);

		return "wm/wmsc0440";
	}

	// 기간별 생산 현황(봉제) 메인
	@RequestMapping(value = "/wmsc0221", method = RequestMethod.GET)
	public String wmsc0221(Locale locale, Model model) throws Exception {

		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setMainGubun("002");
		itemPartAdmVo.setItemGubun("001");
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);

		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001");
		equipCodeAdmVo.setPrcNm("001");
		List<EquipCodeAdmVo> EquipCodeAdmVoList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", EquipCodeAdmVoList);

		BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo();
		baseInfoAdmVo.setBaseInfoGubun("003");
		List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);
		model.addAttribute("baseInfoAdmList", baseInfoAdmList); // 공정불량유형
		model.addAttribute("baseInfoAdmListLength", baseInfoAdmList.size() + 1); // 공정불량유형

		return "wm/wmsc0221";
	}

	// 기간별 생산 현황 목록조회(사출)
	@RequestMapping(value = "wm/workList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workList(WorkStateVo workStateVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("기간별 생산 현황(사출) 목록조회 : " + workStateVo);
		try {
			BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo();
			baseInfoAdmVo.setBaseInfoGubun("003");
			List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);

			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			commonCodeVo.setBaseGroupCd("115"); // 비가동구분
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> commonCodeVoList = commonCodeService.CommonCodeList(commonCodeVo);

			String[] faultyTypeQtyList = new String[baseInfoAdmList.size()];
			String[] noTimeList = new String[commonCodeVoList.size()];

			for (int i = 0; i < baseInfoAdmList.size(); i++) {
				faultyTypeQtyList[i] = baseInfoAdmList.get(i).getBaseInfoCd();
			}

			for (int i = 0; i < commonCodeVoList.size(); i++) {
				noTimeList[i] = commonCodeVoList.get(i).getBaseCd();
			}

			workStateVo.setFaultyTypeQtyList(faultyTypeQtyList);
			workStateVo.setNoTimeList(noTimeList);

			List<WorkStateVo> list = workStateService.workList(workStateVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	@RequestMapping(value = "wm/workListByBongjae", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workListByBongjae(WorkStateVo workStateVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("기간별 생산 현황(봉제) 목록조회 : " + workStateVo);
		try {
			BaseInfoAdmVo baseInfoAdmVo = new BaseInfoAdmVo();
			baseInfoAdmVo.setBaseInfoGubun("003");
			List<BaseInfoAdmVo> baseInfoAdmList = baseInfoAdmService.baseInfoFtList(baseInfoAdmVo);

			String[] faultyTypeQtyList = new String[baseInfoAdmList.size()];

			for (int i = 0; i < baseInfoAdmList.size(); i++) {
				faultyTypeQtyList[i] = baseInfoAdmList.get(i).getBaseInfoCd();
			}

			workStateVo.setFaultyTypeQtyList(faultyTypeQtyList);

			List<WorkStateVo> list = workStateService.workListByBongjae(workStateVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// ========================================== 기간별 자재사용 현황
	// ==========================================
	// 기간별 자재사용(레이저) 현황 메인
	@RequestMapping(value = "/wmsc0230", method = RequestMethod.GET)
	public String wmsc0230(Locale locale, Model model) throws Exception {
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setItemGubun("001");
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);

		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001");
		List<EquipCodeAdmVo> EquipCodeAdmVoList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", EquipCodeAdmVoList);

		return "wm/wmsc0230";
	}

	// 기간별 자재사용(후가공) 현황 메인
	@RequestMapping(value = "/wmsc0300", method = RequestMethod.GET)
	public String wmsc0300(Locale locale, Model model) throws Exception {
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setItemGubun("001");
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);

		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001");
		List<EquipCodeAdmVo> EquipCodeAdmVoList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", EquipCodeAdmVoList);

		return "wm/wmsc0300";
	}

	// 기간별 자재사용(정밀가공) 현황 메인
	@RequestMapping(value = "/wmsc0450", method = RequestMethod.GET)
	public String wmsc0450(Locale locale, Model model) throws Exception {
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setItemGubun("001");
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);

		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001");
		List<EquipCodeAdmVo> EquipCodeAdmVoList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", EquipCodeAdmVoList);

		return "wm/wmsc0450";
	}

	// 기간별 자재사용 현황 목록조회
	@RequestMapping(value = "wm/materialList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> materialList(WorkStateVo workStateVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("기간별 자재사용 현황 목록조회 : " + workStateVo);
		try {
			List<WorkStateVo> list = workStateService.materialList(workStateVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// ========================================== 기간별 비가동 현황
	// ==========================================
	// 설비가동율현황 메인
	@RequestMapping(value = "/mmsc0230", method = RequestMethod.GET)
	public String mmsc0230(Locale locale, Model model) throws Exception {
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setItemGubun("001");
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);

		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001");
		List<EquipCodeAdmVo> EquipCodeAdmVoList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", EquipCodeAdmVoList);

		return "mm/mmsc0230";
	}

	// 설비가동율관리 메인
	@RequestMapping(value = "/wmsc0260", method = RequestMethod.GET)
	public String wmsc0260(Locale locale, Model model) throws Exception {
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setItemGubun("001");
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);

		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001");
		List<EquipCodeAdmVo> EquipCodeAdmVoList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", EquipCodeAdmVoList);

		return "wm/wmsc0260";
	}

	// 기간별 비가동 현황 목록조회
	@RequestMapping(value = "wm/uptimeList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> uptimeList(WorkStateVo workStateVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("기간별 비가동 현황 목록조회 : " + workStateVo);
		try {
			List<WorkStateVo> list = workStateService.uptimeList(workStateVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 기간별 비가동(레이저) 현황 메인
	@RequestMapping(value = "/wmsc0240", method = RequestMethod.GET)
	public String wmsc0240(Locale locale, Model model) throws Exception {
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setItemGubun("001");
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);

		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001");
		List<EquipCodeAdmVo> EquipCodeAdmVoList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", EquipCodeAdmVoList);

		return "wm/wmsc0240";
	}

	// 기간별 비가동(후가공) 현황 메인
	@RequestMapping(value = "/wmsc0310", method = RequestMethod.GET)
	public String wmsc0310(Locale locale, Model model) throws Exception {
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setItemGubun("001");
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);

		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001");
		List<EquipCodeAdmVo> EquipCodeAdmVoList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", EquipCodeAdmVoList);

		return "wm/wmsc0310";
	}
	
	// 기간별 비가동(정밀가공) 현황 메인
	@RequestMapping(value = "/wmsc0460", method = RequestMethod.GET)
	public String wmsc0460(Locale locale, Model model) throws Exception {
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setItemGubun("001");
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);

		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001");
		List<EquipCodeAdmVo> EquipCodeAdmVoList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", EquipCodeAdmVoList);

		return "wm/wmsc0460";
	}

	// 기간별 비가동 현황 목록조회
	@RequestMapping(value = "wm/downtimeList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> downtimeList(WorkStateVo workStateVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("기간별 비가동 현황 목록조회 : " + workStateVo);
		try {
			List<WorkStateVo> list = workStateService.downtimeList(workStateVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// ========================================== 기간별 작업조건 현황
	// ==========================================
	// 기간별 작업조건 현황 메인
	@RequestMapping(value = "/wmsc0250", method = RequestMethod.GET)
	public String wmsc0250(Locale locale, Model model) throws Exception {
		ItemPartAdmVo itemPartAdmVo = new ItemPartAdmVo();
		itemPartAdmVo.setItemGubun("001");
		List<ItemPartAdmVo> ItemPartAdmVoList = itemPartAdmService.itemPartAdmList(itemPartAdmVo);
		model.addAttribute("itemList", ItemPartAdmVoList);

		EquipCodeAdmVo equipCodeAdmVo = new EquipCodeAdmVo();
		equipCodeAdmVo.setMainGubun("001");
		List<EquipCodeAdmVo> EquipCodeAdmVoList = equipCodeAdmService.equipCodeAdmList(equipCodeAdmVo);
		model.addAttribute("equipList", EquipCodeAdmVoList);

		return "wm/wmsc0250";
	}

	// 기간별 작업조건 현황 목록조회
	@RequestMapping(value = "wm/workConditionList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> workConditionList(WorkStateVo workStateVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("기간별 작업조건 현황 목록조회 : " + workStateVo);
		try {
			List<WorkStateVo> list = workStateService.workConditionList(workStateVo);
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
