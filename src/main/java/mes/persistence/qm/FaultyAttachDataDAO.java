package mes.persistence.qm;

import java.util.List;

import mes.domain.qm.FaultyAttachDataVo;

public interface FaultyAttachDataDAO {
	
	//부적합관리 관련자료 상세조회
	public List<FaultyAttachDataVo> faultyAttachDataRead(FaultyAttachDataVo faultyAttachDataVo)throws Exception;
	
	//부적합관리 관련자료 등록
	public void faultyAttachDataCreate(FaultyAttachDataVo faultyAttachDataVo)throws Exception;
	
	//부적합관리 관련자료 수정
	public void faultyAttachDataUpdate(FaultyAttachDataVo faultyAttachDataVo)throws Exception;
	
	//부적합관리 관련자료 삭제
	public void faultyAttachDataDelete(FaultyAttachDataVo faultyAttachDataVo)throws Exception;
	
	//부적합관리 관련자료 시퀀스
	public String getAttachSeq(String date)throws Exception;
	
	//부적합관리 관련자료 파일명
	public String getAttachFn(FaultyAttachDataVo faultyAttachDataVo)throws Exception;
}
