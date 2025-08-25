package mes.persistence.bm;

import java.util.List;

import mes.domain.bm.MatrlCodeAdmVo;

public interface MatrlCodeAdmDAO {

	//자재코드관리 목록조회
	public List<MatrlCodeAdmVo> listAll(MatrlCodeAdmVo matrlCodeAdmVo) throws Exception;

	//자재코드관리 상세조회
	public MatrlCodeAdmVo read(MatrlCodeAdmVo matrlCodeAdmVo) throws Exception;
	
	//자재코드관리 등록
	public void create(MatrlCodeAdmVo matrlCodeAdmVo) throws Exception;
	
	//자재코드관리 수정
	public void update(MatrlCodeAdmVo matrlCodeAdmVo) throws Exception;
	
	//자재코드관리 코드시퀀스조회
	public String selectMatrlSeqCd() throws Exception;
	
	//자재코드관리 자재명/규격 중목 확인
	public int overlapChack(MatrlCodeAdmVo matrlCodeAdmVo) throws Exception;
	
}


