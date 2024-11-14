package mes.web.bm;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.MoldAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bm.DealCorpAdmService;
import mes.service.bm.MatrlCodeAdmService;
import mes.service.bm.MoldAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class MoldAdmController {
	
	@Value("${file.moldPath}")
	private String file_Equip_Path;
	
	@Inject
	private MoldAdmService moldAdmService;
	@Inject
	private CommonCodeAdmService commonCodeService;
	@Inject
	private DealCorpAdmService dealCorpAdmService;

	
	private static final Logger logger = LoggerFactory.getLogger(MatrlCodeAdmService.class);

	/*
	// 금형관리 메인
	@RequestMapping(value = "/bmsc0090", method = RequestMethod.GET)
	public String matrlInOutWhsPreMain(Locale locale, Model model) throws Exception {

		logger.info("금형관리 메인");
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		try {
			commonCodeVo.setBaseGroupCd("004"); // 사용유무
			List<CommonCodeAdmVo> commonCodeList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("useYn", commonCodeList);

			commonCodeVo.setBaseGroupCd("104"); // 제작구분
			commonCodeList = commonCodeService.CommonCodeList(commonCodeVo);
			model.addAttribute("formType", commonCodeList);

			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		} catch (Exception e) {

		}

		return "bm/bmsc0090";
	}
	*/

	//메인 테이블 뷰
	@RequestMapping(value = "/bm/moldViewTableDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> moldViewTableDataList(MoldAdmVo moldAdmVo) throws Exception {
		
		Map<String, Object> jsonData = new HashMap<String, Object>();		
		logger.info("금형정보 조회");
		try {	
			List<MoldAdmVo> moldAdmList = moldAdmService.listAll(moldAdmVo);		
			jsonData.put("data", moldAdmList);		
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		
		return jsonData;
	}
	
	//상세 테이블 뷰
	@RequestMapping(value = "/bm/moldViewTableData", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> moldViewTableData(MoldAdmVo moldAdmVo) throws Exception {

		Map<String, Object> jsonData = new HashMap<String, Object>();		
		logger.info("금형정보 상세 조회");
		try {	
			moldAdmVo = moldAdmService.read(moldAdmVo);			
			jsonData.put("data", moldAdmVo);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//금형정보 등록
	@RequestMapping(value = "/bm/moldAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> moldAdmCreate(MoldAdmVo moldAdmVo) throws Exception {
		
		logger.info("금형정보 등록");
		Map<String, Object> jsonData = new HashMap<String, Object>();	
		try {	
			String sequence = moldAdmService.moldCdSeq();
			logger.info("검색 후 Code : "+ sequence);
			moldAdmVo.setMoldCd(sequence);
			moldAdmVo.setRegId(Utils.getUserId());
			moldAdmService.create(moldAdmVo);
			jsonData.put("result", "ok" );
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}

	//금형정보 수정
	@RequestMapping(value = "/bm/moldAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> moldAdmUpdate(MoldAdmVo moldAdmVo) throws Exception {
		
		logger.info("금형정보 수정");
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {	
			moldAdmVo.setUpdId(Utils.getUserId());
			moldAdmService.update(moldAdmVo);
			jsonData.put("result", "ok" );		
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//금형관리 이미지 경로조회
	@RequestMapping(value = "/bm/moldAdmImgRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> moldAdmImgRead(MoldAdmVo moldAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("사진조회");
		String imageFile1="";
		String imageFile2="";
		String imageFile3="";
		String imageFile4="";
		try {
			Utils utils = new Utils();
			MoldAdmVo moldVo = moldAdmService.moldImgRead(moldAdmVo);
			String moldCd = moldVo.getMoldCd();
			
			if(moldVo.getImageFile1()!=null) {
				imageFile1 = moldVo.getImageFile1();
				String filePath1 = file_Equip_Path+ "//code_" + moldCd + "//" + moldCd +"_1."+imageFile1.substring(imageFile1.lastIndexOf(".")+1);
				logger.info("이미지 경로 1 : "+filePath1);
				byte[] image1 = utils.imageToByteArray(filePath1);
				String fileString1 = new String(Base64.encodeBase64(image1));
				jsonData.put("imageFile1", fileString1);
			}
			
			if(moldVo.getImageFile2()!=null) {
				imageFile2 = moldVo.getImageFile2();
				String filePath2 = file_Equip_Path+ "//code_" + moldCd + "//" + moldCd +"_2."+imageFile2.substring(imageFile2.lastIndexOf(".")+1);
				logger.info("이미지 경로 2 : "+filePath2);
				byte[] image2 = utils.imageToByteArray(filePath2);
				String fileString2 = new String(Base64.encodeBase64(image2));
				jsonData.put("imageFile2", fileString2);
			}
			if(moldVo.getImageFile3()!=null) {
				imageFile3 = moldVo.getImageFile3();
				String filePath3 = file_Equip_Path+ "//code_" + moldCd + "//" + moldCd +"_3."+imageFile3.substring(imageFile3.lastIndexOf(".")+1);
				logger.info("이미지 경로 3 : "+filePath3);
				byte[] image3 = utils.imageToByteArray(filePath3);
				String fileString3 = new String(Base64.encodeBase64(image3));
				jsonData.put("imageFile3", fileString3);
			}
			if(moldVo.getImageFile4()!=null) {
				imageFile4 = moldVo.getImageFile4();
				String filePath4 = file_Equip_Path+ "//code_" + moldCd + "//" + moldCd +"_4."+imageFile4.substring(imageFile4.lastIndexOf(".")+1);
				logger.info("이미지 경로 4 : "+filePath4);
				byte[] image4 = utils.imageToByteArray(filePath4);
				String fileString4 = new String(Base64.encodeBase64(image4));
				jsonData.put("imageFile4", fileString4);
			}
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}
		return jsonData;
	}
		
		
	//금형관리 이미지 업로드
	@ResponseBody
	@RequestMapping(value = "/bm/moldImageUpload")
	public Object moldImageUpload(MoldAdmVo moldAdmVo, MultipartHttpServletRequest multi) throws Exception {
		logger.info("업로드 컨트롤러 시작");
		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			String value = multi.getParameter("value");
			
			MultipartFile mFile = null;
			
			switch (value) {
			case "1":
				mFile = multi.getFile("imgAdd1");
				break;
			case "2":
				mFile = multi.getFile("imgAdd2");
				break;
			case "3":
				mFile = multi.getFile("imgAdd3");
				break;
			case "4":
				mFile = multi.getFile("imgAdd4");
				break;
			}
			
			String moldCd = multi.getParameterValues("moldCd")[0].toString();
			
			moldAdmVo.setMoldCd(moldCd);
			
			logger.info("moldCd 코드 : " + moldCd);
			
			String fileName = mFile.getOriginalFilename(); // 원본 파일 명
			
			logger.info("원본 파일 이름 : " + fileName);
			
			String filePath = file_Equip_Path + "//code_" + moldCd;
			
			logger.info("저장 장소 : " + filePath);
			
			File file = new File(filePath); //파일 저장 경로 확인, 없으면 만든다.
			
			if(!file.exists()) {
				file.mkdirs();
			}
			
			String newFileName = moldCd+"_"+value+"."+fileName.substring(fileName.lastIndexOf(".")+1);
			
			String newFilePath = filePath +"//"+ newFileName;
			
			logger.info("safeFile : " + newFilePath);
			
			switch(value) {
				case "1":
					moldAdmVo.setImageFile1(fileName);
					break;
				case "2":
					moldAdmVo.setImageFile2(fileName);
					break;
				case "3":
					moldAdmVo.setImageFile3(fileName);
					break;
				case "4":
					moldAdmVo.setImageFile4(fileName);
					break;
			}
			
		
			// 파일 저장
			mFile.transferTo(new File(newFilePath));
			logger.info("파일업로드성공!");
			moldAdmService.moldImageUpload(moldAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();	
			jsonData.put("result", "error");
		}
		
		return jsonData;
	}
	
}
