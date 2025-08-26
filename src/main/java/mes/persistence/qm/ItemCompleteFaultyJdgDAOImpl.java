package mes.persistence.qm;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.qm.ItemCompleteFaultyJdgAdmVo;

@Repository
public class ItemCompleteFaultyJdgDAOImpl implements ItemCompleteFaultyJdgDAO {


	@Inject
	private SqlSession session;
	
	@Inject
	private static String namespace = "mes.mappers.qm.itemCompleteFaultyJdgAdmMapper";
	
	
	public ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmRead(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo ) throws Exception{
		return session.selectOne(namespace+".itemCompleteFaultyJdgAdmRead" ,itemCompleteFaultyJdgAdmVo );
	}
	
	public void itemCompleteFaultyJdgAdmCreate(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo) throws Exception{
		session.insert(namespace+".itemCompleteFaultyJdgAdmCreate" ,itemCompleteFaultyJdgAdmVo );
	}
	
	public void itemCompleteFaultyJdgAdmUpdate(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo) throws Exception{
		session.update(namespace+".itemCompleteFaultyJdgAdmUpdate" ,itemCompleteFaultyJdgAdmVo);
	}
	
	public void updateApprovalYn(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo) throws Exception{
		session.update(namespace+".updateApprovalYn",itemCompleteFaultyJdgAdmVo);
	}
}
