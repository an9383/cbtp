package mes.domain.qm;

import lombok.Data;

@Data
public class ItemJajuFaultyVo {

	private String workOrdNo;
	private Integer workOrdSeq;
	private String middlePrcssCd;
	private String minorPrcssCd;
	private String minorPrcssNm;
	private String itemCd;
	private String itemRev;
	private String itemNm;
	private String itemGubun;
	private String itemGubunNm;
	private String serialNo;
	private String admDept;
	private String admChargr;
	private String admChargrNm;
	private String workChargr;
	private String workChargrNm;
	private String faultyRegDate;
	private String faultyTypeCd;
	private String faultyTypeNm;
	private String faultyTypeDate;
	private String faultyTypeDesc;
	private Integer faultyQty;
	private Integer etcQty;
	private String faultyStatus;
	private String faultyCause;
	private String faultyAct;
	private String faultyDept;
	private String faultyNo;
	private String faultyProg;
	private String faultyImprv;
	private String faultyEffect;
	private String faultyPcs;
	private String faultyImage1;
	private String faultyImage2;
	private String faultyImage1Nm;
	private String faultyImage2Nm;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

}
