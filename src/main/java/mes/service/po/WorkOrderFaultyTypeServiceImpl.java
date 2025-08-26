package mes.service.po;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.po.WorkOrderFaultyTypeVo;
import mes.persistence.po.WorkOrderFaultyTypeDAO;

@Service
public class WorkOrderFaultyTypeServiceImpl implements WorkOrderFaultyTypeService {

	@Inject
	private WorkOrderFaultyTypeDAO dao;
	 
	//작업지시 공정별 불량유형 목록조회
	@Override
	public List<WorkOrderFaultyTypeVo> listAll(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception{
		return dao.listAll(workOrderFaultyTypeVo);
	}
	
	//작업지시 공정별 불량유형 생성(list)
	@Override
	public void createList(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception{
		dao.createList(workOrderFaultyTypeVo);
	}
	
	//작업지시 공정별 불량유형 수정
	@Override
	public void update(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception{
		dao.update(workOrderFaultyTypeVo);
	}
	
	//작업지시 공정별 불량유형 초기화
	@Override
	public void deleteAll(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception{
		dao.deleteAll(workOrderFaultyTypeVo);
	}
	
	//작업지시 공정별 불량유형 승인등록
	public void approvalUpdate(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception{
		dao.approvalUpdate(workOrderFaultyTypeVo);
	}
	
	//불량코드별 불량수량 합계
	public int getFaultyTypeSumQty(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception{
		return dao.getFaultyTypeSumQty(workOrderFaultyTypeVo);
	}
	
	//불량등록 조회
	@Override
	public List<WorkOrderFaultyTypeVo> workOrderFaultyList(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception{
		return dao.workOrderFaultyList(workOrderFaultyTypeVo);
	}
	
}

	