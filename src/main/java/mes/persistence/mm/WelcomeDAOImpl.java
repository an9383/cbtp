package mes.persistence.mm;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.mm.WelcomeVo;

@Repository
public class WelcomeDAOImpl implements WelcomeDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.mm.welcomeMapper";
	
	// 조회
	@Override
	public WelcomeVo read(WelcomeVo welcomeVo) throws Exception {
		return session.selectOne(namespace+".read", welcomeVo);
	}
	
	// 수정
	@Override
	public void edit(WelcomeVo welcomeVo) throws Exception {
		session.update(namespace+".edit", welcomeVo);
	}
}