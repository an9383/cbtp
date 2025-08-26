package mes.service.sm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.sm.SystemAccessLogVo;
import mes.persistence.sm.SystemAccessLogDAO;

@Service
public class SystemAccessLogServiceImpl implements SystemAccessLogService {

	@Inject
	private SystemAccessLogDAO dao;
	
	//사용자 목록조회
	@Override
	public List<SystemAccessLogVo> smlistAll(SystemAccessLogVo systemAccessLogVo) throws Exception {
		return dao.smlistAll(systemAccessLogVo);
	}
	
	//로그이력관리 목록조회
	@Override
	public List<SystemAccessLogVo> systemChangeLogList(SystemAccessLogVo systemAccessLogVo) throws Exception {
		return dao.systemChangeLogList(systemAccessLogVo);
	}

	//사용자 상세조회
	@Override
	public SystemAccessLogVo read(SystemAccessLogVo systemAccessLogVo) throws Exception {
		return dao.read(systemAccessLogVo);
	}

	//로그 등록
	@Override
	public void create(SystemAccessLogVo systemAccessLogVo) throws Exception {
		dao.create(systemAccessLogVo);
	}

	//사용자 수정
	@Override
	public void update(SystemAccessLogVo systemAccessLogVo) throws Exception {
		dao.update(systemAccessLogVo);

	}

	//사번 시퀀스
	@Override
	public String selectUserNumberSeq() throws Exception {
		return dao.selectUserNumberSeq();
	}
	
	//이력 등록
	@Override
	public void systemChangeLogCreate(SystemAccessLogVo systemAccessLogVo) throws Exception {
		dao.systemChangeLogCreate(systemAccessLogVo);
	}

}
