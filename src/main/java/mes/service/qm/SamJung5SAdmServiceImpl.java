package mes.service.qm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.AttachDataVo;
import mes.domain.qm.ItemCompleteAdmVo;
import mes.domain.qm.ItemFaultyAdmVo;
import mes.domain.qm.SamJung5SAdmVo;
import mes.persistence.qm.SamJung5SAdmDAO;

@Service
public class SamJung5SAdmServiceImpl implements SamJung5SAdmService {

	@Inject
	private SamJung5SAdmDAO dao;
	
	// 3정5S 개선대책 조회
	@Override
	public List<SamJung5SAdmVo> samJung5SList(SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		return dao.samJung5SList(samJung5SAdmVo);
	}
		
	//개선대책 상세조회
	@Override
	public SamJung5SAdmVo read(SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		return dao.read(samJung5SAdmVo);
	}
	

	//관련자료 시퀀스
	@Override
	public String samJung5Seq(SamJung5SAdmVo samJung5SAdmVo) throws Exception {
		return dao.samJung5Seq(samJung5SAdmVo);
	}
	
	//3정5S 등록
	@Override
	public void samJung5SAdmCreate(SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		dao.samJung5SAdmCreate(samJung5SAdmVo);
	}
	
	//개선대책 수정
	@Override
	public void samJung5SAdmUpdate(SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		dao.samJung5SAdmUpdate(samJung5SAdmVo);
	}
	
	//개선대책 삭제
	@Override
	public void samJung5SAdmDelete(SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		dao.samJung5SAdmDelete(samJung5SAdmVo);
	}
	
	//이미지삭제
	@Override
	public void samJung5SAdmImageDelete(SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		dao.samJung5SAdmImageDelete(samJung5SAdmVo);
	}
}
