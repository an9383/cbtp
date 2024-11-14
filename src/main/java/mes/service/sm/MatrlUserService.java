package mes.service.sm;

import java.util.List;

import mes.domain.sm.MatrlUserVo;

public interface MatrlUserService {
	//사용자 목록조회
	public List<MatrlUserVo> listAll(MatrlUserVo matrlUserVo) throws Exception;

	//사용자 상세조회
	public MatrlUserVo read(MatrlUserVo matrlUserVo) throws Exception;
	
	//사용자 등록
	public void create(MatrlUserVo matrlUserVo) throws Exception;
	
	//사용자 수정
	public void update(MatrlUserVo matrlUserVo) throws Exception;
	
	//사번 시퀀스
	public String selectUserNumberSeq() throws Exception;
	
	//사용자 삭제
	public void matrlUserDelete(MatrlUserVo matrlUserVo) throws Exception;
	
	//관리자 조회
	public MatrlUserVo adminRead(MatrlUserVo matrlUserVo) throws Exception;
	
	//사용자 삭제
	public void imageDelete(MatrlUserVo matrlUserVo) throws Exception;
}
