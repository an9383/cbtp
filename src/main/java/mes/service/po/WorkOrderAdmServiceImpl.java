package mes.service.po;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.po.WorkOrderAdmVo;
import mes.persistence.po.WorkOrderAdmDAO;

@Service
public class WorkOrderAdmServiceImpl implements WorkOrderAdmService {
	
	@Inject
	private WorkOrderAdmDAO dao;

	
	//생산실적(후가공) 정보
	public List<WorkOrderAdmVo> workOrderFinishListByWorkOrdNo(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return dao.workOrderFinishListByWorkOrdNo(workOrderAdmVo);
	}
	
	//생산실적(레이저) 정보 
	@Override
	public List<WorkOrderAdmVo> workOrderRaserListByWorkOrdNo(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return dao.workOrderRaserListByWorkOrdNo(workOrderAdmVo);
	}
	
	//생산실적(레이저) 누적 정보 
	@Override
	public WorkOrderAdmVo workOrderRaserAccList(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return dao.workOrderRaserAccList(workOrderAdmVo);
	}
	
	//생산시작인 작업지시번호 조회
	@Override
	public String workStartGetWorkOrdNo(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return dao.workStartGetWorkOrdNo(workOrderAdmVo);
	}
	
	//작업지시번호 존재여부
	@Override
	public int workOrdNoExist(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return dao.workOrdNoExist(workOrderAdmVo);
	}
	
	//생산실적(레이저) 작업지시번호 채번
	@Override
	public String workOrderAdmGetWorkOrdNo(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		return dao.workOrderAdmGetWorkOrdNo(workOrderAdmVo);
	}
	
	//생산실적(레이저) 작업지시등록
	@Override
	public void workOrderAdmIns(List<WorkOrderAdmVo> workOrderAdmVo) throws Exception {
		dao.workOrderAdmIns(workOrderAdmVo);
	}
	
	//생산실적(레이저) 작업지시수정
	@Override
	public void workOrderAdmUpd(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		dao.workOrderAdmUpd(workOrderAdmVo);
	}
	
	//생산실적 수량 수정
	public void workOrderAdmQtyUpd(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		dao.workOrderAdmQtyUpd(workOrderAdmVo);
	}
	
	//생산실적(레이저) 작업지시삭제
	@Override
	public void workOrderAdmDel(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		dao.workOrderAdmDel(workOrderAdmVo);
	}
	
	//생산지시현황 (수주지시별)
	@Override
	public List<WorkOrderAdmVo> contNoAdmList(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return dao.contNoAdmList(workOrderAdmVo);
	}
		
	//생산지시현황 (작업지시별)
	@Override
	public List<WorkOrderAdmVo> workOrderAdmList(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return dao.workOrderAdmList(workOrderAdmVo);
	}
	
	//작업지시 이전작업지시 조회 
	@Override
	public List<WorkOrderAdmVo> preWorkOrdNoList(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return dao.preWorkOrdNoList(workOrderAdmVo);
	}
	
	//박스라벨
	//박스라벨 목록조회
	@Override
	public List<WorkOrderAdmVo> boxLabelAdmList(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return dao.boxLabelAdmList(workOrderAdmVo);
	}
	
	//박스라벨 상세조회
	@Override
	public WorkOrderAdmVo boxLabelAdmRead(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return dao.boxLabelAdmRead(workOrderAdmVo);
	}
	
	//박스라벨 BOX_IDX 생성
	public String getBoxIdx(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return dao.getBoxIdx(workOrderAdmVo);
	}
	
	//박스라벨 BOX_LABEL_NO 생성
	public String getBoxLabelNo(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return dao.getBoxLabelNo(workOrderAdmVo);
	}
	
	//박스라벨 등록
	@Override
	public void boxLabelAdmIns(List<WorkOrderAdmVo> workOrderAdmVo) throws Exception{
		dao.boxLabelAdmIns(workOrderAdmVo);
	}
	
	//박스라벨 수정
	@Override
	public void boxLabelAdmUpd(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		dao.boxLabelAdmUpd(workOrderAdmVo);
	}
	
	//박스라벨 삭제
	@Override
	public void boxLabelAdmDel(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		dao.boxLabelAdmDel(workOrderAdmVo);
	}
	
	//총 양/불/실적 수량 조회 
	public WorkOrderAdmVo getTotalWorkQty(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return dao.getTotalWorkQty(workOrderAdmVo);
	}
	
}
