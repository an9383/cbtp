package mes.web.bs;

import java.util.HashMap;
import java.util.List;
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
import mes.domain.bs.CustSatisAdmVo;
import mes.domain.sm.MatrlUserVo;
import mes.service.bs.CustSatisAdmService;
import mes.service.sm.MatrlUserService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class TempController {

	private static final Logger logger = LoggerFactory.getLogger(TempController.class);

	@RequestMapping(value = "/bssc0160")
	public String sellPage1Main(Model model) throws Exception {
		return "bs/bssc0160";
	}

	@RequestMapping(value = "/bssc0170")
	public String sellPage2Main(Model model) throws Exception {
		return "bs/bssc0170";
	}

	@RequestMapping(value = "/bssc0180")
	public String sellPage3Main(Model model) throws Exception {
		return "bs/bssc0180";
	}
	
	@RequestMapping(value = "/bssc0190")
	public String buyPage1Main(Model model) throws Exception {
		return "bs/bssc0190";
	}
	
	@RequestMapping(value = "/bssc0200")
	public String buyPage2Main(Model model) throws Exception {
		return "bs/bssc0200";
	}
	
	@RequestMapping(value = "/bssc0210")
	public String buyPage3Main(Model model) throws Exception {
		return "bs/bssc0210";
	}
	
	@RequestMapping(value = "/bssc0220")
	public String buyPage4Main(Model model) throws Exception {
		return "bs/bssc0220";
	}
}
