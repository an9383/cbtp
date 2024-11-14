package mes.service.bm;

import java.util.List;

import mes.domain.bm.PrcssMiddleVo;

public interface PrcssMiddleService {

	//중공정 정보 전체 조회
	public List<PrcssMiddleVo> prcssMiddleAdmList() throws Exception;
	
	//중공정 정보 가져오기
	public PrcssMiddleVo prcssMiddleAdmRead(PrcssMiddleVo Vo) throws Exception;
	
	//중공정 정보 등록
	public int prcssMiddleAdmCreate(PrcssMiddleVo Vo) throws Exception;
	
	//중공정코드 시퀀스로 값 받기
	public String prcssMiddleCd() throws Exception;

	//중공정 정보 수정
	public int prcssMiddleAdmUpdate(PrcssMiddleVo Vo) throws Exception;
	
	//중공정 정보 상세 조회
	public List<PrcssMiddleVo> prcssMiddleDtlList(PrcssMiddleVo Vo) throws Exception;
	
	//중공정 상세 등록
	public int prcssMiddleDtlCreate(PrcssMiddleVo Vo) throws Exception;
	
	//중공정 상세 삭제
    public int prcssMiddleDtlDelete(PrcssMiddleVo Vo) throws Exception;
	
    //중공정 상세 전체 삭제
    public int prcssMiddleDtlDeleteAll(PrcssMiddleVo Vo) throws Exception;
    
	//중공정 상세 공정 시퀀스
	public int prcssSeq(PrcssMiddleVo Vo) throws Exception;
	
	//중공정 상세 공정 코드
	public String prcssCd(PrcssMiddleVo Vo) throws Exception;

}
