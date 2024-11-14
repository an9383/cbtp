package mes.service.sm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.sm.MenuAuthVo;
import mes.domain.sm.UserMenuAuthVo;
import mes.persistence.sm.MenuAuthDAO;

@Service
public class MenuAuthServiceImpl implements MenuAuthService{
	
	@Inject
	private MenuAuthDAO dao;
	
	//권한 목록조회
	@Override
	public List<MenuAuthVo> listAll(MenuAuthVo menuAuthVo) throws Exception{
		return dao.listAll(menuAuthVo);
	}

	//권한 상세조회
	@Override
	public MenuAuthVo read(MenuAuthVo menuAuthVo) throws Exception{
		return dao.read(menuAuthVo);
	}
	
	//특정 부서 전체 조회
	@Override
	public List<MenuAuthVo> readAll(MenuAuthVo menuAuthVo) throws Exception{
		return dao.readAll(menuAuthVo);
	}
	
	//권한 등록
	@Override
	public void create(List<MenuAuthVo> menuAuthVo) throws Exception{
		dao.create(menuAuthVo);
	}				
	
	//권한 수정
	@Override
	public void update(MenuAuthVo menuAuthVo) throws Exception{
		dao.update(menuAuthVo);
	}
	
	//권한 삭제
	@Override
	public void delete(MenuAuthVo menuAuthVo) throws Exception{
		dao.delete(menuAuthVo);
	}
	
	//중복 체크
	@Override
	public MenuAuthVo check(MenuAuthVo menuAuthVo) throws Exception{
		return dao.check(menuAuthVo);
	}
	
	//메뉴 권한 패스 조회
	@Override
	public String menuAuthPath(MenuAuthVo menuAuthVo) throws Exception{
		return dao.menuAuthPath(menuAuthVo);
	}	
	

	//user권한 검색
	public MenuAuthVo readCheck(MenuAuthVo menuAuthVo) throws Exception{
		return dao.readCheck(menuAuthVo);
	}

	//메뉴 권한 패스 조회
	@Override
	public String menuAuthPathAdmin(MenuAuthVo menuAuthVo) throws Exception{
		return dao.menuAuthPathAdmin(menuAuthVo);
	}
}
