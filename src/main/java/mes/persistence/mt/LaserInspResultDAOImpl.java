package mes.persistence.mt;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.mt.LaserInspResultVo;

@Repository
public class LaserInspResultDAOImpl implements LaserInspResultDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.mt.laserInspResultMapper";
	
	// 레이저 측정검사 작지별 목록조회
	@Override
	public List<LaserInspResultVo> laserInspResultList(LaserInspResultVo laserInspResultVo) throws Exception {
		return session.selectList(namespace+".laserInspResultList", laserInspResultVo);
	}
}