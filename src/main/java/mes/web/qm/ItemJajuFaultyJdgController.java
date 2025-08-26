package mes.web.qm;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.qm.ItemJajuFaultyJdgAdmVo;
import mes.service.qm.ItemJajuFaultyJdgService;
import mes.web.io.InOutWhsAdmController;
import mes.web.ut.Utils;

@Controller
public class ItemJajuFaultyJdgController {

	private static final Logger logger = LoggerFactory.getLogger(InOutWhsAdmController.class);

	@Inject
	private ItemJajuFaultyJdgService itemJajuFaultyJdgService;
	
	//부적합 판정관리 상세조회
	@RequestMapping(value = "qm/itemJajuFaultyJdgAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemJajuFaultyJdgAdmRead(ItemJajuFaultyJdgAdmVo itemJajuFaultyJdgAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합 판정관리 상세조회 : "+itemJajuFaultyJdgAdmVo);
		try {
			
			ItemJajuFaultyJdgAdmVo vo = itemJajuFaultyJdgService.itemJajuFaultyJdgAdmRead(itemJajuFaultyJdgAdmVo);
			if(vo==null) {
				vo = new ItemJajuFaultyJdgAdmVo();
			}
			
			jsonData.put("data", vo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//부적합 판정관리 등록
	@RequestMapping(value = "qm/itemJajuFaultyJdgAdmCreate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemJajuFaultyJdgAdmCreate(ItemJajuFaultyJdgAdmVo itemJajuFaultyJdgAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합 판정관리 등록: "+itemJajuFaultyJdgAdmVo);
		try {
			
			itemJajuFaultyJdgAdmVo.setRegId(Utils.getUserId());
			itemJajuFaultyJdgService.itemJajuFaultyJdgAdmCreate(itemJajuFaultyJdgAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//부적합 판정관리 수정
	@RequestMapping(value = "qm/itemJajuFaultyJdgAdmUpdate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemJajuFaultyJdgAdmUpdate(ItemJajuFaultyJdgAdmVo itemJajuFaultyJdgAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("부적합 판정관리 수정: "+itemJajuFaultyJdgAdmVo);
		try {
			
			itemJajuFaultyJdgAdmVo.setUpdId(Utils.getUserId());
			itemJajuFaultyJdgService.itemJajuFaultyJdgAdmUpdate(itemJajuFaultyJdgAdmVo);
			
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
