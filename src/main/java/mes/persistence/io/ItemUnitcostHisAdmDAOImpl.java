package mes.persistence.io;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.io.ItemUnitcostHisAdmVo;

@Repository
public class ItemUnitcostHisAdmDAOImpl implements ItemUnitcostHisAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.io.itemUnitcostHisAdmMapper";
	
	//자재이력관리 목록조회
	public List<ItemUnitcostHisAdmVo> itemUnitcostHisAdmList(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception{
		return session.selectList(namespace+".itemUnitcostHisAdmList" , itemUnitcostHisAdmVo);
	}
	
	//자재이력관리 상세조회
	public List<ItemUnitcostHisAdmVo> itemUnitcostHisAdmRead(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception{
		return session.selectList(namespace+".itemUnitcostHisAdmRead" ,itemUnitcostHisAdmVo );
	}
	
	//자재이력관리 등록
	public void itemUnitcostHisAdmCreate(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception{
		session.insert(namespace+".itemUnitcostHisAdmCreate" ,itemUnitcostHisAdmVo );
	}
	
	//자재이력관리 수정
	public void itemUnitcostHisAdmUpdate(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception{
		session.update(namespace+".itemUnitcostHisAdmUpdate" , itemUnitcostHisAdmVo);
	}
	
	//자재이력관리 수정
	public Integer getPartSeq(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception{
		return session.selectOne(namespace+".getPartSeq" , itemUnitcostHisAdmVo);
	}
	
	//자재이력관리 수정
	public Integer getLastUnitCost(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception{
		return session.selectOne(namespace +".getLastUnitCost" ,itemUnitcostHisAdmVo );
	}
}
