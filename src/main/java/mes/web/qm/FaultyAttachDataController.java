package mes.web.qm;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mes.domain.bm.ItemMotorVo;
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.qm.FaultyAttachDataVo;
import mes.service.qm.FaultyAttachDataService;
import mes.service.tm.StockPaymentAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class FaultyAttachDataController {

	private static final Logger logger = LoggerFactory.getLogger(FaultyAttachDataController.class);
	
	
	@Value("${file.faultyAttachDataPath}") 
	private String faultyAttachDataPath;
	
	
	@Inject
	private FaultyAttachDataService faultyAttachDataService;
	
	//부적합관리 관련자료 상세조회
	@RequestMapping(value = "qm/faultyAttachDataRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> faultyAttachDataRead(FaultyAttachDataVo faultyAttachDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("관련자료 상세조회 : "+faultyAttachDataVo);
		try {
			List<FaultyAttachDataVo> list = new ArrayList<FaultyAttachDataVo>();
			
			if(faultyAttachDataVo.getSourceNo()!=null && !faultyAttachDataVo.getSourceNo().equals("")) {
				list = faultyAttachDataService.faultyAttachDataRead(faultyAttachDataVo);
			}
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}

	
	//부적합관리 관련자료 등록
	@RequestMapping(value = "qm/faultyAttachDataCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> faultyAttachDataCreate(FaultyAttachDataVo faultyAttachDataVo,
			MultipartHttpServletRequest multi) throws Exception {
		logger.info("관련자료 등록 : " +faultyAttachDataVo);
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			String date = DateUtil.getToday("yyyymmdd");
			String seq = faultyAttachDataService.getAttachSeq(date);
			
			MultipartFile mFile = multi.getFile("fileNm_"+faultyAttachDataVo.getIndex()); 
			
			String fileName = mFile.getOriginalFilename(); // 원본 파일 명
			logger.info("파일명"+fileName);
			
			String path = faultyAttachDataPath+"\\"+faultyAttachDataVo.getAttachGubun()+"\\"+date;
			
			
			//(서버 폴더에 저장)
			File dir=new File(path);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			String newFileName="";
			if (mFile != null && !mFile.isEmpty()) {
				newFileName=seq+"."+fileName.substring(fileName.lastIndexOf(".")+1);
				mFile.transferTo(new File(path+"/"+newFileName));
				
				faultyAttachDataVo.setAttachGubun(faultyAttachDataVo.getAttachGubun());
				faultyAttachDataVo.setAttachCd(date+"-"+seq);
				faultyAttachDataVo.setSourceNo(faultyAttachDataVo.getSourceNo());
				faultyAttachDataVo.setAttachContent(faultyAttachDataVo.getAttachContent());
				faultyAttachDataVo.setAttachRegDate(faultyAttachDataVo.getAttachRegDate());
				faultyAttachDataVo.setRegId(Utils.getUserId());
				faultyAttachDataVo.setAttachFn(fileName);
				faultyAttachDataVo.setAttachPath(path);
				
				faultyAttachDataService.faultyAttachDataCreate(faultyAttachDataVo);
			} 
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}

		return jsonData;
	}
	
	
	// 부적합관리 관련자료 다운로드
	@RequestMapping(value = "/qm/faultyAttachDataDownload", method = RequestMethod.GET)
	public @ResponseBody void faultyAttachDataDownload(HttpServletResponse res, HttpServletRequest req,
			FaultyAttachDataVo faultyAttachDataVo) throws Exception {
		try {
			
			String[] arr = faultyAttachDataVo.getAttachCd().split("-",2);
			logger.info("arr[0] : ============>"+arr[0]);
			logger.info("arr[1] : ============>"+arr[1]);
			
			//파일명 가져오기
			String dFile = faultyAttachDataService.getAttachFn(faultyAttachDataVo);
			String newFileName = arr[1]+"."+ dFile.substring(dFile.lastIndexOf(".") + 1);

			String path=faultyAttachDataPath+"\\"+faultyAttachDataVo.getAttachGubun()+"\\"+arr[0]+ "\\" + newFileName;
			
			File file = new File(path);
			String userAgent = req.getHeader("User-Agent");

			boolean ie = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);

			if (ie) {
				dFile = URLEncoder.encode(dFile, "UTF-8").replaceAll("\\+", "%20");
			} else {
				dFile = new String(dFile.getBytes("UTF-8"), "ISO-8859-1");
			}

			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment; fileName=" + dFile + ";");

			FileInputStream fis = new FileInputStream(file);
			BufferedInputStream bis = new BufferedInputStream(fis);
			ServletOutputStream so = res.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(so);

			byte[] data = new byte[2048];
			int input = 0;
			while ((input = bis.read(data)) != -1) {
				bos.write(data, 0, input);
				bos.flush();
			}

			if (bos != null)
				bos.close();
			if (bis != null)
				bis.close();
			if (so != null)
				so.close();
			if (fis != null)
				fis.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//부적합관리 관련자료 삭제
	@RequestMapping(value = "qm/faultyAttachDataDelete", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> faultyAttachDataDelete(FaultyAttachDataVo faultyAttachDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("관련자료 삭제 : "+faultyAttachDataVo);
		try {
			
			faultyAttachDataService.faultyAttachDataDelete(faultyAttachDataVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage()
					);
		}
		return jsonData;
	}

	
}
