package mes.persistence.mt;

import java.util.List;

import mes.domain.mt.EquipDataVo;

public interface EquipDataDAO {
	
	// 가공중인 LASER 설비 가공데이터 조회
	public List<EquipDataVo> laserOperInfoLstByEquipCd(EquipDataVo equipDataVo) throws Exception;
	
	// 기간별 LASER 설비 실적조회
	public List<EquipDataVo> laserOperInfoCntByDate(EquipDataVo equipDataVo) throws Exception;
	
	// 기간별 후가공 설비 실적조회
	public List<EquipDataVo> finishOperInfoCntByDate(EquipDataVo equipDataVo) throws Exception;
	
	// LASER 설비 가동/비가동 조회
	public List<EquipDataVo> laserOperNonOperInfoLstByEquipCd(EquipDataVo equipDataVo) throws Exception;
	
	// 가공중인 후가공 설비 가공데이터 조회
	public List<EquipDataVo> finishOperInfoLstByEquipCd(EquipDataVo equipDataVo) throws Exception;
	
	// 가공중인 LASER 설비 가공데이터 조회
	public List<EquipDataVo> laserOperInfoLstByWorkOrdNo(EquipDataVo equipDataVo) throws Exception;
	
	//시간가동율
	public double timeOperationPercent(EquipDataVo equipDataVo) throws Exception;
	
	//양품율
	public double fairQtyPercent(EquipDataVo equipDataVo) throws Exception;
	
	//성능가동율
	public double performanceOperationPercent(EquipDataVo equipDataVo) throws Exception;
	
	//월별 설비가동률 조회
	public List<EquipDataVo> equipOperatingPercentMonthList(List<EquipDataVo> equipDataVo) throws Exception;
	
	//년별 설비가동률 조회
	public List<EquipDataVo> equipOperatingPercentYearList(List<EquipDataVo> equipDataVo) throws Exception;
	
	//월 기준 생산수량, 불량수량 조회
	public List<EquipDataVo> faultyPercentYearList(List<EquipDataVo> equipDataVo) throws Exception;
	
	//년도 기준 불량타입별 불량 수량 조회
	public List<EquipDataVo> faultyTypeYearList(EquipDataVo equipDataVo) throws Exception;
	
	//부하시간
	public double timeOperationPercentMolecule(EquipDataVo equipDataVo) throws Exception;
	
	//가동시간
	public double timeOperationPercentDenominator(EquipDataVo equipDataVo) throws Exception;
	
	//이론C/T
	public double performanceOperationPercentDenominator(EquipDataVo equipDataVo) throws Exception;
	
	//생산량
	public double getProductionQty(EquipDataVo equipDataVo) throws Exception;
	
	//투입수량
	public double fairQtyPercentMolecule(EquipDataVo equipDataVo) throws Exception;
	
	//불량수량
	public double fairQtyPercentDenominator(EquipDataVo equipDataVo) throws Exception;
	
	//설비종합효율 테이블 리스트(설비별 부하시간, 가동시간, 이론CT, 생산량, 투입수량, 불량수량) 조회
	public List<EquipDataVo> equipTotalDataList(EquipDataVo equipDataVo) throws Exception;
}