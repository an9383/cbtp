package mes.persistence.po;

import java.util.List;

import mes.domain.po.WorkOrderFaultyTypeVo;

public interface WorkOrderFaultyTypeDAO {

	//작업지시 공정별 불량유형 목록조회	
	public List<WorkOrderFaultyTypeVo> listAll(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception;
	
	//작업지시 공정별 불량유형 생성(list)
	public void createList(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception;
	
	//작업지시 공정별 불량유형 수정
	public void update(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception;
	
	//작업지시 공정별 불량유형 초기화
	public void deleteAll(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception;
	
	//작업지시 공정별 불량유형 승인등록
	public void approvalUpdate(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception;
	
	//불량코드별 불량수량 합계
	public int getFaultyTypeSumQty(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception;
	
	//불량등록 조회
	public List<WorkOrderFaultyTypeVo> workOrderFaultyList(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception;
	
}