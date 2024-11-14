package mes.persistence.qm;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.qm.QcObjectiveAdmVo;

@Repository
public class QcObjectiveAdmDAOImpl implements QcObjectiveAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.qm.qcObjectiveMapper";
	
	//품질 목표관리 등록
	public void qcObjAdmCreate(QcObjectiveAdmVo qcObjectiveAdmVo) throws Exception{
		session.insert(namespace+".qcObjAdmCreate" ,qcObjectiveAdmVo );
	}
	
	//품질 목표관리 삭제
	public void qcObjAdmDelete(QcObjectiveAdmVo qcObjectiveAdmVo) throws Exception{
		session.delete(namespace+".qcObjAdmDelete" ,qcObjectiveAdmVo );
	}
}
