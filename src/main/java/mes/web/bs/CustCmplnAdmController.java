package mes.web.bs;

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
import mes.domain.bs.CustCmplnAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.bs.CustCmplnAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class CustCmplnAdmController {
	
	@Inject
	private CustCmplnAdmService custCmplnAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Value("${file.custCmplnAdm}")
	private String file_custCmpln_adm_Path;
	
	private static final Logger logger = LoggerFactory.getLogger(CustCmplnAdmController.class);

	
	//공정정보관리 메인
	@RequestMapping(value = "/bssc0120", method = RequestMethod.GET)
	public String prcssCodeBomMain(Locale locale, Model model) throws Exception {
		try {
			model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
			model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
			model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));		
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
//			commonCodeVo.setBaseGroupCd("001"); // 사용여부
//			commonCodeVo.setUseYn("001");
//			List<CommonCodeAdmVo> useYnList = commonCodeAdmService.CommonCodeList(commonCodeVo);
//			model.addAttribute("useYn", useYnList );
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "bs/bssc0120";
	}
	
	
	//목록조회
	@RequestMapping(value = "bs/custCmplnAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> custCmplnAdmList(CustCmplnAdmVo custCmplnAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("목록조회: "+custCmplnAdmVo);
		try {
			System.out.print("리스트 확인용	:	"+custCmplnAdmVo);
			List<CustCmplnAdmVo> custCmplnAdmList = custCmplnAdmService.custCmplnAdmList(custCmplnAdmVo);
			jsonData.put("data", custCmplnAdmList);
			jsonData.put("result", "ok");
		} catch(Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		
		return jsonData;
	}
	
	//고객불만 상세보기
	@RequestMapping(value = "bs/custCmplnAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> custCmplnAdmRead(CustCmplnAdmVo custCmplnAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("고객불만상세조회: " + custCmplnAdmVo);
			custCmplnAdmVo = custCmplnAdmService.custCmplnAdmRead(custCmplnAdmVo);
			logger.info("상세보기 getFaultyCheckFn 확인>>>>>>"+custCmplnAdmVo.getFaultyCheckFn());
			jsonData.put("data", custCmplnAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//고객불만 등록
	@RequestMapping(value = "bs/custCmplnAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> custCmplnAdmCreate(CustCmplnAdmVo custCmplnAdmVo, MultipartHttpServletRequest multi)throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		String date=DateUtil.getToday("yyyymmdd"); 
		String seq="";
		try {
			logger.info("고객불만 등록 = "+ custCmplnAdmVo);
			uploadFile2(multi, custCmplnAdmVo);
			seq=custCmplnAdmService.locNoSeq(date);
			custCmplnAdmVo.setCustNo(date+"-"+seq);
			custCmplnAdmVo.setRegDate(DateUtil.getToday("YYYYMMDD"));
			custCmplnAdmVo.setRegId(Utils.getUserId());
			custCmplnAdmService.custCmplnAdmCreate(custCmplnAdmVo);
			
			CustCmplnAdmVo fileNameList = custCmplnAdmService.getInspectFileNm(custCmplnAdmVo);
			jsonData.put("faultyCheckFn", fileNameList.getFaultyCheckFn());
			
			jsonData.put("result", "ok");
					
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//고객불만 수정
	@RequestMapping(value = "bs/custCmplnAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> custCmplnAdmUpdate(CustCmplnAdmVo custCmplnAdmVo, MultipartHttpServletRequest multi)throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
			uploadFile2(multi, custCmplnAdmVo);
			custCmplnAdmVo.setUpdId(Utils.getUserId());
			custCmplnAdmVo.setUpdDate(DateUtil.getToday("YYYYMMDD"));
			custCmplnAdmService.custCmplnAdmUpdate(custCmplnAdmVo);
			
			CustCmplnAdmVo fileNameList = custCmplnAdmService.getInspectFileNm(custCmplnAdmVo);
			jsonData.put("faultyCheckFn", fileNameList.getFaultyCheckFn());
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//고객불만(검토부서)수정
	@RequestMapping(value = "bs/custCmplnAdmSideUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> custCmplnAdmSideUpdate(CustCmplnAdmVo custCmplnAdmVo)throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
			custCmplnAdmVo.setUpdId(Utils.getUserId());
			custCmplnAdmVo.setUpdDate(DateUtil.getToday("YYYYMMDD"));
			custCmplnAdmService.custCmplnAdmUpdate(custCmplnAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//고객불만(재발방지)수정
	@RequestMapping(value = "bs/relapseUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> relapseUpdate(CustCmplnAdmVo custCmplnAdmVo, MultipartHttpServletRequest multi)throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		
		try {
			uploadFile3(multi, custCmplnAdmVo);
			
			custCmplnAdmVo.setUpdId(Utils.getUserId());
			custCmplnAdmVo.setUpdDate(DateUtil.getToday("YYYYMMDD"));
			custCmplnAdmService.custCmplnAdmUpdate(custCmplnAdmVo);
			
			CustCmplnAdmVo fileNameList = custCmplnAdmService.getInspectFileNm(custCmplnAdmVo);
			jsonData.put("caNo", fileNameList.getCaNo());
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//불량확인서 업로드
	public void uploadFile2(MultipartHttpServletRequest multi, CustCmplnAdmVo custCmplnAdmVo) throws Exception {
		
		try {
			String custNo = multi.getParameter("custNo").toString();
			
			String newFileName = "";
			String path = file_custCmpln_adm_Path+ "/" + custNo;
			logger.info("경로>>>>>>>>>>>>>>>>>>"+path);
			File dir = new File(path);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			MultipartFile mFile = multi.getFile("fileNm1");
			logger.info("파일>>>>>>"+mFile.isEmpty());
			String fileName = mFile.getOriginalFilename();
			custCmplnAdmVo.setFaultyCheckFn(fileName);
			
			newFileName = custNo +"." +fileName.substring(fileName.lastIndexOf(".")+1);
			logger.info("업로드11111111 실행 확인>>>>>>"+custCmplnAdmVo.getFaultyCheckFn());
			try {
				mFile.transferTo(new File(path + "/" + newFileName));
				logger.info("업로드22222222 실행 확인>>>>>>"+custCmplnAdmVo.getFaultyCheckFn());
			} catch (Exception e) {
				e.printStackTrace();
			
			}
		} catch (Exception e) {
			
		}
	}
		
	//시정조치No 업로드
	public void uploadFile3(MultipartHttpServletRequest multi, CustCmplnAdmVo custCmplnAdmVo) throws Exception {
		
		try {
			String custNo = multi.getParameter("custNo").toString();
			
			String newFileName = "";
			String path = file_custCmpln_adm_Path+ "/" + custNo;
			logger.info("경로>>>>>>>>>>>>>>>>>>"+path);
			File dir = new File(path);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			MultipartFile mFile = multi.getFile("fileNm2");
			logger.info("파일>>>>>>"+mFile.isEmpty());
			String fileName = mFile.getOriginalFilename();
			custCmplnAdmVo.setCaNo(fileName);
			
			newFileName = custNo +"." +fileName.substring(fileName.lastIndexOf(".")+1);
			
			try {
				mFile.transferTo(new File(path + "/" + newFileName));
			} catch (Exception e) {
				e.printStackTrace();
			
			}
		} catch (Exception e) {
			
		}
	}
	
	//고객불만 파일삭제
	@RequestMapping(value="bs/custCmplnAdmDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> custCmplnAdmDelete(CustCmplnAdmVo custCmplnAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("삭제11111111 getFaultyCheckFn 확인>>>>>>"+custCmplnAdmVo.getFaultyCheckFn());
			custCmplnAdmService.custCmplnAdmDelete(custCmplnAdmVo);
			logger.info("삭제 Vo 확인>>>>>>"+custCmplnAdmVo);
			logger.info("삭제 getFaultyCheckFn 확인>>>>>>"+custCmplnAdmVo.getFaultyCheckFn());
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//고객불만 재발방지 파일삭제
	@RequestMapping(value="bs/custCmplnAdmDelete2", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> custCmplnAdmDelete2(CustCmplnAdmVo custCmplnAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			custCmplnAdmService.custCmplnAdmDelete2(custCmplnAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	
	
	//불량확인서 다운로드
	@RequestMapping(value = "bs/downloadFile", method = RequestMethod.GET)
	public @ResponseBody void downloadFile(HttpServletResponse res, HttpServletRequest req, 
		    @RequestParam(value = "custNo") String custNo
		   ) throws Exception {
		try {
			CustCmplnAdmVo custCmplnAdmVo = new  CustCmplnAdmVo();
			custCmplnAdmVo.setCustNo(custNo);
			 
			String dFile =  custCmplnAdmService.custCmplnAdmRead(custCmplnAdmVo).getFaultyCheckFn().toString();			
					
			String newFileName = custCmplnAdmVo.getCustNo().toString()  +"." +dFile.substring(dFile.lastIndexOf(".")+1);

			String path = file_custCmpln_adm_Path +"/"+ custCmplnAdmVo.getCustNo().toString() + "/" + newFileName;

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
	
	//시정조치No 다운로드
	@RequestMapping(value = "bs/downloadFile2", method = RequestMethod.GET)
	public @ResponseBody void downloadFile2(HttpServletResponse res, HttpServletRequest req, 
		    @RequestParam(value = "custNo") String custNo
		   ) throws Exception {
		try {
			CustCmplnAdmVo custCmplnAdmVo = new  CustCmplnAdmVo();
			custCmplnAdmVo.setCustNo(custNo);
			 
			String dFile =  custCmplnAdmService.custCmplnAdmRead(custCmplnAdmVo).getCaNo().toString();		
					
			String newFileName = custCmplnAdmVo.getCustNo().toString()  +"." +dFile.substring(dFile.lastIndexOf(".")+1);

			String path = file_custCmpln_adm_Path +"/"+ custCmplnAdmVo.getCustNo().toString() + "/" + newFileName;

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
	
	
	
	//업로드2
		/*public void uploadFile(MultipartHttpServletRequest multi, CustCmplnAdmVo custCmplnAdmVo) throws Exception {
			try {
				String custNo = multi.getParameter("custNo").toString();
				
				String newFileName = "";
				String path = file_custCmpln_adm_Path+ "/" + custNo;
				
				File dir = new File(path);
				if(!dir.exists()) {
					dir.mkdirs();
				}
				
				for(int i=1; i<=2; i++) {
					MultipartFile mFile = multi.getFile("fileNm"+i);
//					logger.info(mFile.getName());
//					logger.info("파일>>>>>>"+mFile.isEmpty());
//					if(mFile.isEmpty()) {
//						logger.info("파일은 비워져있어");
//						switch (i) {
//						case 1:
//							custCmplnAdmVo.setFaultyCheckFn("");
//							break;
//						case 2:
//							custCmplnAdmVo.setCaNo("");
//							break;
//						}
						
//					}
//				else {
						String fileName = mFile.getOriginalFilename();
//						newFileName = custNo+"_"+ i +"." +fileName.substring(fileName.lastIndexOf(".")+1);
						newFileName = custNo +"." +fileName.substring(fileName.lastIndexOf(".")+1);
						logger.info("성공적으로 넘어왔어");
						switch (i) {
						case 1:
							custCmplnAdmVo.setFaultyCheckFn(fileName);
							break;
						case 2:
							custCmplnAdmVo.setCaNo(fileName);
							break;
						}
						
						try {
							mFile.transferTo(new File(path + "/" + newFileName));
						} catch (Exception e) {
							e.printStackTrace();
						}
//					}
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}*/
	
}
