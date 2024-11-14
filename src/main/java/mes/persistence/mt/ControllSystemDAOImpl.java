package mes.persistence.mt;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.mt.ControllSystemVo;

@Repository
public class ControllSystemDAOImpl implements ControllSystemDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.mt.controllSystemMapper";
	
	// 전기량, 온습도 현황 리스트
	@Override
	public List<ControllSystemVo> controllSystemList(ControllSystemVo controllSystemVo) throws Exception {
		return session.selectList(namespace+".controllSystemList", controllSystemVo);
	}
	
	// 전기량, 온습도 현황 리스트
	@Override
	public void controllSystemCreate(ControllSystemVo controllSystemVo) throws Exception {
		session.insert(namespace+".controllSystemCreate", controllSystemVo);
	}
	
	// 전기량, 온습도 현황 리스트
	@Override
	public List<ControllSystemVo> controllSystemBoardList(ControllSystemVo controllSystemVo) throws Exception {
		return session.selectList(namespace+".controllSystemBoardList", controllSystemVo);
	}
	
	// 레이저 온습도 현황 리스트
	@Override
	public ControllSystemVo controllSystemLaser(ControllSystemVo controllSystemVo) throws Exception {
		return session.selectOne(namespace+".controllSystemLaser", controllSystemVo);
	}

	// 레이저 온습도 현황 리스트
	@Override
	public List<ControllSystemVo> controllSystemLaserList(ControllSystemVo controllSystemVo) throws Exception {
		return session.selectList(namespace+".controllSystemLaserList", controllSystemVo);
	}
	
	// 후가공 온습도 현황 리스트
	@Override
	public ControllSystemVo controllSystemFinish(ControllSystemVo controllSystemVo) throws Exception {
		return session.selectOne(namespace+".controllSystemFinish", controllSystemVo);
	}

	// 후가공 온습도 현황 리스트
	@Override
	public List<ControllSystemVo> controllSystemFinishList(ControllSystemVo controllSystemVo) throws Exception {
		return session.selectList(namespace+".controllSystemFinishList", controllSystemVo);
	}
}