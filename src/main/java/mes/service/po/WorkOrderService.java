package mes.service.po;

import java.util.List;

import mes.domain.po.WorkOrderVo;

public interface WorkOrderService {
	
	//작업지시 목록조회
	public List<WorkOrderVo> listAll(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시 기간조회
	public List<WorkOrderVo> workOrdListAll(WorkOrderVo workOrderVo) throws Exception;
	
	//생산지시현황(사출) 기간조회
	public List<WorkOrderVo> workOrdListAllBybomList(WorkOrderVo workOrderVo) throws Exception;
	
	//생산지시현황(봉제) 기간조회
	public List<WorkOrderVo> workOrdListSewingList(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시 모달조회
	public List<WorkOrderVo> workOrdList(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시 등록
	public void create(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시 수정
	public void update(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시 수정
	public void prcssDelFaultyUpdate(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시 수정
	public void workOrdOutputUpdate(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시 수정
	public void workOrdOutputDelete(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시 삭제
	public void delete(WorkOrderVo workOrderVo) throws Exception;
	
	//작지 번호 가져오기
	public String getWorkOrdNoSeq(String date) throws Exception;
	
	//중공정 목록조회
	public List<WorkOrderVo> readMiddlePrcss(WorkOrderVo workOrderVo) throws Exception;
	
	//소공정 목록조회
	public List<WorkOrderVo> readMinorPrcss(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시선택 자재투입내역 조회
	public List<WorkOrderVo> matrlList(WorkOrderVo workOrderVo) throws Exception;
	
	//긴급여부 수정
	public void updateDlvDate(WorkOrderVo workOrderVo) throws Exception;
	
	//긴급여부 수정
	public void updateEmerYn(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시일 수정
	public void updateWorkOrdDate(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시 조회
	public WorkOrderVo workOrdRead(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시 존재하는 번호인지 확인
	public int chekWorkOrdExsit(WorkOrderVo workOrderVo) throws Exception;

	//작업지시 삭제
	public void deleteWorkOrdNo(WorkOrderVo workOrderVo) throws Exception;
	
	//모니터링 수주진행현황
	public List<WorkOrderVo> monitoringBizOrd(WorkOrderVo workOrderVo) throws Exception;
	
	//완전 종료된 작지번호 조회
	public Integer completeWorkOrdNoCnt(WorkOrderVo workOrderVo) throws Exception;
	
	//완전 종료된 작지번호에 바코드 생성
	public void updateBarcodeNo(WorkOrderVo workOrderVo) throws Exception;
	
	//완료된 작지번호 조회(바코드스캔)
	public WorkOrderVo completeWorkOrderList(WorkOrderVo workOrderVo) throws Exception;
	
	//완료된 작지번호 조회(바코드스캔)
	public WorkOrderVo checkItemComplete(WorkOrderVo workOrderVo) throws Exception;

	//작지종료시간 가져오기
	public String getWorkEndTime(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시 주/부작업자 조회
	public List<WorkOrderVo> selectWorkChargrList(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시 공정관리 조회
	public List<WorkOrderVo> workOrderProgressList(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시 공정관리 등록
	public int workOrderProgressIns(WorkOrderVo workOrderVo) throws Exception;
	
	//작업지시 공정관리 수정
	public int workOrderProgressUpd(WorkOrderVo workOrderVo) throws Exception;
}
