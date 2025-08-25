package mes.web.qm;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.qm.IllumAdmVo;
import mes.service.qm.IllumAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class IllumAdmController {

	private static final Logger logger = LoggerFactory.getLogger(IllumAdmController.class);
	
	@Inject
	private IllumAdmService illumAdmService;
	
	//조도측정등록 메인
	@RequestMapping(value = "/qmsc0060", method = RequestMethod.GET)
	public String qmsc0060(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "qm/qmsc0060";
	}
	
	//조도측정 adm 전체조회
	@RequestMapping(value = "qm/illumAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> illumAdmList(IllumAdmVo illumAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("조도측정 adm 전체조회");
			List<IllumAdmVo> illumAdmList = illumAdmService.illumAdmList(illumAdmVo);
			logger.info("조도측정 adm 전체조회" +illumAdmList);
			jsonData.put("data", illumAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//조도측정 상세조회(List)
	@RequestMapping(value = "qm/illumDtlList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> illumDtlList(IllumAdmVo illumAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("조도측정 상세조회");
			String illumArea = illumAdmVo.getIllumArea(); 
			illumAdmVo.setIllumArea(URLDecoder.decode(illumArea,"UTF-8"));
			List<IllumAdmVo> illumDtlList = illumAdmService.illumDtlList(illumAdmVo);
			logger.info("조도측정 상세조회" +illumDtlList);
			jsonData.put("data", illumDtlList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//조도측정 Adm, Dtl 등록
	@RequestMapping(value = "qm/illumCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> illumCreate(IllumAdmVo illumAdmVo, HttpServletRequest request)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			
			JSONParser jsonParser 	= new JSONParser();
			JSONObject jsonObj 		= new JSONObject();
			JSONArray jsonAdmArray 	= (JSONArray) jsonParser.parse(illumAdmVo.getAdmArrayData());
			JSONArray jsonDtlArray 	= (JSONArray) jsonParser.parse(illumAdmVo.getDtlArrayData());
			IllumAdmVo admVo 		= new IllumAdmVo();	//illumAdm
			IllumAdmVo dtlVo 		= new IllumAdmVo();	//illumDtl
			
			//중복체크
			IllumAdmVo checkVo 		= new IllumAdmVo();
			
			jsonObj.put(0, jsonAdmArray.get(0));
			JSONObject jsonObjAdm = (JSONObject) jsonParser.parse(jsonObj.get(0).toString());
			
			checkVo.setIllumCd(jsonObjAdm.get("illumCd").toString());
			checkVo.setMsmYear(jsonObjAdm.get("msmYear").toString());
			checkVo.setIllumArea(jsonObjAdm.get("illumArea").toString());
			
			List<IllumAdmVo> illumDtlList = illumAdmService.illumDtlList(checkVo);
			
			logger.info("illumAdmVo : " + illumAdmVo);
			
			logger.info("조도측정 상세조회" + illumDtlList);
			logger.info("조도측정 상세조회 사이즈" + illumDtlList.size());
			
			if(illumDtlList.size() != 0) {
				logger.info("값 중복되는 값 있음");
				jsonData.put("result", "overlapError");
				return jsonData;
			}
			//중복체크 끝
			
			//Adm 저장
			admVo.setIllumCd(jsonObjAdm.get("illumCd").toString());			// 공정코드
			admVo.setIllumArea(jsonObjAdm.get("illumArea").toString());		// 구역
			admVo.setMsmLoc(jsonObjAdm.get("msmLoc").toString());			// 측정위치
			admVo.setIllumUnit(jsonObjAdm.get("illumUnit").toString());		// 단위
			admVo.setIllumStand(jsonObjAdm.get("illumStand").toString());	// 표준
			admVo.setMsmYear(jsonObjAdm.get("msmYear").toString());			// 측정년도
			admVo.setRegId(Utils.getUserId());								// 등록자
			illumAdmService.illumAdmCreate(admVo);
			
			logger.info("조도측정 adm 등록 = " + admVo);
			
			//Dtl저장
			for(int i=0; i<jsonDtlArray.size(); i++){
				
				jsonObj.put(i, jsonDtlArray.get(i));
				JSONObject jsonObjDtl = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
				logger.info("값 확인하기 : "+jsonObjDtl);
				
				dtlVo.setIllumCd(jsonObjDtl.get("illumCd").toString());				// 공정코드
				dtlVo.setIllumArea(jsonObjDtl.get("illumArea").toString());			// 구역
				dtlVo.setMsmYear(jsonObjDtl.get("msmYear").toString());				// 측정년도
				dtlVo.setMsmMon(jsonObjDtl.get("msmMon").toString());				// 축정월
				dtlVo.setMsmDueDate(jsonObjDtl.get("msmDueDate").toString());		// 예저일
				dtlVo.setMsmDate(jsonObjDtl.get("msmDate").toString());				// 측정일
				dtlVo.setMsmMeasures(jsonObjDtl.get("msmMeasures").toString());		// 측정값
				dtlVo.setRegId(Utils.getUserId());									// 등록자
				illumAdmService.illumDtlCreate(dtlVo);
			}
			
			logger.info("조도측정 Dtl 등록 = " + dtlVo);
			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//조도측정 Adm, Dtl 수정
	@RequestMapping(value = "qm/illumUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> illumUpdate(IllumAdmVo illumAdmVo, HttpServletRequest request)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			
			JSONParser jsonParser 	= new JSONParser();
			JSONObject jsonObj 		= new JSONObject();
			JSONArray jsonAdmArray 	= (JSONArray) jsonParser.parse(illumAdmVo.getAdmArrayData());
			JSONArray jsonDtlArray 	= (JSONArray) jsonParser.parse(illumAdmVo.getDtlArrayData());
			IllumAdmVo admVo 		= new IllumAdmVo();	//illumAdm
			IllumAdmVo dtlVo 		= new IllumAdmVo();	//illumDtl
			
			//Adm 저장
			jsonObj.put(0, jsonAdmArray.get(0));
			JSONObject jsonObjAdm = (JSONObject) jsonParser.parse(jsonObj.get(0).toString());
			
			admVo.setIllumCd(jsonObjAdm.get("illumCd").toString());			// 공정코드
			admVo.setIllumArea(jsonObjAdm.get("illumArea").toString());		// 구역
			admVo.setMsmLoc(jsonObjAdm.get("msmLoc").toString());			// 측정위치
			admVo.setIllumUnit(jsonObjAdm.get("illumUnit").toString());		// 단위
			admVo.setIllumStand(jsonObjAdm.get("illumStand").toString());	// 표준
			admVo.setMsmYear(jsonObjAdm.get("msmYear").toString());			// 측정년도
			admVo.setRegId(Utils.getUserId());								// 등록자
			illumAdmService.illumAdmUpdate(admVo);
			
			logger.info("조도측정 adm 수정 : " + admVo);
			
			//Dtl저장
			for(int i=0; i<jsonDtlArray.size(); i++){
				
				jsonObj.put(i, jsonDtlArray.get(i));
				JSONObject jsonObjDtl = (JSONObject) jsonParser.parse(jsonObj.get(i).toString());
				logger.info("값 확인하기 : "+jsonObjDtl);
				
				dtlVo.setIllumCd(jsonObjDtl.get("illumCd").toString());				// 공정코드
				dtlVo.setIllumArea(jsonObjDtl.get("illumArea").toString());			// 구역
				dtlVo.setMsmYear(jsonObjDtl.get("msmYear").toString());				// 측정년도
				dtlVo.setMsmMon(jsonObjDtl.get("msmMon").toString());				// 축정월
				dtlVo.setMsmDueDate(jsonObjDtl.get("msmDueDate").toString());		// 예저일
				dtlVo.setMsmDate(jsonObjDtl.get("msmDate").toString());				// 측정일
				dtlVo.setMsmMeasures(jsonObjDtl.get("msmMeasures").toString());		// 측정값
				dtlVo.setRegId(Utils.getUserId());									// 등록자
				illumAdmService.illumDtlUpdate(dtlVo);
			}
			
			logger.info("조도측정 Dtl 수장 : " + dtlVo);
			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//조도측정 삭제
	@RequestMapping(value = "qm/illumDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> illumDelete(IllumAdmVo illumAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("조도측정 삭제 : "+illumAdmVo);
			illumAdmService.illumDelete(illumAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 조도측정조회 메인
	@RequestMapping(value = "/qmsc0080", method = RequestMethod.GET)
	public String qmsc0080(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "qm/qmsc0080";
	}
	
	//조도측정 조회(qmsc0080)
	@RequestMapping(value = "qm/illumLookup", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> illumLookup(IllumAdmVo illumAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("조도측정 조회(qmsc0080)");
			List<IllumAdmVo> illumLookup = illumAdmService.illumLookup(illumAdmVo);
			logger.info("조도측정 조회(qmsc0080)" +illumLookup);
			jsonData.put("data", illumLookup);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	
}
