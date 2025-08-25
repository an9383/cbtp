package mes.web.tm;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.io.InOutWhsAdmVo;
import mes.domain.po.WorkOrderVo;
import mes.domain.tm.ApproveProcAdmVo;
import mes.service.io.InOutWhsAdmService;
import mes.service.po.WorkOrderService;
import mes.service.tm.ApproveProcAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ApproveProcAdmController {

	@Inject
	private ApproveProcAdmService approveProcAdmService;
	
	@Inject
	private WorkOrderService workOrderService;
	
	@Inject
	private InOutWhsAdmService inOutWhsAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(ApproveProcAdmController.class);

	// pda(승인처리) 메인
	@RequestMapping(value = "/tmsc0130", method = RequestMethod.GET)
	public String tmsc0130(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "tm/tmsc0130";
	}
	
	// pda(수입검사) 메인
	@RequestMapping(value = "/tmsc0140", method = RequestMethod.GET)
	public String tmsc0140(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		return "tm/tmsc0140";
	}
	
	// pda(자재입고) 메인
	@RequestMapping(value = "/tmsc0150", method = RequestMethod.GET)
	public String tmsc0150(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		return "tm/tmsc0150";
	}
	// pda(생산투입) 메인
	@RequestMapping(value = "/tmsc0160", method = RequestMethod.GET)
	public String tmsc0160(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		model.addAttribute("userNm", Utils.getUserNm());
		model.addAttribute("userNumber", Utils.getUserNumber());
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		return "tm/tmsc0160";
	}
	
	// pda(완제품검사) 메인
	@RequestMapping(value = "/tmsc0170", method = RequestMethod.GET)
	public String tmsc0170(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		return "tm/tmsc0170";
	}
	
	// pda(제품출하) 메인
	@RequestMapping(value = "/tmsc0180", method = RequestMethod.GET)
	public String tmsc0180(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		return "tm/tmsc0180";
	}
	
	// pda(영업) 메인
	@RequestMapping(value = "/tmsc0190", method = RequestMethod.GET)
	public String tmsc0190(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		return "tm/tmsc0190";
	}
	
	// pda(구매) 메인
	@RequestMapping(value = "/tmsc0200", method = RequestMethod.GET)
	public String tmsc0200(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		return "tm/tmsc0200";
	}
	
	// pda(품질) 메인
	@RequestMapping(value = "/tmsc0210", method = RequestMethod.GET)
	public String tmsc0210(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		return "tm/tmsc0210";
	}
	
	// pda(생산) 메인
	@RequestMapping(value = "/tmsc0220", method = RequestMethod.GET)
	public String tmsc0220(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		return "tm/tmsc0220";
	}
	
	// pda(재고) 메인
	@RequestMapping(value = "/tmsc0230", method = RequestMethod.GET)
	public String tmsc0230(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		return "tm/tmsc0230";
	}
	
	//승인처리 등록
	@RequestMapping(value = "tm/approveProcAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> approveProcAdmCreate(@RequestBody List<Map<String, Object>> approveProcList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ApproveProcAdmVo approveProcAdmVo = new ApproveProcAdmVo();
		logger.info("승인처리 등록 : "+approveProcAdmVo);
		try {
			approveProcAdmVo.setApGubun(approveProcList.get(0).get("apGubun").toString());
			approveProcAdmVo.setApDate(approveProcList.get(0).get("apDate").toString());
			approveProcAdmVo.setApChargr(approveProcList.get(0).get("apChargr").toString());
			
			
			for(Map<String, Object> m : approveProcList) {
			
				approveProcAdmVo.setApCd(m.get("apCd").toString());
				
				//시퀀스 생성
				String apSeq = approveProcAdmService.getApSeq(approveProcAdmVo);
				approveProcAdmVo.setApQty(Float.parseFloat(m.get("apQty").toString()));
				approveProcAdmVo.setApSeq(apSeq);
				approveProcAdmVo.setSourceNo(m.get("sourceNo").toString());
				approveProcAdmVo.setRegId(Utils.getUserId());
				
				approveProcAdmService.approveProcAdmCreate(approveProcAdmVo);
				
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
			
	//수입검사,자재입고 목록조회
	@RequestMapping(value = "tm/approveProcAdmList1", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> approveProcAdmList1(ApproveProcAdmVo approveProcAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
		
			List<ApproveProcAdmVo> list =  approveProcAdmService.approveProcAdmList1(approveProcAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result","ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//수입검사,자재입고 목록조회
	@RequestMapping(value = "tm/approveProcAdmList2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> approveProcAdmList2(ApproveProcAdmVo approveProcAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
		
			List<ApproveProcAdmVo> list =  approveProcAdmService.approveProcAdmList2(approveProcAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result","ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	
	//수입검사,자재입고 목록조회
	@RequestMapping(value = "tm/approveProcAdmList3", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> approveProcAdmList3(ApproveProcAdmVo approveProcAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
		
			List<ApproveProcAdmVo> list =  approveProcAdmService.approveProcAdmList3(approveProcAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result","ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//수입검사,자재입고 목록조회
	@RequestMapping(value = "tm/approveProcAdmList4", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> approveProcAdmList4(ApproveProcAdmVo approveProcAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
		
			List<ApproveProcAdmVo> list =  approveProcAdmService.approveProcAdmList4(approveProcAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result","ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	
	//수입검사,자재입고 목록조회
	@RequestMapping(value = "tm/approveProcAdmList5", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> approveProcAdmList5(ApproveProcAdmVo approveProcAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
		
			List<ApproveProcAdmVo> list =  approveProcAdmService.approveProcAdmList5(approveProcAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result","ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}
	
	//수입검사,자재입고 목록조회
	@RequestMapping(value = "tm/inOutWhsAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> inOutWhsAdmRead(InOutWhsAdmVo inOutWhsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("승인처리 등록 : "+inOutWhsAdmVo);
		
		try {
			InOutWhsAdmVo vo;
			
			if(inOutWhsAdmVo.getBarcodeNo()!=null && !inOutWhsAdmVo.getBarcodeNo().equals("")) {
				vo = inOutWhsAdmService.inOutWhsAdmRead(inOutWhsAdmVo);
			}else {
				vo = new InOutWhsAdmVo();
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
	
	//완제품검사, 제품입고 목록조회
	@RequestMapping(value = "tm/itemWhsAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemWhsAdmRead( WorkOrderVo workOrderVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("승인처리 등록 : "+workOrderVo);
		
		try {
			WorkOrderVo vo;
			if(workOrderVo.getBarcodeNo()!=null && !workOrderVo.getBarcodeNo().equals("")) {
				vo = workOrderService.completeWorkOrderList(workOrderVo);
			}else {
				vo = new WorkOrderVo();
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
	
	
}
