package mes.persistence.sm;

import java.util.List;

import mes.domain.sm.MenuAuthVo;

public interface MenuAuthDAO {
	
			//권한 조회
			public List<MenuAuthVo> listAll(MenuAuthVo menuAuthVo) throws Exception;

			//권한 상세조회
			public MenuAuthVo read(MenuAuthVo menuAuthVo) throws Exception;
			
			//특정 부서 전체 조회
			public List<MenuAuthVo> readAll(MenuAuthVo menuAuthVo) throws Exception;
			
			//권한 등록
			public void create(List<MenuAuthVo> menuAuthVo) throws Exception;
			
			//권한 수정
			public void update(MenuAuthVo menuAuthVo) throws Exception;
			
			//권한 삭제
			public void delete(MenuAuthVo menuAuthVo) throws Exception;
			
			//중복 체크
			public MenuAuthVo check(MenuAuthVo menuAuthVo) throws Exception;
		
			//메뉴 권한 패스 조회
			public String menuAuthPath(MenuAuthVo menuAuthVo) throws Exception;				
			

			//user권한 검색
			public MenuAuthVo readCheck(MenuAuthVo menuAuthVo) throws Exception;		

			//메뉴 권한 패스 조회
			public String menuAuthPathAdmin(MenuAuthVo menuAuthVo) throws Exception;		
			
}
