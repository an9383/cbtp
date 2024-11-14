package mes.service.bs;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bs.CustSatisAdmVo;
import mes.persistence.bs.CustSatisAdmDAO;

@Service
public class CustSatisAdmServiceImpl implements CustSatisAdmService {
	
	@Inject
	private CustSatisAdmDAO dao;

	
	//게시판 등록
	@Override
	public int custSatisAdmCreate(CustSatisAdmVo Vo) throws Exception {
		 return dao.custSatisAdmCreate(Vo);
	}

	//게시판 SEQ(custSatisAdmNo)
	@Override
	public int custSatisAdmNo() throws Exception {
		return dao.custSatisAdmNo();
	}
	
	//게시판 리스트 출력
	@Override
	public List<CustSatisAdmVo> custSatisAdmList(CustSatisAdmVo Vo) throws Exception {
		return dao.custSatisAdmList(Vo);
	}
	
	//게시판 상세보기 출력
	@Override
	public CustSatisAdmVo custSatisAdmRead(CustSatisAdmVo Vo) throws Exception {
		return dao.custSatisAdmRead(Vo);
	}
	
	//게시판 수정
	@Override
	public int custSatisAdmUpdate(CustSatisAdmVo Vo) throws Exception {
		return dao.custSatisAdmUpdate(Vo);
	}
	
	//게시판 파일경로 출력
	@Override
	public int CustSatisAdmFilePath(CustSatisAdmVo Vo) throws Exception {
		return dao.CustSatisAdmFilePath(Vo);
	}
	
	//게시판 파일이름 출력
	@Override
	public String CustSatisAdmFileNm(CustSatisAdmVo Vo) throws Exception {
		return dao.CustSatisAdmFileNm(Vo);
	}
	
	//게시판 삭제
	@Override
	public int CustSatisAdmDelete(CustSatisAdmVo Vo) throws Exception {
		return dao.CustSatisAdmDelete(Vo);
	}
	
	//게시판 댓글 리스트 출력
	@Override
	public List<CustSatisAdmVo> CustSatisAdmReList(CustSatisAdmVo Vo) throws Exception {
		return dao.CustSatisAdmReList(Vo);
	}
	
	//게시판 댓글 상세보기 출력
	@Override
	public CustSatisAdmVo CustSatisAdmReRead(CustSatisAdmVo Vo) throws Exception {
		return dao.CustSatisAdmReRead(Vo);
	}
	
	//게시판 댓글  등록
	@Override
	public int CustSatisAdmReCreate(CustSatisAdmVo Vo) throws Exception {
		return dao.CustSatisAdmReCreate(Vo);
	}
	
	//게시판  댓글 수정
	@Override
	public int CustSatisAdmReUpdate(CustSatisAdmVo Vo) throws Exception {
		return dao.CustSatisAdmReUpdate(Vo);
	}
	
	@Override
	public int upCustSatisAdmNo(CustSatisAdmVo Vo) throws Exception {
		return dao.upCustSatisAdmNo(Vo);
	}
	
	//게시판 리뷰 SEQ(custSatisAdmReSeq)
	@Override
	public int CustSatisAdmReSeq(CustSatisAdmVo Vo) throws Exception {
		return dao.CustSatisAdmReSeq(Vo);
	}

	//게시판 답변 레벨 번호SEQ(custSatisAdmReLevel)
	@Override
	public int CustSatisAdmReLevel(CustSatisAdmVo Vo) throws Exception {
		return dao.CustSatisAdmReLevel(Vo);
	}
		
	//게시판 댓글 SEQ(CustSatisAdmCommentSeq)
	public int CustSatisAdmCommentSeq(CustSatisAdmVo Vo) throws Exception{
		return dao.CustSatisAdmCommentSeq(Vo);
	}

}
