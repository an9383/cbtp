package mes.persistence.mt;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.mt.LaserOperInfoVo;

@Repository
public class LaserOperInfoDAOImpl implements LaserOperInfoDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.mt.laserOperInfoMapper";
	
	// 제조조건 모니터링 리스트
	@Override
	public List<LaserOperInfoVo> laserOperInfoList(LaserOperInfoVo laserOperInfoVo) throws Exception {
		return session.selectList(namespace+".laserOperInfoList", laserOperInfoVo);
	}
	
	// 제조조건 모니터링 상세 리스트
	@Override
	public List<LaserOperInfoVo> laserOperInfoDtlList(LaserOperInfoVo laserOperInfoVo) throws Exception {
		return session.selectList(namespace+".laserOperInfoDtlList", laserOperInfoVo);
	}
	
	// 제조조건 모니터링 단계 구하기
	@Override
	public int laserOperInfoStageCount(LaserOperInfoVo laserOperInfoVo) throws Exception {
		return session.selectOne(namespace+".laserOperInfoStageCount", laserOperInfoVo);
	}
	
}