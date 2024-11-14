package mes.service.po;

import java.util.List;

import mes.domain.po.WorkOrderResultVo;

public interface WorkOrderResultService {
	
	//설비별 가동실적관리 목록조회
	public List<WorkOrderResultVo> listAll(WorkOrderResultVo workOrderResultVo) throws Exception;
}