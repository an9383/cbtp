package mes.service.bs;

import java.util.List;

//import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.bs.AchieveAdmVo;
import mes.domain.po.WorkOrderVo;

public interface AchieveAdmService {
	
	    //게시판 리스트 출력
		public List<AchieveAdmVo> AchieveAdmList(AchieveAdmVo achieveAdmVo) throws Exception;
		
		//게시판 등록 
		public int AchieveAdmCreate(AchieveAdmVo achieveAdmVo) throws Exception;
	
		//게시판 수정
		public int AchieveAdmUpdate(AchieveAdmVo achieveAdmVo) throws Exception;
		
     	//게시판 삭제 
		public int AchieveAdmDelete(AchieveAdmVo achieveAdmVo) throws Exception;
		
		//성취도관리 상세조회
		public List<AchieveAdmVo> AchieveAdmRead(AchieveAdmVo Vo) throws Exception;
}
