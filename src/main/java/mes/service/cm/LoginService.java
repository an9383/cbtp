package mes.service.cm;

import mes.domain.cm.LoginVo;

public interface LoginService {

	//로그인 기록 등록
	public void loginCreate(LoginVo loginVo) throws Exception;
	
	//로그인 시퀀스 생성
	public String loginNoSeq(LoginVo loginVo) throws Exception;
}
