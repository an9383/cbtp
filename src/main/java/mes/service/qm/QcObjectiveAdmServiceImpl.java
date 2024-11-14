package mes.service.qm;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.qm.QcObjectiveAdmVo;
import mes.persistence.qm.QcObjectiveAdmDAO;

@Service
public class QcObjectiveAdmServiceImpl implements QcObjectiveAdmService {

	@Inject
	private QcObjectiveAdmDAO dao;
	
	//품질 목표관리 등록
	public void qcObjAdmCreate(QcObjectiveAdmVo qcObjectiveAdmVo) throws Exception{
		dao.qcObjAdmCreate(qcObjectiveAdmVo);
	}
	
	//품질 목표관리 삭제
	public void qcObjAdmDelete(QcObjectiveAdmVo qcObjectiveAdmVo) throws Exception{
		dao.qcObjAdmDelete(qcObjectiveAdmVo);
	}
}
