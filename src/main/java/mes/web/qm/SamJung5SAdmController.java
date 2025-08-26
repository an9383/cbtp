package mes.web.qm;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.qm.ItemCompleteAdmVo;
import mes.domain.qm.ItemFaultyAdmVo;
import mes.domain.qm.ItemFaultyJdgAdmVo;
import mes.domain.qm.ItemInspectAdmVo;
import mes.domain.qm.SamJung5SAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.qm.ItemFaultyAdmService;
import mes.service.qm.ItemFaultyJdgAdmService;
import mes.service.qm.SamJung5SAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class SamJung5SAdmController {

	@Inject
	private static final Logger logger = LoggerFactory.getLogger(SamJung5SAdmController.class);
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private SamJung5SAdmService  samJung5SAdmService;
	
	@Value("${file.samJung5SPath}")
	private String file_samJung5S_Path;
	//private String file_itemInspect_faulty_Path;
	
	// 3정5s 메인
	@RequestMapping(value = "/qmsc0100", method = RequestMethod.GET)
	public String qmsc0100(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("003"); // 부서명
		List<CommonCodeAdmVo> admDeptList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("admDept", admDeptList);
		
		return "qm/qmsc0100";
	}
	
	// 3정5s 목록 조회
	@RequestMapping(value="qm/samJung5SList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> samJung5SList(SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("3정5S 목록조회");
			List<SamJung5SAdmVo> list =  samJung5SAdmService.samJung5SList(samJung5SAdmVo);
			jsonData.put("data",list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//3정5S 등록
	@RequestMapping(value="qm/samJung5SAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> samJung5sAdmCreate(MultipartHttpServletRequest multi, SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
			try {
			logger.info("3정5S 등록:"+samJung5SAdmVo);		
			
			samJung5SAdmVo.setSjCd(samJung5SAdmService.samJung5Seq(samJung5SAdmVo));			
			samJung5SAdmVo.setRegId(Utils.getUserId());		
			uploadFile(multi, samJung5SAdmVo);
			uploadImg(multi, samJung5SAdmVo);
			String image1 = "";
			String image2 = "";	
			
			
			samJung5SAdmService.samJung5SAdmCreate(samJung5SAdmVo);
			logger.info("3정5S 등록2:"+samJung5SAdmVo);
			if(samJung5SAdmVo.getImage1()!=null) {
				image1 = new String(Base64.encodeBase64(samJung5SAdmVo.getImage1()));
			}
				
			if(samJung5SAdmVo.getImage2()!=null) {
				image2 = new String(Base64.encodeBase64(samJung5SAdmVo.getImage2()));
			}
			if(samJung5SAdmVo.getFileNm1() != null) {
				jsonData.put("FileNm1", samJung5SAdmVo.getFileNm1());
			}
			if(samJung5SAdmVo.getFileNm2() != null) {
				jsonData.put("FileNm2", samJung5SAdmVo.getFileNm2());
			}
			
			jsonData.put("image1", image1);
			jsonData.put("image2", image2);
			jsonData.put("data", samJung5SAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}	
	
	//대책관리 상세조회
	@RequestMapping(value="qm/samJung5SAdmread", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> samJung5SAdmread(SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
			try {
			samJung5SAdmVo =  samJung5SAdmService.read(samJung5SAdmVo);
			logger.info("samJung5SAdmVo"+samJung5SAdmVo);
			
			String image1="";
			String image2="";
			if(samJung5SAdmVo==null) {
				samJung5SAdmVo = new SamJung5SAdmVo();
			}else {
				if(samJung5SAdmVo.getImage1()!=null) {
					image1 = new String(Base64.encodeBase64(samJung5SAdmVo.getImage1()));
				}
				
				if(samJung5SAdmVo.getImage2()!=null) {
					image2 = new String(Base64.encodeBase64(samJung5SAdmVo.getImage2()));
				}
			}
			
			jsonData.put("image1", image1);
			jsonData.put("image2", image2);			
			jsonData.put("data", samJung5SAdmVo);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//3정5S 수정
	@RequestMapping(value="qm/samJung5SAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> samJung5SAdmUpdate(MultipartHttpServletRequest multi, SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
			try {
			logger.info("3정5S 수정:"+samJung5SAdmVo);				
			SamJung5SAdmVo reVo = new SamJung5SAdmVo();
			reVo = samJung5SAdmService.read(samJung5SAdmVo);
			reVo.setUpdId(Utils.getUserId());
			reVo.setSjCd(samJung5SAdmVo.getSjCd());
			reVo.setSjArea(samJung5SAdmVo.getSjArea());
			reVo.setSjDept(samJung5SAdmVo.getSjDept());
			reVo.setCheckChargr(samJung5SAdmVo.getCheckChargr());
			reVo.setCheckDate(samJung5SAdmVo.getCheckDate());
			reVo.setCompChargr(samJung5SAdmVo.getCompChargr());
			reVo.setCompDate(samJung5SAdmVo.getCompDate());
			reVo.setSjDesc(samJung5SAdmVo.getSjDesc());
			reVo.setErrorList(samJung5SAdmVo.getErrorList());
			reVo.setImprovList(samJung5SAdmVo.getImprovList());
			uploadImg(multi, reVo);
			uploadFile(multi, reVo);
			String image1="";
			String image2="";
			samJung5SAdmService.samJung5SAdmUpdate(reVo);
			
			if(reVo.getImage1()!=null) {
				image1 = new String(Base64.encodeBase64(reVo.getImage1()));
			}
				
			if(reVo.getImage2()!=null) {
				image2 = new String(Base64.encodeBase64(reVo.getImage2()));
			}
			if(reVo.getFileNm1() != null) {
				jsonData.put("FileNm1", reVo.getFileNm1());
			}
			if(reVo.getFileNm2() != null) {
				jsonData.put("FileNm2", reVo.getFileNm2());
			}
			jsonData.put("image1", image1);
			jsonData.put("image2", image2);
			jsonData.put("data", reVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 3정5s 삭제
	@RequestMapping(value="qm/samJung5SDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> samJung5SDelete(SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			samJung5SAdmService.samJung5SAdmDelete(samJung5SAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//부적합관리 이미지삭제
	@RequestMapping(value="qm/samJung5SAdmImageDelete", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> samJung5SAdmImageDelete(SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			samJung5SAdmService.samJung5SAdmImageDelete(samJung5SAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
			
	}
	public void uploadImg(MultipartHttpServletRequest multi, SamJung5SAdmVo samJung5SAdmVo) throws Exception {
		try {
			String fileName = "";
			for(int i=1; i<=2; i++) {
				MultipartFile mFile = multi.getFile("imgAdd"+i);
				fileName = mFile.getOriginalFilename(); //원본 파일 명 
				if (mFile == null || mFile.isEmpty()) {
					logger.info("파일 바이트:"+mFile.getBytes());
				}else if(i == 1 && samJung5SAdmVo.getImageStatus1() == "") {
					samJung5SAdmVo.setImage1(samJung5SAdmVo.getImage1()); 
					samJung5SAdmVo.setImageNm1(samJung5SAdmVo.getFileNm1());
				}else if(i == 2 && samJung5SAdmVo.getImageStatus2() == "") {
					samJung5SAdmVo.setImage2(samJung5SAdmVo.getImage2()); 
					samJung5SAdmVo.setImageNm2(samJung5SAdmVo.getFileNm2());
				}else{
					switch(i) {
					case 1 :
						samJung5SAdmVo.setImage1(mFile.getBytes()); //원본 파일 경로
						samJung5SAdmVo.setImageNm1(fileName);  //원본 파일 명 
						break;
					case 2 :
						samJung5SAdmVo.setImage2(mFile.getBytes());
						samJung5SAdmVo.setImageNm2(fileName);
						break;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	public void uploadFile(MultipartHttpServletRequest multi, SamJung5SAdmVo samJung5SAdmVo) throws Exception {
		
		try {
			String sjCd = samJung5SAdmVo.getSjCd();
			
			String newFileName = "";
			String path = file_samJung5S_Path+ "/" + sjCd;
			
			File dir = new File(path);
			if(!dir.exists()) {
				dir.mkdirs();
			} else {
				File[] deleteFolderList = dir.listFiles();
				for(int i = 0; i<deleteFolderList.length; i++) {
					deleteFolderList[i].delete();
				}
				dir.delete();
				dir.mkdirs();
			}
			int flag=0;
			
			for(int i=1; i<3; i++) {
				logger.info("flag값:"+flag);
				MultipartFile mFile = multi.getFile("fileDate"+i);
				String fileName = mFile.getOriginalFilename();
				if(i == 1 && samJung5SAdmVo.getFileStatus1() == "") {
					fileName = samJung5SAdmVo.getFileNm1(); 
				} else if(i == 2 && samJung5SAdmVo.getFileStatus2() == "") {
					fileName = samJung5SAdmVo.getFileNm2(); 
				}
				logger.info(i+"번째 파일 명:"+fileName);
				
				switch(flag) {
				case 0:
					samJung5SAdmVo.setFileNm1(fileName);
					logger.info("flag값이 0임");
					logger.info("vo에 들어가는 파일명:"+samJung5SAdmVo.getFileNm1());
					newFileName = sjCd + "_" +i +"." +fileName.substring(fileName.lastIndexOf(".")+1);
					break;
				case 1:
					samJung5SAdmVo.setFileNm2(fileName);
					logger.info("flag값이 1임");
					logger.info("vo에 들어가는 파일명:"+samJung5SAdmVo.getFileNm2());
					newFileName = sjCd + "_" + i +"." +fileName.substring(fileName.lastIndexOf(".")+1);
					break;
				}
				flag++;
			
				try {
					mFile.transferTo(new File(path + "/" + newFileName));
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//파일 다운로드
	@RequestMapping(value = "qm/downloadFileSamJung5S", method = RequestMethod.GET)
	public @ResponseBody void downloadFileSamJung5S(HttpServletResponse res, HttpServletRequest req,
		    @RequestParam(value = "sjCd") String sjCd,
		    @RequestParam(value = "value") String value,
		    SamJung5SAdmVo samJung5SAdmVo) throws Exception {
		try {
			samJung5SAdmVo = samJung5SAdmService.read(samJung5SAdmVo);;
			
			String dFile="";
			if(value.equals("1")) {
				dFile = samJung5SAdmVo.getFileNm1();
			} else if(value.equals("2")) {
				dFile = samJung5SAdmVo.getFileNm2();
			}
			String newFileName = sjCd + "_" + value + "." + dFile.substring(dFile.lastIndexOf(".")+1);
			String path = file_samJung5S_Path+ "/" + sjCd + "/" + newFileName;
			File file = new File(path);
			String userAgent = req.getHeader("User-Agent");
			boolean ie = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);

			if (ie) {
				dFile = URLEncoder.encode(dFile, "UTF-8").replaceAll("\\+", "%20");
			} else {
				dFile = new String(dFile.getBytes("UTF-8"), "ISO-8859-1");
			}

			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment; fileName=\"" + dFile + "\";");

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
}
