package mes.persistence.po;

import java.util.List;

import mes.domain.po.WorkOrderAdmVo;

public interface WorkOrderAdmDAO {

	//생산실적(후가공) 정보
	public List<WorkOrderAdmVo> workOrderFinishListByWorkOrdNo(WorkOrderAdmVo workOrderAdmVo) throws Exception;
	
	//생산실적(레이저) 정보 
	public List<WorkOrderAdmVo> workOrderRaserListByWorkOrdNo(WorkOrderAdmVo workOrderAdmVo) throws Exception;
	
	//생산실적(레이저) 누적 정보 
	public WorkOrderAdmVo workOrderRaserAccList(WorkOrderAdmVo workOrderAdmVo) throws Exception;

	//생산시작인 작업지시번호 조회
	public String workStartGetWorkOrdNo(WorkOrderAdmVo workOrderAdmVo) throws Exception;
	
	//작업지시번호 존재여부
	public int workOrdNoExist(WorkOrderAdmVo workOrderAdmVo) throws Exception;
	
	
	//생산실적(레이저) 작업지시번호 채번
	public String workOrderAdmGetWorkOrdNo(WorkOrderAdmVo workOrderAdmVo) throws Exception;
	
	//생산실적(레이저) 작업지시생성
	public void workOrderAdmIns(List<WorkOrderAdmVo> workOrderAdmVo) throws Exception;
	
	//생산실적(레이저) 작업지시수정
	public void workOrderAdmUpd(WorkOrderAdmVo workOrderAdmVo) throws Exception;
	
	//생산실적 수량 수정
	public void workOrderAdmQtyUpd(WorkOrderAdmVo workOrderAdmVo) throws Exception;
	
	//생산실적(레이저) 작업지시삭제
	public void workOrderAdmDel(WorkOrderAdmVo workOrderAdmVo) throws Exception;
	
	//생산지시현황 (수주지시별)
	public List<WorkOrderAdmVo> contNoAdmList(WorkOrderAdmVo workOrderAdmVo) throws Exception;
		
	//생산지시현황 (작업지시별)
	public List<WorkOrderAdmVo> workOrderAdmList(WorkOrderAdmVo workOrderAdmVo) throws Exception;
	
	//작업지시 이전작업지시 조회 
	public List<WorkOrderAdmVo> preWorkOrdNoList(WorkOrderAdmVo workOrderAdmVo) throws Exception;
	
	
	//박스라벨
	//박스라벨 목록조회
	public List<WorkOrderAdmVo> boxLabelAdmList(WorkOrderAdmVo workOrderAdmVo) throws Exception;
	
	//박스라벨 상세조회
	public WorkOrderAdmVo boxLabelAdmRead(WorkOrderAdmVo workOrderAdmVo) throws Exception;
	
	//박스라벨 BOX_IDX 생성
	public String getBoxIdx(WorkOrderAdmVo workOrderAdmVo) throws Exception;
	
	//박스라벨 BOX_LABEL_NO 생성
	public String getBoxLabelNo(WorkOrderAdmVo workOrderAdmVo) throws Exception;
	
	//박스라벨 등록
	public void boxLabelAdmIns(List<WorkOrderAdmVo> workOrderAdmVo) throws Exception;
	
	//박스라벨 수정
	public void boxLabelAdmUpd(WorkOrderAdmVo workOrderAdmVo) throws Exception;
	
	//박스라벨 삭제
	public void boxLabelAdmDel(WorkOrderAdmVo workOrderAdmVo) throws Exception;
	
	
	//총 양/불/실적 수량 조회 
	public WorkOrderAdmVo getTotalWorkQty(WorkOrderAdmVo workOrderAdmVo) throws Exception;
		
}
