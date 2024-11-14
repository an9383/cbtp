package mes.domain.qm;

import lombok.Data;

@Data
public class ItemCompleteFaultyJdgAdmVo {

	private String workOrdNo;
	private String itemCd;
	private String itemRev;
	private String faultyPcs;
	private Integer pairCnt;
	private Integer faultyCnt;
	private String faultyDate;
	private String faultyChargr;
	private String faultyChargrNm;
	private Integer disuseQty;
	private String disuseDate;
	private Integer repairQty;
	private String repairDate;
	private Integer reworkQty;
	private String reworkDate;
	private String approvalYn;
	private String faultyDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

	
}
