package mes.web.sm;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.sm.MatrlUserVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.sm.MatrlUserService;
import mes.web.cm.LoginController;
import mes.web.ut.Utils;

@Controller
public class MatrlUserController {
	
	@Inject
	private MatrlUserService matrlUserService;
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	//자재코드관리 메인
	@RequestMapping(value = "/smsc0010", method = RequestMethod.GET)
	public String matrlUserMain(Model model) throws Exception {
		
		CommonCodeAdmVo systemCommonCodeVo = new CommonCodeAdmVo();
		
		systemCommonCodeVo.setBaseGroupCd("001"); // 사용여부
		List<CommonCodeAdmVo>  systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("useYn", systemCommonCodeList );
		
		systemCommonCodeVo.setBaseGroupCd("002"); // 입퇴유무
		systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("empCd", systemCommonCodeList );
		
		systemCommonCodeVo.setBaseGroupCd("003"); // 담당
		systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("departmentCd", systemCommonCodeList );
        
		systemCommonCodeVo.setBaseGroupCd("004"); // 담당
		systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("chargeDuty", systemCommonCodeList );
		
		systemCommonCodeVo.setBaseGroupCd("005"); // 직위
		systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("postCd", systemCommonCodeList );
		
		systemCommonCodeVo.setBaseGroupCd("016"); // 조편성
		systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("teamCd", systemCommonCodeList );		
		
		systemCommonCodeVo.setBaseGroupCd("006"); // 사업장
		systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("workplaceCd", systemCommonCodeList );
		
		systemCommonCodeVo.setBaseGroupCd("083"); // 승인권한
		systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("acknowledgment", systemCommonCodeList );
		
		systemCommonCodeVo.setBaseGroupCd("086"); // 공수인원현황
		systemCommonCodeList = commonCodeAdmService.CommonCodeList(systemCommonCodeVo);
		model.addAttribute("personalGubun", systemCommonCodeList );
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userDepart", Utils.getUserDepartmentNm());
		
		return "sm/smsc0010";
	}
		
	//목록 조회
	@RequestMapping(value = "/sm/matrlUserDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> matrlCdDataList(MatrlUserVo matrlUserVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사용자 목록조회");
		
