package mes.persistence.bs;

import java.util.List;

import mes.domain.bs.CustSatisAdmVo;

public interface CustSatisAdmDAO {

	//게시판 등록
	public int custSatisAdmCreate(CustSatisAdmVo Vo) throws Exception;
	
	//게시판 SEQ(custSatisAdmNo)
	public int custSatisAdmNo() throws Exception;
	
	//게시판 리스트 출력
	public List<CustSatisAdmVo> custSatisAdmList(CustSatisAdmVo Vo) throws Exception;
	
	//게시판 상세보기 출력
	public CustSatisAdmVo custSatisAdmRead(CustSatisAdmVo Vo) throws Exception;
	
	//게시판 수정
	public int custSatisAdmUpdate(CustSatisAdmVo Vo) throws Exception;
	
	//게시판 파일경로
	public int CustSatisAdmFilePath(CustSatisAdmVo Vo) throws Exception;
	
	//게시판 파일이름
	public String CustSatisAdmFileNm(CustSatisAdmVo Vo) throws Exception;

	//게시판 삭제
	public int CustSatisAdmDelete(CustSatisAdmVo Vo) throws Exception;
	
	//게시판  댓글 리스트 출력
	public List<CustSatisAdmVo> CustSatisAdmReList(CustSatisAdmVo Vo) throws Exception;
	
	//게시판 댓글 상세보기 출력
	public CustSatisAdmVo CustSatisAdmReRead(CustSatisAdmVo Vo) throws Exception;
	
	//게시판 댓글 등록
	public int CustSatisAdmReCreate(CustSatisAdmVo Vo) throws Exception;
	
	//게시판 댓글 수정
	public int CustSatisAdmReUpdate(CustSatisAdmVo Vo) throws Exception;
	
	
	public int upCustSatisAdmNo(CustSatisAdmVo Vo) throws Exception;
	
	//게시판 리뷰 SEQ(custSatisAdmReSeq)
	public int CustSatisAdmReSeq(CustSatisAdmVo Vo) throws Exception;
	
	//게시판 답변레벨 SEQ(custSatisAdmReLevl)
	public int CustSatisAdmReLevel(CustSatisAdmVo Vo) throws Exception;
	
	//게시판 댓글 SEQ(CustSatisAdmCommentSeq)
	public int CustSatisAdmCommentSeq(CustSatisAdmVo Vo) throws Exception;
}
