package mes.service.bs;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bs.AchieveAdmVo;
import mes.persistence.bs.AchieveAdmDAO;

@Service
public class AchieveAdmServiceImpl implements AchieveAdmService {
	
	@Inject
	private AchieveAdmDAO dao;
	
	//게시판 리스트 출력
	@Override
	public List<AchieveAdmVo> AchieveAdmList(AchieveAdmVo achieveAdmVo) throws Exception {
		return dao.AchieveAdmList(achieveAdmVo);
	}
	
	//게시판 등록
	@Override 
	public int AchieveAdmCreate(AchieveAdmVo achieveAdmVo) throws Exception {
		return dao.AchieveAdmCreate(achieveAdmVo); 
	}
	
	//게시판 수정
	@Override 
	public int AchieveAdmUpdate(AchieveAdmVo achieveAdmVo) throws Exception {
		return dao.AchieveAdmUpdate(achieveAdmVo); 
	}
	
  	//게시판 삭제
  	@Override 
  	public int AchieveAdmDelete(AchieveAdmVo achieveAdmVo) throws Exception {
  		return dao.AchieveAdmDelete(achieveAdmVo); 
  	}
  	
	//성취도관리 상세조회
  	@Override
	public List<AchieveAdmVo> AchieveAdmRead(AchieveAdmVo Vo) throws Exception{
  		return dao.AchieveAdmRead(Vo); 
	}

}
