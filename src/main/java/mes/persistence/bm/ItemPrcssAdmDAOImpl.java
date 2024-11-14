package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.ItemPrcssAdmVo;

@Repository
public class ItemPrcssAdmDAOImpl implements ItemPrcssAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.itemPrcssAdmMapper";
	
	//공정목록 조회
	public List<ItemPrcssAdmVo> itemPrcssAdmList(ItemPrcssAdmVo vo) throws Exception{
		return session.selectList(namespace+".itemPrcssAdmList" , vo);
	}
	
	//공정목록 등록
	public int itemPrcssAdmIns(ItemPrcssAdmVo vo) throws Exception{
		return session.insert(namespace+".itemPrcssAdmIns" , vo);
	}
	
	//공정목록 수정
	public int itemPrcssAdmUpd(ItemPrcssAdmVo vo) throws Exception{
		return session.update(namespace+".itemPrcssAdmUpd" , vo);
	}
	
	//공정목록 삭제
	public int itemPrcssAdmDel(ItemPrcssAdmVo vo) throws Exception{
		return session.delete(namespace+".itemPrcssAdmDel" , vo);
	}
	
	//공정시퀀스 생성 
	public String itemPrcssSeqSel(ItemPrcssAdmVo itemPrcssAdmVo) throws Exception{
		return session.selectOne(namespace+".itemPrcssSeqSel" , itemPrcssAdmVo);
	}
}
