package mes.web.qm;

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
import mes.domain.qm.ItemJajuFaultyVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.qm.ItemJajuFaultyService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ItemJajuFaultyController {

	@Inject
	private static final Logger logger = LoggerFactory.getLogger(ItemJajuFaultyController.class);
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private ItemJajuFaultyService itemJajuFaultyService;
	
	// 부적합관리(자주검사) 메인
	@RequestMapping(value = "/qmsc0050", method = RequestMethod.GET)
	public String qmsc0050(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("003"); // 사용여부
		List<CommonCodeAdmVo> admDeptList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("admDept", admDeptList);
		
		commonCodeVo.setBaseGroupCd("076"); // 사용여부
		List<CommonCodeAdmVo> faultyPcsList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("faultyPcs", faultyPcsList);
		return "qm/qmsc0050";
	}
	
	//부적합관리 목록조회
	@RequestMapping(value = "qm/itemJajuFaultyList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemJajuFaultyList(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리 목록조회 : "+itemJajuFaultyVo);
		try {
			
			List<ItemJajuFaultyVo> itemJajuFaultyList = itemJajuFaultyService.itemJajuFaultyList(itemJajuFaultyVo);
			//List<String> faultyTypeList = itemJajuFaultyService.getFaultyTypeCd(itemJajuFaultyVo);
			//logger.info(""+faultyTypeList);
			jsonData.put("data", itemJajuFaultyList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	
	//부적합관리 디테일 조회
	@RequestMapping(value = "qm/itemJajuFaultyDetailList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemJajuFaultyDetailList(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리 디테일 조회: "+itemJajuFaultyVo);
		try {
			
			List<ItemJajuFaultyVo> itemJajuFaultyDetailList = itemJajuFaultyService.itemJajuFaultyDetailList(itemJajuFaultyVo);
			
			if(itemJajuFaultyDetailList==null || itemJajuFaultyDetailList.size()==0){
				itemJajuFaultyDetailList = new ArrayList<ItemJajuFaultyVo>();
			}
			
			jsonData.put("data", itemJajuFaultyDetailList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	
	//부적합관리 목록조회
	@RequestMapping(value = "qm/itemJajuFaultyRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemJajuFaultyRead(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리 상세조회 : "+itemJajuFaultyVo);
		try {
			
			ItemJajuFaultyVo itemJajuFaultyRead = itemJajuFaultyService.itemJajuFaultyRead(itemJajuFaultyVo);
			if(itemJajuFaultyRead==null) {
				itemJajuFaultyRead = new ItemJajuFaultyVo();
			}
			
			/*
			 * StringBuffer faultyTypeData = new StringBuffer(); List<String> list =
			 * itemJajuFaultyService.getFaultyTypeCd(itemJajuFaultyVo); for(int i=0;
			 * i<list.size(); i++) { if(list.size()-1!=i) {
			 * faultyTypeData.append(list.get(i)+" , "); }else {
			 * faultyTypeData.append(list.get(i)); } }
			 */
			
			//jsonData.put("faultyType", faultyTypeData);
			jsonData.put("data", itemJajuFaultyRead);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//부적합관리 등록
	@RequestMapping(value = "qm/itemJajuFaultyCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemJajuFaultyCreate( ItemJajuFaultyVo itemJajuFaultyVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리 등록: "+itemJajuFaultyVo);
		try {
			
			itemJajuFaultyVo.setRegId(Utils.getUserId());
			itemJajuFaultyService.itemJajuFaultyCreate(itemJajuFaultyVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//부적합관리 수정
	@RequestMapping(value = "qm/itemJajuFaultyUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemJajuFaultyUpdate( ItemJajuFaultyVo itemJajuFaultyVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합관리 수정: "+itemJajuFaultyVo);
		try {
			
			itemJajuFaultyVo.setUpdId(Utils.getUserId());
			itemJajuFaultyService.itemJajuFaultyUpdate(itemJajuFaultyVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
		
}
