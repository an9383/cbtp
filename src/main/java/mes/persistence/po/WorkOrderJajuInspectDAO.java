package mes.persistence.po;

import java.util.List;

import mes.domain.po.WorkOrderJajuInspectVo;

public interface WorkOrderJajuInspectDAO {

	//자주검사 리스트 조회
	public List<WorkOrderJajuInspectVo> workOrderJajuInspectRead(WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception;
	
	//기준정보의 자주검사 관리항목 조회
	public List<WorkOrderJajuInspectVo> jajuInspectRead(WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception;
	
	//자주검사가 존재하는지 확인
	public int existWorkOrderJajuInspect(WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception;

	//작업지시 생성
	public void workOrderJajuInspectCreate(WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception;
	
	//작업지시 삭제
	public void workOrderJajuInspectDelete(WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception;
	
	

	
}