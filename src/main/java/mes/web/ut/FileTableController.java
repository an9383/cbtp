package mes.web.ut;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller

public class FileTableController {
	
	private static final Logger logger = LoggerFactory.getLogger(FileTableController.class);
	
	// 파일 base64 변환
	@ResponseBody
	@RequestMapping(value = "ut/getImgBase64", method = RequestMethod.POST)
	public Object getImgBase64( MultipartHttpServletRequest multipartRequest) throws Exception {
	    List<HashMap> fileArrayList = new ArrayList<HashMap>();
	    Map<String, Object> jsonData = new HashMap<String, Object>(); //응답값 셋팅
	    HashMap fileHashMap;
	    
	    FileUtil fileUtil = new FileUtil();
	    
	    File file = fileUtil.convertToMultipartFile(multipartRequest.getFile("file-0"));
	    Blob blob = fileUtil.convertFileToBlob(file);
	    
	    Iterator<String> itr =  multipartRequest.getFileNames(); //파일들을 Iterator 에 넣는다.
	    int i = 0;
	    while (itr.hasNext()) { //파일을 하나씩 불러온다.
	    	MultipartFile mpf = multipartRequest.getFile(itr.next());
	    	fileUtil = new FileUtil();
	    	
		    file = fileUtil.convertToMultipartFile(mpf);
		    
		    byte[] data = new byte[(int) file.length()];
		    try (FileInputStream stream = new FileInputStream(file)) {
		    	stream.read(data, 0, data.length);
		    } catch (Throwable e) {
		    	e.printStackTrace();
		    }
		    jsonData.put("data", data);
	    }
	    
	    jsonData.put("result", "ok");
	    return jsonData;
	 
	}
}
