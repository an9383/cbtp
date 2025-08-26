package mes.persistence.cm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.cm.BbsVo;

@Repository
public class BbsDAOImpl implements BbsDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="mes.mappers.cm.bbsMapper";
	
	//게시판 리스트 출력
	@Override
	public List<BbsVo> BbsList() {
		return session.selectList(namespace+".bbsList");
	}
	
	//게시판 상위10개 출력
	public List<BbsVo> bbsTop10List() throws Exception{
		return session.selectList(namespace+".bbsTop10List");
	}
	
	//게시판 상세보기 출력
	@Override
	public BbsVo BbsRead(BbsVo Vo) throws Exception {
		return session.selectOne(namespace + ".bbsRead", Vo);
	}
	//게시판 파일경로(filePath)
	@Override
	public int BbsFilePath(BbsVo Vo) throws Exception {
		return session.selectOne(namespace + ".bbsFilePath", Vo);
	}
	
	//게시판 파일명(fileNm)
	@Override
	public String BbsFileNm(BbsVo Vo) throws Exception {
		return session.selectOne(namespace + ".bbsFileNm", Vo);
	}
	
	//게시판 등록
	@Override
	public int BbsCreate(BbsVo Vo) {
		return session.insert(namespace + ".bbsCreate", Vo);
	}
	
	//게시판 수정
	@Override
	public int BbsUpdate(BbsVo Vo) throws Exception {
		return session.update(namespace + ".bbsUpdate" , Vo);
	}
	
	//게시판 삭제
	@Override
	public int BbsDelete(BbsVo Vo) throws Exception {
		return session.update(namespace + ".bbsDelete" , Vo);
	}
	
	//게시판 댓글 리스트 출력
	@Override
	public List<BbsVo> BbsReList(BbsVo Vo) {
		return session.selectList(namespace+".bbsReList" , Vo);
	}
	
	//게시판  댓글 상세보기 출력
	@Override
	public BbsVo BbsReRead(BbsVo Vo) throws Exception {
		return session.selectOne(namespace + ".bbsReRead", Vo);
	}
	
	//게시판  댓글 등록
	@Override
	public int BbsReCreate(BbsVo Vo) {
		return session.insert(namespace + ".bbsReCreate", Vo);
	}
	
	//게시판  댓글 수정
	@Override
	public int BbsReUpdate(BbsVo Vo) throws Exception {
		return session.update(namespace + ".bbsReUpdate" , Vo);
	}
	
	//게시판 SEQ(bbsNo)
	@Override
	public int BbsNo() throws Exception {
		return session.selectOne(namespace + ".bbsNo");
	}
	
	@Override
	public int upBbsNo(BbsVo Vo) throws Exception {
		return session.selectOne(namespace + ".upBbsNo" ,Vo);
	}
	
	//게시판 리뷰 SEQ(bbsReSeq)
	@Override
	public int BbsReSeq(BbsVo Vo) throws Exception {
		return session.selectOne(namespace + ".bbsReSeq",Vo);
	}
	
	//게시판 답변 레벨 번호SEQ(bbsReLevel)
	@Override
	public int BbsReLevel(BbsVo Vo) throws Exception {
		return session.selectOne(namespace + ".bbsReLevel", Vo); 
	}
	
	//게시판 댓글 SEQ(BbsCommentSeq)
	public int BbsCommentSeq(BbsVo Vo) throws Exception{
		return session.selectOne(namespace + ".bbsCommentSeq", Vo);
	}
	

}
