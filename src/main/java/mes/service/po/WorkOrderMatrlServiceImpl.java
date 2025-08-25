package mes.service.po;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.po.WorkOrderMatrlVo;
import mes.persistence.po.WorkOrderMatrlDAO;

@Service
public class WorkOrderMatrlServiceImpl implements WorkOrderMatrlService {

	@Inject
	private WorkOrderMatrlDAO dao;
	 
	//작업지시별 자재투입 목록조회
	@Override
	public List<WorkOrderMatrlVo> listAll(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.listAll(workOrderMatrlVo);
	}
	
	//자재투입내역(ADM)
	@Override
	public List<WorkOrderMatrlVo> workOrdMatrlListAdm(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlListAdm(workOrderMatrlVo);
	}
	
	//자재투입내역(DTL)
	@Override
	public List<WorkOrderMatrlVo> workOrdMatrlListDtl(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlListDtl(workOrderMatrlVo);
	}
	
	//자재투입내역 자재별 투입현황 조회
	@Override
	public WorkOrderMatrlVo workOrdMatrlPartRead(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlPartRead(workOrderMatrlVo);
	}
	
	//자재투입처리 등록
	@Override
	public void workOrdMatrlAdd(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		dao.workOrdMatrlAdd(workOrderMatrlVo);
	}
	
	//자재투입처리 수정
	public void workOrdMatrlEdit(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		dao.workOrdMatrlEdit(workOrderMatrlVo);
	}
	
	//자재투입처리 목록조회
	public int workOrdMatrlList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlList(workOrderMatrlVo);
	}
	
	//자재투입처리 투입삭제
	public int workOrdMatrlDel(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlDel(workOrderMatrlVo);
	}
	
	//선입선출 자재투입 조회(사출)
	public WorkOrderMatrlVo workOrdMatrlFifoList(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlFifoList(workOrderMatrlVo);
	}
	
	//선입선출 자재투입 조회(봉제)
	public WorkOrderMatrlVo workOrdMatrlFifoListByBongjae(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.workOrdMatrlFifoListByBongjae(workOrderMatrlVo);
	}
	
	//해당 바코드가 투입된 작업지시 상태
	public String getMatrlWorkStatus(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.getMatrlWorkStatus(workOrderMatrlVo);
	}
	
	//해당 바코드가 투입된 작업지시 상태(봉제)
	public String getMatrlWorkStatusByBongjae(WorkOrderMatrlVo workOrderMatrlVo) throws Exception{
		return dao.getMatrlWorkStatusByBongjae(workOrderMatrlVo);
	}
}

	