package mes.persistence.qm;

import mes.domain.qm.QcObjectiveAdmVo;

public interface QcObjectiveAdmDAO {

	//품질 목표관리 등록
	public void qcObjAdmCreate(QcObjectiveAdmVo qcObjectiveAdmVo) throws Exception;
	
	//품질 목표관리 삭제
	public void qcObjAdmDelete(QcObjectiveAdmVo qcObjectiveAdmVo) throws Exception;
	
}
