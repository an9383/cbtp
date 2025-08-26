package mes.persistence.bs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bs.CustSatisAdmVo;

@Repository
public class CustSatisAdmDAOImpl implements CustSatisAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="mes.mappers.bs.custSatisAdmMapper";

	//게시판 등록
	@Override
	public int custSatisAdmCreate(CustSatisAdmVo Vo) {
		return session.insert(namespace + ".custSatisAdmCreate", Vo);
	}
	
	//게시판 SEQ(custSatisAdmNo)
	@Override
	public int custSatisAdmNo() throws Exception {
		return session.selectOne(namespace + ".custSatisAdmNo");
	}
	
	//게시판 리스트 출력
	@Override
	public List<CustSatisAdmVo> custSatisAdmList(CustSatisAdmVo Vo) {
		return session.selectList(namespace+".custSatisAdmList", Vo);
	}
	
	//게시판 상세보기 출력
	@Override
	public CustSatisAdmVo custSatisAdmRead(CustSatisAdmVo Vo) throws Exception {
		return session.selectOne(namespace + ".custSatisAdmRead", Vo);
	}
	
	//게시판 수정
	@Override
	public int custSatisAdmUpdate(CustSatisAdmVo Vo) throws Exception {
		return session.update(namespace + ".custSatisAdmUpdate" , Vo);
	}
	
	//게시판 파일경로(filePath)
	@Override
	public int CustSatisAdmFilePath(CustSatisAdmVo Vo) throws Exception {
		return session.selectOne(namespace + ".custSatisAdmFilePath", Vo);
	}
	
	//게시판 파일명(fileNm)
	@Override
	public String CustSatisAdmFileNm(CustSatisAdmVo Vo) throws Exception {
		return session.selectOne(namespace + ".custSatisAdmFileNm", Vo);
	}
	
	//게시판 삭제
	@Override
	public int CustSatisAdmDelete(CustSatisAdmVo Vo) throws Exception {
		return session.update(namespace + ".custSatisAdmDelete" , Vo);
	}
	
	//게시판 댓글 리스트 출력
	@Override
	public List<CustSatisAdmVo> CustSatisAdmReList(CustSatisAdmVo Vo) {
		return session.selectList(namespace+".custSatisAdmReList" , Vo);
	}
	
	//게시판  댓글 상세보기 출력
	@Override
	public CustSatisAdmVo CustSatisAdmReRead(CustSatisAdmVo Vo) throws Exception {
		return session.selectOne(namespace + ".custSatisAdmReRead", Vo);
	}
	
	//게시판  댓글 등록
	@Override
	public int CustSatisAdmReCreate(CustSatisAdmVo Vo) {
		return session.insert(namespace + ".custSatisAdmReCreate", Vo);
	}
	
	//게시판  댓글 수정
	@Override
	public int CustSatisAdmReUpdate(CustSatisAdmVo Vo) throws Exception {
		return session.update(namespace + ".custSatisAdmReUpdate" , Vo);
	}
	
	@Override
	public int upCustSatisAdmNo(CustSatisAdmVo Vo) throws Exception {
		return session.selectOne(namespace + ".upCustSatisAdmNo" ,Vo);
	}
	
	//게시판 리뷰 SEQ(custSatisAdmReSeq)
	@Override
	public int CustSatisAdmReSeq(CustSatisAdmVo Vo) throws Exception {
		return session.selectOne(namespace + ".custSatisAdmReSeq",Vo);
	}
	
	//게시판 답변 레벨 번호SEQ(custSatisAdmReLevel)
	@Override
	public int CustSatisAdmReLevel(CustSatisAdmVo Vo) throws Exception {
		return session.selectOne(namespace + ".custSatisAdmReLevel", Vo); 
	}
	
	//게시판 댓글 SEQ(CustSatisAdmCommentSeq)
	public int CustSatisAdmCommentSeq(CustSatisAdmVo Vo) throws Exception{
		return session.selectOne(namespace + ".custSatisAdmCommentSeq", Vo);
	}
	

}
