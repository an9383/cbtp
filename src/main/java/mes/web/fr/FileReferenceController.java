package mes.web.fr;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale	;
import java.util.Map;

import javax.inject.Inject;

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
import org.springframework.web.servlet.ModelAndView;

import mes.domain.bm.BaseInfoAdmVo;
import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.fr.FileReferenceVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.fr.FileReferenceService;
import mes.web.ut.FileUtil;
import mes.web.ut.Utils;

@Controller
public class FileReferenceController {
	
	private static final Logger logger = LoggerFactory.getLogger(FileReferenceController.class);

	@Inject
	private FileReferenceService fileReferenceService;
	@Inject
	private CommonCodeAdmService commonCodeService;
	
	
	// ========================================== 통합자료실 ==========================================
	// 통합자료실(사출)
	@RequestMapping(value = "frsc0010", method = RequestMethod.GET)
	public String frsc0010(Locale locale, Model model) throws Exception {
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		commonCodeVo.setBaseGroupCd("132"); //비가동구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> commonCodeVoList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("fileGubun", commonCodeVoList);
		
		commonCodeVo.setBaseGroupCd("143"); //통합자료실 항목
		commonCodeVo.setUseYn("001");
		commonCodeVoList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("fileItem", commonCodeVoList);
		
		return "fr/frsc0010";
	}
	
	// 통합자료실(봉제)
	@RequestMapping(value = "frsc0020", method = RequestMethod.GET)
	public String frsc0020(Locale locale, Model model) throws Exception {
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		commonCodeVo.setBaseGroupCd("132"); //비가동구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> commonCodeVoList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("fileGubun", commonCodeVoList);
		
		commonCodeVo.setBaseGroupCd("146"); //통합자료실 항목
		commonCodeVo.setUseYn("001");
		commonCodeVoList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("fileItem", commonCodeVoList);
		
		return "fr/frsc0020";
	}
	
	// 통합자료실(정밀가공)
	@RequestMapping(value = "frsc0030", method = RequestMethod.GET)
	public String frsc0030(Locale locale, Model model) throws Exception {
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		
		commonCodeVo.setBaseGroupCd("132"); //비가동구분
		commonCodeVo.setUseYn("001");
		List<CommonCodeAdmVo> commonCodeVoList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("fileGubun", commonCodeVoList);
		
		commonCodeVo.setBaseGroupCd("146"); //통합자료실 항목
		commonCodeVo.setUseYn("001");
		commonCodeVoList = commonCodeService.CommonCodeList(commonCodeVo);
		model.addAttribute("fileItem", commonCodeVoList);
		
		return "fr/frsc0030";
	}
	
