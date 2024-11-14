package mes.persistence.qm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.qm.IllumAdmVo;

@Repository
public class IllumAdmDAOImpl implements IllumAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.qm.illumAdmMapper";
	
	//조도측정 adm조회
	@Override
	public List<IllumAdmVo> illumAdmList(IllumAdmVo illumAdmVo) throws Exception{
		return session.selectList(namespace+".illumAdmList", illumAdmVo);
	}
	
//	//조도측정 상세조회
//	@Override
//	public IllumAdmVo illumAdmRead(IllumAdmVo illumAdmVo) throws Exception{
//		return session.selectOne(namespace+".illumAdmRead", illumAdmVo);
//	}
	
	//조도측정 상세조회(List)
	public List<IllumAdmVo> illumDtlList(IllumAdmVo illumAdmVo) throws Exception{
		return session.selectList(namespace+".illumDtlList", illumAdmVo);
	}
	
	//조도측정 Adm 등록
	@Override
	public void illumAdmCreate(IllumAdmVo illumAdmVo) {
		session.insert(namespace + ".illumAdmCreate", illumAdmVo);
	}
	
	//조도측정 Adm 수정
	@Override
	public void illumAdmUpdate(IllumAdmVo illumAdmVo) throws Exception {
		session.update(namespace + ".illumAdmUpdate" , illumAdmVo);
	}
	
	
	//조도측정 Dtl 등록
	@Override
	public void illumDtlCreate(IllumAdmVo illumAdmVo) {
		session.insert(namespace + ".illumDtlCreate", illumAdmVo);
	}
	
	//조도측정 Dtl 수정
	@Override
	public void illumDtlUpdate(IllumAdmVo illumAdmVo) throws Exception {
		session.update(namespace + ".illumDtlUpdate" , illumAdmVo);
	}
	
	//조도측정 삭제
	@Override
	public void illumDelete(IllumAdmVo illumAdmVo) throws Exception {
		session.update(namespace + ".illumDelete" , illumAdmVo);
	}
	
	
	//조도측정 조회(qmsc0080)
	@Override
	public List<IllumAdmVo> illumLookup(IllumAdmVo illumAdmVo) throws Exception{
		return session.selectList(namespace+".illumLookup", illumAdmVo);
	}
	
		
}
