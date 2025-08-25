package mes.service.po;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.po.WorkOrderPrcssVo;
import mes.domain.po.WorkOrderVo;
import mes.persistence.po.ReworkOrderDAO;

@Service
public class ReworkOrderServiceImpl implements ReworkOrderService {

	@Inject
	private ReworkOrderDAO dao;
	 
	//재작업지시 목록 조회
	@Override
	public List<WorkOrderVo> listAll(WorkOrderVo workOrderVo) throws Exception{
		return dao.listAll(workOrderVo);
	}
	
	//재작업지시 상세 조회
	@Override
	public WorkOrderVo reworkOrdRead(WorkOrderVo workOrderVo) throws Exception{
		return dao.reworkOrdRead(workOrderVo);
	}
	
	//작업지시 모달조회
	@Override
	public List<WorkOrderPrcssVo> reworkOrdList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.reworkOrdList(workOrderPrcssVo);
	}
	
	//기존작지 업데이트
	@Override
	public void lastYnUpdate(WorkOrderVo workOrderVo) throws Exception{
		dao.lastYnUpdate(workOrderVo);
	}
	
	//재작업작지 수정
	@Override
	public void reworkOrdUpdate(WorkOrderVo workOrderVo) throws Exception{
		dao.reworkOrdUpdate(workOrderVo);
	}
}

	