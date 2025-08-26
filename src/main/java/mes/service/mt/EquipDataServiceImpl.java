package mes.service.mt;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.mt.EquipDataVo;
import mes.persistence.mt.EquipDataDAO;

@Service
public class EquipDataServiceImpl implements EquipDataService {

	@Inject
	private EquipDataDAO dao;
	
	// 가공중인 LASER 설비 가공데이터 조회
	@Override
	public List<EquipDataVo> laserOperInfoLstByEquipCd(EquipDataVo equipDataVo) throws Exception {
		return dao.laserOperInfoLstByEquipCd(equipDataVo);
	}
	
	// 기간별 LASER 설비 실적조회
	@Override
	public List<EquipDataVo> laserOperInfoCntByDate(EquipDataVo equipDataVo) throws Exception {
		return dao.laserOperInfoCntByDate(equipDataVo);
	}
	
	// 기간별 후가공 설비 실적조회
	@Override
	public List<EquipDataVo> finishOperInfoCntByDate(EquipDataVo equipDataVo) throws Exception {
		return dao.finishOperInfoCntByDate(equipDataVo);
	}
	
	// LASER 설비 가동/비가동 조회
	@Override
	public List<EquipDataVo> laserOperNonOperInfoLstByEquipCd(EquipDataVo equipDataVo) throws Exception {
		return dao.laserOperNonOperInfoLstByEquipCd(equipDataVo);
	}
	
	// 가공중인 후가공 설비 가공데이터 조회
	@Override
	public List<EquipDataVo> finishOperInfoLstByEquipCd(EquipDataVo equipDataVo) throws Exception {
		return dao.finishOperInfoLstByEquipCd(equipDataVo);
	}
	
	// 가공중인 LASER 설비 가공데이터 조회
	@Override
	public List<EquipDataVo> laserOperInfoLstByWorkOrdNo(EquipDataVo equipDataVo) throws Exception{
		return dao.laserOperInfoLstByWorkOrdNo(equipDataVo);
	}
	
	//시간가동율
	@Override
	public double timeOperationPercent(EquipDataVo equipDataVo) throws Exception {
		return dao.timeOperationPercent(equipDataVo);
	}
	
	//양품율
	@Override
	public double fairQtyPercent(EquipDataVo equipDataVo) throws Exception {
		return dao.fairQtyPercent(equipDataVo);
	}
	
	//성능가동율
	@Override
	public double performanceOperationPercent(EquipDataVo equipDataVo) throws Exception {
		return dao.performanceOperationPercent(equipDataVo);
	}
	
	//월별 설비가동률 조회
	@Override
	public List<EquipDataVo> equipOperatingPercentMonthList(List<EquipDataVo> equipDataVo) throws Exception {
		return dao.equipOperatingPercentMonthList(equipDataVo);
	}
	
	//년별 설비가동률 조회
	@Override
	public List<EquipDataVo> equipOperatingPercentYearList(List<EquipDataVo> equipDataVo) throws Exception {
		return dao.equipOperatingPercentYearList(equipDataVo);
	}
	
	//월 기준 생산수량, 불량수량 조회
	@Override
	public List<EquipDataVo> faultyPercentYearList(List<EquipDataVo> equipDataVo) throws Exception {
		return dao.faultyPercentYearList(equipDataVo);
	}
	
	//년도 기준 불량타입별 불량 수량 조회
	@Override
	public List<EquipDataVo> faultyTypeYearList(EquipDataVo equipDataVo) throws Exception {
		return dao.faultyTypeYearList(equipDataVo);
	}
	
	//부하시간
	@Override
	public double timeOperationPercentMolecule(EquipDataVo equipDataVo) throws Exception {
		return dao.timeOperationPercentMolecule(equipDataVo);
	}
	
	//가동시간
	@Override
	public double timeOperationPercentDenominator(EquipDataVo equipDataVo) throws Exception {
		return dao.timeOperationPercentDenominator(equipDataVo);
	}
	
	//이론C/T
	@Override
	public double performanceOperationPercentDenominator(EquipDataVo equipDataVo) throws Exception {
		return dao.performanceOperationPercentDenominator(equipDataVo);
	}
	
	//생산량
	@Override
	public double getProductionQty(EquipDataVo equipDataVo) throws Exception {
		return dao.getProductionQty(equipDataVo);
	}
	
	//투입수량
	@Override
	public double fairQtyPercentMolecule(EquipDataVo equipDataVo) throws Exception {
		return dao.fairQtyPercentMolecule(equipDataVo);
	}
	
	//불량수량
	@Override
	public double fairQtyPercentDenominator(EquipDataVo equipDataVo) throws Exception {
		return dao.fairQtyPercentDenominator(equipDataVo);
	}
	
	//설비종합효율 테이블 리스트(설비별 부하시간, 가동시간, 이론CT, 생산량, 투입수량, 불량수량) 조회
	@Override
	public List<EquipDataVo> equipTotalDataList(EquipDataVo equipDataVo) throws Exception {
		return dao.equipTotalDataList(equipDataVo);
	}
}
