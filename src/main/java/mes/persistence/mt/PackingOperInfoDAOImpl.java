package mes.persistence.mt;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.mt.EquipDataVo;
import mes.domain.mt.PackingOperInfoVo;
import mes.service.bm.FactoryCalendarService;

@Repository
public class PackingOperInfoDAOImpl implements PackingOperInfoDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.mt.packingOperInfoMapper";
	
	// 금일 가장 최신 데이터 조회
	@Override
	public List<PackingOperInfoVo> packingOperInfoTodayData(PackingOperInfoVo packingOperInfoVo) throws Exception {
		return session.selectList(namespace+".packingOperInfoTodayData", packingOperInfoVo);
	}
}