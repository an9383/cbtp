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
public class CustSatisAdmController {

	private static final Logger logger = LoggerFactory.getLogger(CustSatisAdmController.class);

	@Inject
	private CustSatisAdmService custSatisAdmService;
	@Inject
	private MatrlUserService matrlUserService;

	@RequestMapping(value = "/bssc0150")
	public String CustSatisAdmMain(Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));

		MatrlUserVo matrlUserVo = new MatrlUserVo(); // 삭제유무
		List<MatrlUserVo> matrlUserList = matrlUserService.listAll(matrlUserVo);
		model.addAttribute("matrlUserList", matrlUserList );
		
		
		return "bs/bssc0150";
	}

	// 게시판 등록
	@RequestMapping(value = "bs/custSatisAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> CustSatisAdmCreate(CustSatisAdmVo custSatisAdmVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			custSatisAdmVo.setSatisNo(custSatisAdmService.custSatisAdmNo());
			custSatisAdmService.custSatisAdmCreate(custSatisAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 게시판 리스트 출력
	@RequestMapping(value = "bs/custSatisAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> custSatisAdmList(CustSatisAdmVo custSatisAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			List<CustSatisAdmVo> custSatisAdmList = custSatisAdmService.custSatisAdmList(custSatisAdmVo);

			jsonData.put("data", custSatisAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 게시판 상세보기 출력
	@RequestMapping(value = "bs/custSatisAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> BaseInfoItRead(CustSatisAdmVo custSatisAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			custSatisAdmVo = custSatisAdmService.custSatisAdmRead(custSatisAdmVo);
			jsonData.put("data", custSatisAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 게시판 수정
	@RequestMapping(value = "bs/custSatisAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> custSatisAdmUpdate(CustSatisAdmVo custSatisAdmVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			custSatisAdmVo.setUpdId(Utils.getUserId());
			custSatisAdmService.custSatisAdmUpdate(custSatisAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 게시판 삭제
	@RequestMapping(value = "bs/custSatisAdmDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> custSatisAdmDel(CustSatisAdmVo custSatisAdmVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			int count=custSatisAdmService.CustSatisAdmDelete(custSatisAdmVo);
			logger.info("게시판 삭제 후" + custSatisAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

}
