package mes.domain.qm;

import lombok.Data;

@Data
public class UnfitAdmVo {

	private String unfitNo;
	private String unfitGubun;
	private String unfitLot;
	private String unfitProc;
	private String unfitDate;
	private String unfitManager;
	private String cmApproDate;
	private String cmComplDate;
	private String approvalYn;
	private String approvalYnNm;
	private String unfitDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	//추가사항
	private String inspectDate;
	private String attribPlace;
	private String generateProc;
	private String modelNm;
	private String itemCd;
	private String itemNm;
	private String faultyCd;
	private String faultyDtl;
	private String lotNo;
	private String lotCount;
	private String faultyCnt;
	private String initFaultyCnt;
	private String etFaultyCnt;
	private String itemModel;
	private String itemModelNm;
	private String itemCus;
	private String inSlipNo;
	private String inSlipSeq;
	private String itemSeq;
	private String startDate;
	private String endDate;
	private String unfitProcNm;
	private String unfitToday;
	
	private String faultyCavity;
	private String faultyQty;
	private String ordLotNo;
	private String mainGubun;
	private String itemCusNm;
	private String fairQty;
	private String minorPrcssCd;
	private String equipCd;
	private String equipNm;
	
	
	private String unfitFaultyDate;
	private String unfitFaultyChargr;
	private String unfitPairCnt;
	private String unfitFaultyCnt;
	private String unfitResultLot;
	private String idx;
	private String unfitResultNo;
	private String unfitFaultyChargrNm;
	private String itemGubun;
	private String insertYn;
	
	
}