		try {
			List<MatrlUserVo> matrlUserData = matrlUserService.listAll(matrlUserVo);
			jsonData.put("data", matrlUserData);
			jsonData.put("result", "ok");	
		} catch (Exception e) {
			logger.info("사용자 목록조회 오류");
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "fail");
		}

		return jsonData;
	}
	
	//상세 조회
	@RequestMapping(value = "/sm/matrlUserData", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> matrlCdData(MatrlUserVo matrlUserVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사용자 상세 조회");
		
		try {
			matrlUserVo = matrlUserService.read(matrlUserVo);
			jsonData.put("data", matrlUserVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("사용자 상세 조회 오류");
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "fail");
		}
		
		return jsonData;
	}
	
	//유저정보 등록
	@RequestMapping(value = "/sm/matrlUserCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> matrlUserCreate(MatrlUserVo matrlUserVo, MultipartHttpServletRequest multi) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사용자 등록");
		matrlUserVo.setRegId(Utils.getUserId());
		logger.info("로그인 ID : " + Utils.getUserId());
		try {
			String matrlUserNumberSeq = matrlUserService.selectUserNumberSeq();
			matrlUserVo.setUserNumber(matrlUserNumberSeq);
			matrlUserVo.setUserPw(BCrypt.hashpw(matrlUserVo.getUserPw().toString(), BCrypt.gensalt(12)));
			
			//사진 업로드될수있도록 추가된것
			MultipartFile mFile = multi.getFile("imgAdd1");
			
			String fileName = mFile.getOriginalFilename(); // 원본 파일 명
			
			String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
			String[] imageList = {"tif","pjp","xbm","jxl","svgz","jpg","jpeg","ico","tiff","gif","svg","jfif","webp","png","bmp","pjpeg","avif","TIF","PJP","XBM","JXL","SVGZ","JPG","JPEG","ICO","TIFF","GIF","SVG","JFIF","WEBP","PNG","BMP","PJPEG","AVIF"};
			Long size = mFile.getSize();
			if(!Arrays.asList(imageList).contains(extension)) {
				jsonData.put("result", "extensionError");
	  		}/* else if (size > (1 * 1024 * 1024)) {
	  			jsonData.put("result", "sizeError");
			}*/ else if (mFile == null || mFile.isEmpty()) {

			} else {
					matrlUserVo.setUserImageFile(mFile.getBytes());
					matrlUserVo.setUserImageFileNm(fileName);
			}
			
			
			
			matrlUserService.create(matrlUserVo);
			jsonData.put("data", matrlUserVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("사용자 등록 오류");
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "fail");
		}
		
		return jsonData;
	}
	
	//유저정보 수정
	@RequestMapping(value = "/sm/matrlUserUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> matrlUserUpdate(MatrlUserVo matrlUserVo, MultipartHttpServletRequest multi) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사용자 수정");
		matrlUserVo.setUpdId(Utils.getUserId());
		logger.info("로그인 ID : " + Utils.getUserId());
		
		try {
			if(matrlUserVo.getUserPw().equals("") || matrlUserVo.getUserPw() == null ) {
				
			} else {
				matrlUserVo.setUserPw(BCrypt.hashpw(matrlUserVo.getUserPw().toString(), BCrypt.gensalt(12)));
			}
			
			//사진 업로드될수있도록 추가된것
			
			MultipartFile mFile = multi.getFile("imgAdd1");
			
			String fileName = mFile.getOriginalFilename(); // 원본 파일 명
			if( matrlUserVo.getImageStatus1() != null || matrlUserVo.getImageStatus1() != "") { //수정버튼을 누르고 사진을 올렸을 때 업데이트 할 수 있도록
				String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
				String[] imageList = {"tif","pjp","xbm","jxl","svgz","jpg","jpeg","ico","tiff","gif","svg","jfif","webp","png","bmp","pjpeg","avif","TIF","PJP","XBM","JXL","SVGZ","JPG","JPEG","ICO","TIFF","GIF","SVG","JFIF","WEBP","PNG","BMP","PJPEG","AVIF"};
				Long size = mFile.getSize();
				if(!Arrays.asList(imageList).contains(extension)) {
					jsonData.put("result", "extensionError");
		  		} /*else if (size > (1 * 1024 * 1024)) {
		  			jsonData.put("result", "sizeError");
				}*/ else if (mFile == null || mFile.isEmpty()) {
	
				} else {
						matrlUserVo.setUserImageFile(mFile.getBytes());
						matrlUserVo.setUserImageFileNm(fileName);
				}
			}
			
			matrlUserService.update(matrlUserVo);
			matrlUserVo = matrlUserService.read(matrlUserVo); 
			jsonData.put("data", matrlUserVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("사용자 수정 오류");
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "fail");
		}
		
		return jsonData;
	}	
	
	@RequestMapping(value = "/sm/checkIdData", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> checkUserId(MatrlUserVo matrlUserVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("id 체크");
		
		try {
			matrlUserVo = matrlUserService.read(matrlUserVo);
			jsonData.put("res", matrlUserVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("id 체크 오류");
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "fail");
		}
		
		return jsonData;
	}
	
	@RequestMapping(value = "/sm/checkAdmin", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> checkAdmin(MatrlUserVo matrlUserVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("관리자 계정 체크");
		
		try {
			matrlUserVo = matrlUserService.adminRead(matrlUserVo);
			jsonData.put("res", matrlUserVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("관리자 계정 체크 오류");
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "fail");
		}
		
		return jsonData;
	}
	
	//사번코드 생성
	@RequestMapping(value = "/sm/userNumberCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> userNumberCreate() throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사번코드 생성");
		
		try {
			String matrlUserNumberSeq = matrlUserService.selectUserNumberSeq();
			MatrlUserVo matrlUserVo = new MatrlUserVo();
			matrlUserVo.setUserNumber(matrlUserNumberSeq);
			jsonData.put("data", matrlUserVo);	
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("사번코드 생성 오류");
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "fail");
		}

		return jsonData;
	}		
	
	//사용자 정보조회
	@RequestMapping(value = "/sm/info", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> infoMain(HttpServletRequest request, Model model) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();		
		MatrlUserVo matrlUserVo = new MatrlUserVo();
		matrlUserVo.setUserId(request.getSession().getAttribute("userId").toString());
		matrlUserVo.setUserNumber(request.getSession().getAttribute("userNumber").toString());
		try {	
			matrlUserVo = matrlUserService.read(matrlUserVo);
			jsonData.put("data", matrlUserVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("사용자 상세 조회 오류");
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "fail");
		}
		
		return jsonData;
	}
	
	//비밀번호 변경
	@RequestMapping(value = "/sm/passChange", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> passChange(@RequestParam(value="nowPass") String nowPass,
														@RequestParam(value="changePassword") String changePass,																								
														HttpServletRequest request) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();	
		MatrlUserVo matrlUserVo = new MatrlUserVo();
		logger.info("--------------------------------------------------");
		logger.info(" " + nowPass);
		logger.info(" " + changePass);

		try {
			matrlUserVo.setUserId(request.getSession().getAttribute("userId").toString());
			matrlUserVo.setUserNumber(request.getSession().getAttribute("userNumber").toString());
			matrlUserVo = matrlUserService.read(matrlUserVo);
			matrlUserVo.setUpdId(Utils.getUserId());
			if (!BCrypt.checkpw (nowPass,matrlUserVo.getUserPw()) ) {				 
				jsonData.put("result", "fail");
				jsonData.put("message", "비밀번호가 일치하지 않습니다.");
			} else {
				matrlUserVo.setUserPw(BCrypt.hashpw(changePass.toString(), BCrypt.gensalt(12)));
				matrlUserService.update(matrlUserVo);
				jsonData.put("data", matrlUserVo);
				jsonData.put("result", "ok");
			}			
		
		} catch (Exception e) {
			logger.info("사용자 수정 오류");
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "fail");
		}
		
		return jsonData;
	}	
	
	// 사용자 삭제
	@RequestMapping(value = "sm/matrlUserDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> matrlUserDelete(MatrlUserVo matrlUserVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사용자 삭제");
		try {
			matrlUserService.matrlUserDelete(matrlUserVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("사용자 삭제 오류");
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 이미지 삭제
	@RequestMapping(value = "sm/imageDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> imageDelete(MatrlUserVo matrlUserVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("이미지 삭제");
		try {
			matrlUserService.imageDelete(matrlUserVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("이미지 삭제 오류");
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
}
