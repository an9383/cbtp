package mes.service.po;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.po.WorkOrderResultVo;
import mes.persistence.po.WorkOrderResultDAO;

@Service
public class WorkOrderResultServiceImpl implements WorkOrderResultService {

	@Inject
	private WorkOrderResultDAO dao;
	 
	//설비별 가동실적조회 목록조회
	@Override
	public List<WorkOrderResultVo> listAll(WorkOrderResultVo workOrderResultVo) throws Exception{
		return dao.listAll(workOrderResultVo);
	}
}

	