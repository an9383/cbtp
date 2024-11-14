package mes.web.em;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import mes.domain.em.ManufacturerVo;
import mes.domain.sm.MenuAuthVo;
import mes.domain.em.EquipCondBomAdmVo;
import mes.domain.em.EquipCondCommonAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.em.EquipCondBomAdmService;
import mes.service.em.ManufacturerService;

@Controller
public class ManufacturerController {

	@Inject
	private ManufacturerService manufacturerService;
	@Inject
	private CommonCodeAdmService systemCommonCodeService;
	@Inject
	private EquipCondBomAdmService equipCondBomAdmService;

	private static final Logger logger = LoggerFactory.getLogger(ManufacturerController.class);

	// 설비코드관리 페이지
	@RequestMapping(value = "/emsc0020", method = RequestMethod.GET)
	public String emsc0020GET(Model model, HttpServletRequest request) throws Exception {
		
		
		logger.info("작업지시(설비별 생산계획) 메인");
		/*
		 * SystemCommonCodeVo systemCommonCodeVo = new SystemCommonCodeVo();
		 * 
		 * systemCommonCodeVo.setBaseGroupCd("007"); // 재질 List<SystemCommonCodeVo>
		 * systemCommonCodeList = systemCommonCodeService.listAll(systemCommonCodeVo);
		 * model.addAttribute("statusYnCd", systemCommonCodeList );
		 * 
		 * systemCommonCodeVo.setBaseGroupCd("008"); // 설치 장소 systemCommonCodeList =
		 * systemCommonCodeService.listAll(systemCommonCodeVo);
		 * model.addAttribute("installLocation", systemCommonCodeList );
		 * 
		 * systemCommonCodeVo.setBaseGroupCd("009"); // 설비 분류 systemCommonCodeList =
		 * systemCommonCodeService.listAll(systemCommonCodeVo);
		 * model.addAttribute("equipCtrgy", systemCommonCodeList );
		 */
		return "em/emsc0020";
	}

	//제조조건관리 설비 클릭시 계획 목록 조회
	@RequestMapping(value = "/em/manufacturerDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> manufacturerDataListGET(ManufacturerVo manufacturerVo) throws Exception {
		
		logger.info("제조조건관리 설비 클릭시 계획 목록 조회");
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		List<ManufacturerVo> ManufacturerVoList= manufacturerService.listAll(manufacturerVo);
		jsonData.put("data", ManufacturerVoList);
		return jsonData;
		
	}
	
	// 설비코드 클릭 시 해당 설비 계획 목록 조회
	@RequestMapping(value = "/em/manufacturerPlanListRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> manufacturerPlanListReadGET (EquipCondCommonAdmVo equipCondCommonAdmVo) throws Exception {
		
		logger.info("특정 제품코드 클릭 상세조회");
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		List<ManufacturerVo> ManufacturerRead= manufacturerService.listRead(equipCondCommonAdmVo);
		jsonData.put("data", ManufacturerRead);
		return jsonData;
	}
	
