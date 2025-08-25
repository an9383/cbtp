package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.ManHourAdmVo;

@Repository
public class ManHourAdmDAOImpl implements ManHourAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.manHourAdmMapper";
	
	//공수관리 전체조회
	public List<ManHourAdmVo>manHourAdmList(ManHourAdmVo manHourAdmVo) throws Exception {
		return session.selectList(namespace+".manHourAdmList", manHourAdmVo);
	}
	
	//공수관리  상세조회
	public ManHourAdmVo manHourAdmRead(ManHourAdmVo manHourAdmVo) throws Exception {
		return session.selectOne(namespace+".manHourAdmRead", manHourAdmVo);
	}

	//공수관리 등록
	public void manHourAdmCreate(ManHourAdmVo manHourAdmVo) throws Exception {
		session.insert(namespace+".manHourAdmCreate", manHourAdmVo);
	}
			
	
	//관련 정보 수정
	public void manHourAdmUpdate(ManHourAdmVo manHourAdmVo) throws Exception {
		session.update(namespace+".manHourAdmUpdate", manHourAdmVo);
	}
	
	//관련자료 시퀀스
	public String manHourAdmSeq(ManHourAdmVo manHourAdmVo) throws Exception {
		return session.selectOne(namespace + ".manHourAdmSeq",manHourAdmVo);
	}
	
}
