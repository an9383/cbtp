package mes.domain.qm;

import lombok.Data;

@Data
public class ItemJajuFaultyJdgAdmVo {

	private String workOrdNo;
	private String workOrdSeq;
	private String minorPrcssCd;
	private String middlePrcssCd;
	private String itemCd;
	private String itemRev;
	private Integer reworkQty;
	private String reworkDate;
	private Integer disuseQty;
	private String disuseDate;
	private String faultyChargr;
	private String faultyChargrNm;
	private String faultyDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

}

