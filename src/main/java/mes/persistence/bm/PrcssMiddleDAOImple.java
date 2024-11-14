package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.PrcssMiddleVo;

@Repository
public class PrcssMiddleDAOImple implements PrcssMiddleDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.prcssMiddleAdmMapper";
	
	//중공정 정보 전체 조회
	@Override
	public List<PrcssMiddleVo> prcssMiddleAdmList() throws Exception {
		return session.selectList(namespace +".prcssMiddleAdmList");
	}

	//중공정 정보 가져오기
	@Override
	public PrcssMiddleVo prcssMiddleAdmRead(PrcssMiddleVo Vo) throws Exception {
		return session.selectOne(namespace + ".prcssMiddleAdmRead", Vo);
	}
	
	//중공정 정보 등록
	@Override
	public int prcssMiddleAdmCreate(PrcssMiddleVo Vo) throws Exception {
		return session.update(namespace + ".prcssMiddleAdmCreate", Vo);
	}
	
	//중공정 공정코드 시퀀스 값
	@Override
	public String prcssMiddleCd() throws Exception {
		return session.selectOne(namespace + ".prcssMiddleCd");
	}
	
	//중공정 정보 수정
	@Override
	public int prcssMiddleAdmUpdate(PrcssMiddleVo Vo) throws Exception {
		return session.update(namespace + ".prcssMiddleAdmUpdate", Vo);
	}
	
	//중공정 정보 상세 조회
	@Override
	public List<PrcssMiddleVo> prcssMiddleDtlList(PrcssMiddleVo Vo) throws Exception {
		return session.selectList(namespace + ".prcssMiddleDtlList" ,Vo);
	}
	
	//중공정 정보 등록
	@Override
	public int prcssMiddleDtlCreate(PrcssMiddleVo Vo) throws Exception {
		return session.update(namespace + ".prcssMiddleDtlCreate", Vo);
	}
	
	//중공정 정보 삭제
	@Override
	public int prcssMiddleDtlDelete(PrcssMiddleVo Vo) throws Exception {
		return session.delete(namespace + ".prcssMiddleDtlDelete", Vo);
	}
	
	//중공정 정보 전체 삭제
	@Override
	public int prcssMiddleDtlDeleteAll(PrcssMiddleVo Vo) throws Exception {
		return session.delete(namespace + ".prcssMiddleDtlDeleteAll", Vo);
	}
	
	@Override
	public int prcssSeq(PrcssMiddleVo Vo) throws Exception {
		return session.selectOne(namespace + ".prcssSeq", Vo);
	}
	
	@Override
	public String prcssCd(PrcssMiddleVo Vo) throws Exception {
		return session.selectOne(namespace + ".prcssCd", Vo);
	}
	
	
}
