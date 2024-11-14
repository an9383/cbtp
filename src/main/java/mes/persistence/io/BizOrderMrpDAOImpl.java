package mes.persistence.io;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.io.BizOrderMrpVo;

@Repository
public class BizOrderMrpDAOImpl implements BizOrderMrpDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.io.bizOrderMrpMapper";
	
	//소요량코드 조회
	@Override
	public List<BizOrderMrpVo> listAll(BizOrderMrpVo bizOrderMrpVo) throws Exception{
		return session.selectList(namespace + ".listAll", bizOrderMrpVo);
	}
	//소요량코드 상세 조회
	@Override
	public BizOrderMrpVo read(BizOrderMrpVo bizOrderMrpVo) throws Exception{
		return session.selectOne(namespace + ".selectOne", bizOrderMrpVo);
	}
			
	//소요량코드 등록
	@Override
	public void create(BizOrderMrpVo bizOrderMrpVo) throws Exception{
		session.insert(namespace + ".create",bizOrderMrpVo);
	}
	
	//소요량코드 수정
	@Override
	public void update(BizOrderMrpVo bizOrderMrpVo) throws Exception{
		session.update(namespace + ".update",bizOrderMrpVo);
	}
	
	//소요량코드 삭제
	public void delete(BizOrderMrpVo bizOrderMrpVo) throws Exception{
		session.delete(namespace +".delete",bizOrderMrpVo);
	}
	
	//소요량코드 시퀀스 생성
	@Override
	public int seq(String date) throws Exception{
		return session.selectOne(namespace + ".seq", date);
	}
	
	//소요량코드 생성
	@Override
	public int mrpSeq() throws Exception{
		return session.selectOne(namespace + ".mrpSeq");	
	}
	
	//소요량코드 확정
	@Override
	public void updateStatus(BizOrderMrpVo bizOrderMrpVo) throws Exception{
		session.update(namespace + ".updateStatus", bizOrderMrpVo);	
	}
	
	//소요량코드 대비 발주존재여부 확인 
	public int getPurchaseExist(BizOrderMrpVo bizOrderMrpVo) throws Exception{
		return session.selectOne(namespace+".getPurchaseExist" , bizOrderMrpVo);
	}


}
