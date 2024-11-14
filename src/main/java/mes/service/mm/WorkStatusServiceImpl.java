package mes.service.mm;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.mm.WorkStatusVo;
import mes.persistence.mm.WorkStatusDAO;

@Service
public class WorkStatusServiceImpl implements WorkStatusService {

	@Inject
	private WorkStatusDAO dao;
	
	// 조회
	@Override
	public WorkStatusVo read(WorkStatusVo workStatusVo) throws Exception {
		return dao.read(workStatusVo);
	}
	
	// 등록
	@Override
	public void add(WorkStatusVo workStatusVo) throws Exception {
		dao.add(workStatusVo);
	}
	
	// 수정
	@Override
	public void edit(WorkStatusVo workStatusVo) throws Exception {
		dao.edit(workStatusVo);
	}
}
