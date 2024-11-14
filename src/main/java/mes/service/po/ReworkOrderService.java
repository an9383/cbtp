package mes.service.po;

import java.util.List;

import mes.domain.po.WorkOrderPrcssVo;
import mes.domain.po.WorkOrderVo;

public interface ReworkOrderService {
	
	//재작업지시 목록 조회
	public List<WorkOrderVo> listAll(WorkOrderVo workOrderVo) throws Exception;
	
	//재작업지시 상세 조회
	public WorkOrderVo reworkOrdRead(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시 모달조회
	public List<WorkOrderPrcssVo> reworkOrdList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;	
	
	//기존작지 업데이트
	public void lastYnUpdate(WorkOrderVo workOrderVo) throws Exception;
	
	//재작업작지 수정
	public void reworkOrdUpdate(WorkOrderVo workOrderVo) throws Exception;
}
