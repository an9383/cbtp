package mes.domain.qm;

import lombok.Data;

@Data
public class IllumAdmVo {

	private String illumCd;		//공정코드
	private String illumNm;		//공정명
	private String illumArea;	//구역
	private String msmLoc;      //측정위치
	private String illumUnit;   //단위
	private String illumStand;  //표준
	
	private String msmYear;     //측정년도
	
	private String msmMon;      //측정월
	private String msmDueDate;  //예정일
	private String msmDate;     //측정일
	private String msmMeasures; //측정값
	private String regId;       //등록자
	private String regDate;     //등록일
	private String updId;       //수정자
	private String updDate;     //수정일

	//추가항목
	private String admArrayData;
	private String dtlArrayData;
	private String chooseYear;
	private String chooseYear2;
	
	private String msmDate1;
	private String msmDate2;
	private String msmDate3;
	private String msmDate4;
	private String msmDate5;
	private String msmDate6;
	private String msmDate7;
	private String msmDate8;
	private String msmDate9;
	private String msmDate10;
	private String msmDate11;
	private String msmDate12;
	
	private String mon1;
	private String mon2;
	private String mon3;
	private String mon4;
	private String mon5;
	private String mon6;
	private String mon7;
	private String mon8;
	private String mon9;
	private String mon10;
	private String mon11;
	private String mon12;
	
}
