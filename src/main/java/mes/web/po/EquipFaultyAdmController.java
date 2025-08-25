package mes.web.po;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.po.EquipPrcssFaultyAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.po.EquipPrcssFaultyAdmService;
import mes.web.ut.DateUtil;

@Controller
public class EquipFaultyAdmController {
	
	@Inject
	private CommonCodeAdmService systemCommonCodeService;
	@Inject
	private EquipPrcssFaultyAdmService equipRcssFaultyAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(EquipFaultyAdmController.class);
	
	/*
	 * //공정실적관리 불량등록
	 * 
	 * @RequestMapping(value = "/posc0050", method = RequestMethod.GET) public
	 * String posc0050GET(Locale locale, Model model) throws Exception {
	 * 
	 * logger.info("공정실적관리 불량등록 페이지"); CommonCodeAdmVo systemCommonCodeVo = new
	 * CommonCodeAdmVo(); systemCommonCodeVo.setBaseGroupCd("028"); //주야
	 * List<CommonCodeAdmVo> systemCommonCodeList =
	 * systemCommonCodeService.CommonCodeList(systemCommonCodeVo);
	 * model.addAttribute("dayNightCd", systemCommonCodeList );
	 * model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd") );
	 * 
	 * return "po/posc0050"; }
	 */
	
	//공정불량 조회
	@RequestMapping(value = "po/readRcssFaulty", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> readRcssFaultyPOST(EquipPrcssFaultyAdmVo equipPrcssFaultyAdmVo) throws Exception {
			
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정불량 조회");
		logger.info("받은 값 : " + equipPrcssFaultyAdmVo);
		
		try {
			equipPrcssFaultyAdmVo = equipRcssFaultyAdmService.readPrcssFaulty(equipPrcssFaultyAdmVo);
			logger.info("공정불량 조회성공");
			logger.info("공정불량 조회 값 : " + equipPrcssFaultyAdmVo);
			jsonData.put("readData", equipPrcssFaultyAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("공정불량 조회 실패");
			jsonData.put("result", "fail");
		}
		
		return jsonData;
	}
	
	//공정불량 등록
	@RequestMapping(value = "po/insertRcssFaulty", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> insertRcssFaultyPOST(EquipPrcssFaultyAdmVo equipPrcssFaultyAdmVo, HttpServletRequest request) throws Exception {
			
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정불량 등록");
		String regId = (String) request.getSession().getAttribute("userId");
		equipPrcssFaultyAdmVo.setRegId(regId);
		logger.info("로그인 ID : " + regId);
		logger.info("받은 값 : " + equipPrcssFaultyAdmVo);
		
		try {
			equipRcssFaultyAdmService.createPrcssFaulty(equipPrcssFaultyAdmVo);
			logger.info("공정불량 등록 성공");
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("공정불량 등록 실패");
			jsonData.put("result", "fail");
		}
		
		return jsonData;
	}
	
	
	//공정불량 수정
	@RequestMapping(value = "po/updateRcssFaulty", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> updateRcssFaultyPOST(EquipPrcssFaultyAdmVo equipPrcssFaultyAdmVo, HttpServletRequest request) throws Exception {
			
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("공정불량 수정");
		String updId = (String) request.getSession().getAttribute("userId");
		equipPrcssFaultyAdmVo.setRegId(updId);
		logger.info("로그인 ID : " + updId);
		logger.info("받은 값 : " + equipPrcssFaultyAdmVo);
		
		try {
			equipRcssFaultyAdmService.updatePrcssFaulty(equipPrcssFaultyAdmVo);
			logger.info("공정불량 수정 성공");
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("공정불량 수정 실패");
			jsonData.put("result", "fail");
		}
		
		return jsonData;
	}
	

	/*
	 * //해당설비&해당날짜 작업지시 조회
	 * 
	 * @RequestMapping(value = "/po/workOrderDataList123", method =
	 * RequestMethod.GET) public @ResponseBody Map<String, Object>
	 * workOrderPlanListGET213(WorkOrderVo workOrderVo) throws Exception {
	 * Map<String, Object> jsonData = new HashMap<String, Object>();
	 * logger.info("공정실적관리 작업지시목록 조회"); try { List<WorkOrderVo> workOrderData=
	 * workOrderService.workOrderDataList(workOrderVo); jsonData.put("data",
	 * workOrderData); jsonData.put("result", "ok"); } catch (NullPointerException
	 * e) { logger.info("조회된 값이 업습니다."); } catch (Exception
	 * e) { logger.info("최상단 에러 발생 = ");  e.printStackTrace();
	 * } return jsonData; }
	 */

}