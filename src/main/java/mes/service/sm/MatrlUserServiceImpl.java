package mes.service.sm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.sm.MatrlUserVo;
import mes.persistence.sm.MatrlUserDAO;

@Service
public class MatrlUserServiceImpl implements MatrlUserService{
	
	@Inject
	private MatrlUserDAO dao;
	
	//사용자 목록조회
	@Override
	public List<MatrlUserVo> listAll(MatrlUserVo matrlUserVo) throws Exception{
		return dao.listAll(matrlUserVo);
	}

	//사용자 상세조회
	@Override
	public MatrlUserVo read(MatrlUserVo matrlUserVo) throws Exception{
		return dao.read(matrlUserVo);
	}
	
	//사용자 등록
	@Override
	public void create(MatrlUserVo matrlUserVo) throws Exception{
		dao.create(matrlUserVo);
	}				
	
	//사용자 수정
	@Override
	public void update(MatrlUserVo matrlUserVo) throws Exception{
		dao.update(matrlUserVo);
	}
	
	@Override
	//사번 시퀀스
	public String selectUserNumberSeq() throws Exception{
		return dao.selectUserNumberSeq();
	}
	
	// 사용자 삭제
	@Override
	public void matrlUserDelete(MatrlUserVo matrlUserVo) throws Exception {
		dao.matrlUserDelete(matrlUserVo);
	}
	
	//관리자 계정 조회
	@Override
	public MatrlUserVo adminRead(MatrlUserVo matrlUserVo) throws Exception{
		return dao.adminRead(matrlUserVo);
	}
	
	// 사용자 삭제
	@Override
	public void imageDelete(MatrlUserVo matrlUserVo) throws Exception {
		dao.imageDelete(matrlUserVo);
	}
}
