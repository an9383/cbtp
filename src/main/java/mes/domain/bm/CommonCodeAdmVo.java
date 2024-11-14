package mes.domain.bm;

import java.util.Date;
import lombok.Data;

@Data
public class CommonCodeAdmVo {
	
	private String menuAuth;        //메뉴권한
	private String baseGroupCd;		//공통그룹코드
	private String baseGroupNm;		//공통그룹코드명
	private String baseGroupType;	//공통그룹코드유형    N:일반코드, S:시스템코드
	private String baseGroupAbbr;	//공통그룹코드약어명
	private String baseGroupDesc;   //공통그룹코드 비고
	private String baseCd;          //공통코드
	private String baseNm;          //공통코드명
	private String baseAbbr;		//공통코드약어명
	private String baseDesc;		//비고
	private String etc1;			//공통코드기타1
	private String etc2;			//공통코드기타2
	private String etc3;			//공통코드기타3
	private String useYn;			//사용여부    Y:사용, N:미사용
	private String useYnNm;
	private String regId; 			//등록자
	private Date regDate; 		    //등록일
	private String updId;			//수정자
	private Date updDate;			//수정일
	
	private String startBaseCd;			
	private String endBaseCd;		
	
	//추가사항
	private String groupCheck;
	private String baseCdAfter;
}
