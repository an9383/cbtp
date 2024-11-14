package mes.web.sm;

import java.util.ArrayList;
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
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.sm.IpAccessControlAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.sm.IpAccessControlAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class IpAccessControlAdmController {
	
	private static final Logger logger = LoggerFactory.getLogger(IpAccessControlAdmController.class);

	@Inject
	private IpAccessControlAdmService ipAccessControlAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	
	// IP접근제어관리 메인
	@RequestMapping(value = "/smsc0060", method = RequestMethod.GET)
	public String smsc0060(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("050"); //사용유무
		List<CommonCodeAdmVo> useYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("useYn", useYnList);

		return "sm/smsc0060";
	}
	
	//IP접근제어관리 조회
	@RequestMapping(value = "sm/list", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> list(IpAccessControlAdmVo ipAccessControlAdmVo ) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {

			List<IpAccessControlAdmVo> list = ipAccessControlAdmService.list(ipAccessControlAdmVo);
			if(list==null || list.size()==0) {
				list = new ArrayList<IpAccessControlAdmVo>();
			}
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//IP접근제어관리 상세조회
	@RequestMapping(value = "sm/read", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> read(IpAccessControlAdmVo ipAccessControlAdmVo ) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {

			IpAccessControlAdmVo vo = ipAccessControlAdmService.read(ipAccessControlAdmVo);
			if(vo==null) {
				vo = new IpAccessControlAdmVo();
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
	
	//IP접근제어관리 등록
	@RequestMapping(value = "sm/create", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> create(IpAccessControlAdmVo ipAccessControlAdmVo ) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {

			//IP 중복확인
			if(ipAccessControlAdmService.existIpAddr(ipAccessControlAdmVo.getIpAddr()) == 0) {
				String ipNo = ipAccessControlAdmService.getIpNo(ipAccessControlAdmVo);
				ipAccessControlAdmVo.setIpNo(ipNo);
				ipAccessControlAdmVo.setRegId(Utils.getUserId());
				
				ipAccessControlAdmService.create(ipAccessControlAdmVo);
				jsonData.put("result", "ok");
			}else {
				jsonData.put("result", "exist");
				jsonData.put("message", "중복된 IP주소입니다. 확인해주세요.");
			}
		
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//IP접근제어관리 수정
	@RequestMapping(value = "sm/update", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update(IpAccessControlAdmVo ipAccessControlAdmVo ) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			ipAccessControlAdmVo.setUpdId(Utils.getUserId());
			ipAccessControlAdmService.update(ipAccessControlAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	

	
}
