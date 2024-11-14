package mes.web.cm;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
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

import mes.domain.cm.BbsVo;
import mes.service.cm.BbsService;
import mes.web.ut.Utils;

@Controller
public class BbsController {

	private static final Logger logger = LoggerFactory.getLogger(BbsController.class);

	@Value("${file.bbsPath}")
	private String file_bbs_Path;

	@Inject
	private BbsService bbsService;

	@RequestMapping(value = "/cmsc0010")
	public String BbsMain() {
		return "cm/cmsc0010";
	}

	// 게시판 리스트 출력
	@RequestMapping(value = "cm/bbsList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> BbsList(BbsVo bbsVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			List<BbsVo> bbsList = bbsService.BbsList();

			jsonData.put("data", bbsList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 게시판 상세보기 출력
	@RequestMapping(value = "cm/bbsRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> BaseInfoItRead(BbsVo bbsVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			bbsVo = bbsService.BbsRead(bbsVo);
			if (bbsVo.getAttchFileNm1() == null) {
				bbsVo.setAttchFileNm1("");
			}
			if (bbsVo.getAttchFileNm2() == null) {
				bbsVo.setAttchFileNm2("");
			}
			if (bbsVo.getAttchFileNm3() == null) {
				bbsVo.setAttchFileNm3("");
			}
			jsonData.put("data", bbsVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 게시판 등록
	@RequestMapping(value = "cm/bbsCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> BbsCreate(MultipartHttpServletRequest multi, BbsVo bbsVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			
			bbsVo.setRegId(Utils.getUserId());
			bbsVo.setBbsNo(bbsService.BbsNO());
			bbsVo.setUpBbsNo(bbsService.BbsNO());
			bbsVo.setBbsReSeq(1);
			bbsVo.setBbsReLevel(0);
			uploadFile(multi, bbsVo);
			logger.info("게시판 등록 = "+ bbsVo);
			bbsService.BbsCreate(bbsVo);
			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 게시판 답변 등록
	@RequestMapping(value = "cm/bbsReply", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> BbsReply(MultipartHttpServletRequest multi, BbsVo bbsVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		try {
			logger.info("게시판 답변 등록 : "+bbsVo);
			bbsVo.setRegId(Utils.getUserId());
			bbsVo.setUpBbsNo(bbsService.upBbsNo(bbsVo));
			bbsVo.setBbsReSeq(bbsService.BbsReSeq(bbsVo));
			int bbsReL=bbsService.BbsReLevel(bbsVo);
			if(bbsReL==1) {
				bbsVo.setBbsReLevel(1);
			}else if(bbsReL>1) {
				bbsVo.setBbsReLevel(2);
			}
			
			bbsVo.setBbsNo(bbsService.BbsNO());
	
			uploadFile(multi, bbsVo);
			logger.info("게시판 답변 등록= "+ bbsVo);
			bbsService.BbsCreate(bbsVo);
			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	//게시글 파일 업로드
	public void uploadFile(MultipartHttpServletRequest multi, BbsVo bbsVo) throws Exception {
		try {
			String attchPath = multi.getParameter("attchPath").toString();
			String newFileName = "";
			int bbsNo = bbsVo.getBbsNo();
			String path = file_bbs_Path + "/" + attchPath;

			File dir = new File(path);

			if (!dir.exists()) {
				dir.mkdirs();
			}

			for (int i = 1; i <= 3; i++) {
				MultipartFile mFile = multi.getFile("tf" + i);

				String fileName = mFile.getOriginalFilename();

				if (!(fileName == null || fileName == "")) {
					newFileName = bbsNo + "_" + i + "." + fileName.substring(fileName.lastIndexOf(".") + 1);

					switch (i) {
					case 1:
						bbsVo.setAttchFileNm1(fileName);
						break;
					case 2:
						bbsVo.setAttchFileNm2(fileName);
						break;
					case 3:
						bbsVo.setAttchFileNm3(fileName);
					}

					try {
						mFile.transferTo(new File(path + "/" + newFileName));
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		} catch (Exception e) {
		}
	}

	// 게시글 파일 다운로드
	@RequestMapping(value = "cm/downloadFile", method = RequestMethod.GET)
	public @ResponseBody void downloadFile(HttpServletResponse res, HttpServletRequest req,
		    @RequestParam(value = "fileNo") String fileNo,BbsVo bbsVo) throws Exception {
		try {

			//String dFile = attchFileNm;
			String dFile = bbsService.BbsFileNm(bbsVo);
			
			String newFileName = bbsVo.getBbsNo() + "_" + fileNo + "." + dFile.substring(dFile.lastIndexOf(".") + 1);

			String path = file_bbs_Path +"\\"+ bbsService.BbsFilePath(bbsVo) + "\\" + newFileName;

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

	// 게시판 수정
	@RequestMapping(value = "cm/bbsUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bbsUpdate(MultipartHttpServletRequest multi, BbsVo bbsVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			uploadFile(multi, bbsVo);
			bbsVo.setUpdId(Utils.getUserId());
			logger.info("게시판 수정" + bbsVo);
			bbsService.BbsUpdate(bbsVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
	
	// 게시판 삭제
	@RequestMapping(value = "cm/bbsDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> bbsDel(BbsVo bbsVo)
			throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			int count=bbsService.BbsDelete(bbsVo);
			
			logger.info("게시판 삭제 후" + bbsVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	
	// 게시판 댓글 리스트 출력
	@RequestMapping(value = "cm/bbsReList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> BbsReList(BbsVo bbsVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		try {
			List<BbsVo> bbsReList = bbsService.BbsReList(bbsVo);
			jsonData.put("data", bbsReList);
			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

	// 댓글 등록
	@RequestMapping(value = "cm/bbsReCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> BbsReCreate(BbsVo bbsVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<>();
		logger.info("컨트롤러 구동");
		try {

			bbsVo.setRegId(Utils.getUserId());
			bbsVo.setBbsSeq(bbsService.BbsCommentSeq(bbsVo));
			bbsService.BbsReCreate(bbsVo);
			jsonData.put("result", "ok");

		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}

}
