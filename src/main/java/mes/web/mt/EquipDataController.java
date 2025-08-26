package mes.web.mt;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.FactoryCalendarVo;
import mes.domain.mt.EquipDataVo;
import mes.service.bm.FactoryCalendarService;
import mes.service.mt.EquipDataService;

@Controller
public class EquipDataController {
	
	@Inject
	private EquipDataService equipDataService;
	@Inject
	private FactoryCalendarService factoryCalendarService;
	
	// 가공중인 LASER 설비 가공데이터 조회
	@RequestMapping(value = "mt/laserOperInfoLstByEquipCd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> laserOperInfoLstByEquipCd(EquipDataVo equipDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<EquipDataVo> equipDataVoList = equipDataService.laserOperInfoLstByEquipCd(equipDataVo);
			jsonData.put("data", equipDataVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 기간별 LASER 설비 실적조회
	@RequestMapping(value = "mt/laserOperInfoCntByDate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> laserOperInfoCntByDate(EquipDataVo equipDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<EquipDataVo> equipDataVoList = equipDataService.laserOperInfoCntByDate(equipDataVo);
			jsonData.put("data", equipDataVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 기간별 후가공 설비 실적조회
	@RequestMapping(value = "mt/finishOperInfoCntByDate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> finishOperInfoCntByDate(EquipDataVo equipDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<EquipDataVo> equipDataVoList = equipDataService.finishOperInfoCntByDate(equipDataVo);
			jsonData.put("data", equipDataVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// LASER 설비 가동/비가동 조회
	@RequestMapping(value = "mt/laserOperNonOperInfoLstByEquipCd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> laserOperNonOperInfoLstByEquipCd(EquipDataVo equipDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<EquipDataVo> equipDataVoList = equipDataService.laserOperNonOperInfoLstByEquipCd(equipDataVo);
			jsonData.put("data", equipDataVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 가공중인 후가공 설비 가공데이터 조회
	@RequestMapping(value = "mt/finishOperInfoLstByEquipCd", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> finishOperInfoLstByEquipCd(EquipDataVo equipDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<EquipDataVo> equipDataVoList = equipDataService.finishOperInfoLstByEquipCd(equipDataVo);
			jsonData.put("data", equipDataVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	
	// 가공중인 LASER 설비 가공데이터 조회
	@RequestMapping(value = "mt/laserOperInfoLstByWorkOrdNo", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> laserOperInfoLstByWorkOrdNo(EquipDataVo equipDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<EquipDataVo> equipDataVoList = equipDataService.laserOperInfoLstByWorkOrdNo(equipDataVo);
			jsonData.put("data", equipDataVoList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	// 대시보드에 설비 종합효율 표시
	@RequestMapping(value = "mt/equipTotalEfficiencyDataReadToDashboard", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipTotalEfficiencyDataReadToDashboard(EquipDataVo equipDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			equipDataVo.setDateType("month");
			double momthTimeOperationPercent = equipDataService.timeOperationPercent(equipDataVo);
			double momthFairQtyPercent = equipDataService.fairQtyPercent(equipDataVo);
			double momthPerformanceOperationPercent = equipDataService.performanceOperationPercent(equipDataVo);
			double momthEquipEfficiencyPercent = momthTimeOperationPercent * momthFairQtyPercent * momthPerformanceOperationPercent/10000;
			momthEquipEfficiencyPercent = Math.round(momthEquipEfficiencyPercent*10)/10.0;
			
			jsonData.put("momthTimeOperationPercent", momthTimeOperationPercent);
			jsonData.put("momthFairQtyPercent", momthFairQtyPercent);
			jsonData.put("momthPerformanceOperationPercent", momthPerformanceOperationPercent);
			jsonData.put("momthEquipEfficiencyPercent", momthEquipEfficiencyPercent);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 설비 종합효율
	@RequestMapping(value = "mt/equipTotalEfficiencyDataRead", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipEfficiencyDataRead(EquipDataVo equipDataVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			equipDataVo.setDateType("month");
			double momthTimeOperationPercent = equipDataService.timeOperationPercent(equipDataVo);
			double momthFairQtyPercent = equipDataService.fairQtyPercent(equipDataVo);
			double momthPerformanceOperationPercent = equipDataService.performanceOperationPercent(equipDataVo);
			double momthEquipEfficiencyPercent = momthTimeOperationPercent * momthFairQtyPercent * momthPerformanceOperationPercent/10000;
			momthEquipEfficiencyPercent = Math.round(momthEquipEfficiencyPercent*10)/10.0;
			
			jsonData.put("momthTimeOperationPercent", momthTimeOperationPercent);
			jsonData.put("momthFairQtyPercent", momthFairQtyPercent);
			jsonData.put("momthPerformanceOperationPercent", momthPerformanceOperationPercent);
			jsonData.put("momthEquipEfficiencyPercent", momthEquipEfficiencyPercent);
			
			//설비종합효율 테이블 리스트(설비별 부하시간, 가동시간, 이론CT, 생산량, 투입수량, 불량수량) 조회
			List<EquipDataVo> monthEquipTotalDataList = equipDataService.equipTotalDataList(equipDataVo);
			jsonData.put("monthEquipTotalDataList", monthEquipTotalDataList);
			
			//월별 부하시간
			double a1 = equipDataService.timeOperationPercentMolecule(equipDataVo);
			System.out.println("월별 부하 시간 : " + a1);
			//월별 가동시간
			double b1 = equipDataService.timeOperationPercentDenominator(equipDataVo);
			//월별 이론CT
			double c1 = equipDataService.performanceOperationPercentDenominator(equipDataVo);
			//월별 생산량
			double d1 = equipDataService.getProductionQty(equipDataVo);
			//월별 투입수량
			double e1 = equipDataService.fairQtyPercentMolecule(equipDataVo);
			//월별 불량수량
			double f1 = equipDataService.fairQtyPercentDenominator(equipDataVo);
			
			jsonData.put("a1", a1);
			jsonData.put("b1", b1);
			jsonData.put("c1", c1);
			jsonData.put("d1", d1);
			jsonData.put("e1", e1);
			jsonData.put("f1", f1);
			
			equipDataVo.setDateType("year");
			double yearTimeOperationPercent = equipDataService.timeOperationPercent(equipDataVo);
			double yearFairQtyPercent = equipDataService.fairQtyPercent(equipDataVo);
			double yearPerformanceOperationPercent = equipDataService.performanceOperationPercent(equipDataVo);
			double yearEquipEfficiencyPercent = yearTimeOperationPercent * yearFairQtyPercent * yearPerformanceOperationPercent/10000;
			yearEquipEfficiencyPercent = Math.round(yearEquipEfficiencyPercent*10)/10.0;

			jsonData.put("yearTimeOperationPercent", yearTimeOperationPercent);
			jsonData.put("yearFairQtyPercent", yearFairQtyPercent);
			jsonData.put("yearPerformanceOperationPercent", yearPerformanceOperationPercent);
			jsonData.put("yearEquipEfficiencyPercent", yearEquipEfficiencyPercent);
			
			//설비종합효율 테이블 리스트(설비별 부하시간, 가동시간, 이론CT, 생산량, 투입수량, 불량수량) 조회
			List<EquipDataVo> yearEquipTotalDataList = equipDataService.equipTotalDataList(equipDataVo);
			jsonData.put("yearEquipTotalDataList", yearEquipTotalDataList);
			
			//년별 부하시간
			double A1 = equipDataService.timeOperationPercentMolecule(equipDataVo);
			//년별 가동시간
			double B1 = equipDataService.timeOperationPercentDenominator(equipDataVo);
			//년별 이론CT
			double C1 = equipDataService.performanceOperationPercentDenominator(equipDataVo);
			//년별 생산량
			double D1 = equipDataService.getProductionQty(equipDataVo);
			//년별 투입수량
			double E1 = equipDataService.fairQtyPercentMolecule(equipDataVo);
			//년별 불량수량
			double F1 = equipDataService.fairQtyPercentDenominator(equipDataVo);

			jsonData.put("A1", A1);
			jsonData.put("B1", B1);
			jsonData.put("C1", C1);
			jsonData.put("D1", D1);
			jsonData.put("E1", E1);
			jsonData.put("F1", F1);
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 가공중인 LASER 설비 가공데이터 조회
	@RequestMapping(value = "mt/equipOperatingPercentMonthList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> equipOperatingPercentMonthList(@RequestBody List<Map<String, Object>> equipDataList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			
			String equipCd = equipDataList.get(0).get("equipCd").toString();
			String mainGubun = equipDataList.get(0).get("mainGubun").toString();
			List<EquipDataVo> equipDataVoList= new ArrayList<EquipDataVo>();
			List<EquipDataVo> equipDataVoList2= new ArrayList<EquipDataVo>();
			int dataCount = 0;
			for(Map<String, Object> m : equipDataList) {
				//월별
				EquipDataVo equipDataVo = new EquipDataVo();
				equipDataVo.setSearchDate(m.get("searchDate").toString());
				equipDataVo.setEquipCd(equipCd);
				equipDataVo.setMainGubun(mainGubun);
				equipDataVoList.add(equipDataVo);
				//년별
				if(dataCount<12) {
					EquipDataVo equipDataVo2 = new EquipDataVo();
					equipDataVo2.setSearchDate(m.get("searchMonth").toString());
					equipDataVo2.setEquipCd(equipCd);
					equipDataVo2.setMainGubun(mainGubun);
					equipDataVoList2.add(equipDataVo2);
				}
				dataCount++;
			}
			List<EquipDataVo> equipOperatingPercentMonthList = equipDataService.equipOperatingPercentMonthList(equipDataVoList);
			List<EquipDataVo> equipOperatingPercentYearList = equipDataService.equipOperatingPercentYearList(equipDataVoList2);
			jsonData.put("monthDataList", equipOperatingPercentMonthList);
			jsonData.put("yearDataList", equipOperatingPercentYearList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
	
	// 품질목표대비실적 데이터 조회
	@RequestMapping(value = "mt/faultyPercentYearList", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> faultyPercentYearList(@RequestBody List<Map<String, Object>> equipDataList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			String mainGubun = equipDataList.get(0).get("mainGubun").toString();
			String searchYear = equipDataList.get(0).get("searchYear").toString();
			List<EquipDataVo> equipDataVoList= new ArrayList<EquipDataVo>();
			for(Map<String, Object> m : equipDataList) {
				//월별
				EquipDataVo equipDataVo = new EquipDataVo();
				equipDataVo.setSearchDate(m.get("searchDate").toString());
				equipDataVo.setMainGubun(mainGubun);
				equipDataVoList.add(equipDataVo);
			}
			List<EquipDataVo> equipOperatingPercentMonthList = equipDataService.faultyPercentYearList(equipDataVoList);
			jsonData.put("grapeDataList", equipOperatingPercentMonthList);
			
			EquipDataVo equipDataVo = new EquipDataVo();
			equipDataVo.setMainGubun(mainGubun);
			equipDataVo.setSearchDate(searchYear);
			List<EquipDataVo> faultyTypeYearList = equipDataService.faultyTypeYearList(equipDataVo);
			jsonData.put("pieDataList", faultyTypeYearList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("message", "시스템오류가 발생했습니다.");
			jsonData.put("result", "error");
		}
		return jsonData;
	}
}