	// 통합자료실 목록조회
	@RequestMapping(value = "fr/fileReferenceList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> fileReferenceList(FileReferenceVo fileReferenceVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("통합자료실 목록조회 : "+fileReferenceVo);
		try {
			List<FileReferenceVo> operationNoOticeVoList = fileReferenceService.list(fileReferenceVo);
			jsonData.put("data", operationNoOticeVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//통합자료실 상세조회
	@RequestMapping(value="fr/fileReferenceJustRead" , method = RequestMethod.GET)
	public @ResponseBody Map<String , Object> fileReferenceJustRead(FileReferenceVo fileReferenceVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("통합자료실 상세조회 : " + fileReferenceVo);
		try {
			fileReferenceVo = fileReferenceService.read(fileReferenceVo);
			jsonData.put("data", fileReferenceVo);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	} 
	
	// 통합자료실 조회
	@RequestMapping(value = "fr/fileReferenceRead", method = RequestMethod.GET)
	public @ResponseBody ModelAndView  fileReferenceRead(ModelAndView mv, @RequestParam(value="idx") String idx) throws Exception {
		Map resultMap = new HashMap();
		logger.info("통합자료실 조회");
		FileReferenceVo fileReferenceVo = new FileReferenceVo();
		fileReferenceVo.setIdx(idx);
		fileReferenceVo = fileReferenceService.read(fileReferenceVo);
		
		byte [] fileBLOB = fileReferenceVo.getFileBlob();
		String fileName = fileReferenceVo.getFileName();
		
		
		String filePath = Utils.getPath()+fileName; //파일 저장 경로, 설정파일로 따로 관리한다.
		String fileDir = Utils.getPath(); //파일 저장 경로, 설정파일로 따로 관리한다.
		File dir = new File(fileDir); //파일 저장 경로 
		File newFile = new File(filePath); // 파일
	    File files[] = dir.listFiles();
	    if (!dir.exists()) {
	        dir.mkdirs();
	        newFile.createNewFile();
	    } else {
	    	newFile.delete();
	    }
		
		logger.info("fileBLOB : " + fileBLOB);
		logger.info("fileName : " + fileName);
		logger.info("filePath : " + filePath);
		File file = new File(filePath);
		
		Blob blob = new javax.sql.rowset.serial.SerialBlob(fileBLOB);
		InputStream in = blob.getBinaryStream();
		OutputStream out = new FileOutputStream(file);
		byte[] buff = new byte[4096];  // how much of the blob to read/write at a time
		int len = 0;
        
		while ((len = in.read(buff)) != -1) {
		    out.write(buff, 0, len);
		}
		out.flush();
		out.close();
		//file.deleteOnExit();
		
		return new ModelAndView("downloadView", "downloadFile", file);
		
	}
	
	// 통합자료실 등록
	@ResponseBody
	@RequestMapping(value = "fr/fileReferenceAdd", method = RequestMethod.POST)
	public Object fileReferenceAdd( MultipartHttpServletRequest multipartRequest) throws Exception {
		logger.info("통합자료실 등록");
	    List<HashMap> fileArrayList = new ArrayList<HashMap>();
	    HashMap fileHashMap;
	    
	    FileUtil fileUtil = new FileUtil();
	    String idx = "";
	    String fileName = "";
	    String fileInfo3 = "";
	    String gubun = "";
	    
	    Iterator<String> itr =  multipartRequest.getFileNames(); //파일들을 Iterator 에 넣는다.
	    int i = 0;
	    while (itr.hasNext()) { //파일을 하나씩 불러온다.
	    	MultipartFile mpf = multipartRequest.getFile(itr.next());
	    	fileUtil = new FileUtil();
	    	
		    fileName = multipartRequest.getParameterValues("fileName")[i].toString();
		    fileInfo3 = multipartRequest.getParameterValues("fileInfo3")[i].toString();
		    gubun = multipartRequest.getParameterValues("gubun")[i].toString();
		    
		    File file = fileUtil.convertToMultipartFile(mpf);
		    Blob blob = fileUtil.convertFileToBlob(file);
		    
		    FileReferenceVo fileReferenceVo = new FileReferenceVo();
		    fileReferenceVo.setGubun(gubun);
		    fileReferenceVo.setFileName(fileName);
		    fileReferenceVo.setFileBlob(blob.getBytes(1,(int) blob.length()));
		    fileReferenceVo.setFileManager(Utils.getUserNumber());
		    fileReferenceVo.setFileInfo3(fileInfo3);
		    fileReferenceVo.setRegId(Utils.getUserNumber());
		    idx = fileReferenceService.add(fileReferenceVo);
		    i++;
	    }
	    
	    Map<String, Object> jsonData = new HashMap<String, Object>(); //응답값 셋팅
	    jsonData.put("result", "ok");
	    jsonData.put("userNumber", Utils.getUserNumber());
	    return jsonData;
	}
	
	// 통합자료실 수정
	@RequestMapping(value = "fr/fileReferenceEdit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> fileReferenceEdit(FileReferenceVo fileReferenceVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("통합자료실 수정 : "+fileReferenceVo);
		try {
			fileReferenceVo.setUpdId(Utils.getUserNumber());
			fileReferenceService.edit(fileReferenceVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 통합자료실 삭제
	@RequestMapping(value = "fr/fileReferenceRemove", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> fileReferenceRemove(FileReferenceVo fileReferenceVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("통합자료실 삭제 : "+fileReferenceVo);
		try {
			fileReferenceService.remove(fileReferenceVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}
