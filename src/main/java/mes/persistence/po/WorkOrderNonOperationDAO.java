package mes.persistence.po;

import java.util.List;

import mes.domain.po.WorkOrderNonOperationVo;

public interface WorkOrderNonOperationDAO {

	//비가동등록 리스트 조회
	public List<WorkOrderNonOperationVo> workOrderNonOperationRead(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception;
	
	//비가동등록 생성
	public void workOrderNonOperationCreate(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception;
	
	//비가동등록 수정
	public void workOrderNonOperationUpdate(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception;
	
	//비가동등록 삭제
	public void workOrderNonOperationDelete(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception;
	
	//작업 상태 비가동으로 변경
	public void workOrderPrcssNonOperation(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception;
	
	//비가동시간 계산
	public String getWorkNonTime(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception;
	
	//비가동 시퀀스 생성
	public String createNoSeq(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception;
	
	//가동 시퀀스 가져오기
	public String getNoSeq(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception;
	
	
	

}