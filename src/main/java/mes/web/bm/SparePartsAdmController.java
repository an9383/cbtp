package mes.web.bm;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.SparePartsAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.SparePartsAdmService;
import mes.web.ut.Utils;

@Controller
public class SparePartsAdmController {
	@Inject
	private SparePartsAdmService sparePartsAdmService;
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(SparePartsAdmController.class);
	
	//예비품등록 페이지
	@RequestMapping(value = "/bmsc0080", method = RequestMethod.GET)
	public String SparePartsAdmMain(Locale locale, Model model) throws Exception {
		logger.info("예비품등록 메인");
		try {
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("001"); // 사용여부
			List<CommonCodeAdmVo> useYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", useYnList );
			
			commonCodeVo.setBaseGroupCd("003"); // 부서
			List<CommonCodeAdmVo> admDeptList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("admDept", admDeptList );
			
			commonCodeVo.setBaseGroupCd("004"); // 담당
			List<CommonCodeAdmVo> mainChargrList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("mainChargr", mainChargrList );
			
			commonCodeVo.setBaseGroupCd("056"); // 담당
			List<CommonCodeAdmVo> spCycleList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("spCycle", spCycleList );
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return "bm/bmsc0080";
	}
	
	//예비품등록 전체 조회
	@RequestMapping(value = "bm/sparePartsAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> sparePartsAdmList(SparePartsAdmVo sparePartsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("예비품 읽기 : "+sparePartsAdmVo);
		try {
			List<SparePartsAdmVo> list  = sparePartsAdmService.sparePartsAdmList();
			logger.info("검색 후 : "+list);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}

	//예비품등록 클릭 Read
	@RequestMapping(value = "/bm/sparePartsAdmRead", method = RequestMethod.GET)
	public @ResponseBody
	Map<String, Object> sparePartsAdmRead(SparePartsAdmVo sparePartsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("예비품 수정 : "+sparePartsAdmVo);
		try {
			sparePartsAdmVo = sparePartsAdmService.sparePartsAdmRead(sparePartsAdmVo);
			logger.info("검색 후 : "+sparePartsAdmVo);
			jsonData.put("data", sparePartsAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//예비품등록 Create
	@RequestMapping(value = "/bm/sparePartsAdmCreate", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> sparePartsAdmCreate(SparePartsAdmVo sparePartsAdmVo, HttpServletRequest request) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("예비품 등록: " + sparePartsAdmVo);
		try {
			String spCd = sparePartsAdmService.getSpCd();
			sparePartsAdmVo.setSpCd(spCd);
			sparePartsAdmVo.setRegId(Utils.getUserId());
			sparePartsAdmService.sparePartsAdmCreate(sparePartsAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	//예비품등록 Update
	@RequestMapping(value = "/bm/sparePartsAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody
	Map<String, Object> sparePartsAdmUpdate(SparePartsAdmVo sparePartsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		
		try {
			sparePartsAdmVo.setUpdId(Utils.getUserId());
			logger.info("예비품 수정: " + sparePartsAdmVo);
			sparePartsAdmService.sparePartsAdmUpdate(sparePartsAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	//설비관리 이미지 경로조회
	@RequestMapping(value = "/bm/sparePartsImgRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> sparePartsImgRead(SparePartsAdmVo sparePartsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("이미지조회");
		try {
		
			SparePartsAdmVo vo=sparePartsAdmService.sparePartsImgRead(sparePartsAdmVo);
			
			if (vo.getImageFile1() != null) {
				String imageFile1 = new String(Base64.encodeBase64(vo.getImageFile1()));
				String imageFile1Nm = vo.getImageFile1Nm();
				jsonData.put("imageFile1", imageFile1);
				jsonData.put("imageFile1Nm", imageFile1Nm);
			}
			if (vo.getImageFile2() != null) {
				String imageFile2 = new String(Base64.encodeBase64(vo.getImageFile2()));
				String imageFile2Nm = vo.getImageFile2Nm();
				jsonData.put("imageFile2", imageFile2);
				jsonData.put("imageFile2Nm", imageFile2Nm);
			}
			if (vo.getImageFile3() != null) {
				String imageFile3 = new String(Base64.encodeBase64(vo.getImageFile3()));
				String imageFile3Nm = vo.getImageFile3Nm();
				jsonData.put("imageFile3", imageFile3);
				jsonData.put("imageFile3Nm", imageFile3Nm);
			}
			if (vo.getImageFile4() != null) {
				String imageFile4 = new String(Base64.encodeBase64(vo.getImageFile4()));
				String imageFile4Nm = vo.getImageFile4Nm();
				jsonData.put("imageFile4", imageFile4);
				jsonData.put("imageFile4Nm", imageFile4Nm);
			}
			jsonData.put("data", vo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	 

	
	//설비 관리 이미지 업로드(DB에 바로 저장)
	@RequestMapping(value = "/bm/sparePartsImageUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> sparePartsImageUpload(SparePartsAdmVo sparePartsAdmVo,
			MultipartHttpServletRequest multi) throws Exception {
		logger.info("업로드 컨트롤러 시작");
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
			logger.info("계측기이미지 vo="+sparePartsAdmVo);
			//이미지 번호
			String value=multi.getParameter("value");
			MultipartFile mFile = multi.getFile("imgAdd" + value);
			
			String fileName = mFile.getOriginalFilename(); // 원본 파일 명
			
			if (mFile == null || mFile.isEmpty()) {

			} else {
				
				switch(value) {
				case "1" :
					sparePartsAdmVo.setImageFile1(mFile.getBytes());
					sparePartsAdmVo.setImageFile1Nm(fileName);
					break;
				case "2" :
					sparePartsAdmVo.setImageFile2(mFile.getBytes());
					sparePartsAdmVo.setImageFile2Nm(fileName);
					break;
				case "3" :
					sparePartsAdmVo.setImageFile3(mFile.getBytes());
					sparePartsAdmVo.setImageFile3Nm(fileName);
					break;
				case "4" :
					sparePartsAdmVo.setImageFile4(mFile.getBytes());
					sparePartsAdmVo.setImageFile4Nm(fileName);
					break;
				}
			}
			sparePartsAdmService.sparePartsImageUpload(sparePartsAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}

		return jsonData;
	}
	
	//설비 관리 이미지 Delete
	@RequestMapping(value = "/bm/sparePartsImageDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> sparePartsImageDelete(SparePartsAdmVo sparePartsAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("파일 삭제 vo:"+sparePartsAdmVo);
		try {
			
			sparePartsAdmVo.setUpdId(Utils.getUserId());		
			sparePartsAdmService.sparePartsImageDelete(sparePartsAdmVo);
		
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
			logger.info(""+Utils.getErrorMessage());
		}
		
		return jsonData;
	}
}
