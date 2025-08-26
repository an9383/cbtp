package mes.persistence.po;

import java.util.List;

import mes.domain.po.WorkOrderResultVo;

public interface WorkOrderResultDAO {

	//설비별 가동실적조회 목록조회
	public List<WorkOrderResultVo> listAll(WorkOrderResultVo workOrderResultVo) throws Exception;
}