	// 제품코드 조회 팝업의 목록에서 특정 제품 클릭 시 제품코드에 대한 재질,규격,두께등을 가져옴
	@RequestMapping(value = "/em/manufacturerRead", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> manufacturerReadGET(ManufacturerVo manufacturerVo) throws Exception {
		
		logger.info("특정 제품코드 클릭 상세조회");
		Map<String, Object>	jsonData = new HashMap<String, Object>();
		ManufacturerVo ManufacturerRead= manufacturerService.read(manufacturerVo);
		jsonData.put("data", ManufacturerRead);
		return jsonData;
		
	}
	
	//설비 계획 등록
	@RequestMapping(value = "/em/equipCondCommonAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCondCommonAdmCreatePOST(@RequestBody List<Map<String, Object>> bomList) throws Exception {

		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("제조조건관리 - 설비계획 등록 BOM 조건 = "+ bomList);
		EquipCondBomAdmVo equipCondBomAdmVo = new EquipCondBomAdmVo();
		EquipCondCommonAdmVo equipCondCommonAdmVo = new EquipCondCommonAdmVo();
		
		int i = 0;
		String equipCondSeq = manufacturerService.selectEquipCondSeq();
		equipCondCommonAdmVo.setEquipCondSeq(equipCondSeq);
		equipCondCommonAdmVo.setRegId("regId");
		equipCondBomAdmVo.setEquipCondSeq(equipCondSeq);
		equipCondBomAdmVo.setRegId("regId");
		
		for(Map<String, Object> m : bomList) {
			if ( i==0 ) {	//설비조건공통관리
				equipCondCommonAdmVo.setEquipCd(m.get("equipCd").toString());
				equipCondCommonAdmVo.setGoodsCd(m.get("goodsCd").toString());
				equipCondCommonAdmVo.setUseYnCd("Y");
				manufacturerService.equipCondCommonAdmcreate(equipCondCommonAdmVo);
			}
			else if( i==1 || i==2 || i==3) {
				equipCondBomAdmVo.setWarmupCond(m.get("warmupCond").toString());
				equipCondBomAdmVo.setWarmupAlwncePlus(m.get("warmupAlwncePlus").toString());
				equipCondBomAdmVo.setWarmupAlwnceMinus(m.get("warmupAlwnceMinus").toString());
				equipCondBomAdmVo.setFitupCond(m.get("fitupCond").toString());
				equipCondBomAdmVo.setFitupAlwncePlus(m.get("fitupAlwncePlus").toString());
				equipCondBomAdmVo.setFitupAlwnceMinus(m.get("fitupAlwnceMinus").toString());
				equipCondBomAdmVo.setFirstCond(m.get("firstCond").toString());
				equipCondBomAdmVo.setFirstAlwncePlus(m.get("firstAlwncePlus").toString());
				equipCondBomAdmVo.setFirstAlwnceMinus(m.get("firstAlwnceMinus").toString());
				equipCondBomAdmVo.setSecondCond(m.get("secondCond").toString());
				equipCondBomAdmVo.setSecondAlwncePlus(m.get("secondAlwncePlus").toString());
				equipCondBomAdmVo.setSecondAlwnceMinus(m.get("secondAlwnceMinus").toString());
				equipCondBomAdmVo.setJinjeopCond(m.get("jinjeopCond").toString());
				equipCondBomAdmVo.setJinjeopAlwncePlus(m.get("jinjeopAlwncePlus").toString());
				equipCondBomAdmVo.setJinjeopAlwnceMinus(m.get("jinjeopAlwnceMinus").toString());
				equipCondBomAdmVo.setReformCond(m.get("reformCond").toString());
				equipCondBomAdmVo.setReformAlwncePlus(m.get("reformAlwncePlus").toString());
				equipCondBomAdmVo.setReformAlwnceMinus(m.get("reformAlwnceMinus").toString());
				if (i==1) {
					//온도 등록
					equipCondBomAdmService.tempaturCreate(equipCondBomAdmVo);
				}
				else if (i==2) {
					//시간 등록
					equipCondBomAdmService.timeCreate(equipCondBomAdmVo);
				}
				else if (i==3) {
					//치수 등록
					equipCondBomAdmService.pressureCreate(equipCondBomAdmVo);
				}
				logger.info("온도 시간 압력  = "+ equipCondBomAdmVo);
			}
			else if ( i==4 ) {
				equipCondBomAdmVo.setWpLeftCond(m.get("wpLeftCond").toString());
				equipCondBomAdmVo.setWpLeftAlwncePlus(m.get("wpLeftAlwncePlus").toString());
				equipCondBomAdmVo.setWpLeftAlwnceMinus(m.get("wpLeftAlwnceMinus").toString());
				equipCondBomAdmVo.setWpRightCond(m.get("wpRightCond").toString());
				equipCondBomAdmVo.setWpRightAlwncePlus(m.get("wpRightAlwncePlus").toString());
				equipCondBomAdmVo.setWpRightAlwnceMinus(m.get("wpRightAlwnceMinus").toString());
				equipCondBomAdmVo.setPitchLeftCond(m.get("pitchLeftCond").toString());
				equipCondBomAdmVo.setPitchLeftAlwncePlus(m.get("pitchLeftAlwncePlus").toString());
				equipCondBomAdmVo.setPitchLeftAlwnceMinus(m.get("pitchLeftAlwnceMinus").toString());
				equipCondBomAdmVo.setPitchRightCond(m.get("pitchRightCond").toString());
				equipCondBomAdmVo.setPitchRightAlwncePlus(m.get("pitchRightAlwncePlus").toString());
				equipCondBomAdmVo.setPitchRightAlwnceMinus(m.get("pitchRightAlwnceMinus").toString());
				equipCondBomAdmVo.setPpfWingLeftCond(m.get("ppfWingLeftCond").toString());
				equipCondBomAdmVo.setPpfWingLeftAlwncePlus(m.get("ppfWingLeftAlwncePlus").toString());
				equipCondBomAdmVo.setPpfWingLeftAlwnceMinus(m.get("ppfWingLeftAlwnceMinus").toString());
				equipCondBomAdmVo.setPpfWingRightCond(m.get("ppfWingRightCond").toString());
				equipCondBomAdmVo.setPpfWingRightAlwncePlus(m.get("ppfWingRightAlwncePlus").toString());
				equipCondBomAdmVo.setPpfWingRightAlwnceMinus(m.get("ppfWingRightAlwnceMinus").toString());	
				equipCondBomAdmVo.setPpfDepthLeftCond(m.get("ppfDepthLeftCond").toString());
				equipCondBomAdmVo.setPpfDepthLeftAlwncePlus(m.get("ppfDepthLeftAlwncePlus").toString());
				equipCondBomAdmVo.setPpfDepthLeftAlwnceMinus(m.get("ppfDepthLeftAlwnceMinus").toString());
				equipCondBomAdmVo.setPpfDepthRightCond(m.get("ppfDepthRightCond").toString());
				equipCondBomAdmVo.setPpfDepthRightAlwncePlus(m.get("ppfDepthRightAlwncePlus").toString());
				equipCondBomAdmVo.setPpfDepthRightAlwnceMinus(m.get("ppfDepthRightAlwnceMinus").toString());
				equipCondBomAdmVo.setFilmCond(m.get("filmCond").toString());
				equipCondBomAdmVo.setFilmAlwncePlus(m.get("filmAlwncePlus").toString());
				equipCondBomAdmVo.setFilmAlwnceMinus(m.get("filmAlwnceMinus").toString());
				equipCondBomAdmVo.setMetalDepthCond(m.get("metalDepthCond").toString());
				equipCondBomAdmVo.setMetalDepthAlwncePlus(m.get("metalDepthAlwncePlus").toString());
				equipCondBomAdmVo.setMetalDepthAlwnceMinus(m.get("metalDepthAlwnceMinus").toString());
				equipCondBomAdmVo.setMetalThicknessCond(m.get("metalThicknessCond").toString());
				equipCondBomAdmVo.setMetalThicknessAlwncePlus(m.get("metalThicknessAlwncePlus").toString());
				equipCondBomAdmVo.setMetalThicknessAlwnceMinus(m.get("metalThicknessAlwnceMinus").toString());
				equipCondBomAdmVo.setThCenterCond(m.get("thCenterCond").toString());
				equipCondBomAdmVo.setThCenterAlwncePlus(m.get("thCenterAlwncePlus").toString());
				equipCondBomAdmVo.setThCenterAlwnceMinus(m.get("thCenterAlwnceMinus").toString());
				equipCondBomAdmVo.setThEdgeCond(m.get("thEdgeCond").toString());
				equipCondBomAdmVo.setThEdgeAlwncePlus(m.get("thEdgeAlwncePlus").toString());
				equipCondBomAdmVo.setThEdgeAlwnceMinus(m.get("thEdgeAlwnceMinus").toString());
				equipCondBomAdmVo.setBurrCond(m.get("burrCond").toString());
				equipCondBomAdmVo.setBurrAlwncePlus(m.get("burrAlwncePlus").toString());
				equipCondBomAdmVo.setBurrAlwnceMinus(m.get("burrAlwnceMinus").toString());
				//사이즈 등록
				equipCondBomAdmService.sizeCreate(equipCondBomAdmVo);
				logger.info("치수 조건  = "+ equipCondBomAdmVo);
			}
			i++;
		}
		jsonData.put("result", "ok");
		return jsonData;
	}
	
	
	//설비 계획 수정
	@RequestMapping(value = "/em/equipCondCommonAdmEdit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipCondCommonAdmEditPOST(@RequestBody List<Map<String, Object>> bomList, EquipCondBomAdmVo equipCondBomAdmVo) throws Exception {

		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("제조조건관리 - 설비계획 수정 BOM 조건 = "+ bomList);
		int i = 0;
		equipCondBomAdmVo.setUpdId("updId");
		
		for(Map<String, Object> m : bomList) {
			if( i==0) {
				equipCondBomAdmVo.setEquipCondSeq(m.get("equipCondSeq").toString());	//hidden으로 숨긴 SEQ값 가져옴
			}
			else if( i==1 || i==2 || i==3) {
				equipCondBomAdmVo.setWarmupCond(m.get("warmupCond").toString());
				equipCondBomAdmVo.setWarmupAlwncePlus(m.get("warmupAlwncePlus").toString());
				equipCondBomAdmVo.setWarmupAlwnceMinus(m.get("warmupAlwnceMinus").toString());
				equipCondBomAdmVo.setFitupCond(m.get("fitupCond").toString());
				equipCondBomAdmVo.setFitupAlwncePlus(m.get("fitupAlwncePlus").toString());
				equipCondBomAdmVo.setFitupAlwnceMinus(m.get("fitupAlwnceMinus").toString());
				equipCondBomAdmVo.setFirstCond(m.get("firstCond").toString());
				equipCondBomAdmVo.setFirstAlwncePlus(m.get("firstAlwncePlus").toString());
				equipCondBomAdmVo.setFirstAlwnceMinus(m.get("firstAlwnceMinus").toString());
				equipCondBomAdmVo.setSecondCond(m.get("secondCond").toString());
				equipCondBomAdmVo.setSecondAlwncePlus(m.get("secondAlwncePlus").toString());
				equipCondBomAdmVo.setSecondAlwnceMinus(m.get("secondAlwnceMinus").toString());
				equipCondBomAdmVo.setJinjeopCond(m.get("jinjeopCond").toString());
				equipCondBomAdmVo.setJinjeopAlwncePlus(m.get("jinjeopAlwncePlus").toString());
				equipCondBomAdmVo.setJinjeopAlwnceMinus(m.get("jinjeopAlwnceMinus").toString());
				equipCondBomAdmVo.setReformCond(m.get("reformCond").toString());
				equipCondBomAdmVo.setReformAlwncePlus(m.get("reformAlwncePlus").toString());
				equipCondBomAdmVo.setReformAlwnceMinus(m.get("reformAlwnceMinus").toString());
				if (i==1) {
					//온도 수정
					equipCondBomAdmService.tempaturUpdate(equipCondBomAdmVo);
				}
				else if (i==2) {
					//시간 수정
					equipCondBomAdmService.timeUpdate(equipCondBomAdmVo);
				}
				else if (i==3) {
					//치수 수정
					equipCondBomAdmService.pressureUpdate(equipCondBomAdmVo);
				}
				logger.info("온도 시간 압력  = "+ equipCondBomAdmVo);
			}
			else if ( i==3 ) {
				equipCondBomAdmVo.setWpLeftCond(m.get("wpLeftCond").toString());
				equipCondBomAdmVo.setWpLeftAlwncePlus(m.get("wpLeftAlwncePlus").toString());
				equipCondBomAdmVo.setWpLeftAlwnceMinus(m.get("wpLeftAlwnceMinus").toString());
				equipCondBomAdmVo.setWpRightCond(m.get("wpRightCond").toString());
				equipCondBomAdmVo.setWpRightAlwncePlus(m.get("wpRightAlwncePlus").toString());
				equipCondBomAdmVo.setWpRightAlwnceMinus(m.get("wpRightAlwnceMinus").toString());
				equipCondBomAdmVo.setPitchLeftCond(m.get("pitchLeftCond").toString());
				equipCondBomAdmVo.setPitchLeftAlwncePlus(m.get("pitchLeftAlwncePlus").toString());
				equipCondBomAdmVo.setPitchLeftAlwnceMinus(m.get("pitchLeftAlwnceMinus").toString());
				equipCondBomAdmVo.setPitchRightCond(m.get("pitchRightCond").toString());
				equipCondBomAdmVo.setPitchRightAlwncePlus(m.get("pitchRightAlwncePlus").toString());
				equipCondBomAdmVo.setPitchRightAlwnceMinus(m.get("pitchRightAlwnceMinus").toString());
				equipCondBomAdmVo.setPpfWingLeftCond(m.get("ppfWingLeftCond").toString());
				equipCondBomAdmVo.setPpfWingLeftAlwncePlus(m.get("ppfWingLeftAlwncePlus").toString());
				equipCondBomAdmVo.setPpfWingLeftAlwnceMinus(m.get("ppfWingLeftAlwnceMinus").toString());
				equipCondBomAdmVo.setPpfWingRightCond(m.get("ppfWingRightCond").toString());
				equipCondBomAdmVo.setPpfWingRightAlwncePlus(m.get("ppfWingRightAlwncePlus").toString());
				equipCondBomAdmVo.setPpfDepthLeftCond(m.get("ppfDepthLeftCond").toString());
				equipCondBomAdmVo.setPpfDepthLeftAlwncePlus(m.get("ppfDepthLeftAlwncePlus").toString());
				equipCondBomAdmVo.setPpfDepthLeftAlwnceMinus(m.get("ppfDepthLeftAlwnceMinus").toString());
				equipCondBomAdmVo.setPpfDepthRightCond(m.get("ppfDepthRightCond").toString());
				equipCondBomAdmVo.setPpfDepthRightAlwncePlus(m.get("ppfDepthRightAlwncePlus").toString());
				equipCondBomAdmVo.setPpfDepthRightAlwnceMinus(m.get("ppfDepthRightAlwnceMinus").toString());
				equipCondBomAdmVo.setFilmCond(m.get("filmCond").toString());
				equipCondBomAdmVo.setFilmAlwncePlus(m.get("filmAlwncePlus").toString());
				equipCondBomAdmVo.setFilmAlwnceMinus(m.get("filmAlwnceMinus").toString());
				equipCondBomAdmVo.setMetalDepthCond(m.get("metalDepthCond").toString());
				equipCondBomAdmVo.setMetalDepthAlwncePlus(m.get("metalDepthAlwncePlus").toString());
				equipCondBomAdmVo.setMetalDepthAlwnceMinus(m.get("metalDepthAlwnceMinus").toString());
				equipCondBomAdmVo.setMetalThicknessCond(m.get("metalThicknessCond").toString());
				equipCondBomAdmVo.setMetalThicknessAlwncePlus(m.get("metalThicknessAlwncePlus").toString());
				equipCondBomAdmVo.setMetalThicknessAlwnceMinus(m.get("metalThicknessAlwnceMinus").toString());
				equipCondBomAdmVo.setThCenterCond(m.get("thCenterCond").toString());
				equipCondBomAdmVo.setThCenterAlwncePlus(m.get("thCenterAlwncePlus").toString());
				equipCondBomAdmVo.setThCenterAlwnceMinus(m.get("thCenterAlwnceMinus").toString());
				equipCondBomAdmVo.setThEdgeCond(m.get("thEdgeCond").toString());
				equipCondBomAdmVo.setThEdgeAlwncePlus(m.get("thEdgeAlwncePlus").toString());
				equipCondBomAdmVo.setThEdgeAlwnceMinus(m.get("thEdgeAlwnceMinus").toString());
				equipCondBomAdmVo.setBurrCond(m.get("burrCond").toString());
				equipCondBomAdmVo.setBurrAlwncePlus(m.get("burrAlwncePlus").toString());
				equipCondBomAdmVo.setBurrAlwnceMinus(m.get("burrAlwnceMinus").toString());
				//사이즈 수정
				equipCondBomAdmService.sizeUpdate(equipCondBomAdmVo);
				logger.info("치수 조건  = "+ equipCondBomAdmVo);
			}
			i++;
		}
		jsonData.put("result", "ok");
		return jsonData;
	}
	
	
	
	//설비 계획 상세 조회
	@RequestMapping(value = "/em/equipBomDataList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> equipBomDataListGET(EquipCondBomAdmVo equipCondBomAdmVo, ManufacturerVo manufacturerVo) throws Exception {

		Map<String, Object> jsonData = new HashMap<String, Object>();
		manufacturerVo = manufacturerService.read(manufacturerVo);
		Map<String, Object> manufacturerMap = new HashMap<String, Object>();
				
		manufacturerMap.put("goodsCd", 			manufacturerVo.getGoodsCd());          //제품코드           
		manufacturerMap.put("goodsNm", 			manufacturerVo.getGoodsNm());          //제품명            
		manufacturerMap.put("model", 			manufacturerVo.getModel());            //규격             
		manufacturerMap.put("qutyCd", 			manufacturerVo.getQutyCd());           //재질             
		manufacturerMap.put("alniQutyNm", 		manufacturerVo.getAlniQutyNm());       //알류미늄or니켈 종류    
		manufacturerMap.put("alniThickness", 	manufacturerVo.getAlniThickness());    //알류미늄or니켈 두께    
		manufacturerMap.put("alniWidth", 		manufacturerVo.getAlniWidth());        //알류미늄or니켈 너비    
		manufacturerMap.put("alniLength", 		manufacturerVo.getAlniLength());       //알류미늄or니켈 길이    
		manufacturerMap.put("alniPich", 		manufacturerVo.getAlniPich());         //알류미늄or니켈 피치    
		manufacturerMap.put("filmQutyNm", 		manufacturerVo.getFilmQutyNm());       //필름명            
		manufacturerMap.put("filmThickness", 	manufacturerVo.getFilmThickness());    //필름 두께          
		manufacturerMap.put("filmDepth", 		manufacturerVo.getFilmDepth());        //필름 규격          
		jsonData.put("manufacturerData", manufacturerMap);
		
		EquipCondBomAdmVo tempaturRead = new EquipCondBomAdmVo();
		EquipCondBomAdmVo timeRead = new EquipCondBomAdmVo();
		EquipCondBomAdmVo pressureRead = new EquipCondBomAdmVo();
		EquipCondBomAdmVo sizeRead = new EquipCondBomAdmVo();
		
		tempaturRead = equipCondBomAdmService.tempaturRead(equipCondBomAdmVo);
		timeRead = equipCondBomAdmService.timeRead(equipCondBomAdmVo);
		pressureRead = equipCondBomAdmService.pressureRead(equipCondBomAdmVo);
		sizeRead = equipCondBomAdmService.sizeRead(equipCondBomAdmVo);
		
		//List<Map<String, Object>> bomlist = new ArrayList<Map<String, Object>>();
		Map<String, Object> tempaturMap = new HashMap<String, Object>();
		Map<String, Object> timeMap = new HashMap<String, Object>();
		Map<String, Object> pressureMap = new HashMap<String, Object>();
		Map<String, Object> sizeMap = new HashMap<String, Object>();
		
		tempaturMap.put("equipCondSeq", 		tempaturRead.getEquipCondSeq());
		tempaturMap.put("warmupCond", 			tempaturRead.getWarmupCond());
		tempaturMap.put("warmupAlwncePlus", 	tempaturRead.getWarmupAlwncePlus());
		tempaturMap.put("warmupAlwnceMinus", 	tempaturRead.getWarmupAlwnceMinus());
		tempaturMap.put("fitupCond",			tempaturRead.getFitupCond());
		tempaturMap.put("fitupAlwncePlus", 		tempaturRead.getFitupAlwncePlus());
		tempaturMap.put("fitupAlwnceMinus", 	tempaturRead.getFitupAlwnceMinus());
		tempaturMap.put("firstCond", 			tempaturRead.getFirstCond());
		tempaturMap.put("firstAlwncePlus", 		tempaturRead.getFirstAlwncePlus());
		tempaturMap.put("firstAlwnceMinus", 	tempaturRead.getFirstAlwnceMinus());
		tempaturMap.put("secondCond", 			tempaturRead.getSecondCond());
		tempaturMap.put("secondAlwncePlus",		tempaturRead.getSecondAlwncePlus());
		tempaturMap.put("secondAlwnceMinus", 	tempaturRead.getSecondAlwnceMinus());
		tempaturMap.put("jinjeopCond", 			tempaturRead.getJinjeopCond());
		tempaturMap.put("jinjeopAlwncePlus", 	tempaturRead.getJinjeopAlwncePlus());
		tempaturMap.put("jinjeopAlwnceMinus", 	tempaturRead.getJinjeopAlwnceMinus());
		tempaturMap.put("reformCond", 			tempaturRead.getReformCond());
		tempaturMap.put("reformAlwncePlus", 	tempaturRead.getReformAlwncePlus());
		tempaturMap.put("reformAlwnceMinus", 	tempaturRead.getReformAlwnceMinus());
		jsonData.put("tempaturData", tempaturMap);
		
		timeMap.put("equipCondSeq", 		timeRead.getEquipCondSeq());
		timeMap.put("warmupCond", 			timeRead.getWarmupCond());
		timeMap.put("warmupAlwncePlus", 	timeRead.getWarmupAlwncePlus());
		timeMap.put("warmupAlwnceMinus", 	timeRead.getWarmupAlwnceMinus());
		timeMap.put("fitupCond",			timeRead.getFitupCond());
		timeMap.put("fitupAlwncePlus", 		timeRead.getFitupAlwncePlus());
		timeMap.put("fitupAlwnceMinus", 	timeRead.getFitupAlwnceMinus());
		timeMap.put("firstCond", 			timeRead.getFirstCond());
		timeMap.put("firstAlwncePlus", 		timeRead.getFirstAlwncePlus());
		timeMap.put("firstAlwnceMinus", 	timeRead.getFirstAlwnceMinus());
		timeMap.put("secondCond", 			timeRead.getSecondCond());
		timeMap.put("secondAlwncePlus",		timeRead.getSecondAlwncePlus());
		timeMap.put("secondAlwnceMinus", 	timeRead.getSecondAlwnceMinus());
		timeMap.put("jinjeopCond", 			timeRead.getJinjeopCond());
		timeMap.put("jinjeopAlwncePlus", 	timeRead.getJinjeopAlwncePlus());
		timeMap.put("jinjeopAlwnceMinus", 	timeRead.getJinjeopAlwnceMinus());
		timeMap.put("reformCond", 			timeRead.getReformCond());
		timeMap.put("reformAlwncePlus", 	timeRead.getReformAlwncePlus());
		timeMap.put("reformAlwnceMinus", 	timeRead.getReformAlwnceMinus());
		jsonData.put("timeData", timeMap);
		
		pressureMap.put("equipCondSeq", 		pressureRead.getEquipCondSeq());
		pressureMap.put("warmupCond", 			pressureRead.getWarmupCond());
		pressureMap.put("warmupAlwncePlus", 	pressureRead.getWarmupAlwncePlus());
		pressureMap.put("warmupAlwnceMinus", 	pressureRead.getWarmupAlwnceMinus());
		pressureMap.put("fitupCond",			pressureRead.getFitupCond());
		pressureMap.put("fitupAlwncePlus", 		pressureRead.getFitupAlwncePlus());
		pressureMap.put("fitupAlwnceMinus", 	pressureRead.getFitupAlwnceMinus());
		pressureMap.put("firstCond", 			pressureRead.getFirstCond());
		pressureMap.put("firstAlwncePlus", 		pressureRead.getFirstAlwncePlus());
		pressureMap.put("firstAlwnceMinus", 	pressureRead.getFirstAlwnceMinus());
		pressureMap.put("secondCond", 			pressureRead.getSecondCond());
		pressureMap.put("secondAlwncePlus",		pressureRead.getSecondAlwncePlus());
		pressureMap.put("secondAlwnceMinus", 	pressureRead.getSecondAlwnceMinus());
		pressureMap.put("jinjeopCond", 			pressureRead.getJinjeopCond());
		pressureMap.put("jinjeopAlwncePlus", 	pressureRead.getJinjeopAlwncePlus());
		pressureMap.put("jinjeopAlwnceMinus", 	pressureRead.getJinjeopAlwnceMinus());
		pressureMap.put("reformCond", 			pressureRead.getReformCond());
		pressureMap.put("reformAlwncePlus", 	pressureRead.getReformAlwncePlus());
		pressureMap.put("reformAlwnceMinus", 	pressureRead.getReformAlwnceMinus());
		jsonData.put("pressureData", pressureMap);
		
		sizeMap.put("equipCondSeq", 			sizeRead.getEquipCondSeq());
		sizeMap.put("wpLeftCond", 				sizeRead.getWpLeftCond());
		sizeMap.put("wpLeftAlwncePlus", 		sizeRead.getWpLeftAlwncePlus());
		sizeMap.put("wpLeftAlwnceMinus", 		sizeRead.getWpLeftAlwnceMinus());
		sizeMap.put("wpRightCond", 				sizeRead.getWpRightCond());
		sizeMap.put("wpRightAlwncePlus", 		sizeRead.getWpRightAlwncePlus());
		sizeMap.put("wpRightAlwnceMinus", 		sizeRead.getWpRightAlwnceMinus());
		sizeMap.put("pitchLeftCond", 			sizeRead.getPitchLeftCond());
		sizeMap.put("pitchLeftAlwncePlus", 		sizeRead.getPitchLeftAlwncePlus());
		sizeMap.put("pitchLeftAlwnceMinus", 	sizeRead.getPitchLeftAlwnceMinus());
		sizeMap.put("pitchRightCond", 			sizeRead.getPitchRightCond());
		sizeMap.put("pitchRightAlwncePlus", 	sizeRead.getPitchRightAlwncePlus());
		sizeMap.put("pitchRightAlwnceMinus",	sizeRead.getPitchRightAlwnceMinus());
		sizeMap.put("ppfWingLeftCond", 			sizeRead.getPpfWingLeftCond());
		sizeMap.put("ppfWingLeftAlwncePlus",	sizeRead.getPpfWingLeftAlwncePlus());
		sizeMap.put("ppfWingLeftAlwnceMinus", 	sizeRead.getPpfWingLeftAlwnceMinus());
		sizeMap.put("ppfWingRightCond", 		sizeRead.getPpfWingRightCond());
		sizeMap.put("ppfWingRightAlwncePlus", 	sizeRead.getPpfWingRightAlwncePlus());
		sizeMap.put("ppfWingRightAlwnceMinus", 	sizeRead.getPpfWingRightAlwnceMinus());
		sizeMap.put("ppfDepthLeftCond", 		sizeRead.getPpfDepthLeftCond());
		sizeMap.put("ppfDepthLeftAlwncePlus", 	sizeRead.getPpfDepthLeftAlwncePlus());
		sizeMap.put("ppfDepthLeftAlwnceMinus", 	sizeRead.getPpfDepthLeftAlwnceMinus());
		sizeMap.put("ppfDepthRightCond", 		sizeRead.getPpfDepthRightCond());
		sizeMap.put("ppfDepthRightAlwncePlus", 	sizeRead.getPpfDepthRightAlwncePlus());
		sizeMap.put("ppfDepthRightAlwnceMinus", sizeRead.getPpfDepthRightAlwnceMinus());
		sizeMap.put("filmCond", 				sizeRead.getFilmCond());
		sizeMap.put("filmAlwncePlus", 			sizeRead.getFilmAlwncePlus());
		sizeMap.put("filmAlwnceMinus", 			sizeRead.getFilmAlwnceMinus());
		sizeMap.put("metalDepthCond", 			sizeRead.getMetalDepthCond());
		sizeMap.put("metalDepthAlwncePlus", 	sizeRead.getMetalDepthAlwncePlus());
		sizeMap.put("metalDepthAlwnceMinus", 	sizeRead.getMetalDepthAlwnceMinus());
		sizeMap.put("metalThicknessCond", 		sizeRead.getMetalThicknessCond());
		sizeMap.put("metalThicknessAlwncePlus", sizeRead.getMetalThicknessAlwncePlus());
		sizeMap.put("metalThicknessAlwnceMinus",sizeRead.getMetalThicknessAlwnceMinus());
		sizeMap.put("thCenterCond", 			sizeRead.getThCenterCond());
		sizeMap.put("thCenterAlwncePlus", 		sizeRead.getThCenterAlwncePlus());
		sizeMap.put("thCenterAlwnceMinus", 		sizeRead.getThCenterAlwnceMinus());
		sizeMap.put("thEdgeCond", 				sizeRead.getThEdgeCond());
		sizeMap.put("thEdgeAlwncePlus", 		sizeRead.getThEdgeAlwncePlus());
		sizeMap.put("thEdgeAlwnceMinus", 		sizeRead.getThEdgeAlwnceMinus());
		sizeMap.put("burrCond", 				sizeRead.getBurrCond());
		sizeMap.put("burrAlwncePlus", 			sizeRead.getBurrAlwncePlus());
		sizeMap.put("burrAlwnceMinus", 			sizeRead.getBurrAlwnceMinus());
		jsonData.put("sizeData", sizeMap);

		jsonData.put("result", "ok");
		return jsonData;
	}
}