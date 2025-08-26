package mes.web.home;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import mes.domain.bm.CommonCodeAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class HomeController {
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;


	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// home
	@RequestMapping(value = {"/",""}, method = RequestMethod.GET)
	public ModelAndView root(ModelAndView mav, HttpServletRequest request) {
		String userAgent = request.getHeader("user-agent");
		logger.info("userAgent(PDA확인하기) : " + userAgent);
		if (userAgent.indexOf("iPhone") != -1 || userAgent.indexOf("iPad") != -1 || userAgent.indexOf("Android") != -1 || userAgent.indexOf("BlackBerry") != -1 || userAgent.indexOf("symbian") != -1 || userAgent.indexOf("sony") != -1 || userAgent.indexOf("Mobile") != -1) {
			logger.info("Mobile 접속 tmsc0100(PDA Main)으로 이동");
			mav.setViewName("redirect:/tmsc0100");
		} else {
			logger.info("PC 접속 main으로 이동");
			mav.setViewName("redirect:/main");
		}
		return mav;
	}
	
	//모바일 권한없음 PDA 메인
	@RequestMapping(value = "/mainPDA", method = RequestMethod.GET)
	public String mainPDA (Locale locale, Model model) throws Exception {
		
		logger.info("mainPDA 페이지");

		return "cm/mainPDA";
	}

	// dashboard
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView dashboard(ModelAndView mav) {
		mav.setViewName("home/dashboard");
		return mav;
	}

	// commingsoon
	@RequestMapping(value = "/commingsoon", method = RequestMethod.GET)
	public ModelAndView commingsoon(ModelAndView mav) {
		mav.setViewName("etc/commingsoon");
		return mav;
	}

	// default
	@RequestMapping(value = "/defaultpage", method = RequestMethod.GET)
	public ModelAndView defaultpage(ModelAndView mav) {
		mav.setViewName("etc/defaultpage");
		return mav;
	}

	// pagesidebar
	@RequestMapping(value = "/pagesidebar", method = RequestMethod.GET)
	public ModelAndView pagesidebar(ModelAndView mav) {
		mav.setViewName("etc/pagesidebar");
		return mav;
	}

	// eaars
	@RequestMapping(value = "/eaars", method = RequestMethod.GET)
	public ModelAndView eaars(ModelAndView mav) {
		mav.setViewName("etc/eaars");
		return mav;
	}

	// attend
	@RequestMapping(value = "/attend", method = RequestMethod.GET)
	public ModelAndView attend(ModelAndView mav) {
		mav.setViewName("etc/attend");
		return mav;
	}
	
	
	
	
	
	

	/*---------------------------------------- 테스트 페이지 ----------------------------------------*/
	@RequestMapping(value = "/test_bm_011", method = RequestMethod.GET)
	public ModelAndView test_bm_011(ModelAndView mav) {
		mav.setViewName("testPage/test_bm_011");
		return mav;
	}
	
	@RequestMapping(value = "/test_bm_011_1", method = RequestMethod.GET)
	public ModelAndView test_bm_011_1(ModelAndView mav) {
		mav.setViewName("testPage/test_bm_011_1");
		return mav;
	}
	
	@RequestMapping(value = "/test_basiclayout_011", method = RequestMethod.GET)
	public ModelAndView test_basiclayout_011(ModelAndView mav) {
		mav.setViewName("testPage/test_basiclayout_011");
		return mav;
	}
	
	@RequestMapping(value = "/test_basiclayout_011_1", method = RequestMethod.GET)
	public ModelAndView test_basiclayout_011_1(ModelAndView mav) {
		mav.setViewName("testPage/test_basiclayout_011_1");
		return mav;
	}
	
	@RequestMapping(value = "/test_basiclayout_009", method = RequestMethod.GET)
	public ModelAndView test_basiclayout_009(ModelAndView mav) {
		mav.setViewName("testPage/test_basiclayout_009");
		return mav;
	}
	
	@RequestMapping(value = "/test_bm_009(tab)", method = RequestMethod.GET)
	public ModelAndView test_bm_009 (ModelAndView mav) {
		mav.setViewName("testPage/test_bm_009(tab)");
		return mav;
	}
	
	
	/*---------------------------20200907 생성 :  준비중으로 이동---------------------------*/
	
	
	@RequestMapping(value = "/notPage", method = RequestMethod.GET)
	public ModelAndView notPage (ModelAndView mav) {
		mav.setViewName("cm/notPage");
		return mav;
	}
	
	// 모니터링(재고현황) 메인
	@RequestMapping(value = "/smsc0070", method = RequestMethod.GET)
	public String smsc0070(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "sm/smsc0070";
	}
	
	// 모니터링(재고현황) 메인
	@RequestMapping(value = "/cmsc0010", method = RequestMethod.GET)
	public String cmsc0010(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "cm/cmsc0010";
	}
	
	// 설비관리(설비등록) 메인
	@RequestMapping(value = "/emsc0010", method = RequestMethod.GET)
	public String emsc0010(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "em/emsc0010";
	}
	
	
	// 설비관리(설비등록) 메인
	@RequestMapping(value = "/emsc0050", method = RequestMethod.GET)
	public String emsc0050(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "em/emsc0050";
	}


	// 품질관리(불량집계현황) 메인
	@RequestMapping(value = "/qmsc0070", method = RequestMethod.GET)
	public String qmsc0070(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "qm/qmsc0070";
	}
	


	// 재고관리(재고실사관리) 메인
	@RequestMapping(value = "/tmsc0030", method = RequestMethod.GET)
	public String tmsc0030(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "tm/tmsc0030";
	}
	
	// 재공창고현황 메인
	@RequestMapping(value = "/tmsc0240", method = RequestMethod.GET)
	public String tmsc0240(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "tm/tmsc0240";
	}
	
	

	// pda(재고현황)사출 메인
	@RequestMapping(value = "/tmsc0120", method = RequestMethod.GET)
	public String tmsc0120(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "tm/tmsc0120";
	}
	
	// pda(재고현황)봉제 메인
	@RequestMapping(value = "/tmsc0320", method = RequestMethod.GET)
	public String tmsc0320(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "tm/tmsc0320";
	}
	
	// pda(재고현황)정밀가공 메인
	@RequestMapping(value = "/tmsc0430", method = RequestMethod.GET)
	public String tmsc0430(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "tm/tmsc0430";
	}
	
	//생산관리(폐기등록/현황)
	@RequestMapping(value = "/wmsc0020", method = RequestMethod.GET)
	public String wmsc0020(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "wm/wmsc0020";
	}
	
	//생산관리(폐기등록/현황)
	@RequestMapping(value = "/wmsc0030", method = RequestMethod.GET)
	public String wmsc0030(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "wm/wmsc0030";
	}
	
	//생산관리(폐기등록/현황)
	@RequestMapping(value = "/wmsc0070", method = RequestMethod.GET)
	public String wmsc0070(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "wm/wmsc0070";
	}
	
	//생산관리(폐기등록/현황)
	@RequestMapping(value = "/wmsc0100", method = RequestMethod.GET)
	public String wmsc0100(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "wm/wmsc0100";
	}

	//생산관리(폐기등록/현황)
	@RequestMapping(value = "/wmsc0120", method = RequestMethod.GET)
	public String wmsc0120(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "wm/wmsc0120";
	}
	
	
	//생산관리(폐기등록/현황)
	@RequestMapping(value = "/wmsc0130", method = RequestMethod.GET)
	public String wmsc0130(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "wm/wmsc0130";
	}
	
	//생산관리(폐기등록/현황)
	@RequestMapping(value = "/wmsc0140", method = RequestMethod.GET)
	public String wmsc0140(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "wm/wmsc0140";
	}

	
	// 모니터링(수주진행현황) 메인
	@RequestMapping(value = "/mmsc0010", method = RequestMethod.GET)
	public String mmsc0010(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "mm/mmsc0010";
	}

	
	
	// 모니터링(생산현황) 메인
	@RequestMapping(value = "/mmsc0110", method = RequestMethod.GET)
	public String mmsc0110(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "mm/mmsc0110";
	}
	
	// 모니터링(생산입출고현황) 메인
	@RequestMapping(value = "/mmsc0120", method = RequestMethod.GET)
	public String mmsc0120(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "mm/mmsc0120";
	}
	
	
	
	/*
	 * // 생산실적수집
	 * 
	 * @RequestMapping(value = "/posc0020", method = RequestMethod.GET) public
	 * String posc0020(Locale locale, Model model) throws Exception {
	 * model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
	 * model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
	 * model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd")); return
	 * "notPage/notPage"; }
	 * 
	 * // 자주검사
	 * 
	 * @RequestMapping(value = "/posc0030", method = RequestMethod.GET) public
	 * String posc0030(Locale locale, Model model) throws Exception {
	 * model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
	 * model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
	 * model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd")); return
	 * "notPage/notPage"; }
	 * 
	 * // 불량등록
	 * 
	 * @RequestMapping(value = "/posc0040", method = RequestMethod.GET) public
	 * String posc0040(Locale locale, Model model) throws Exception {
	 * model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
	 * model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
	 * model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd")); return
	 * "notPage/notPage"; }
	 * 
	 * // 비가동사유등록
	 * 
	 * @RequestMapping(value = "/posc0050", method = RequestMethod.GET) public
	 * String posc0050(Locale locale, Model model) throws Exception {
	 * model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
	 * model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
	 * model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd")); return
	 * "notPage/notPage"; }
	 * 
	 * // 제품라벨발행
	 * 
	 * @RequestMapping(value = "/posc0060", method = RequestMethod.GET) public
	 * String posc0060(Locale locale, Model model) throws Exception {
	 * model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
	 * model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
	 * model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd")); return
	 * "notPage/notPage"; }
	 */
	// 생산일보관리(전체)
	@RequestMapping(value = "/mmsc0130", method = RequestMethod.GET)
	public String mmsc0130(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "mm/mmsc0130";
	}
	
	// 우편번호 찾기
	@RequestMapping(value = "/popup/jusoPopup", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView jusoPopup(ModelAndView mav, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.info("팝업!");
		try {
			mav.setViewName("/layout/jusoPopup");
		}

		catch (NullPointerException e) {
			// e.printStackTrace();
		}
		return mav;
	}
	
	// 데브익스프레스
	@RequestMapping(value = "/Devexpress", method = RequestMethod.GET)
	public String Devexpress(Locale locale, Model model) throws Exception {
		return "cm/Devexpress";
	}
	
	
	
	
	
		
	
	
}
