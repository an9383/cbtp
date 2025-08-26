package mes.persistence.mt;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.FactoryCalendarVo;
import mes.domain.mt.EquipDataVo;
import mes.service.bm.FactoryCalendarService;

@Repository
public class EquipDataDAOImpl implements EquipDataDAO{
	
	@Inject
	private SqlSession session;
	@Inject
	private FactoryCalendarService factoryCalendarService;
	
	private static String namespace = "mes.mappers.mt.equipDataMapper";
	
	// 가공중인 LASER 설비 가공데이터 조회
	@Override
	public List<EquipDataVo> laserOperInfoLstByEquipCd(EquipDataVo equipDataVo) throws Exception {
		return session.selectList(namespace+".laserOperInfoLstByEquipCd", equipDataVo);
	}
	
	// 기간별 LASER 설비 실적조회
	@Override
	public List<EquipDataVo> laserOperInfoCntByDate(EquipDataVo equipDataVo) throws Exception {
		return session.selectList(namespace+".laserOperInfoCntByDate", equipDataVo);
	}
	
	// 기간별 후가공 설비 실적조회
	@Override
	public List<EquipDataVo> finishOperInfoCntByDate(EquipDataVo equipDataVo) throws Exception {
		return session.selectList(namespace+".finishOperInfoCntByDate", equipDataVo);
	}
	
	// LASER 설비 가동/비가동 조회
	@Override
	public List<EquipDataVo> laserOperNonOperInfoLstByEquipCd(EquipDataVo equipDataVo) throws Exception {
		return session.selectList(namespace+".laserOperNonOperInfoLstByEquipCd", equipDataVo);
	}
	
	// 가공중인 후가공 설비 가공데이터 조회
	@Override
	public List<EquipDataVo> finishOperInfoLstByEquipCd(EquipDataVo equipDataVo) throws Exception {
		return session.selectList(namespace+".finishOperInfoLstByEquipCd", equipDataVo);
	}
	
	// 가공중인 LASER 설비 가공데이터 조회
	@Override
	public List<EquipDataVo> laserOperInfoLstByWorkOrdNo(EquipDataVo equipDataVo) throws Exception{
		return session.selectList(namespace+".laserOperInfoLstByWorkOrdNo" , equipDataVo);
	}
	
	//시간가동율
	@Override
	public double timeOperationPercent(EquipDataVo equipDataVo) throws Exception {
		//분자
		double denominator = session.selectOne(namespace+".timeOperationPercentDenominator", equipDataVo);
		//분모
		double molecule = session.selectOne(namespace+".timeOperationPercentMolecule", equipDataVo);
		
		if(molecule==0 || denominator == 0) {
			return 0;
		} else {
			return (Math.round((denominator/molecule*100)*10)/10.0);
		}
		
	}
	
	//양품율
	@Override
	public double fairQtyPercent(EquipDataVo equipDataVo) throws Exception {
		//분자
		double denominator = session.selectOne(namespace+".fairQtyPercentDenominator", equipDataVo);
		//분모
		double molecule = session.selectOne(namespace+".fairQtyPercentMolecule", equipDataVo);
		
		if(molecule==0) {
			return 0;
		} else {
			if(molecule-denominator==0) {
				return 0;
			}
			return (Math.round(((molecule-denominator)/molecule*100)*10)/10.0);
		}
	}
	
	//성능가동율
	@Override
	public double performanceOperationPercent(EquipDataVo equipDataVo) throws Exception {
		//분자
		double denominator = session.selectOne(namespace+".performanceOperationPercentDenominator", equipDataVo);
		//분모
		double molecule = session.selectOne(namespace+".performanceOperationPercentMolecule", equipDataVo);
		
		if(molecule==0 || denominator == 0) {
			return 0;
		} else {
			return (Math.round((denominator/molecule*100)*10)/10.0);
		}
	}
	
	//월별 설비가동률 조회
	@Override
	public List<EquipDataVo> equipOperatingPercentMonthList(List<EquipDataVo> equipDataVo) throws Exception {
		return session.selectList(namespace+".equipOperatingPercentMonthList", equipDataVo);
	}
	
	//년별 설비가동률 조회
	@Override
	public List<EquipDataVo> equipOperatingPercentYearList(List<EquipDataVo> equipDataVo) throws Exception {
		return session.selectList(namespace+".equipOperatingPercentYearList", equipDataVo);
	}
	
	//월 기준 생산수량, 불량수량 조회
	@Override
	public List<EquipDataVo> faultyPercentYearList(List<EquipDataVo> equipDataVo) throws Exception {
		return session.selectList(namespace+".faultyPercentYearList", equipDataVo);
	}
	
	//년도 기준 불량타입별 불량 수량 조회
	@Override
	public List<EquipDataVo> faultyTypeYearList(EquipDataVo equipDataVo) throws Exception {
		return session.selectList(namespace+".faultyTypeYearList", equipDataVo);
	}
	
	//부하시간
	@Override
	public double timeOperationPercentMolecule(EquipDataVo equipDataVo) throws Exception {
		return session.selectOne(namespace+".timeOperationPercentMolecule", equipDataVo);
	}
	
	//가동시간
	@Override
	public double timeOperationPercentDenominator(EquipDataVo equipDataVo) throws Exception {
		return session.selectOne(namespace+".timeOperationPercentDenominator", equipDataVo);
	}
	
	//이론C/T
	@Override
	public double performanceOperationPercentDenominator(EquipDataVo equipDataVo) throws Exception {
		return session.selectOne(namespace+".performanceOperationPercentDenominator", equipDataVo);
	}
	
	//생산량
	@Override
	public double getProductionQty(EquipDataVo equipDataVo) throws Exception {
		return session.selectOne(namespace+".getProductionQty", equipDataVo);
	}
	
	//투입수량
	@Override
	public double fairQtyPercentMolecule(EquipDataVo equipDataVo) throws Exception {
		return session.selectOne(namespace+".fairQtyPercentMolecule", equipDataVo);
	}
	
	//불량수량
	@Override
	public double fairQtyPercentDenominator(EquipDataVo equipDataVo) throws Exception {
		return session.selectOne(namespace+".fairQtyPercentDenominator", equipDataVo);
	}
	
	//설비종합효율 테이블 리스트(설비별 부하시간, 가동시간, 이론CT, 생산량, 투입수량, 불량수량) 조회
	@Override
	public List<EquipDataVo> equipTotalDataList(EquipDataVo equipDataVo) throws Exception {
		return session.selectList(namespace+".equipTotalDataList", equipDataVo);
	}
}