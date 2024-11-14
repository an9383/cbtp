package mes.web.tm;

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
import mes.domain.tm.PartInventoryAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.io.InOutWhsAdmService;
import mes.service.tm.PartInventoryAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class PartInventoryAdmController {

	@Inject
	private InOutWhsAdmService inOutWhsAdmService;
	
	@Inject
	private PartInventoryAdmService partInventoryAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(PartInventoryAdmController.class);
	

	
	//기초재고관리 목록조회
	@RequestMapping(value = "tm/partInventoryAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> partInventoryAdmList(PartInventoryAdmVo partInventoryAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("기초재고관리 목록조회 : "+partInventoryAdmVo);
		try {
		
			List<PartInventoryAdmVo> list = partInventoryAdmService.partInventoryAdmList(partInventoryAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//재고위치 목록조회
	@RequestMapping(value = "tm/partInventoryLocList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> partInventoryLocList(PartInventoryAdmVo partInventoryAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("재고위치 목록조회 : "+partInventoryAdmVo);
		try {
		
			List<PartInventoryAdmVo> list = partInventoryAdmService.partInventoryLocList(partInventoryAdmVo);
			
			if(list==null || list.size()==0) {
				list = new ArrayList<>();
				jsonData.put("data", list);
			}else {
				jsonData.put("data", list);
			}
			
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
