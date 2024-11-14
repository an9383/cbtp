package mes.service.sm;

import java.util.List;

import mes.domain.sm.MatrlUserVo;
import mes.domain.sm.MenuAuthVo;
import mes.domain.sm.MenuInfoAdmVo;

public interface MenuInfoAdmService {
	//메뉴 목록조회
	public List<MenuInfoAdmVo> listAll(MenuInfoAdmVo menuInfoAdmVo) throws Exception;

	//메뉴 상세조회
	public MenuInfoAdmVo read(MenuInfoAdmVo menuInfoAdmVo) throws Exception;
	
	//메뉴 순서조회
	public String menuInfoAdmSelByMenuOrder(MenuInfoAdmVo menuInfoAdmVo) throws Exception;
		
	//상위메뉴 조회
	public List<MenuInfoAdmVo> readUpperMenu(MenuInfoAdmVo menuInfoAdmVo) throws Exception;
	
	//하위메뉴 조회
	public List<MenuInfoAdmVo> readSubMenu(MenuInfoAdmVo menuInfoAdmVo) throws Exception;
	
	//메뉴 등록
	public void create(MenuInfoAdmVo menuInfoAdmVo) throws Exception;
	
	//메뉴 수정
	public void update(MenuInfoAdmVo menuInfoAdmVo) throws Exception;
	
	//메뉴 수정전 중복조회
	public MenuInfoAdmVo updateCheck(MenuInfoAdmVo menuInfoAdmVo) throws Exception;
		
	//메뉴ID 시퀀스
	public String selectMenuIdSeq() throws Exception;
	
	//하위메뉴 조회
	public List<MenuInfoAdmVo> subMenu(MenuInfoAdmVo menuInfoAdmVo) throws Exception;
	
	//메뉴 불러오기
	public List<MenuInfoAdmVo> menuInfo(MenuAuthVo menuAuthVo) throws Exception;
	
	//메뉴 삭제
	public void menuInfoDelete(MenuInfoAdmVo menuInfoAdmVo) throws Exception;
	
	//사용자권한 삭제 사용 X
	public void menuAuthDelete(MenuInfoAdmVo menuInfoAdmVo) throws Exception;

	//사용자권한 등록 사용 X
	public void menuAuthCreate(MenuAuthVo menuAuthVo) throws Exception;
		
	//전체메뉴 불러오기
	public List<MenuInfoAdmVo> menuInfoAdmin(MenuAuthVo menuAuthVo) throws Exception;
}

