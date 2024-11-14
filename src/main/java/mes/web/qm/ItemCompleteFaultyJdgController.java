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

import mes.domain.qm.ItemCompleteFaultyJdgAdmVo;
import mes.service.qm.ItemCompleteFaultyJdgService;
import mes.web.ut.Utils;

@Controller
public class ItemCompleteFaultyJdgController {


	private static final Logger logger = LoggerFactory.getLogger(ItemCompleteFaultyJdgController.class);
	
	@Inject
	private ItemCompleteFaultyJdgService itemCompleteFaultyJdgService;
	
	//부적합판정관리 조회
	@RequestMapping(value="qm/itemCompleteFaultyJdgAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemFaultyJdgAdmRead(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("부적합판정관리 목록조회:"+itemCompleteFaultyJdgAdmVo);
			ItemCompleteFaultyJdgAdmVo vo = itemCompleteFaultyJdgService.itemCompleteFaultyJdgAdmRead(itemCompleteFaultyJdgAdmVo);
			if(vo==null) {
				vo = new ItemCompleteFaultyJdgAdmVo();
			}
			jsonData.put("data", vo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
		
		
	//부적합판정관리 등록
	@RequestMapping(value="qm/itemCompleteFaultyJdgAdmCreate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemCompleteFaultyJdgAdmCreate(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("부적합판정관리 등록:"+itemCompleteFaultyJdgAdmVo);
			itemCompleteFaultyJdgAdmVo.setRegId(Utils.getUserId());
			itemCompleteFaultyJdgAdmVo.setApprovalYn("002");
			itemCompleteFaultyJdgService.itemCompleteFaultyJdgAdmCreate(itemCompleteFaultyJdgAdmVo);
			
			//입출고테이블 불량수량 수정
			//itemCompleteFaultyJdgService.updateInOutWhsFaultyQty(itemCompleteFaultyJdgAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	
	//부적합판정관리 수정
	@RequestMapping(value="qm/itemCompleteFaultyJdgAdmUpdate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemFaultyJdgAdmUpdate(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("부적합판정관리 수정:"+itemCompleteFaultyJdgAdmVo);
			
			itemCompleteFaultyJdgAdmVo.setUpdId(Utils.getUserId());
			itemCompleteFaultyJdgService.itemCompleteFaultyJdgAdmUpdate(itemCompleteFaultyJdgAdmVo);

			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//부적합판정관리 승인여부 수정
	@RequestMapping(value="qm/itemCompleteFaultyJdgApproveYnUpdate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemCompleteFaultyJdgApproveYnUpdate(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("부적합판정관리 승인여부 수정:"+itemCompleteFaultyJdgAdmVo);
			itemCompleteFaultyJdgAdmVo.setApprovalYn("001");
			itemCompleteFaultyJdgService.updateApprovalYn(itemCompleteFaultyJdgAdmVo);

			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
}
