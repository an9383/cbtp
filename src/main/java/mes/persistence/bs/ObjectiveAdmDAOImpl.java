package mes.persistence.bs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bs.ObjectiveAdmVo;

@Repository
public class ObjectiveAdmDAOImpl implements ObjectiveAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="mes.mappers.bs.objectiveAdmMapper";
	
	//목표관리 목록 조회
	@Override
	public List<ObjectiveAdmVo> listAll(ObjectiveAdmVo objectiveAdmVo) throws Exception{
		return session.selectList(namespace+".listAll",objectiveAdmVo);
	}
	
	//목표관리 모달 조회
	@Override
	public List<ObjectiveAdmVo> read(ObjectiveAdmVo objectiveAdmVo) throws Exception{
		return session.selectList(namespace+".read",objectiveAdmVo);
	}
	
	//목표관리 생성
	@Override
	public void create(ObjectiveAdmVo objectiveAdmVo) throws Exception{
		session.insert(namespace+".create",objectiveAdmVo);
	}
	
	//목표관리 삭제
	@Override
	public void delete(ObjectiveAdmVo objectiveAdmVo) throws Exception{
		session.delete(namespace+".delete",objectiveAdmVo);
	}
	

}
