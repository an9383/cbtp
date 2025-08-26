package mes.persistence.bm;

import java.util.List;

import mes.domain.bm.ManHourAdmVo;

public interface ManHourAdmDAO {
	
	//공수관리 전체조회
	public List<ManHourAdmVo>manHourAdmList(ManHourAdmVo manHourAdmVo) throws Exception;
	
	//공수관리  상세조회
	public ManHourAdmVo manHourAdmRead(ManHourAdmVo manHourAdmVo) throws Exception;

	//공수관리 등록
	public void manHourAdmCreate(ManHourAdmVo manHourAdmVo) throws Exception;
			
	//공수관리 수정
	public void manHourAdmUpdate(ManHourAdmVo manHourAdmVo) throws Exception;
	
	//관련자료 시퀀스
	public String manHourAdmSeq(ManHourAdmVo manHourAdmVo) throws Exception;
	
}
