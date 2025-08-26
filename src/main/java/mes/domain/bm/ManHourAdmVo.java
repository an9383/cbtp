package mes.domain.bm;

import lombok.Data;

@Data
public class ManHourAdmVo {
	
	private String mhGubun;			//공수관리구분
	private String mhGubunNm;		//공수관리구분 이름
	private String airliftGubun;	//공수구분
	private String airliftGubunNm;	//공수구분명
	private String mhCd;    		//공수코드
	private String mhNm;    		//공수명
	private String mhMin;   		//공수시간
	private String useYn;   		//사용여부
	private String mhDesc;  		//비고
	private String regId;   		//등록자
	private String regDate; 		//등록일
	private String updId;  		 	//수정자
	private String updDate;			//수정일
	
	//추가
	private String baseCd;			//공통코드 구분 코드 

}
