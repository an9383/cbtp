package mes.service.sm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.sm.MenuAuthVo;
import mes.domain.sm.MenuInfoAdmVo;
import mes.persistence.sm.MenuInfoAdmDAO;

@Service
public class MenuInfoAdmServiceImpl implements MenuInfoAdmService{
	
	@Inject
	private MenuInfoAdmDAO dao;
	
	//메뉴 목록조회
	@Override
	public List<MenuInfoAdmVo> listAll(MenuInfoAdmVo menuInfoAdmVo) throws Exception{
		return dao.listAll(menuInfoAdmVo);
	}

	//메뉴 상세조회
	@Override
	public MenuInfoAdmVo read(MenuInfoAdmVo menuInfoAdmVo) throws Exception{
		return dao.read(menuInfoAdmVo);
	}
	
	//메뉴 순서조회
	@Override
	public String menuInfoAdmSelByMenuOrder(MenuInfoAdmVo menuInfoAdmVo) throws Exception{
		return dao.menuInfoAdmSelByMenuOrder(menuInfoAdmVo);
	}
	
	//상위메뉴 조회
	@Override
	public List<MenuInfoAdmVo> readUpperMenu(MenuInfoAdmVo menuInfoAdmVo) throws Exception{
		return dao.readUpperMenu(menuInfoAdmVo);
	}
	
	//하위메뉴 조회
	@Override
	public List<MenuInfoAdmVo> readSubMenu(MenuInfoAdmVo menuInfoAdmVo) throws Exception{
		return dao.readSubMenu(menuInfoAdmVo);
	}
	
	//메뉴 등록
	@Override
	public void create(MenuInfoAdmVo menuInfoAdmVo) throws Exception{
		dao.create(menuInfoAdmVo);
	}

	//메뉴 수정
	@Override
	public void update(MenuInfoAdmVo menuInfoAdmVo) throws Exception{
		dao.update(menuInfoAdmVo);
	}
	
	//메뉴 수정전 중복체크
	@Override
	public MenuInfoAdmVo updateCheck(MenuInfoAdmVo menuInfoAdmVo) throws Exception{
		return dao.updateCheck(menuInfoAdmVo);
	}
		
	//메뉴번호 시퀀스
	@Override	
	public String selectMenuIdSeq() throws Exception{
		return dao.selectMenuIdSeq();
	}
	
	//하위메뉴전체 조회
	@Override
	public List<MenuInfoAdmVo> subMenu(MenuInfoAdmVo menuInfoAdmVo) throws Exception{
		return dao.subMenu(menuInfoAdmVo);
	}
	
	//메뉴 불러오기
	@Override
	public List<MenuInfoAdmVo> menuInfo(MenuAuthVo menuAuthVo) throws Exception{
		return dao.menuInfo(menuAuthVo);
	}
	
	//메뉴 삭제
	@Override
	public void menuInfoDelete(MenuInfoAdmVo menuInfoAdmVo) throws Exception {
		dao.menuInfoDelete(menuInfoAdmVo);
	}
	
	//사용자 권한 삭제 사용 X
	@Override
	public void menuAuthDelete(MenuInfoAdmVo menuInfoAdmVo) throws Exception {
		dao.menuAuthDelete(menuInfoAdmVo);
	}
	
	//사용자 권한 등록 사용 X
	@Override
	public void menuAuthCreate(MenuAuthVo menuAuthVo) throws Exception{
		dao.menuAuthCreate(menuAuthVo);
	}
		
	//메뉴 불러오기
	@Override
	public List<MenuInfoAdmVo> menuInfoAdmin(MenuAuthVo menuAuthVo) throws Exception{
		return dao.menuInfoAdmin(menuAuthVo);
	}
		
}
