package mes.domain.bm;

import lombok.Data;

@Data
public class MeasureInstrmtAdmVo {
	private String mitCd;
	private String admNo;
	private String mitNo;
	private String admDept;
	private String mainChargr;
	private String mitNm;
	private String corrCycle;
	private String corrCycleNm;
	private String corrCount;
	private String mitForm;
	private String mitKind;
	private String modelNm;
	private String mfcCorpNm;
	private String acqDate;
	private String acqCost;
	private String mitLoc;
	private String mitLocNm;
	private String useYn;
	private String mitDesc;

	
	private byte[] imageFile1;
	private byte[] imageFile2;
	private byte[] imageFile3;
	private byte[] imageFile4;
	private String imageFile1Nm;
	private String imageFile2Nm;
	private String imageFile3Nm;
	private String imageFile4Nm;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	private String value;
	private String url;
	
	//추가사항
	private String corrDate;
	private String corrWillDate;
	private String mainGubun;
	private String mainGubunNm;
	private String corrYear;
	private String monthOne;
	private String monthTwo;
	private String monthThree;
	private String monthFour;
	private String monthFive;
	private String monthSix;
	private String monthSeven;
	private String monthEight;
	private String monthNine;
	private String monthTen;
	private String monthEleven;
	private String monthTwelve;
	private String corrCheck;
	private String corrGubun;
	private String corrGubunNm;
	private String admDeptNm;
	private String mitCorrDate;
	private String mitCorrWillDate;

}
