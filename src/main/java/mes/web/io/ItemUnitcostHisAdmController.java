package mes.web.io;

import java.util.ArrayList;
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
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.io.ItemUnitcostHisAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.io.ItemUnitcostHisAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ItemUnitcostHisAdmController {

	private static final Logger logger = LoggerFactory.getLogger(ItemUnitcostHisAdmController.class);
	
	@Inject
	private ItemUnitcostHisAdmService itemUnitcostHisAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeService;
	
	// 자재단가이력관리 메인
	@RequestMapping(value = "/iosc0160", method = RequestMethod.GET)
	public String iosc0160(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		List<CommonCodeAdmVo> itemList = commonCodeService.CommonCodeList(commonCodeVo);
		commonCodeVo.setBaseGroupCd("091"); // 제품/상품/재공품
		itemList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("itemGubun", itemList);
		return "io/iosc0160";
	}
	
	//자재단가이력관리 목록조회
	@RequestMapping(value = "io/itemUnitcostHisAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemUnitcostHisAdmList(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재단가이력관리 목록조회 : "+itemUnitcostHisAdmVo);
		try {
			
			List<ItemUnitcostHisAdmVo> itemUnitcostHisAdmList = itemUnitcostHisAdmService.itemUnitcostHisAdmList(itemUnitcostHisAdmVo);
			jsonData.put("data", itemUnitcostHisAdmList);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//자재단가이력관리 목록조회
	@RequestMapping(value = "io/itemUnitcostHisAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemUnitcostHisAdmRead(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("자재단가이력관리 상세조회 : "+itemUnitcostHisAdmVo);
		try {
			List<ItemUnitcostHisAdmVo> list = new ArrayList<ItemUnitcostHisAdmVo>();
			
			if(itemUnitcostHisAdmVo.getPartCd()==null || itemUnitcostHisAdmVo.getPartCd().equals("")) {
				jsonData.put("data", list);
			}else {
				list = itemUnitcostHisAdmService.itemUnitcostHisAdmRead(itemUnitcostHisAdmVo);
				jsonData.put("data", list);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}
