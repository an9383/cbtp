package mes.web.em;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.em.EquipRepairHistAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.em.EquipRepairHistAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class EquipRepairHistAdmController {

	@Inject
	private EquipRepairHistAdmService equipRepairHistAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
		
	private static final Logger logger = LoggerFactory.getLogger(EquipRepairHistAdmController.class);
	
	// 설비코드관리 페이지
	@RequestMapping(value = "/emsc0040", method = RequestMethod.GET)
	public String emsc0020GET(Model model, HttpServletRequest request) throws Exception {
		logger.info("수리이력조회 메인");			
		try {
			model.addAttribute("serverDateTo", DateUtil.getDay("yyyy-mm-dd", -6) );
			model.addAttribute("serverDateFrom", DateUtil.getToday("yyyy-mm-dd") );
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("066"); // 수리상태
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> repairStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("repairStatus", repairStatusList );
			
			commonCodeVo.setBaseGroupCd("123"); // 설비수리교체점검구분
			commonCodeVo.setUseYn("001");
			repairStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("equipGubun", repairStatusList );
			
			String userNm = Utils.getUserNm();
			model.addAttribute("userNm", userNm);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "em/emsc0040";
		
	}
	
	
	// 공구코드관리 페이지
	@RequestMapping(value = "/tosc0030", method = RequestMethod.GET)
	public String tosc0030(Model model, HttpServletRequest request) throws Exception {
		logger.info("수리이력조회 메인");			
		try {
			model.addAttribute("serverDateTo", DateUtil.getDay("yyyy-mm-dd", -6) );
			model.addAttribute("serverDateFrom", DateUtil.getToday("yyyy-mm-dd") );
			
			CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
			
			commonCodeVo.setBaseGroupCd("066"); // 수리상태
			commonCodeVo.setUseYn("001");
			List<CommonCodeAdmVo> repairStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("repairStatus", repairStatusList );
			
			commonCodeVo.setBaseGroupCd("123"); // 설비수리교체점검구분
			commonCodeVo.setUseYn("001");
			repairStatusList = commonCodeAdmService.CommonCodeList(commonCodeVo);
			model.addAttribute("equipGubun", repairStatusList );
			
			String userNm = Utils.getUserNm();
			model.addAttribute("userNm", userNm);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return "to/tosc0030";
		
	}
	
	//수리이력 목록 조회
	@RequestMapping(value = "/em/equipRepairHistAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipRepairHistAdmList(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		logger.info("수리이력 목록 조회");
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		try {
			List<EquipRepairHistAdmVo> equipRepairHistList = equipRepairHistAdmService.EquipRepairHistAdmList(equipRepairHistAdmVo);
			jsonData.put("data", equipRepairHistList);			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("수리이력 목록 조회 오류");
			e.printStackTrace();
			jsonData.put("message", "시스템 오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		
		return jsonData;		
	}
	
	// 수리이력 상세목록 조회
	@RequestMapping(value = "/em/equipRepairHistAdmRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipRepairHistAdmRead(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		logger.info("수리이력 상세목록 조회");
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		try {
			equipRepairHistAdmVo = equipRepairHistAdmService.EquipRepairHistAdmRead(equipRepairHistAdmVo);	
			jsonData.put("data", equipRepairHistAdmVo);			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("수리이력 상세목록 조회 오류");
			e.printStackTrace();
			jsonData.put("message", "시스템 오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;	
		
	}

	// 수리이력 등록
	@RequestMapping(value = "/em/equipRepairHistAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipRepairHistAdmCreate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수리이력 등록");
		try {
			equipRepairHistAdmVo.setRegId(Utils.getUserId());
			String repairNo = equipRepairHistAdmService.EquipRepairHistAdmSeq();
			equipRepairHistAdmService.EquipRepairHistAdmCreate(equipRepairHistAdmVo);	
			equipRepairHistAdmVo.setRepairNo(repairNo);
			
			jsonData.put("data", equipRepairHistAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("수리이력 등록 오류");
			e.printStackTrace();
			jsonData.put("message", "시스템 오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		
		return jsonData;
	}
		
	// 수리이력 수정
	@RequestMapping(value = "/em/equipRepairHistAdmUpdate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipRepairHistAdmUpdate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		logger.info("수리이력 수정");		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			equipRepairHistAdmVo.setUpdId(Utils.getUserId());
			equipRepairHistAdmService.EquipRepairHistAdmUpdate(equipRepairHistAdmVo);			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("수리이력 수정 오류");
			e.printStackTrace();
			jsonData.put("message", "시스템 오류가 발생했습니다.");
			jsonData.put("result", "error");
		}	
		return jsonData;
		
	}
	
	// 수리이력 삭제
	@RequestMapping(value = "/em/equipRepairHistAdmDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipRepairHistAdmDelete(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("수리이력 삭제");
		try {
			equipRepairHistAdmService.equipRepairHistAdmDelete(equipRepairHistAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("수리이력 삭제 오류");
			e.printStackTrace();
			jsonData.put("message", "시스템 오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		
		return jsonData;
	}
	
	// 설비 시퀀스 받아오기
	@RequestMapping(value = "/em/equipRepairHistAdmSeq", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipRepairHistAdmSeq(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		logger.info("설비 시퀀스 조회");		
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			String seq = equipRepairHistAdmService.EquipRepairHistAdmSeq();
			seq =  DateUtil.getToday("yyyymmdd") + "-" + seq;
			jsonData.put("data", seq);			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("설비 시퀀스 조회 오류");
			e.printStackTrace();
			jsonData.put("message", "시스템 오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;	
		
	}
	
	//수리이력 이미지 업로드
	@RequestMapping(value = "/em/equipRepairHistAdmImgUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipRepairHistAdmImgUpload(MultipartHttpServletRequest multi) throws Exception {
		logger.debug("수리이력 이미지 업로드");
		EquipRepairHistAdmVo equipRepairHistAdmVo = new EquipRepairHistAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			MultipartFile beforeImageFile = multi.getFile("beforeImageFile");
			MultipartFile afterImageFile = multi.getFile("afterImageFile");
		    
			String status = multi.getParameter("status");
			String change = multi.getParameter("change");
			
			equipRepairHistAdmVo.setRepairNo(multi.getParameter("repairNo"));

			EquipRepairHistAdmVo vo = equipRepairHistAdmService.EquipRepairHistAdmImgRead(equipRepairHistAdmVo);
			
			//jsp단
			String beforeImageFileNm = beforeImageFile.getOriginalFilename();
			String afterImageFileNm = afterImageFile.getOriginalFilename();

			equipRepairHistAdmVo.setBeforeImageFile(beforeImageFile.getBytes());
			equipRepairHistAdmVo.setBeforeImageFileNm(beforeImageFileNm);
			equipRepairHistAdmVo.setAfterImageFile(afterImageFile.getBytes());
			equipRepairHistAdmVo.setAfterImageFileNm(afterImageFileNm);
			
			if(status.equals("edit")) {
				if(change.equals("3")) {
				}
				
				else if(change.equals("2")) {
					if(vo.getBeforeImageFileNm() != null && !vo.getBeforeImageFileNm().equals("")) {
						equipRepairHistAdmVo.setBeforeImageFile(vo.getBeforeImageFile());
						equipRepairHistAdmVo.setBeforeImageFileNm(vo.getBeforeImageFileNm());
					}
				}
				
				else if(change.equals("1")) {
					if(vo.getAfterImageFileNm() != null && !vo.getAfterImageFileNm().equals("")) {
						equipRepairHistAdmVo.setAfterImageFile(vo.getAfterImageFile());
						equipRepairHistAdmVo.setAfterImageFileNm(vo.getAfterImageFileNm());
					}
				}
			}
			
			equipRepairHistAdmService.EquipRepairHistAdmImgUpload(equipRepairHistAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
		}

		return jsonData;
	}
		
	//이미지 경로조회
	@RequestMapping(value = "/em/equipRepairHistAdmImgRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipRepairHistAdmImgRead(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("이미지 조회");
		try {
			equipRepairHistAdmVo = equipRepairHistAdmService.EquipRepairHistAdmImgRead(equipRepairHistAdmVo);
			if (equipRepairHistAdmVo.getBeforeImageFile() != null) {
				String beforeImageFile = new String(Base64.encodeBase64(equipRepairHistAdmVo.getBeforeImageFile()));
				String beforeImageFileNm = equipRepairHistAdmVo.getBeforeImageFileNm();
				jsonData.put("beforeImageFile", beforeImageFile);
				jsonData.put("beforeImageFileNm", beforeImageFileNm);
			}
			
			if (equipRepairHistAdmVo.getAfterImageFile() != null) {
				String afterImageFile = new String(Base64.encodeBase64(equipRepairHistAdmVo.getAfterImageFile()));
				String afterImageFileNm = equipRepairHistAdmVo.getAfterImageFileNm();
				jsonData.put("afterImageFile", afterImageFile);
				jsonData.put("afterImageFileNm", afterImageFileNm);
			}
			
			jsonData.put("data", equipRepairHistAdmVo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			logger.info("이미지 조회 오류");
			e.printStackTrace();
			jsonData.put("result", "error");
		}
		return jsonData;
	}

	//등록일자 생성
	/*
	@RequestMapping(value = "/em/repairRegDateCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> menuIdCreate() throws Exception {
		
		EquipRepairHistAdmVo equipRepairHistAdmVo = new EquipRepairHistAdmVo();
		Map<String, Object> jsonData = new HashMap<String, Object>();
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyyMMdd");		
		Date time = new Date();				
		String time1 = format1.format(time);
		String seqSt = equipRepairHistAdmService.regSeq(time1);
		int seqStart = Integer.valueOf(seqSt);
		
		String tmp= String.format("%03d", seqStart);					 
		String repairRegDate = time1 + "-" + tmp;
		equipRepairHistAdmVo.setRepairRegDate(repairRegDate);				
		
		jsonData.put("data", equipRepairHistAdmVo);	
		
		return jsonData;
	
	}		
	*/
}