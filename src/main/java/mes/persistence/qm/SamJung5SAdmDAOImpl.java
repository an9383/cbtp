package mes.persistence.qm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.AttachDataVo;
import mes.domain.qm.ItemCompleteAdmVo;
import mes.domain.qm.ItemFaultyAdmVo;
import mes.domain.qm.SamJung5SAdmVo;

@Repository
public class SamJung5SAdmDAOImpl implements SamJung5SAdmDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "mes.mappers.qm.samJung5SAdmMapper";

	// 3정5S 개선대책 조회
	@Override
	public List<SamJung5SAdmVo> samJung5SList(SamJung5SAdmVo samJung5SAdmVo) throws Exception {
		return session.selectList(namespace + ".samJung5SList", samJung5SAdmVo);
	}
	
	//개선대책 상세조회
	@Override
	public SamJung5SAdmVo read(SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		return session.selectOne(namespace + ".read",samJung5SAdmVo);
	}
	
	//관리코드 시퀀스
	@Override
	public String samJung5Seq(SamJung5SAdmVo samJung5SAdmVo) throws Exception {
		return session.selectOne(namespace + ".samJung5Seq",samJung5SAdmVo);
	}
	
	//개선대책 등록
	@Override
	public void samJung5SAdmCreate(SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		session.insert(namespace+".samJung5SAdmCreate",samJung5SAdmVo);
	}
	
	//개선대책 수정
	@Override
	public void samJung5SAdmUpdate(SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		session.update(namespace+".samJung5SAdmUpdate",samJung5SAdmVo);
	}
	
	//개선대책 삭제
	@Override
	public void samJung5SAdmDelete(SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		session.delete(namespace+".samJung5SAdmDelete",samJung5SAdmVo);
	}
	
	// 이미지삭제
	@Override
	public void samJung5SAdmImageDelete(SamJung5SAdmVo samJung5SAdmVo) throws Exception{
		session.update(namespace + ".samJung5SAdmImageDelete" , samJung5SAdmVo);
	}
}
