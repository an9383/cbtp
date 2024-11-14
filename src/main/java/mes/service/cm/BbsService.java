package mes.service.cm;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import mes.domain.cm.BbsVo;

public interface BbsService {

	//게시판 리스트 출력
	public List<BbsVo> BbsList() throws Exception;
	
	//게시판 상위10개 출력
	public List<BbsVo> bbsTop10List() throws Exception;
	
	//게시판 상세보기 출력
	public BbsVo BbsRead(BbsVo Vo) throws Exception;
	
	//게시판 파일경로 출력
	public int BbsFilePath(BbsVo Vo) throws Exception;
	
	//게시판 파일이름 출력
	public String BbsFileNm(BbsVo Vo) throws Exception;
	
	//게시판 등록
	public int BbsCreate(BbsVo Vo) throws Exception;
	
	//게시판 수정
	public int BbsUpdate(BbsVo Vo) throws Exception;
	
	//게시판 삭제
	public int BbsDelete(BbsVo Vo) throws Exception;
	
	//게시판 댓글 리스트 출력
	public List<BbsVo> BbsReList(BbsVo Vo) throws Exception;
	
	//게시판  댓글 상세보기 출력
	public BbsVo BbsReRead(BbsVo Vo) throws Exception;
	
	//게시판  댓글 등록
	public int BbsReCreate(BbsVo Vo) throws Exception;
	
	//게시판 댓글  수정
	public int BbsReUpdate(BbsVo Vo) throws Exception;
	
    //게시글 상단 번호
	public int upBbsNo(BbsVo Vo) throws Exception;

	//게시판 SEQ(bbsNo)
	public int BbsNO() throws Exception;
	
	//게시판 리뷰 SEQ(bbsReSeq)
	public int BbsReSeq(BbsVo Vo) throws Exception;
	
	//게시판 답변레벨 SEQ(bbsReLevl)
	public int BbsReLevel(BbsVo Vo) throws Exception;
	
	//게시판 댓글 SEQ(BbsCommentSeq)
	public int BbsCommentSeq(BbsVo Vo) throws Exception;
	

	
	
	
}
