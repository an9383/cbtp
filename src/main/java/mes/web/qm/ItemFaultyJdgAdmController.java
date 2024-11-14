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

import mes.domain.qm.ItemFaultyJdgAdmVo;
import mes.service.qm.ItemFaultyJdgAdmService;
import mes.web.ut.Utils;

@Controller
public class ItemFaultyJdgAdmController {


	private static final Logger logger = LoggerFactory.getLogger(ItemFaultyJdgAdmController.class);
	
	@Inject
	private ItemFaultyJdgAdmService itemFaultyJdgAdmService;
	
	//부적합판정관리 조회
	@RequestMapping(value="qm/itemFaultyJdgAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemFaultyJdgAdmRead(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("부적합판정관리 목록조회:"+itemFaultyJdgAdmVo);
			ItemFaultyJdgAdmVo vo = itemFaultyJdgAdmService.itemFaultyJdgAdmRead(itemFaultyJdgAdmVo);
			if(vo==null) {
				vo = new ItemFaultyJdgAdmVo();
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
	@RequestMapping(value="qm/itemFaultyJdgAdmCreate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemFaultyJdgAdmCreate(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("부적합판정관리 등록:"+itemFaultyJdgAdmVo);
			itemFaultyJdgAdmVo.setRegId(Utils.getUserId());
			itemFaultyJdgAdmVo.setApprovalYn("002");
			itemFaultyJdgAdmService.itemFaultyJdgAdmCreate(itemFaultyJdgAdmVo);
			
			//입출고테이블 불량수량 수정
			//itemFaultyJdgAdmService.updateInOutWhsFaultyQty(itemFaultyJdgAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	
	//부적합판정관리 수정
	@RequestMapping(value="qm/itemFaultyJdgAdmUpdate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemFaultyJdgAdmUpdate(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("부적합판정관리 수정:"+itemFaultyJdgAdmVo);
			
			ItemFaultyJdgAdmVo vo = itemFaultyJdgAdmService.getInWhsQty(itemFaultyJdgAdmVo);
			float inWhsQty = Float.parseFloat(vo.getInWhsQty().toString());
			float preInWhsQty = Float.parseFloat(vo.getPreInWhsQty().toString());
			float faultyCnt = Float.parseFloat(itemFaultyJdgAdmVo.getFaultyCnt().toString());
			
			logger.info("가입고수량:"+preInWhsQty);
			logger.info("입고수량:"+inWhsQty);
			logger.info("입력한 불량수량:"+faultyCnt);
			
			if((inWhsQty+faultyCnt)<=preInWhsQty) {
				itemFaultyJdgAdmVo.setUpdId(Utils.getUserId());
				itemFaultyJdgAdmService.itemFaultyJdgAdmUpdate(itemFaultyJdgAdmVo);
				
				jsonData.put("result", "ok");
			}else {
				jsonData.put("result", "excess");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//부적합판정관리 승인여부 수정
	@RequestMapping(value="qm/itemFaultyJdgApproveYnUpdate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemFaultyJdgApproveYnUpdate(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("부적합판정관리 승인여부:"+itemFaultyJdgAdmVo);
			
			itemFaultyJdgAdmVo.setApprovalYn("001");
			itemFaultyJdgAdmService.updateApprovalYn(itemFaultyJdgAdmVo);
			
			//입출고TB 수정
			itemFaultyJdgAdmService.updateInOutWhsFaultyQty(itemFaultyJdgAdmVo);	
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	
}
