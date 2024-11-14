package mes.domain.sm;

import lombok.Data;

@Data
public class MatrlUserVo {
	
	private String menuAuth;              //메뉴권한
	private String userNumber;
	private String userId;
	private String userNm;
	private String userPw;
	private String postCd;
	private String postNm;
	private String positionCd;
	private String positionNm;
	private String departmentCd;
	private String departmentNm;
	private String gradeCd;
	private String gradeNm;
	private String officeYnCd;
	private String officeYnNm;
	private String chargeDuty;
	private String chargeDutyNm;
	private String teamCd;
	private String teamNm;
	private String joinDate;
	private String resignDate;
	private String empCd;
	private String empYnCd;
	private String empNm;
	private String userDesc;
	private String imageYn;
	private String useYnCd;
	private String userYnNm;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private String workplaceCd;
	private String workplaceNm;
	
	private String rememberMe;	//자동로그인 
	private String personalGubun;
	private String personalGubunNm;
	
	private String adminCheck; //관리자계정 여부
	private byte[] userImageFile; //사용자 사진
	private String userImageFileNm; // 사용자 사진 파일명 
	private String imageStatus1; //사진변경여부
	
	private String mainGubun;
}
