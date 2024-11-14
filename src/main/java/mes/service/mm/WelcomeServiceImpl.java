package mes.service.mm;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.mm.WelcomeVo;
import mes.persistence.mm.WelcomeDAO;

@Service
public class WelcomeServiceImpl implements WelcomeService {

	@Inject
	private WelcomeDAO dao;
	
	// 조회
	@Override
	public WelcomeVo read(WelcomeVo welcomeVo) throws Exception {
		return dao.read(welcomeVo);
	}
	
	// 수정
	@Override
	public void edit(WelcomeVo welcomeVo) throws Exception {
		dao.edit(welcomeVo);
	}
}
