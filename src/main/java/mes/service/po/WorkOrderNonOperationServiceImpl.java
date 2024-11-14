package mes.service.po;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.po.WorkOrderNonOperationVo;
import mes.persistence.po.WorkOrderNonOperationDAO;

@Service
public class WorkOrderNonOperationServiceImpl implements WorkOrderNonOperationService {

	@Inject
	private WorkOrderNonOperationDAO dao;
	 
	//비가동등록 리스트 조회
	@Override
	public List<WorkOrderNonOperationVo> workOrderNonOperationRead(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		return dao.workOrderNonOperationRead(workOrderNonOperationVo);
	}
	
	//비가동등록 생성
	@Override
	public void workOrderNonOperationCreate(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		dao.workOrderNonOperationCreate(workOrderNonOperationVo);
	}
	
	//비가동등록 수정
	public void workOrderNonOperationUpdate(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception{
		dao.workOrderNonOperationUpdate(workOrderNonOperationVo);
	}
	
	//비가동등록 삭제
	@Override
	public void workOrderNonOperationDelete(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		dao.workOrderNonOperationDelete(workOrderNonOperationVo);
	}
	
	//작업 상태 비가동으로 변경
	@Override
	public void workOrderPrcssNonOperation(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		dao.workOrderPrcssNonOperation(workOrderNonOperationVo);
	}
	
	//비가동시간 계산
	@Override
	public String getWorkNonTime(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception{
		return dao.getWorkNonTime(workOrderNonOperationVo);
	}
	
	//비가동 시퀀스 생성
	public String createNoSeq(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception{
		return dao.createNoSeq(workOrderNonOperationVo);
	}
	
	//가동 시퀀스 가져오기
	public String getNoSeq(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception{
		return dao.getNoSeq(workOrderNonOperationVo);
	}
	
	

}
	