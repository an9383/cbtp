package mes.domain.wm;

import lombok.Data;

@Data
public class DailyWorkPlanAdmVo {


	private String workOrdNo;		//작지번호
	private String bomCd;			//bom코드
	private String middlePrcssCd;	//중공정
	private String middlePrcssNm;	//중공정
	private String minorPrcssCd;	//소공정
	private String minorPrcssNm;	//소공정
	private String dailyWorkChargr;	//주작업자
	private String dailyWorkChargrNm;	//주작업자
	private String dailyWorkDate;	//작업일자
	private String dailyWorkDesc;	//비고
	private String regId;			//등록자
	private String regDate;			//등록일
	private String updId;			//수정자
	private String updDate;			//수정일

}
