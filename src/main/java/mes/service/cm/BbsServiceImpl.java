package mes.service.cm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.cm.BbsVo;
import mes.persistence.cm.BbsDAO;

@Service
public class BbsServiceImpl implements BbsService {
	
	@Inject
	private BbsDAO dao;
	
	//게시판 리스트 출력
	@Override
	public List<BbsVo> BbsList() throws Exception {
		return dao.BbsList();
	}
	
	//게시판 상위10개 출력
	public List<BbsVo> bbsTop10List() throws Exception{
		return dao.bbsTop10List();
	}
	
	//게시판 상세보기 출력
	@Override
	public BbsVo BbsRead(BbsVo Vo) throws Exception {
		return dao.BbsRead(Vo);
	}
	
	//게시판 파일경로 출력
	@Override
	public int BbsFilePath(BbsVo Vo) throws Exception {
		return dao.BbsFilePath(Vo);
	}
	
	//게시판 파일이름 출력
	@Override
	public String BbsFileNm(BbsVo Vo) throws Exception {
		return dao.BbsFileNm(Vo);
	}
	
	//게시판 등록
	@Override
	public int BbsCreate(BbsVo Vo) throws Exception {
		 return dao.BbsCreate(Vo);
	}
	
	//게시판 수정
	@Override
	public int BbsUpdate(BbsVo Vo) throws Exception {
		return dao.BbsUpdate(Vo);
	}
	
	//게시판 삭제
	@Override
	public int BbsDelete(BbsVo Vo) throws Exception {
		return dao.BbsDelete(Vo);
	}
	
	//게시판 댓글 리스트 출력
	@Override
	public List<BbsVo> BbsReList(BbsVo Vo) throws Exception {
		return dao.BbsReList(Vo);
	}
	
	//게시판 댓글 상세보기 출력
	@Override
	public BbsVo BbsReRead(BbsVo Vo) throws Exception {
		return dao.BbsReRead(Vo);
	}
	
	//게시판 댓글  등록
	@Override
	public int BbsReCreate(BbsVo Vo) throws Exception {
		return dao.BbsReCreate(Vo);
	}
	
	//게시판  댓글 수정
	@Override
	public int BbsReUpdate(BbsVo Vo) throws Exception {
		return dao.BbsReUpdate(Vo);
	}
	
	//게시판 SEQ(bbsNo)
	@Override
	public int BbsNO() throws Exception {
		return dao.BbsNo();
	}
	
	@Override
	public int upBbsNo(BbsVo Vo) throws Exception {
		return dao.upBbsNo(Vo);
	}
	
	//게시판 리뷰 SEQ(bbsReSeq)
	@Override
	public int BbsReSeq(BbsVo Vo) throws Exception {
		return dao.BbsReSeq(Vo);
	}

	//게시판 답변 레벨 번호SEQ(bbsReLevel)
	@Override
	public int BbsReLevel(BbsVo Vo) throws Exception {
		return dao.BbsReLevel(Vo);
	}
		
	//게시판 댓글 SEQ(BbsCommentSeq)
	public int BbsCommentSeq(BbsVo Vo) throws Exception{
		return dao.BbsCommentSeq(Vo);
	}

}
