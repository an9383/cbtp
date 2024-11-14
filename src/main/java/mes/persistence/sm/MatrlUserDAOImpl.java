package mes.persistence.sm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.sm.MatrlUserVo;

@Repository
public class MatrlUserDAOImpl implements MatrlUserDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "mes.mappers.sm.matrlUserMapper";
	//사용자 목록조회
	@Override
	public List<MatrlUserVo> listAll(MatrlUserVo matrlUserVo) throws Exception{
		return session.selectList(namespace + ".listAll" , matrlUserVo);
	}
	//사용자 상세조회
	@Override
	public MatrlUserVo read(MatrlUserVo matrlUserVo) throws Exception{
		return session.selectOne(namespace + ".read", matrlUserVo);
	}
	
	//사용자 등록
	@Override
	public void create(MatrlUserVo matrlUserVo) throws Exception{
		session.insert(namespace + ".create", matrlUserVo);
	}
	
	//사용자 수정
	@Override
	public void update(MatrlUserVo matrlUserVo) throws Exception{
		session.update(namespace + ".update", matrlUserVo);
	}
	
	//사번 시퀀스
	@Override
	public String selectUserNumberSeq() throws Exception{
		return session.selectOne(namespace + ".selectUserNumberSeq");
	}
	
	//사용자 삭제
	@Override
	public void matrlUserDelete(MatrlUserVo matrlUserVo) throws Exception {
		session.delete(namespace+".matrlUserDelete", matrlUserVo);
	}
	
	//관리자 계정 조회
	@Override
	public MatrlUserVo adminRead(MatrlUserVo matrlUserVo) throws Exception{
		return session.selectOne(namespace + ".adminRead", matrlUserVo);
	}
	
	//이미지 삭제
	@Override
	public void imageDelete(MatrlUserVo matrlUserVo) throws Exception {
		session.update(namespace+".imageDelete", matrlUserVo);
	}
}
