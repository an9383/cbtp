package mes.persistence.po;

import java.util.List;

import mes.domain.po.WorkOrderMatrlVo;

public interface WorkOrderMatrlDAO {

	//작업지시별 자재투입 목록조회	
	public List<WorkOrderMatrlVo> listAll(WorkOrderMatrlVo workOrderMatrlVo) throws Exception;
	
	//자재투입내역(ADM)
	public List<WorkOrderMatrlVo> workOrdMatrlListAdm(WorkOrderMatrlVo workOrderMatrlVo) throws Exception;
	
	//자재투입내역(DTL)
	public List<WorkOrderMatrlVo> workOrdMatrlListDtl(WorkOrderMatrlVo workOrderMatrlVo) throws Exception;
	
	//자재투입내역 자재별 투입현황 조회
	public WorkOrderMatrlVo workOrdMatrlPartRead(WorkOrderMatrlVo workOrderMatrlVo) throws Exception;
	
	//자재투입처리 등록
	public void workOrdMatrlAdd(WorkOrderMatrlVo workOrderMatrlVo) throws Exception;
	
	//자재투입처리 수정
	public void workOrdMatrlEdit(WorkOrderMatrlVo workOrderMatrlVo) throws Exception;
	
	//자재투입처리 목록조회
	public int workOrdMatrlList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception;
	
	//자재투입처리 투입삭제
	public int workOrdMatrlDel(WorkOrderMatrlVo workOrderMatrlVo) throws Exception;
	
	//선입선출 자재투입 조회(사출)
	public WorkOrderMatrlVo workOrdMatrlFifoList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception;
	
	//선입선출 자재투입 조회(봉제)
	public WorkOrderMatrlVo workOrdMatrlFifoListByBongjae(WorkOrderMatrlVo workOrderMatrlVo) throws Exception;
	
	//해당 바코드가 투입된 작업지시 상태(사출)
	public String getMatrlWorkStatus(WorkOrderMatrlVo workOrderMatrlVo) throws Exception;
	
	//해당 바코드가 투입된 작업지시 상태(봉제)
	public String getMatrlWorkStatusByBongjae(WorkOrderMatrlVo workOrderMatrlVo) throws Exception;


}