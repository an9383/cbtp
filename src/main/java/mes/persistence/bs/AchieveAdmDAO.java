package mes.persistence.bs;

import java.util.List;

import mes.domain.bs.AchieveAdmVo;

public interface AchieveAdmDAO {
	
	//게시판 리스트 출력
	public List<AchieveAdmVo> AchieveAdmList(AchieveAdmVo Vo) throws Exception;
	
	//게시판 등록 
	public int AchieveAdmCreate(AchieveAdmVo Vo) throws Exception;

	//게시판 수정 
	public int AchieveAdmUpdate(AchieveAdmVo Vo) throws Exception;

	//게시판 삭제 
	public int AchieveAdmDelete(AchieveAdmVo vo) throws Exception; 
	
	//성취도관리 상세조회
	public List<AchieveAdmVo> AchieveAdmRead(AchieveAdmVo Vo) throws Exception;
                                                                                                                                                                                                                                                                                                                                                                                                                                             
}
