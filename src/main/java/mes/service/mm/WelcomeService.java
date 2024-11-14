package mes.service.mm;

import mes.domain.mm.WelcomeVo;

public interface WelcomeService {

	// 조회
	public WelcomeVo read(WelcomeVo welcomeVo) throws Exception;
	
	// 수정
	public void edit(WelcomeVo welcomeVo) throws Exception;
}
