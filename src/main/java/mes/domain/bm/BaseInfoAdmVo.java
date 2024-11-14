package mes.domain.bm;

import java.sql.Date;

import lombok.Data;

@Data
public class BaseInfoAdmVo {
	
	private String baseInfoSeq; 		//기준 정보 시퀀스
	private String baseInfoType; 		//기준정보유형
	private String baseInfoGubunNm;		//기준정보구분이름
	private String baseInfoGubun; 		//기중정보구분
	private String baseInfoCd; 			//기준정보코드
	private String baseInfoNm; 			//기준정보코드명
	private String etc1; 				//체크1
	private String etc1Nm; 				//이름
	private String etc2; 				//체크2
	private String etc3; 				//체크3
	private String etc4; 				//체크4
	private String etc5; 				//체크5
	private String useYn; 				//사용여부
	private String useYnNm;				//사용여부이름
	private String baseInfoDesc; 		//비고
	private String regId; 				//등록자
	private String regDate; 				//등록일
	private String updId; 				//수정자
	private String updDate; 				//수정일
	private String areaCd; 				//구역코드
	private String areaNm; 				//구역명
	

}
