package mes.service.mm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.mm.AccidentFreeVo;
import mes.domain.mm.OperationNoticeVo;
import mes.persistence.mm.OperationNoticeDAO;

@Service
public class OperationNoticeServiceImpl implements OperationNoticeService {

	@Inject
	private OperationNoticeDAO dao;
	
	// 목록조회
	@Override
	public List<OperationNoticeVo> list(OperationNoticeVo operationNoticeVo) throws Exception {
		return dao.list(operationNoticeVo);
	}
	
	// 상세조회
	@Override
	public OperationNoticeVo read(OperationNoticeVo operationNoticeVo) throws Exception {
		return dao.read(operationNoticeVo);
	}
	
	// 등록
	@Override
	public String add(OperationNoticeVo operationNoticeVo) throws Exception {
    	return dao.add(operationNoticeVo);
	}
	
	// 수정
	@Override
	public void edit(OperationNoticeVo operationNoticeVo) throws Exception {
		dao.edit(operationNoticeVo);
	}
	
	// 삭제
	@Override
	public void remove(OperationNoticeVo operationNoticeVo) throws Exception {
		dao.remove(operationNoticeVo);
	}
}
