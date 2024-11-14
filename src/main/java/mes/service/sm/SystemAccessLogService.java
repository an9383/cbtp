package mes.service.sm;

import java.util.List;

import mes.domain.sm.SystemAccessLogVo;

public interface SystemAccessLogService {
	
	//사용자 목록조회
	public List<SystemAccessLogVo> smlistAll(SystemAccessLogVo systemAccessLogVo) throws Exception;
	
	//로그이력관리 목록조회
	public List<SystemAccessLogVo> systemChangeLogList(SystemAccessLogVo systemAccessLogVo) throws Exception;

	//사용자 상세조회
	public SystemAccessLogVo read(SystemAccessLogVo systemAccessLogVo) throws Exception;
	
	//로그 등록
	public void create(SystemAccessLogVo systemAccessLogVo) throws Exception;
	
	//사용자 수정
	public void update(SystemAccessLogVo systemAccessLogVo) throws Exception;
	
	//사번 시퀀스
	public String selectUserNumberSeq() throws Exception;
	
	//이력 등록
	public void systemChangeLogCreate(SystemAccessLogVo systemAccessLogVo) throws Exception;

}
