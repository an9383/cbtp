package mes.persistence.cm;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.cm.LoginVo;

@Repository
public class LoginDAOImpl implements LoginDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.cm.loginMapper";
	
	@Override
	public void loginCreate(LoginVo loginVo) throws Exception {
		session.insert(namespace+".logCreate", loginVo);

	}

	
	//로그인 시퀀스 생성
	public String loginNoSeq(LoginVo loginVo) throws Exception{
		return session.selectOne(namespace+".loginNoSeq", loginVo);
	}
	
}
