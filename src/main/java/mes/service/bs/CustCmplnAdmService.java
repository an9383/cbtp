package mes.service.bs;

import java.util.List;

import mes.domain.bs.CustCmplnAdmVo;

public interface CustCmplnAdmService {
	
	//고객불만 목록조회
	public List<CustCmplnAdmVo> custCmplnAdmList(CustCmplnAdmVo custCmplnAdmVo) throws Exception;
	
	//고객불만 상세조회
	public CustCmplnAdmVo custCmplnAdmRead(CustCmplnAdmVo custCmplnAdmVo) throws Exception;
	
	//고객불만 등록
	public void custCmplnAdmCreate(CustCmplnAdmVo custCmplnAdmVo) throws Exception;
	
	//고객불만 수정
	public void custCmplnAdmUpdate(CustCmplnAdmVo custCmplnAdmVo) throws Exception;

	//고객불만 파일명 가져오기
	public CustCmplnAdmVo getInspectFileNm(CustCmplnAdmVo custCmplnAdmVo) throws Exception;
	
	//고객불만 파일 삭제
	public void custCmplnAdmDelete(CustCmplnAdmVo custCmplnAdmVo) throws Exception;
	
	//고객불만 재발방지 파일 삭제
	public void custCmplnAdmDelete2(CustCmplnAdmVo custCmplnAdmVo) throws Exception;


	//고객불만 시퀀스 조회
	public String locNoSeq(String date) throws Exception;
	
}
