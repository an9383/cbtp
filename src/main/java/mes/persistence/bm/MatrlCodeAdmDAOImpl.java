package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.MatrlCodeAdmVo;

@Repository
public class MatrlCodeAdmDAOImpl implements MatrlCodeAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "mes.mappers.bm.matrlCodeAdmMapper";

	//자재코드관리 목록조회
	@Override
	public List<MatrlCodeAdmVo> listAll(MatrlCodeAdmVo matrlCodeAdmVo) throws Exception {
		return session.selectList(namespace + ".listAll", matrlCodeAdmVo);
	}
	
	//자재코드관리 상세조회
	@Override
	public MatrlCodeAdmVo read(MatrlCodeAdmVo matrlCodeAdmVo) throws Exception {		
		return session.selectOne(namespace + ".read", matrlCodeAdmVo);
	}	
		
	//자재코드관리 등록
	@Override
	public void create(MatrlCodeAdmVo matrlCodeAdmVo) throws Exception {
		session.insert(namespace + ".create", matrlCodeAdmVo);
	}

	//자재코드관리 수정	
	@Override
	public void update(MatrlCodeAdmVo matrlCodeAdmVo) throws Exception {
		session.update(namespace + ".update", matrlCodeAdmVo);
	}

	//자재코드관리 코드시퀀스조회	
	@Override
	public String selectMatrlSeqCd() throws Exception{
		return session.selectOne(namespace + ".selectMatrlSeqCd");
	}
	
	//자재코드관리 자재명/규격 중복 확인	
	@Override
	public int overlapChack(MatrlCodeAdmVo matrlCodeAdmVo) throws Exception{
		return session.selectOne(namespace + ".overlapChack", matrlCodeAdmVo);
	}
}
