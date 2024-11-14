package mes.domain.sm;

import lombok.Data;

@Data
public class MenuInfoAdmVo {
	
	private String menuAuth;      //메뉴권한
	private String menuId;
	private String upperMenuId;
	private String menuNm;
	private String menuPath;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	private String depthFullPath;
	private String userNumber;
	private String menuOrder;	 //메뉴 순서
	
	private String useYn; 		//미사용 ( 조회여부 )
	private String mainGubun;   //구분
	private String adminCheck; 	//계정 조회 
	private String beforeMenuId;
	private int updateCheckCnt;

}
