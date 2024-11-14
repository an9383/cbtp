package mes.persistence.mm;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.mm.CustSendDocVo;

@Repository
public class CustSendDocDAOImpl implements CustSendDocDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.mm.custSendDocMapper";
	
	// 조회
	@Override
	public CustSendDocVo read(CustSendDocVo custSendDocVo) throws Exception {
		return session.selectOne(namespace+".read", custSendDocVo);
	}
	
	// 수정
	@Override
	public void edit(CustSendDocVo custSendDocVo) throws Exception {
		session.update(namespace+".edit", custSendDocVo);
	}
}