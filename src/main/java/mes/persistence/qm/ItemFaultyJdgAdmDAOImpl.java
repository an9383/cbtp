package mes.persistence.qm;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.qm.ItemFaultyJdgAdmVo;

@Repository
public class ItemFaultyJdgAdmDAOImpl implements ItemFaultyJdgAdmDAO {

	@Inject
	private SqlSession session;
	
	@Inject
	private static String namespace = "mes.mappers.qm.itemFaultyJdgAdmMapper";
	
	
	public ItemFaultyJdgAdmVo itemFaultyJdgAdmRead(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception{
		return session.selectOne(namespace+".itemFaultyJdgAdmRead" ,itemFaultyJdgAdmVo );
	}
	
	public void itemFaultyJdgAdmCreate(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception{
		session.insert(namespace+".itemFaultyJdgAdmCreate" ,itemFaultyJdgAdmVo);
	}
	
	public void itemFaultyJdgAdmUpdate(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception{
		session.update(namespace+".itemFaultyJdgAdmUpdate",itemFaultyJdgAdmVo);
	}
	
	public void updateInOutWhsFaultyQty(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception{
		session.update(namespace+".updateInOutWhsFaultyQty" ,itemFaultyJdgAdmVo );
	}
	
	public ItemFaultyJdgAdmVo getInWhsQty(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception{
		return session.selectOne(namespace+".getInWhsQty",itemFaultyJdgAdmVo);
	}
	
	public void updateApprovalYn(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception{
		session.update(namespace+".updateApprovalYn" ,itemFaultyJdgAdmVo );
	}
	
}
