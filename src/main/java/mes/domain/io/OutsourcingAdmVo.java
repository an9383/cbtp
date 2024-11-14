package mes.domain.io;

import lombok.Data;

@Data
public class OutsourcingAdmVo {
	
	private String outsrcNo;
	private String workOrdNo;
	private String minorPrcssCd;
	private String minorPrcssNm;
	private String middlePrcssCd;
	private String itemCd;
	private String itemRev;
	private String itemNm;
	private String itemGubun;
	private String itemGubunNm;
	private String outCorpCd;
	private String outCorpNm;
	private String outsrcGubun;
	private Integer outsrcQty;
	private Integer outQty;
	private Integer outRemainQty;
	private Integer inQty;
	private Integer inRemainQty;
	private String outsrcDate;
	private String reqDate;
	private String dlvDate;
	private String outChargr;
	private String outChargrNm;
	private String outsrcStatus;
	private String outsrcStatusNm;
	private String outDesc;
	private String reportFn;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

	private String startDate;
	private String endDate;
	private String today;
	private String value;
	
	//출고상세
	private String outsrcChargr;
	private String outsrcChargrNm;
	private String outsrcDesc;
	private String outsrcDtlDate;
	private String outsrcCorpCd;
	private String outsrcCorpNm;
	private Integer outsrcSeq;
	private Integer outsrcDtlQty;
	private Integer outsrcRemainQty;
	
	//입고상세
	private String insrcChargr;
	private String insrcChargrNm;
	private String insrcDesc;
	private String insrcDtlDate;
	private String insrcCorpCd;
	private String insrcCorpNm;
	private Integer insrcSeq;
	private Integer insrcDtlQty;
	private Integer insrcRemainQty;
	

}
