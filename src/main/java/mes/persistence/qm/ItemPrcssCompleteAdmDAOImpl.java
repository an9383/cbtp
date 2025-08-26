package mes.persistence.qm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.qm.ItemPrcssCompleteAdmVo;

@Repository
public class ItemPrcssCompleteAdmDAOImpl implements ItemPrcssCompleteAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.qm.itemPrcssCompleteAdmMapper";
	

	// 공정검사 목록조회
	@Override
	public List<ItemPrcssCompleteAdmVo> listAll(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		return session.selectList(namespace + ".listAll",itemPrcssCompleteAdmVo);
	}
	
	// 공정검사 목록조회(봉제)
	public List<ItemPrcssCompleteAdmVo> listAllByBongjae(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		return session.selectList(namespace+".listAllByBongjae" ,itemPrcssCompleteAdmVo );
	}
	
	// 공정검사 상세조회
	@Override
	public ItemPrcssCompleteAdmVo read(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		return session.selectOne(namespace + ".read",itemPrcssCompleteAdmVo);
	}
	
	// 공정검사 생성
	@Override
	public void create(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		session.insert(namespace + ".create",itemPrcssCompleteAdmVo);
	}
	
	// 공정검사 수정
	@Override
	public void update(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		session.update(namespace + ".update",itemPrcssCompleteAdmVo);
	}
	
	// 공정검사 삭제
	@Override
	public void delete(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		session.delete(namespace + ".delete",itemPrcssCompleteAdmVo);
	}
	
	// 공정검사 원재료 목록조회
	@Override
	public List<ItemPrcssCompleteAdmVo> matrlList(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		return session.selectList(namespace + ".matrlList",itemPrcssCompleteAdmVo);
	}
	
	// 자주검사 목록조회
	@Override
	public List<ItemPrcssCompleteAdmVo> jajuList(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		return session.selectList(namespace + ".jajuList",itemPrcssCompleteAdmVo);
	}
	
	// 기간별 검사결과 조회(자주검사/공정검사) 목록조회
	@Override
	public List<ItemPrcssCompleteAdmVo> testResultList(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		return session.selectList(namespace + ".testResultList",itemPrcssCompleteAdmVo);
	}
}
