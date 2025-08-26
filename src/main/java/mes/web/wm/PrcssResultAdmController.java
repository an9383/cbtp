package mes.web.wm;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.ItemPartAdmVo;
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.io.ItemUnitcostHisAdmVo;
import mes.domain.wm.DailyWorkPlanAdmVo;
import mes.domain.wm.PrcssResultAdmVo;
import mes.service.wm.DailyWorkPlanAdmService;
import mes.service.wm.PrcssResultAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class PrcssResultAdmController {
	
private static final Logger logger = LoggerFactory.getLogger(PrcssResultAdmController.class);

	@Inject
	private PrcssResultAdmService prcssResultAdmService;
	
	//Read
	@RequestMapping(value="wm/prcssResultAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prcssResultAdmRead(PrcssResultAdmVo prcssResultAdmVo) throws Exception{
	    Map<String, Object> jsonData = new HashMap<String, Object>();
	    try {
	        prcssResultAdmVo = prcssResultAdmService.prcssResultAdmRead(prcssResultAdmVo);
	        jsonData.put("data", prcssResultAdmVo);
	        jsonData.put("result", "ok");
	    } catch (Exception e) {
	        e.printStackTrace();
	        jsonData.put("result", "error");
	        jsonData.put("message", Utils.getErrorMessage());
	    }
	    return jsonData;
	}
	
	//Create or Update
	@RequestMapping(value="wm/prcssResultAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> prcssResultAdmCreate(PrcssResultAdmVo prcssResultAdmVo) throws Exception{
	    Map<String, Object> jsonData = new HashMap<String, Object>();
	    try {
	    	if (prcssResultAdmService.prcssResultAdmRead(prcssResultAdmVo) == null) {
	    		prcssResultAdmVo.setRegId(Utils.getUserNumber());
		        prcssResultAdmService.prcssResultAdmCreate(prcssResultAdmVo);
		        jsonData.put("message", "등록되었습니다.");
	    	} else {
	    		prcssResultAdmVo.setUpdId(Utils.getUserNumber());
		        prcssResultAdmService.prcssResultAdmUpdate(prcssResultAdmVo);
		        jsonData.put("message", "수정되었습니다.");
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
