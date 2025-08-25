package mes.web.bs;

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
import mes.domain.bs.DeliveryOrderAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.DealCorpAdmService;
import mes.service.bs.DeliveryOrderAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class DeliveryOrderAdmController {

	private static final Logger logger = LoggerFactory.getLogger(DeliveryOrderAdmController.class);

	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private DeliveryOrderAdmService deliveryOrderAdmService;
	
	@Inject
	private DealCorpAdmService dealCorpAdmService;

	// 출고의뢰등록 메인
	@RequestMapping(value = "/bssc0050", method = RequestMethod.GET)
	public String bssc0050(Locale locale, Model model) throws Exception {
		logger.info("출고의뢰등록 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("061"); //출하상태
		List<CommonCodeAdmVo> doStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("doStatus", doStatusList);
		
		commonCodeVo.setBaseGroupCd("112"); //레이저/후가공
		List<CommonCodeAdmVo> mainGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", mainGubunList);
		
		return "bs/bssc0050";
	}
	

	// 출고외릐현황 메인
	@RequestMapping(value = "/bssc0060", method = RequestMethod.GET)
	public String bssc0060(Locale locale, Model model) throws Exception {
		logger.info("출고의뢰등록 메인");
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));

		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("061"); //출하상태
		List<CommonCodeAdmVo> doStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("doStatus", doStatusList);
		
		commonCodeVo.setBaseGroupCd("112"); //레이저/후가공
		List<CommonCodeAdmVo> mainGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("mainGubun", mainGubunList);
		
		return "bs/bssc0060";
	}
	
	// 영업(미출고현황) 메인
	@RequestMapping(value = "/bssc0090", method = RequestMethod.GET)
	public String bssc0090(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "bs/bssc0090";
	}
		
	//출고의뢰등록 목록조회
	@RequestMapping(value="bs/deliveryOrderAdmList" , method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> deliveryOrderAdmList(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고의뢰등록 목록조회 : "+ deliveryOrderAdmVo);
		try {
			List<DeliveryOrderAdmVo> deliveryOrderAdmList = deliveryOrderAdmService.deliveryOrderAdmList(deliveryOrderAdmVo);
			jsonData.put("data", deliveryOrderAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//출고의뢰등록 등록
	@RequestMapping(value="bs/deliveryOrderAdmIns" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deliveryOrderAdmUpd(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고의뢰등록 등록 : "+ deliveryOrderAdmVo);
		try {
			deliveryOrderAdmVo.setDate(DateUtil.getCurrentYyyymmdd());
			deliveryOrderAdmVo.setDoNo(deliveryOrderAdmService.getDoNo(deliveryOrderAdmVo));
			deliveryOrderAdmVo.setRegId(Utils.getUserNumber());
			deliveryOrderAdmService.deliveryOrderAdmIns(deliveryOrderAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//출고의뢰등록 삭제
	@RequestMapping(value="bs/deliveryOrderAdmDel" , method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> deliveryOrderAdmDel(DeliveryOrderAdmVo deliveryOrderAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("출고의뢰등록 삭제 : "+ deliveryOrderAdmVo);
		try {
			deliveryOrderAdmService.deliveryOrderAdmDel(deliveryOrderAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
}
