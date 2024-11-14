package mes.service.cm;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.cm.LoginVo;
import mes.persistence.cm.LoginDAO;

@Service
public class LoginServiceImpl implements LoginService {

	@Inject
	private LoginDAO dao;
	
	@Override                    
	public void loginCreate(LoginVo loginVo) throws Exception {
		dao.loginCreate(loginVo);
	}
	
	//로그인 시퀀스 생성
	public String loginNoSeq(LoginVo loginVo) throws Exception{
		return dao.loginNoSeq(loginVo);
	}

}
