package mes.service.bs;

import java.util.List;

import mes.domain.bs.ObjectiveAdmVo;

public interface ObjectiveAdmService {
	
	//목표관리 목록 조회
	public List<ObjectiveAdmVo> listAll(ObjectiveAdmVo objectiveAdmVo) throws Exception;
	
	//목표관리 모달 조회
	public List<ObjectiveAdmVo> read(ObjectiveAdmVo objectiveAdmVo) throws Exception;
	
	//목표관리 생성
	public void create(ObjectiveAdmVo objectiveAdmVo) throws Exception;
	
	//목표관리 삭제
	public void delete(ObjectiveAdmVo objectiveAdmVo) throws Exception;
	
}
