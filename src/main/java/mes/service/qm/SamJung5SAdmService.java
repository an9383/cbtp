package mes.service.qm;

import java.util.List;

import mes.domain.bm.AttachDataVo;
import mes.domain.qm.ItemCompleteAdmVo;
import mes.domain.qm.ItemFaultyAdmVo;
import mes.domain.qm.SamJung5SAdmVo;

public interface SamJung5SAdmService {

	//3정 5S 개선대책 조회
	public List<SamJung5SAdmVo> samJung5SList(SamJung5SAdmVo samJung5SAdmVo) throws Exception;
	
	//개선대책 상세조회
	public SamJung5SAdmVo read(SamJung5SAdmVo samJung5SAdmVo) throws Exception;
	
	//관리코드 시퀀스
	public String samJung5Seq(SamJung5SAdmVo samJung5SAdmVo) throws Exception;
	
	//개선대책 등록
	public void samJung5SAdmCreate(SamJung5SAdmVo samJung5SAdmVo) throws Exception;
	
	//개선대책 수정
	public void samJung5SAdmUpdate(SamJung5SAdmVo samJung5SAdmVo) throws Exception;
	
	//개선대책 삭제
	public void samJung5SAdmDelete(SamJung5SAdmVo samJung5SAdmVo) throws Exception;
	
	// 이미지삭제
	public void samJung5SAdmImageDelete(SamJung5SAdmVo samJung5SAdmVo) throws Exception;
}
