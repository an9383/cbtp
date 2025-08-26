package mes.domain.bm;

import lombok.Data;

@Data
public class SparePartsAdmVo {
	private String spCd;
	private String spNm;
	private String equipCd;
	private String equipNm;
	private String spCycle;
	private String spCycleNm;
	private String spCnt;
	private String admDept;
	private String mainChargr;
	private String useYn;
	private String spDesc;
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

}
