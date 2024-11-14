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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.io.SpareInOutWhsAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.io.SpareInOutWhsAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class SpareInOutWhsAdmController {
	
	@Inject
	private SpareInOutWhsAdmService spareInOutWhsAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeService;

	private static final Logger logger = LoggerFactory.getLogger(SpareInOutWhsAdmController.class);

	//스페어관리
	@RequestMapping(value = "/posc0030", method = RequestMethod.GET)
	public String bmsc0170(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		commonCodeVo.setBaseGroupCd("112"); // 구분(사출/봉제)
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> itemList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", itemList);
		
		return "po/posc0030";
	}
	
	//스페어관리 조회
	@RequestMapping(value="po/spareItemInfoList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> spareItemInfoList(SpareInOutWhsAdmVo vo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			List<SpareInOutWhsAdmVo> list = spareInOutWhsAdmService.spareItemInfoList(vo);
			
			jsonData.put("result", "ok");
			jsonData.put("data", list);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//스페어관리 조회
	@RequestMapping(value="po/spareInOutWhsList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> spareInOutWhsList(SpareInOutWhsAdmVo vo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			List<SpareInOutWhsAdmVo> list = new ArrayList<SpareInOutWhsAdmVo>();
			if(vo.getItemSeq()!=null && !vo.getItemSeq().equals("")) {
				list = spareInOutWhsAdmService.spareInOutWhsList(vo);
			}
			
			jsonData.put("result", "ok");
			jsonData.put("data", list);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	
	//스페어관리 등록
	@RequestMapping(value="po/spareInOutWhsCreate" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> spareInOutWhsCreate(@RequestBody List<Map<String, Object>> list) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		SpareInOutWhsAdmVo vo = new SpareInOutWhsAdmVo();
		try {

			vo.setToday(DateUtil.getToday("yyyymmdd"));
			vo.setSpaIoNo(spareInOutWhsAdmService.getSpaIoNo(vo));
			
			for(Map<String, Object> m :list) {
				vo.setSpaIoSeq(Integer.toString(spareInOutWhsAdmService.getSpaIoSeq(vo)));
				vo.setItemSeq(m.get("itemSeq").toString());
				vo.setBarcodeNo(m.get("barcodeNo").toString());
				vo.setSpaIoGubun(m.get("spaIoGubun").toString());
				vo.setSpaIoDate(m.get("spaIoDate").toString());
				vo.setSpaIoQty(m.get("spaIoQty").toString());
				vo.setRegId(Utils.getUserNumber());
				spareInOutWhsAdmService.spareInOutWhsCreate(vo);
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
			}
			
			return jsonData;
	}
	
	
	//스페어 현재고 가져오기
	@RequestMapping(value="po/getTmQtyRead" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getTmQtyRead(SpareInOutWhsAdmVo vo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			SpareInOutWhsAdmVo data = spareInOutWhsAdmService.getTmQtyRead(vo);
			
			jsonData.put("result", "ok");
			jsonData.put("data", data);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	
	//스페어 삭제
	@RequestMapping(value="po/spareInOutWhsDelete" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> spareInOutWhsDelete(SpareInOutWhsAdmVo vo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			spareInOutWhsAdmService.spareInOutWhsDelete(vo);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	
}
