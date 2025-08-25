package mes.service.mm;

import mes.domain.mm.WorkStatusVo;

public interface WorkStatusService {

	// 조회
	public WorkStatusVo read(WorkStatusVo workStatusVo) throws Exception;
	
	// 등록
	public void add(WorkStatusVo workStatusVo) throws Exception;
	
	// 수정
	public void edit(WorkStatusVo workStatusVo) throws Exception;
}
