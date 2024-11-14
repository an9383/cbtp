package mes.persistence.mm;

import mes.domain.mm.WelcomeVo;

public interface WelcomeDAO {
	
	// 조회
	public WelcomeVo read(WelcomeVo wccidentFreeVo) throws Exception;
	
	// 수정
	public void edit(WelcomeVo wccidentFreeVo) throws Exception;
}