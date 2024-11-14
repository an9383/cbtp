package mes.web.io;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.io.InOutWhsAdmVo;
import mes.domain.io.OutsourcingAdmVo;
import mes.domain.io.PurchaseOrderReturnVo;
import mes.domain.qm.ItemInspectAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.io.OutsourcingAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class OutsourcingAdmController {
	
	private static final Logger logger = LoggerFactory.getLogger(OutsourcingAdmController.class);

	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	@Inject
	private OutsourcingAdmService outsourcingAdmService;
	
	@Value("${file.insrcReportPath}")
	private String insrcReportPath;	
	

	// 구매자재관리(외주발주등록) 메인
	@RequestMapping(value = "/iosc0070", method = RequestMethod.GET)
	public String iosc0070(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("071"); // 사급/도급
		List<CommonCodeAdmVo> outsrcGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("outsrcGubun", outsrcGubunList);

		model.addAttribute("userNumber", Utils.getUserNumber());
		model.addAttribute("userNm", Utils.getUserNm());

		return "io/iosc0070";
	}
	
	// 구매자재관리(외주발주마감) 메인
	@RequestMapping(value = "/iosc0080", method = RequestMethod.GET)
	public String iosc0080(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "io/iosc0080";
	}
	
	// 구매자재관리(외주발주미입고현황) 메인
	@RequestMapping(value = "/iosc0090", method = RequestMethod.GET)
	public String iosc0090(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		return "io/iosc0090";
	}
	
	// 외주발주등록 목록조회
	@RequestMapping(value = "io/outsourcingAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outsourcingAdmList(OutsourcingAdmVo outsourcingAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("외주발주등록 목록조회: " + outsourcingAdmVo);
		try {
			List<OutsourcingAdmVo> OutsourcingAdmList = outsourcingAdmService.outsourcingAdmList(outsourcingAdmVo);
			jsonData.put("data", OutsourcingAdmList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 외주발주등록 상세조회
	@RequestMapping(value = "io/outsourcingAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outsourcingAdmRead(OutsourcingAdmVo outsourcingAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("외주발주등록 상세조회: " + outsourcingAdmVo);
		try {
			OutsourcingAdmVo vo;
			if(outsourcingAdmVo.getOutsrcNo()==null || outsourcingAdmVo.getOutsrcNo().equals("")) {
				vo = new OutsourcingAdmVo();
			}else {
				vo = outsourcingAdmService.outsourcingAdmRead(outsourcingAdmVo);
			}
			
			jsonData.put("data", vo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 외주발주등록 등록
	@RequestMapping(value = "io/outsourcingAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outsourcingAdmCreate(OutsourcingAdmVo outsourcingAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("외주발주등록 등록: " + outsourcingAdmVo);
		try {
			outsourcingAdmVo.setRegId(Utils.getUserId());
			outsourcingAdmVo.setOutsrcStatus("006");
			outsourcingAdmService.outsourcingAdmCreate(outsourcingAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 외주발주등록 수정
	@RequestMapping(value = "io/outsourcingAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outsourcingAdmUpdate(OutsourcingAdmVo outsourcingAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("외주발주등록 수정: " + outsourcingAdmVo);
		try {
			outsourcingAdmVo.setUpdId(Utils.getUserId());
			outsourcingAdmService.outsourcingAdmUpdate(outsourcingAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 외주발주등록 삭제
	@RequestMapping(value = "io/outsourcingAdmDelete", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outsourcingAdmDelete(OutsourcingAdmVo outsourcingAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("외주발주등록 삭제: " + outsourcingAdmVo);
		try {
			outsourcingAdmService.outsourcingAdmDelete(outsourcingAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}

	//외주발주 생성
	@RequestMapping(value="io/getOutsrcNo", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getOutsrcNo(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			String toDay = DateUtil.getToday("YYMMdd");
			outsourcingAdmVo.setToday(toDay);
			String outsrcSeq = outsourcingAdmService.getOutsrcNo(outsourcingAdmVo);
			String outsrcNo = "S"+toDay+"-"+outsrcSeq;
			jsonData.put("result", "ok");
			jsonData.put("data", outsrcNo);
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 외주발주미입고현황 목록조회
	@RequestMapping(value = "io/outsourcingStatusList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outsourcingStatusList(OutsourcingAdmVo outsourcingAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("외주발주미입고현황 목록조회: " + outsourcingAdmVo);
		try {
			List<OutsourcingAdmVo> list = outsourcingAdmService.outsourcingStatusList(outsourcingAdmVo);
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 외주발주 마감상태 수정
	@RequestMapping(value = "io/updateOutsrcStatus", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> updateOutsrcStatus(OutsourcingAdmVo outsourcingAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();	
		logger.info("외주발주 마감상태 수정: " + outsourcingAdmVo);
		try {
			
			String outsrcStatusVal = outsourcingAdmVo.getOutsrcStatus();
			
			if(outsrcStatusVal.equals("005")) {
				outsourcingAdmVo.setOutsrcStatus("006");
			}else {
				outsourcingAdmVo.setOutsrcStatus("005");				
			}
			
			outsourcingAdmService.updateOutsrcStatus(outsourcingAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 외주출고 목록조회
	@RequestMapping(value = "io/outsourcingDtlList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outsourcingDtlList(OutsourcingAdmVo outsourcingAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("외주출고 목록조회: " + outsourcingAdmVo);
		try {
			List<OutsourcingAdmVo> OutsourcingAdmList2 = new ArrayList<OutsourcingAdmVo>();
			List<OutsourcingAdmVo> OutsourcingAdmList = outsourcingAdmService.outsourcingAdmList(outsourcingAdmVo);
			
			for(int i=0; i<OutsourcingAdmList.size(); i++) {
				
				//사급 && 진행상태 인 경우
				if(OutsourcingAdmList.get(i).getOutsrcGubun().equals("001") && !OutsourcingAdmList.get(i).getOutsrcStatus().equals("005")) {
					OutsourcingAdmList2.add(OutsourcingAdmList.get(i));
				}
			}
			
			jsonData.put("data", OutsourcingAdmList2);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 외주입고 목록조회
	@RequestMapping(value = "io/insourcingDtlList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> insourcingDtlList(OutsourcingAdmVo outsourcingAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("외주입고 목록조회: " + outsourcingAdmVo);
		try {
			List<OutsourcingAdmVo> OutsourcingAdmList2 = new ArrayList<OutsourcingAdmVo>();
			List<OutsourcingAdmVo> OutsourcingAdmList = outsourcingAdmService.outsourcingAdmList(outsourcingAdmVo);
			
			for(int i=0; i<OutsourcingAdmList.size(); i++) {
				
				//도급 && 
				if((OutsourcingAdmList.get(i).getOutsrcGubun().equals("002")||OutsourcingAdmList.get(i).getOutQty()!=null)&&!OutsourcingAdmList.get(i).getOutsrcStatus().equals("005")) {
					OutsourcingAdmList2.add(OutsourcingAdmList.get(i));
				}
			}
			
			jsonData.put("data", OutsourcingAdmList2);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 외주 출고 상세조회
	@RequestMapping(value = "io/outsourcingDtlRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> outsourcingDtlRead(OutsourcingAdmVo outsourcingAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("외주출고 상세조회: " + outsourcingAdmVo);
		try {
			List<OutsourcingAdmVo> list = new ArrayList<>();
			if(outsourcingAdmVo.getOutsrcNo()==null || outsourcingAdmVo.getOutsrcNo().equals("")) {
				jsonData.put("data", list); 
			}else {
				list = outsourcingAdmService.outsourcingDtlRead(outsourcingAdmVo);
				jsonData.put("data", list);
			}
			
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 외주 입고 상세조회
	@RequestMapping(value = "io/insourcingDtlRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> insourcingDtlRead(OutsourcingAdmVo outsourcingAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();

		logger.info("외주입고 상세조회: " + outsourcingAdmVo);
		try {
			List<OutsourcingAdmVo> list = new ArrayList<>();
			if(outsourcingAdmVo.getOutsrcNo()==null || outsourcingAdmVo.getOutsrcNo().equals("")) {
				jsonData.put("data", list);
			}else {
				list = outsourcingAdmService.insourcingDtlRead(outsourcingAdmVo);
				jsonData.put("data", list);
			}
		
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//외주출고 등록
	@RequestMapping(value="io/outsourcingDtlCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> outsourcingDtlCreate(@RequestBody List<Map<String, Object>> outsourcingDtlList) throws Exception{
		OutsourcingAdmVo outsourcingAdmVo = new OutsourcingAdmVo();
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("외주출고 등록:"+outsourcingAdmVo);
		try {
			
			outsourcingAdmVo.setOutsrcNo(outsourcingDtlList.get(0).get("outsrcNo").toString());
			outsourcingAdmVo.setOutsrcCorpCd(outsourcingDtlList.get(0).get("outsrcCorpCd").toString());
			outsourcingAdmVo.setOutsrcChargr(outsourcingDtlList.get(0).get("outsrcChargr").toString());
			outsourcingAdmVo.setRegId(Utils.getUserId());
			
			outsourcingAdmService.outsourcingDtlDelete(outsourcingAdmVo);
			
			int outQty = 0;
			
			for(Map<String, Object> m :outsourcingDtlList) {
				outsourcingAdmVo.setOutsrcDtlQty(Integer.parseInt(m.get("outsrcDtlQty").toString()));
				//outsourcingAdmVo.setOutsrcRemainQty(Integer.parseInt(m.get("outsrcRemainQty").toString()));
				outsourcingAdmVo.setOutsrcDtlDate(m.get("outsrcDtlDate").toString());
				outsourcingAdmVo.setOutsrcDesc(m.get("outsrcDesc").toString());
				
				outsourcingAdmVo.setOutsrcSeq(outsourcingAdmService.getOutsrcSeq(outsourcingAdmVo));
				outsourcingAdmService.outsourcingDtlCreate(outsourcingAdmVo);
				
				outQty += outsourcingAdmVo.getOutsrcDtlQty();
			}
			
			//외주발주 수량값 수정
			outsourcingAdmVo.setOutsrcDtlQty(outQty);
			outsourcingAdmVo.setValue("out");
			outsourcingAdmService.updateOutInQty(outsourcingAdmVo);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//외주입고 등록
	@RequestMapping(value="io/insourcingDtlCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> insourcingDtlCreate(@RequestBody List<Map<String, Object>> outsourcingDtlList) throws Exception{
		OutsourcingAdmVo outsourcingAdmVo = new OutsourcingAdmVo();
		Map<String , Object> jsonData = new HashMap<String, Object>();
		logger.info("외주입고 등록:"+outsourcingAdmVo);
		try {
			
			outsourcingAdmVo.setOutsrcNo(outsourcingDtlList.get(0).get("outsrcNo").toString());
			outsourcingAdmVo.setInsrcCorpCd(outsourcingDtlList.get(0).get("insrcCorpCd").toString());
			outsourcingAdmVo.setInsrcChargr(outsourcingDtlList.get(0).get("insrcChargr").toString());
			outsourcingAdmVo.setRegId(Utils.getUserId());
			
			outsourcingAdmService.insourcingDtlDelete(outsourcingAdmVo);
			int inQty = 0;
			
			for(Map<String, Object> m :outsourcingDtlList) {
				outsourcingAdmVo.setInsrcDtlQty(Integer.parseInt(m.get("insrcDtlQty").toString()));
				//outsourcingAdmVo.setInsrcRemainQty(Integer.parseInt(m.get("insrcRemainQty").toString()));
				outsourcingAdmVo.setInsrcDtlDate(m.get("insrcDtlDate").toString());
				outsourcingAdmVo.setInsrcDesc(m.get("insrcDesc").toString());
				outsourcingAdmVo.setInsrcSeq(outsourcingAdmService.getInsrcSeq(outsourcingAdmVo));
				outsourcingAdmService.insourcingDtlCreate(outsourcingAdmVo);
				
				inQty += outsourcingAdmVo.getInsrcDtlQty();
				
			}
			//외주발주 수량값 수정
			outsourcingAdmVo.setInsrcDtlQty(inQty);
			outsourcingAdmVo.setValue("in");
			outsourcingAdmService.updateOutInQty(outsourcingAdmVo);
			jsonData.put("result", "ok");
			
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//성적서 등록
	@RequestMapping(value="io/uploadFile", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> uploadFile(MultipartHttpServletRequest multi, OutsourcingAdmVo outsourcingAdmVo) throws Exception {
		Map<String , Object> jsonData = new HashMap<String, Object>();
		try {
			String outsrcNo = multi.getParameter("outsrcNo").toString();
		
			String newFileName = "";
			String path = insrcReportPath;
			
			File dir = new File(path);
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			MultipartFile mFile = multi.getFile("fileNm");
			String fileName = mFile.getOriginalFilename();
			outsourcingAdmVo.setReportFn(fileName);
			
			outsourcingAdmService.uploadFile(outsourcingAdmVo);
			
			newFileName = outsrcNo +"." +fileName.substring(fileName.lastIndexOf(".")+1);
			
			try {
				mFile.transferTo(new File(path + "/" + newFileName));
			} catch (Exception e) {
				e.printStackTrace();
			
			}
			
			String reportFn = outsourcingAdmService.getReportFn(outsourcingAdmVo);
			
			jsonData.put("result", "ok");
			jsonData.put("data",reportFn);
		} catch (Exception e) {
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	// 성적서 다운로드
	@RequestMapping(value = "io/downloadFile", method = RequestMethod.GET)
	public @ResponseBody void downloadFile(HttpServletResponse res, HttpServletRequest req,
		    @RequestParam(value = "outsrcNo") String outsrcNo,
		    OutsourcingAdmVo outsourcingAdmVo) throws Exception {
		try {
			logger.info("다운로드 컨트롤러 구동");
			String dFile = outsourcingAdmService.getReportFn(outsourcingAdmVo);
			
			String newFileName = outsrcNo +"." +dFile.substring(dFile.lastIndexOf(".")+1);

			String path = insrcReportPath +"/"+ newFileName;

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
