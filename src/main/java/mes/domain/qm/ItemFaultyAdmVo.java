package mes.domain.qm;

import lombok.Data;

@Data
public class ItemFaultyAdmVo {

	private String poNo;
	private Integer poSeq;
	private Integer inSeq;
	
	private String inSlipNo;	//입고전표번호
	private String inSlipSeq;	//입고전표시퀀스
	
	private String itemSeq;
	private String itemCd;
	private String itemNm;
	private String itemUnit;
	private String itemGubun;
	private String itemModel;
	private String itemModelNm;
	
	private String admDept;
	private String admChargr;
	private String admChargrNm;
	private String faultyRegDate;
	private String faultyStatus;
	private String faultyCause;
	private String faultyAct;
	private String faultyDept;
	private String faultyNo;
	private String faultyProg;
	private String faultyImprv;
	private String faultyEffect;
	private String faultyPcs;
	private byte[] faultyImage1;
	private byte[] faultyImage2;
	private String faultyImage1Nm;
	private String faultyImage2Nm;
	private String faultyFile1Nm;
	private String faultyFile2Nm;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private String inspectDate;
	private String inspectChargrNm;
	private String inspectDesc;
	private String inspectCnt;
	private String pairCnt;
	private String faultyCnt;
	private String preInWhsQty;
	private String faultyPercent;
	
	private String dealCorpCd;
	private String dealCorpNm;
	private String telNo;
	private String addrBase;
	
	
	private String startDate;
	private String endDate;
	private String value;

	
	//불량유형관리 
	private String faultyTypeCd;	//불량유형코드
	private String faultyTypeNm;	//불량유형명
	private String faultyTypeQty;	//불량수량
	private String faultyTypeDate;	//불량등록일
	private String faultyTypeDesc;	//불량비고
	private String etc1;
	
	//추가항목
	private String approvalYn;		//승인처리
	
	//사용x
	private String partCd;
	private String partNm;
	private String partRev;
	private String partGubun;
	private String partSpec;
	private String barcodeNo;
}
