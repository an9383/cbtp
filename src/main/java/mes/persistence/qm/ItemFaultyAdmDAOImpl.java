package mes.persistence.qm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.qm.ItemFaultyAdmVo;

@Repository
public class ItemFaultyAdmDAOImpl implements ItemFaultyAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.qm.itemFaultyAdmMapper";
	
	// 부적합관리 목록조회
	public List<ItemFaultyAdmVo> itemFaultyAdmMasterList(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		return session.selectList(namespace+".itemFaultyAdmMasterList",itemFaultyAdmVo);
	}
	
	// 부적합관리 목록조회
	public List<ItemFaultyAdmVo> itemFaultyAdmList(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		return session.selectList(namespace + ".itemFaultyAdmList",itemFaultyAdmVo);
	}
	
	// 부적합관리 상세조회
	public ItemFaultyAdmVo itemFaultyAdmRead(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		return session.selectOne(namespace +".itemFaultyAdmRead", itemFaultyAdmVo);
	}
	
	//부적합관리 등록
	public void itemFaultyAdmCreate(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		session.insert(namespace+".itemFaultyAdmCreate",itemFaultyAdmVo);
	}
	
	//부적합관리 수정
	public void itemFaultyAdmUpdate(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		session.update(namespace+".itemFaultyAdmUpdate",itemFaultyAdmVo);
	}
	
	// 부적합관리 상세조회
	public ItemFaultyAdmVo itemFaultyImageList(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		return session.selectOne(namespace + ".itemFaultyImageList",itemFaultyAdmVo );
	}
	
	//부적합관리 이미지삭제
	public void itemFaultyImageDelete(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		session.update(namespace + ".itemFaultyImageDelete" , itemFaultyAdmVo);
	}
	
	//부적합관리 이미지삭제
	public Integer getItemFaultySeq(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		return session.selectOne(namespace+".getItemFaultySeq",itemFaultyAdmVo);
	}
}
