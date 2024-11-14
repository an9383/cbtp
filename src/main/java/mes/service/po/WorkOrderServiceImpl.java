package mes.service.po;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.po.WorkOrderVo;
import mes.persistence.po.WorkOrderDAO;

@Service
public class WorkOrderServiceImpl implements WorkOrderService {

	@Inject
	private WorkOrderDAO dao;
	 
	//작업지시 목록조회
	@Override
	public List<WorkOrderVo> listAll(WorkOrderVo workOrderVo) throws Exception{
		return dao.listAll(workOrderVo);
	}
	
	//작업지시 기간조회
	@Override
	public List<WorkOrderVo> workOrdListAll(WorkOrderVo workOrderVo) throws Exception{
		return dao.workOrdListAll(workOrderVo);
	}
	
	//생산지시현황(사출) 기간조회
	@Override
	public List<WorkOrderVo> workOrdListAllBybomList(WorkOrderVo workOrderVo) throws Exception{
		return dao.workOrdListAllBybomList(workOrderVo);
	}
	
	//생산지시현황(봉제) 기간조회
	@Override
	public List<WorkOrderVo> workOrdListSewingList(WorkOrderVo workOrderVo) throws Exception{
		return dao.workOrdListSewingList(workOrderVo);
	}
	
	//작업지시 목록조회
	@Override
	public List<WorkOrderVo> workOrdList(WorkOrderVo workOrderVo) throws Exception{
		return dao.workOrdList(workOrderVo);
	}

	//작업지시 등록
	@Override
	public void create(WorkOrderVo workOrderVo) throws Exception {
		dao.create(workOrderVo);
	}
	
	//작업지시 수정
	public void update(WorkOrderVo workOrderVo) throws Exception{
		dao.update(workOrderVo);
	}
	
	//작업지시 수정
	public void prcssDelFaultyUpdate(WorkOrderVo workOrderVo) throws Exception{
		dao.prcssDelFaultyUpdate(workOrderVo);
	}

	//작업지시 수정
	public void workOrdOutputUpdate(WorkOrderVo workOrderVo) throws Exception{
		dao.workOrdOutputUpdate(workOrderVo);
	}
	
	//작업지시 수정
	public void workOrdOutputDelete(WorkOrderVo workOrderVo) throws Exception{
		dao.workOrdOutputDelete(workOrderVo);
	}
	
	//작업지시 삭제
	@Override
	public void delete(WorkOrderVo workOrderVo) throws Exception {
		dao.delete(workOrderVo);
	}
	
	//작지 번호 가져오기
	@Override
	public String getWorkOrdNoSeq(String date) throws Exception{
		return dao.getWorkOrdNoSeq(date);
	}
	
	//중공정 목록조회
	@Override
	public List<WorkOrderVo> readMiddlePrcss(WorkOrderVo workOrderVo) throws Exception{
		return dao.readMiddlePrcss(workOrderVo);
	}
	
	//소공정 목록조회
	@Override
	public List<WorkOrderVo> readMinorPrcss(WorkOrderVo workOrderVo) throws Exception{
		return dao.readMinorPrcss(workOrderVo);
	}
	
	//작업지시선택 자재투입내역 조회
	@Override
	public List<WorkOrderVo> matrlList(WorkOrderVo workOrderVo) throws Exception{
		return dao.matrlList(workOrderVo);
	}
	
	//긴급여부 수정
	public void updateDlvDate(WorkOrderVo workOrderVo) throws Exception{
		dao.updateDlvDate(workOrderVo);
	}
	
	//긴급여부 수정
	@Override
	public void updateEmerYn(WorkOrderVo workOrderVo) throws Exception{
		dao.updateEmerYn(workOrderVo);
	}
	
	//작업지시일 수정
	@Override
	public void updateWorkOrdDate(WorkOrderVo workOrderVo) throws Exception{
		dao.updateWorkOrdDate(workOrderVo);
	}
	
	//작업지시 조회
	@Override
	public WorkOrderVo workOrdRead(WorkOrderVo workOrderVo) throws Exception{
		return dao.workOrdRead(workOrderVo);
	}
	
	//작업지시 존재하는 번호인지 확인
	@Override
	public int chekWorkOrdExsit(WorkOrderVo workOrderVo) throws Exception{
		return dao.chekWorkOrdExsit(workOrderVo);
	}
	
	//작업지시 삭제
	@Override
	public void deleteWorkOrdNo(WorkOrderVo workOrderVo) throws Exception{
		dao.deleteWorkOrdNo(workOrderVo);
	}
	
	//모니터링 수주진행현황
	@Override
	public List<WorkOrderVo> monitoringBizOrd(WorkOrderVo workOrderVo) throws Exception{
		return dao.monitoringBizOrd(workOrderVo);
	}
	
	//완전 종료된 작지번호 조회
	public Integer completeWorkOrdNoCnt(WorkOrderVo workOrderVo) throws Exception{
		return dao.completeWorkOrdNoCnt(workOrderVo);
	}

	
	//완전 종료된 작지번호에 바코드 생성
	public void updateBarcodeNo(WorkOrderVo workOrderVo) throws Exception{
		dao.updateBarcodeNo(workOrderVo);
	}
	
	//완료된 작지번호 조회(바코드스캔)
	public WorkOrderVo completeWorkOrderList(WorkOrderVo workOrderVo) throws Exception{
		return dao.completeWorkOrderList(workOrderVo);
	}
	
	//완료된 작지번호 조회(바코드스캔)
	public WorkOrderVo checkItemComplete(WorkOrderVo workOrderVo) throws Exception{
		return dao.checkItemComplete(workOrderVo);
	}
	
	//작지 번호 가져오기
	@Override
	public String getWorkEndTime(WorkOrderVo workOrderVo) throws Exception{
		return dao.getWorkEndTime(workOrderVo);
	}
	
	//작업지시 주/부작업자 조회
	public List<WorkOrderVo> selectWorkChargrList(WorkOrderVo workOrderVo) throws Exception{
		return dao.selectWorkChargrList(workOrderVo);
	}
	
	//작업지시 공정관리 조회
	public List<WorkOrderVo> workOrderProgressList(WorkOrderVo workOrderVo) throws Exception{
		return dao.workOrderProgressList(workOrderVo);
	}
	
	//작업지시 공정관리 등록
	public int workOrderProgressIns(WorkOrderVo workOrderVo) throws Exception{
		return dao.workOrderProgressIns(workOrderVo);
	}
	
	//작업지시 공정관리 수정
	public int workOrderProgressUpd(WorkOrderVo workOrderVo) throws Exception{
		return dao.workOrderProgressUpd(workOrderVo);
	}
}

	