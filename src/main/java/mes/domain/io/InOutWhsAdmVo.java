package mes.domain.io;

import lombok.Data;

@Data
public class InOutWhsAdmVo {

	private String poNo;
	private String poSeq;
	
	private String inSlipNo;  //입고전표
	private String inSlipSeq; //입고전표시퀀스
	
	private String inSeq;
	

	private String lotNo;
	
	private String itemSeq;  	 
	private String itemCd;		  
	private String itemNm;		  	  
	private String itemModel;
	private String itemUnit;
	private String itemFifoGubun;
	private String itemFifoGubunNm;
	
	private String importCost;
	private String importYn;
	
	private String partCd;
	private String partRev;
	private String partNm;
	private String partSpec;
	private String partUnit;
	private String partGubun;
	
	private String ordQty;
	
	private String partQty;
	private String safyStockCnt;		//안전재고
	private String addQty;
	private String payYn;
	
	private String inspectYn;
	private String preInWhsQty;
	private String inWhsQty;
	private String inspectQty;
	private String adjustQty;
	private String faultyQty;
	private String returnQty;
	private String exceptQty;
	private String diffQty;
	private String remainQty;
	private String spplyCorpCd;
	private String spplyCorpNm;
	private String preInWhsDate;
	private String preInStatus;
	private String inWhsDate;
	private String inspectDate;
	private String barcodeNo;
	private String approvalCd;
	private String approvalYn;
	private String approvalNm;
	private String statusCd;
	private String partChargr;
	private String preOutWhsDate;
	private String preOutEquipCd;
	private String preOutPartCd;
	private String preOutQty;
	private String preWorkCharger;
	private String preWorkChargerNm;
	private String outWhsDate;
	private String outEquipCd;
	private String outPartCd;
	private String outQty;
	private String outWorkCharger;
	private String locationCd;		//창고코드
	private String locationNm;		//창고명
	private String areaCd;			//구역코드
	private String areaNm;			//구역명
	private String floorCd;			//위치코드
	private String floorNm;			//위치명
	private String locationNo;		//Location No
	private String outputDate;
	private String manufactrCd;
	private String inWhsDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

	private String startDate;
	private String endDate;
	
	private String dealCorpCd;
	private String dealCorpNm;
	private String poDate;
	private String poDesc;
	private String dlvDate;
	private String receiptGubun;
	private String receiptGubunNm;
	private String pairCnt;
	private String faultyCnt;
	
	private String tmMon;
	private String status;
	private String contDtlNo;
	private String searchOption;
	private String searchOption2;
	private String today;

	//추가사항
	private String itemInspectCheck;
	private String inOutWhsCheck;
	private String mainGubun;
	private String mainGubunNm;
	
	private String itemGubun;
	private String itemGubunNm;
	
	private String qaEval;
	private String faultyPcs;
	private String faultyPcsNm;
	private String inspectChargr;
	private String inWhsYn;
	private String unfitProc;
	private String unfitProcNm;
	private String inOutWhsGubun;
	private String areaNmSewing;
	private String floorNmSewing;
	private String searchVal;
	private int totalCount;
	private String ordDir;
	private String ordColumn;
	
	private String inWhsCost;			//입고금액
}
