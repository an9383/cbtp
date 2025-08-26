package mes.persistence.mm;

import java.util.List;

import mes.domain.mm.OperationNoticeVo;

public interface OperationNoticeDAO {

	// 목록조회
	public List<OperationNoticeVo> list(OperationNoticeVo operationNoticeVo) throws Exception;
	
	// 상세조회
	public OperationNoticeVo read(OperationNoticeVo operationNoticeVo) throws Exception;
	
	// 등록
	public String add(OperationNoticeVo operationNoticeVo) throws Exception;
	
	// 수정
	public void edit(OperationNoticeVo operationNoticeVo) throws Exception;
	
	// 삭제
	public void remove(OperationNoticeVo operationNoticeVo) throws Exception;
}