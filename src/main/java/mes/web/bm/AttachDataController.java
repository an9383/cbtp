package mes.web.bm;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mes.domain.bm.AttachDataVo;
import mes.domain.bm.DealCorpAdmVo;
import mes.domain.bm.PrcssBomAdmVo;
import mes.service.bm.AttachDataService;
import mes.web.ut.Utils;


@Controller
public class AttachDataController {
	private static final Logger logger = LoggerFactory.getLogger(AttachDataController.class);
	
	@Value("${file.attachDataPath}")
	private String filePath;	
	
	@Inject
	private AttachDataService attachDataService;

	//관련 자료 전체 조회
	@RequestMapping(value = "bm/attachDataAllList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> attachDataAllList(AttachDataVo attachDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		attachDataVo.setRegId(Utils.getUserId());
		logger.info("관련 자료 전체 조회 = " + attachDataVo);
		try {
			List<AttachDataVo> attachDataList = attachDataService.attachDataAllList(attachDataVo);
			jsonData.put("data", attachDataList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//관련 자료 조회
	@RequestMapping(value = "bm/attachDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipAttachDataList(AttachDataVo attachDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		attachDataVo.setRegId(Utils.getUserId());
		logger.info("관련 자료 조회 = " + attachDataVo);
		try {
			List<AttachDataVo> attachDataList = attachDataService.attachDataList(attachDataVo);
			jsonData.put("data", attachDataList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//관련자료 Create
	@RequestMapping(value = "/bm/attachDataCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipAttachDataCreate(AttachDataVo attachDataVo, MultipartHttpServletRequest multi, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("관련자료 등록 : " + attachDataVo);
		try {
			String attchPath = multi.getParameter("path").toString();
			String contents = multi.getParameter("contents");
			String attachCd = multi.getParameter("attachCd");
			String newFileName = "";
			String attachGubun = attachDataVo.getAttachGubun();
			String attachType = attachDataVo.getAttachType();
			int attachSeq = attachDataService.attachDataSeq(attachDataVo);
			
			String path = filePath + "/" + attachGubun + "/" + attchPath;
			File dir = new File(path);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			MultipartFile mFile = multi.getFile("fileNm");
			String fileName = mFile.getOriginalFilename(); //실제파일이름
			
			logger.info("실제 파일 이름 : " + fileName);
			logger.info("실제 파일 이름 : " + attachType);
			attachDataVo.setEtc5(fileName.substring(fileName.lastIndexOf(".") + 1));
			
			if(attachType!=null) {
				newFileName = attachCd + "_" + attachSeq + "_" + attachType + "." + fileName.substring(fileName.lastIndexOf(".") + 1);	
			} else {
				newFileName = attachCd + "_" + attachSeq + "." + fileName.substring(fileName.lastIndexOf(".") + 1);	
			}
			
			
			mFile.transferTo(new File(path + "/" + newFileName));
			
			attachDataVo.setAttachFn(fileName);
			logger.info("파일업로드 성공됨");
			
			String attachSeqStr = Integer.toString(attachSeq);
			attachDataVo.setAttachSeq(attachSeqStr);
			attachDataVo.setContents(contents);
			attachDataVo.setAttachPath(attchPath);
			attachDataVo.setRegId(Utils.getUserId());
			
			attachDataService.attachDataCreate(attachDataVo);
			logger.info("서비스값 가져오기");
			logger.info("등록후 vo:" + attachDataVo);
			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", "시스템 오류가 발생했습니다.");
		}
		
		return jsonData;
	}
	
	//관련자료 Create - CD
	@RequestMapping(value = "/bm/attachCdDataCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> attachCdDataCreate(AttachDataVo attachDataVo, MultipartHttpServletRequest multi, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("관련자료 CD 등록 : " + attachDataVo);
		try {
			String attchPath = multi.getParameter("attchPath").toString();
			String contents = multi.getParameter("contents");
			String attachCd = multi.getParameter("attachCd");
			String attachGubun = attachDataVo.getAttachGubun();
			String attachType = attachDataVo.getAttachType();
			String etc1 = attachDataVo.getEtc1();
			int attachSeq = attachDataService.attachDataSeq(attachDataVo);
			
			String path = filePath + "/" + attachGubun + "/" + attchPath;
			File dir = new File(path);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			MultipartFile mFile = multi.getFile("fileNm");
			String fileName = mFile.getOriginalFilename(); //실제파일이름
			
			String newFileName = "";
			newFileName = attachCd + "_" + etc1 + "_" + attachType + "_" + attachSeq + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
			
			mFile.transferTo(new File(path + "/" + newFileName));
			
			String attachSeqStr = Integer.toString(attachSeq);
			attachDataVo.setAttachSeq(attachSeqStr);
			attachDataVo.setAttachFn(fileName);
			attachDataVo.setEtc5(fileName.substring(fileName.lastIndexOf(".") + 1));
			attachDataVo.setContents(contents);
			attachDataVo.setAttachPath(attchPath);
			attachDataVo.setRegId(Utils.getUserId());
			
			attachDataService.attachDataCreate(attachDataVo);
			logger.info("등록후 vo:" + attachDataVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", "시스템 오류가 발생했습니다.");
		}
		
		return jsonData;
	}
	
	//개발관리-첨부 승인
	@RequestMapping(value ="bm/attachApproveUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> attachApproveUpdate(AttachDataVo attachDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("개발관리-첨부 승인: " + attachDataVo);
		try {
			attachDataVo.setUpdId(Utils.getUserId());
			attachDataService.attachApproveUpdate(attachDataVo);
			jsonData.put("result", "ok" );
		}catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//관련 자료 Update
	@RequestMapping(value = "/bm/attachDataUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipAttachDataUpdate(AttachDataVo attachDataVo, MultipartHttpServletRequest multi, HttpServletRequest request) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			MultipartFile mFile = multi.getFile("fileNm");
			String fileName = mFile.getOriginalFilename();   //실제파일이름
			logger.info("실제 파일 이름 : " + fileName);
			if(fileName != null) {
				String attchPath = multi.getParameter("path").toString();
				logger.info("YYYYMM : " + attchPath);
				String contents = multi.getParameter("contents");
				String attachSeq = multi.getParameter("attachSeq");
				String attachCd = multi.getParameter("attachCd");
				int seq = Integer.parseInt(attachSeq);
				logger.info("seq : " + seq);
				String newFileName = "";
				String attachGubun = multi.getParameter("attachGubun");
				if(attachDataVo.getAttachGubun().toString().equals("MO")) {
					attachGubun = "MO";
				}
				if(attachDataVo.getAttachGubun().toString().equals("MI")) {
					attachGubun = "MI";
				}
				attachDataVo.setAttachGubun(attachGubun);
						
				String path = filePath + "/" + attachGubun + "/" + attchPath;
				File dir = new File(path);
				if(!dir.exists()) {
					dir.mkdirs();
				}
				
				logger.info("실제 파일 이름 : " + fileName);
				newFileName = attachCd+"_"+seq + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
				mFile.transferTo(new File(path + "/" + newFileName));
				logger.info("파일업로드 성공됨");
				attachDataVo.setAttachFn(fileName);
				attachDataVo.setAttachPath(attchPath);
			}
			
			attachDataVo.setUpdId(Utils.getUserId());
			logger.info("관련 자료 수정: " + attachDataVo);
			attachDataService.attachDataUpdate(attachDataVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//관련 자료 Delete
	@RequestMapping(value = "/bm/attachDataDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipAttachDataDelete(AttachDataVo attachDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			logger.info("관련자료 삭제 : " + attachDataVo);
			attachDataService.attachDataDelete(attachDataVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//관련 자료 파일 Delete
	@RequestMapping(value = "/bm/moldAttachFileDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> moldAttachFileDelete(AttachDataVo attachDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			if(attachDataVo.getAttachFn()!=null) {
				String aa =  attachDataVo.getAttachFn();
				String bb =  aa.substring(aa.indexOf("."));
				String path = filePath + "/" + attachDataVo.getAttachGubun() + "/"+ attachDataVo.getAttachPath() + "/" + attachDataVo.getAttachSeq() + bb;
				logger.info("YYYYMM : "+path);
				
				File dir = new File(path);
				dir.delete();
				attachDataVo.setUpdId(Utils.getUserId());			
				logger.info("관련자료 파일삭제 : " + attachDataVo);
				attachDataService.attachFileDelete(attachDataVo);
				
			}
						
			attachDataVo.setUpdId(Utils.getUserId());			
			logger.info("관련자료 파일삭제 : " + attachDataVo);
			attachDataService.attachFileDelete(attachDataVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//관련 자료 파일 다운로드 (EQ)
	@RequestMapping(value = "/bm/equipAttachDataDownload", method = RequestMethod.GET)
	public @ResponseBody void downloadFile(HttpServletResponse res, HttpServletRequest req,
			@RequestParam(value = "attachFn") String attachFn, @RequestParam(value = "attachSeq") String attachSeq,@RequestParam(value = "attachCd") String attachCd,
			@RequestParam(value = "attachGubun") String attachGubun,AttachDataVo attachDataVo) throws Exception {
		try {
			int seq = Integer.parseInt(attachSeq);
			attachDataVo.setAttachCd(attachCd);
			attachDataVo.setAttachGubun(attachGubun);
			
			String dFile = attachFn;
			String newFileName = seq + "." + dFile.substring(dFile.lastIndexOf(".") + 1);

			String path = filePath + "/EQ/" + attachDataService.dtrFilePath(attachDataVo) + "/" + newFileName;
			
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
	
	//관련 자료 SEQ,NAME(attachSeq)
	@RequestMapping(value = "bm/attachDataSeq", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> attachDataSeq(AttachDataVo attachDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			int attachSeq = attachDataService.attachDataSeq(attachDataVo);
			
			String regId = Utils.getUserNm();
			jsonData.put("name", regId);
			jsonData.put("seq", attachSeq);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//관련 자료 cd(attachCd)
	@RequestMapping(value = "bm/attachDataCd", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> attachDataCd(AttachDataVo attachDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			String attachCd = attachDataService.attachDataCd(attachDataVo);
			jsonData.put("attachCd", attachCd);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	// 관련 자료 파일 다운로드 (기본)
	@RequestMapping(value = "/bm/attachDataDownload", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> downloadFile(HttpServletResponse res , HttpServletRequest req,AttachDataVo attachDataVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			int seq = Integer.parseInt(attachDataVo.getAttachSeq());

			String attachCd = attachDataVo.getAttachCd();
			String attachGubun = attachDataVo.getAttachGubun();
			
			String dFile = attachDataService.getAttachFileNm(attachDataVo);
			
			String newFileName = attachCd +"_"+seq + "." + dFile.substring(dFile.lastIndexOf(".") + 1);
			logger.info("newFileName:"+newFileName);

			String path = filePath + '/' + attachGubun + '/' + attachDataService.dtrFilePath(attachDataVo) + "/" + newFileName;

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
		return jsonData;
	}
	
	// 관련 자료 파일 다운로드 (CD)
	@RequestMapping(value = "/bm/attachDataCdDownload", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> attachDataCdDownload(HttpServletResponse res, HttpServletRequest req, AttachDataVo attachDataVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			int attachSeq = Integer.parseInt(attachDataVo.getAttachSeq());
			String attachCd = attachDataVo.getAttachCd();
			String attachGubun = attachDataVo.getAttachGubun();
			String etc1 = attachDataVo.getEtc1();
			String attachType = attachDataVo.getAttachType();
			
			String dFile = attachDataService.getAttachFileNm(attachDataVo);
			
			String newFileName = attachCd + "_" + etc1 + "_" + attachType + "_" + attachSeq + "." + dFile.substring(dFile.lastIndexOf(".") + 1);
			logger.info("newFileName:" + newFileName);

			String path = filePath + '/' + attachGubun + '/' + attachDataService.dtrFilePath(attachDataVo) + "/" + newFileName;

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
		return jsonData;
	}
	
	
	// 관련 자료 파일 다운로드(MI)
	@RequestMapping(value = "/bm/measureAttachDataDownload", method = RequestMethod.GET)
	public @ResponseBody void measureAttachDataDownload(HttpServletResponse res, HttpServletRequest req,
			@RequestParam(value = "attachFn") String attachFn, @RequestParam(value = "attachSeq") String attachSeq, @RequestParam(value = "attachCd") String attachCd,
			@RequestParam(value = "attachGubun") String attachGubun, @RequestParam(value = "attachType") String attachType, AttachDataVo attachDataVo) throws Exception {
		try {
			int seq = Integer.parseInt(attachSeq);
			attachDataVo.setAttachCd(attachCd);
			attachDataVo.setAttachGubun(attachGubun);
			attachDataVo.setAttachFn(URLDecoder.decode(attachFn,"UTF-8"));
			
			String dFile = attachDataService.getAttachFileNm(attachDataVo);
			
			String newFileName ="";
			if(attachType != null) {
				newFileName = attachCd +"_"+ seq +"_" + attachType + "." + dFile.substring(dFile.lastIndexOf(".") + 1);
				logger.info("index:"+dFile.lastIndexOf("."));
				logger.info("pos:"+dFile.substring(dFile.lastIndexOf(".") + 1));
				                                                            
			} else {
				newFileName = attachCd +"_"+ seq + "." + dFile.substring(dFile.lastIndexOf(".") + 1);	
			}

			String path = filePath + "/MI/" + attachDataService.dtrFilePath(attachDataVo) + "/" + newFileName;

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
	
	
	// 관련 자료 파일 다운로드 (MS)
	@RequestMapping(value = "/bm/msAttachDataDownload", method = RequestMethod.GET)
	public @ResponseBody void msAttachDataDownload(HttpServletResponse res, HttpServletRequest req,
			@RequestParam(value = "attachFn") String attachFn, @RequestParam(value = "attachSeq") String attachSeq, @RequestParam(value = "attachCd") String attachCd,
			@RequestParam(value = "attachGubun") String attachGubun,AttachDataVo attachDataVo) throws Exception {
		try {
			int seq = Integer.parseInt(attachSeq);
			attachDataVo.setAttachCd(attachCd);
			attachDataVo.setAttachGubun("MS");

			String dFile = attachDataService.getAttachFileNm(attachDataVo);
			String newFileName = attachCd+"_"+seq + "." + dFile.substring(dFile.lastIndexOf(".") + 1);

			String path = filePath + "/MS/" + attachDataService.dtrFilePath(attachDataVo) + "/" + newFileName;

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
	
	// 관련 자료 파일 다운로드 (TA)
	@RequestMapping(value = "/bm/taAttachDataDownload", method = RequestMethod.GET)
	public @ResponseBody void taAttachDataDownload(HttpServletResponse res, HttpServletRequest req,
			@RequestParam(value = "attachFn") String attachFn, @RequestParam(value = "attachSeq") String attachSeq, @RequestParam(value = "attachCd") String attachCd,
			AttachDataVo attachDataVo) throws Exception {
		try {
			int seq = Integer.parseInt(attachSeq);
			
			attachDataVo.setAttachCd(attachCd);
			attachDataVo.setAttachGubun("TA");

			String dFile = attachDataService.getAttachFileNm(attachDataVo);
			String newFileName = attachCd+ "_" + seq + "." + dFile.substring(dFile.lastIndexOf(".") + 1);

			String path = filePath + "/TA/" + attachDataService.dtrFilePath(attachDataVo) + "/" + newFileName;

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
