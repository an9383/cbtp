package mes.persistence.qm;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.qm.ItemJajuFaultyJdgAdmVo;

@Repository
public class ItemJajuFaultyJdgDAOImpl implements ItemJajuFaultyJdgDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.qm.itemJajuFaultyJdgMapper";
	

	//부적합 판정관리 상세조회
	public ItemJajuFaultyJdgAdmVo itemJajuFaultyJdgAdmRead(ItemJajuFaultyJdgAdmVo itemJajuFaultyJdgAdmVo) throws Exception{
		return session.selectOne(namespace+".itemJajuFaultyJdgAdmRead" , itemJajuFaultyJdgAdmVo);
	}
	
	//부적합 판정관리 등록
	public void itemJajuFaultyJdgAdmCreate(ItemJajuFaultyJdgAdmVo itemJajuFaultyJdgAdmVo) throws Exception{
		session.insert(namespace+".itemJajuFaultyJdgAdmCreate" , itemJajuFaultyJdgAdmVo);
		
	}
	
	//부적합 판정관리 수정
	public void itemJajuFaultyJdgAdmUpdate(ItemJajuFaultyJdgAdmVo itemJajuFaultyJdgAdmVo) throws Exception{
		session.update(namespace+".itemJajuFaultyJdgAdmUpdate" , itemJajuFaultyJdgAdmVo);
	}
}
