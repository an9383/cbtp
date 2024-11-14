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
import mes.domain.qm.ItemFaultyAdmVo;
import mes.domain.qm.ItemFaultyJdgAdmVo;
import mes.domain.qm.ItemInspectAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.qm.ItemFaultyAdmService;
import mes.service.qm.ItemFaultyJdgAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class ItemFaultyAdmController {

	@Inject
	private static final Logger logger = LoggerFactory.getLogger(ItemFaultyAdmController.class);
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private ItemFaultyAdmService  itemFaultyAdmService;
	
	@Value("${file.itemInspectFaulty}")
	private String file_itemInspect_faulty_Path;
	
	
	// 품질관리(부적합관리) 메인
	@RequestMapping(value = "/qmsc0020", method = RequestMethod.GET)
	public String qmsc0040(Locale locale, Model model, HttpServletRequest request) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("003"); // 사용여부
		List<CommonCodeAdmVo> admDeptList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("admDept", admDeptList);
		
		commonCodeVo.setBaseGroupCd("059"); // 부적합처리
		List<CommonCodeAdmVo> faultyPcsList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("faultyPcs", faultyPcsList);
		
		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());
		
		//승인관리
		String menuUrl = "";
		String requestURI = request.getRequestURI();
		menuUrl = requestURI.substring(requestURI.length()-8, requestURI.length());
		model.addAttribute("menuUrl", menuUrl);
		model.addAttribute("userId", request.getSession().getAttribute("userId").toString());
		
		return "qm/qmsc0020";
	}
	
	//부적합관리 목록조회 master list
	@RequestMapping(value="qm/itemFaultyAdmMasterList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemFaultyAdmMasterList(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("부적합관리 목록조회");
			List<ItemFaultyAdmVo> list =  itemFaultyAdmService.itemFaultyAdmMasterList(itemFaultyAdmVo);
			jsonData.put("data",list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//부적합관리 목록조회
	@RequestMapping(value="qm/itemFaultyAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemFaultyAdmList(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("부적합관리 목록조회");
			List<ItemFaultyAdmVo> list =  itemFaultyAdmService.itemFaultyAdmList(itemFaultyAdmVo);
			jsonData.put("data",list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//부적합관리 상세조회
	@RequestMapping(value="qm/itemFaultyAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemFaultyAdmRead(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			ItemFaultyAdmVo vo =  itemFaultyAdmService.itemFaultyAdmRead(itemFaultyAdmVo);
			logger.info("vo"+vo);
			String faultyImage1="";
			String faultyImage2="";
			if(vo==null) {
				vo = new ItemFaultyAdmVo();
			}else {
				if(vo.getFaultyImage1()!=null) {
					faultyImage1 = new String(Base64.encodeBase64(vo.getFaultyImage1()));
				}
				
				if(vo.getFaultyImage2()!=null) {
					faultyImage2 = new String(Base64.encodeBase64(vo.getFaultyImage2()));
				}
			}
			
			
			jsonData.put("faultyImage1", faultyImage1);
			jsonData.put("faultyImage2", faultyImage2);
			
			
			jsonData.put("data",vo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//부적합관리 등록
	@RequestMapping(value="qm/itemFaultyAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemFaultyAdmCreate(MultipartHttpServletRequest multi,  ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("부적합관리 등록:"+itemFaultyAdmVo);
			
			uploadImg(multi, itemFaultyAdmVo);
			uploadFile(multi, itemFaultyAdmVo);
			
			itemFaultyAdmVo.setRegId(Utils.getUserId());
			itemFaultyAdmService.itemFaultyAdmCreate(itemFaultyAdmVo);
			
			logger.info("사진리스트 없음!!!");
			ItemFaultyAdmVo imgVo =  itemFaultyAdmService.itemFaultyImageList(itemFaultyAdmVo);
			
			logger.info("vo:"+imgVo);
			if(imgVo != null) {
				if (imgVo.getFaultyImage1() != null) {
					String faultyImage1 = new String(Base64.encodeBase64(imgVo.getFaultyImage1()));
					jsonData.put("faultyImage1", faultyImage1);
				}
				if (imgVo.getFaultyImage2() != null) {
					String faultyImage2 = new String(Base64.encodeBase64(imgVo.getFaultyImage2()));
					jsonData.put("faultyImage2", faultyImage2);
				}
				if(imgVo.getFaultyFile1Nm() != null) {
					jsonData.put("faultyFile1", imgVo.getFaultyFile1Nm());
				}
				if(imgVo.getFaultyFile2Nm() != null) {
					jsonData.put("faultyFile2", imgVo.getFaultyFile2Nm());
				}
			}
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//부적합관리 수정
	@RequestMapping(value="qm/itemFaultyAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> itemFaultyAdmUpdate(MultipartHttpServletRequest multi,  ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("부적합관리 수정:"+itemFaultyAdmVo);
			
			uploadImg(multi, itemFaultyAdmVo);
			uploadFile(multi, itemFaultyAdmVo);
			
			itemFaultyAdmVo.setUpdId(Utils.getUserId());
			logger.info("vo:"+itemFaultyAdmVo);
			itemFaultyAdmService.itemFaultyAdmUpdate(itemFaultyAdmVo);
		
			
			//사진 및 파일명 가져오기
			ItemFaultyAdmVo imgVo =  itemFaultyAdmService.itemFaultyImageList(itemFaultyAdmVo);
			if(imgVo != null) {
				if (imgVo.getFaultyImage1() != null) {
					String faultyImage1 = new String(Base64.encodeBase64(imgVo.getFaultyImage1()));
					jsonData.put("faultyImage1", faultyImage1);
				}
				if (imgVo.getFaultyImage2() != null) {
					String faultyImage2 = new String(Base64.encodeBase64(imgVo.getFaultyImage2()));
					jsonData.put("faultyImage2", faultyImage2);
				}
				if(imgVo.getFaultyFile1Nm() != null) {
					jsonData.put("faultyFile1", imgVo.getFaultyFile1Nm());
				}
				if(imgVo.getFaultyFile2Nm() != null) {
					jsonData.put("faultyFile2", imgVo.getFaultyFile2Nm());
				}
			}
				
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//수입검사성적서 업로드
	public void uploadFile(MultipartHttpServletRequest multi, ItemFaultyAdmVo itemFaultyAdmVo) throws Exception {
		
		try {
			String inSlipNo = multi.getParameter("inSlipNo").toString();
			String inSlipSeq = multi.getParameter("inSlipSeq").toString();
			
			String newFileName = "";
			String path = file_itemInspect_faulty_Path+ "/" + inSlipNo + "/" +inSlipSeq;
			
			File dir = new File(path);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			int flag=0;
			
			for(int i=1; i<3; i++) {
				logger.info("flag값:"+flag);
				MultipartFile mFile = multi.getFile("fileNm"+i);
				String fileName = mFile.getOriginalFilename();
				logger.info(i+"번째 파일 명:"+fileName);
				
				switch(flag) {
				case 0:
					itemFaultyAdmVo.setFaultyFile1Nm(fileName);
					logger.info("flag값이 0임");
					logger.info("vo에 들어가는 파일명:"+itemFaultyAdmVo.getFaultyFile1Nm());
					break;
				case 1:
					itemFaultyAdmVo.setFaultyFile2Nm(fileName);
					logger.info("flag값이 1임");
					logger.info("vo에 들어가는 파일명:"+itemFaultyAdmVo.getFaultyFile2Nm());
					break;
				}
				flag++;
				
				newFileName = inSlipSeq +"." +fileName.substring(fileName.lastIndexOf(".")+1);
				
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
	
	//부적합관리 이미지 업로드
	public void uploadImg(MultipartHttpServletRequest multi, ItemFaultyAdmVo itemFaultyAdmVo) throws Exception {
		try {
			String fileName = "";
			for(int i=1; i<=2; i++) {
				MultipartFile mFile = multi.getFile("imgAdd"+i);
				fileName = mFile.getOriginalFilename(); //원본 파일 명
				
				if (mFile == null || mFile.isEmpty()) {
					logger.info("파일 바이트:"+mFile.getBytes());
				}else {
					
					switch(i) {
					case 1 :
						itemFaultyAdmVo.setFaultyImage1(mFile.getBytes()); //원본 파일 경로
						itemFaultyAdmVo.setFaultyImage1Nm(fileName);  //원본 파일 명 
						break;
					case 2 :
						itemFaultyAdmVo.setFaultyImage2(mFile.getBytes());
						itemFaultyAdmVo.setFaultyImage2Nm(fileName);
						break;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	
	//부적합관리 이미지삭제
	@RequestMapping(value="qm/itemFaultyImageDelete", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> itemFaultyImageDelete(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			itemFaultyAdmService.itemFaultyImageDelete(itemFaultyAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
		
	}
	
	//파일 다운로드
	@RequestMapping(value = "qm/downloadFile2", method = RequestMethod.GET)
	public @ResponseBody void downloadFile(HttpServletResponse res, HttpServletRequest req,
		    @RequestParam(value = "inSlipNo") String inSlipNo,
		    @RequestParam(value = "inSlipSeq") String inSlipSeq,
		    @RequestParam(value = "value") String value,
		    ItemFaultyAdmVo itemFaultyAdmVo) throws Exception {
		try {

			itemFaultyAdmVo = itemFaultyAdmService.itemFaultyImageList(itemFaultyAdmVo);
			
			String dFile="";
			if(value.equals("1")) {
				dFile = itemFaultyAdmVo.getFaultyFile1Nm();
			} else if(value.equals("2")) {
				dFile = itemFaultyAdmVo.getFaultyFile2Nm();
			}
			
			String newFileName = inSlipSeq +"." +dFile.substring(dFile.lastIndexOf(".")+1);

			String path = file_itemInspect_faulty_Path +"/"+ inSlipNo + "/" + inSlipSeq + "/" + newFileName;

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
