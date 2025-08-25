package mes.domain.qm;

import lombok.Data;

@Data
public class ItemFaultyJdgAdmVo {

	private String poNo;
	private Integer poSeq;
	private Integer inSeq;
	
	private String inSlipNo;	//입고전표번호
	private String inSlipSeq;	//입고전표시퀀스
	
	private String faultyPcs;
	private Float pairCnt;
	private Float faultyCnt;
	private String faultyDate;
	private String faultyChargr;
	private String faultyChargrNm;
	private Float returnQty;
	private String returnDate;
	private Float disuseQty;
	private String disuseDate;
	private String approvalYn;
	private String faultyDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

	private Float inWhsQty;
	private Float preInWhsQty;
	
	private String value;
	
}
