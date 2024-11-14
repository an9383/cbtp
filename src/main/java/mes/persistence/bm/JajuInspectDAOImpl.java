package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.JajuInspectVo;

@Repository
public class JajuInspectDAOImpl implements JajuInspectDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.jajuInspectMapper";

	//자주검사 리스트 조회
	@Override
	public List<JajuInspectVo> jajuInspectList() throws Exception {
		return session.selectList(namespace +".jajuInspectList");
	}
	
	//자주검사 상세 조회
	@Override
	public JajuInspectVo jajuInspectRead(JajuInspectVo jajuInspectVo) throws Exception {
		return session.selectOne(namespace +".jajuInspectRead", jajuInspectVo);
	}
	
	//자주검사 관리항목 리스트 조회
	@Override
	public List<JajuInspectVo> jajuInspectDtlRead(JajuInspectVo jajuInspectVo) throws Exception {
		return session.selectList(namespace +".jajuInspectDtlRead", jajuInspectVo);
	}
	
	//자주검사 등록
	@Override
	public void jajuInspectCreate(JajuInspectVo jajuInspectVo) throws Exception {
		session.insert(namespace +".jajuInspectCreate", jajuInspectVo);
	}
	
	//자주검사 수정
	@Override
	public void jajuInspectUpdate(JajuInspectVo jajuInspectVo) throws Exception {
		session.update(namespace +".jajuInspectUpdate", jajuInspectVo);
	}
	
	//자주검사 코드 값 가져오기
	@Override
	public String getWorkCd() throws Exception {
		return session.selectOne(namespace +".getWorkCd");
	}
	
	//자주검사 등록 시 등록된 소공정인지 확인
	@Override
	public int checkPrcssCdCreate(JajuInspectVo jajuInspectVo) throws Exception {
		return session.selectOne(namespace +".checkPrcssCdCreate", jajuInspectVo);
	}
	
	//자주검사 수정 시 등록된 소공정인지 확인
	@Override
	public int checkPrcssCdUpdate(JajuInspectVo jajuInspectVo) throws Exception {
		return session.selectOne(namespace +".checkPrcssCdUpdate", jajuInspectVo);
	}
	
}
