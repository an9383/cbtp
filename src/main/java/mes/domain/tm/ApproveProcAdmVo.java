package mes.domain.tm;

import lombok.Data;

@Data
public class ApproveProcAdmVo {

	private String barcodeNo;	//바코드번호
	private String apCd;		//승인번호
	private String apGubun;		//승인구분
	private String apSeq;		//승인순번
	private String apDate;		//승인일
	private Float  apQty;		//승인수량
	private String apChargr;	//승인일
	private String apChargrNm;	//승인일
	private String sourceNo;	//연계번호
	private String regId;		//등록자
	private String regDate;		//등록일
	private String updId;		//수정자
	private String updDate;		//수정일
	
	
	private String partCd;
	private String partRev;
	private String partNm;
	private String partSpec;
	private String partUnit;
	private String partUnitNm;
	private String partGubun;
	private String partGubunNm;
	
	private String preInWhsQty;
	private String inWhsQty;
	private String preInWhsDate;
	private String inWhsDate;
	private String inspectDate;
	
	private String pairQty;
	private String faultyQty;
	private String diffQty;

	private String workOrdNo;
	private String itemCd;
	private String itemNm;
	private String itemRev;
	private String itemGubun;
	private String itemGubunNm;
	private String rcvDate;
	private String ordCorpCd;
	private String ordCorpNm;
	private String dlvDate;
	private String workOrdQty;
	
	private String ordDate;
	private String serialNo;
	private String outputQty;
	
	private String startDate;
	private String endDate;

	
}
