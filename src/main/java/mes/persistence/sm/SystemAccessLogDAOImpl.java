package mes.persistence.sm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.sm.SystemAccessLogVo;

@Repository
public class SystemAccessLogDAOImpl implements SystemAccessLogDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "mes.mappers.sm.SystemAccessLogMapper";
	
	//사용자 목록 조회
	@Override
	public List<SystemAccessLogVo> smlistAll(SystemAccessLogVo systemAccessLogVo) throws Exception {
		return session.selectList(namespace + ".smlistAll", systemAccessLogVo);	
	}
	
	//로그이력관리 조회
	@Override
	public List<SystemAccessLogVo> systemChangeLogList(SystemAccessLogVo systemAccessLogVo) throws Exception {
		return session.selectList(namespace + ".systemChangeLogList", systemAccessLogVo);	
	}

	//사용자 상세조회
	@Override
	public SystemAccessLogVo read(SystemAccessLogVo systemAccessLogVo) throws Exception {
		return session.selectOne(namespace + ".read", systemAccessLogVo);
	}

	//로그 등록
	@Override
	public void create(SystemAccessLogVo systemAccessLogVo) throws Exception {
		session.insert(namespace + ".create", systemAccessLogVo);
	}

	//사용자 수정
	@Override
	public void update(SystemAccessLogVo systemAccessLogVo) throws Exception {
		session.update(namespace + ".update", systemAccessLogVo);

	}

	//사번 시퀀스
	@Override
	public String selectUserNumberSeq() throws Exception {
		return session.selectOne(namespace + ".selectUserNumberSeq");
	}
	
	//이력 등록
	@Override
	public void systemChangeLogCreate(SystemAccessLogVo systemAccessLogVo) throws Exception {
		session.insert(namespace + ".systemChangeLogCreate", systemAccessLogVo);
	}

}
