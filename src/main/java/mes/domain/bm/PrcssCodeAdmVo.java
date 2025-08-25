package mes.domain.bm;

import lombok.Data;

@Data
public class PrcssCodeAdmVo {

	private String prcssCd;
	private String prcssType;
	private String lowerPrcssCd;
	private String prcssSeq;
	private String prcssNm;
	private String prcssGubun;
	private String prcssGubunNm;
	private String prcssInitial;
	private String osrcYn;
	private String prcssUph;
	private String prcssStand1;
	private String prcssStand2;
	private String prcssStand3;
	private String etc1;
	private String etc2;
	private String prcssDesc;
	private String useYn;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	//추가정보
	private String itemCd;
	private String itemConsumpt;
	private String itemNm;
	private String itemGubunNm;
	private String itemUnit;
	private String equipCd;
	private String equipNm;
	private String osrcYnNm;
	private String itemSeq;
	private String itemModelNm;
	private String realPrcssNm;
	private String mainGubun;
	private String[] checkBoxArray;
	private String workerSeq;
	private String userNumber;
	private String seqCheck;
	private String userId;
	private String userNm;
	private String departmentNm;
	private String postNm;
	private String userDesc;


}
