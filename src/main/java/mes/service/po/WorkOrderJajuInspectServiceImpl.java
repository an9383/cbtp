package mes.service.po;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.po.WorkOrderJajuInspectVo;
import mes.persistence.po.WorkOrderJajuInspectDAO;

@Service
public class WorkOrderJajuInspectServiceImpl implements WorkOrderJajuInspectService {

	@Inject
	private WorkOrderJajuInspectDAO dao;
	 
	//자주검사 리스트 조회
	public List<WorkOrderJajuInspectVo> workOrderJajuInspectRead(WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception {
		return dao.workOrderJajuInspectRead(workOrderJajuInspectVo);
	}
	
	//기준정보의 자주검사 관리항목 조회
	public List<WorkOrderJajuInspectVo> jajuInspectRead(WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception {
		return dao.jajuInspectRead(workOrderJajuInspectVo);
	}
	
	//자주검사가 존재하는지 확인
	public int existWorkOrderJajuInspect(WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception {
		return dao.existWorkOrderJajuInspect(workOrderJajuInspectVo);
	}

	//작업지시 생성
	public void workOrderJajuInspectCreate(WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception {
		dao.workOrderJajuInspectCreate(workOrderJajuInspectVo);
	}
	
	//작업지시 삭제
	public void workOrderJajuInspectDelete(WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception {
		dao.workOrderJajuInspectDelete(workOrderJajuInspectVo);
	}

}
	