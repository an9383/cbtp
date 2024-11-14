package mes.domain.po;

import lombok.Data;

@Data
public class WorkOrderAdmVo {

	private String workOrdNo;
	private String upperWorkOrdNo;
	private String preWorkOrdNo;
	private String contDtlNo;
	private String workOrdDate;
	private String workEmerYn;
	private String itemSeq;
	private String itemCd;
	private String itemNm;
	private String itemGubun;
	private String itemGubunNm;
	private String itemColor;
	private String recipeCount;
	private String hallCount;
	private String pnlSize;
	private String cutSize;
	private String equipCd;
	private String equipNm;
	private String workGubun;
	
	private String rcvChargr;
	private String rcvChargrNm;	
	private String workChargr;
	private String workChargrNm;	
	
	private String processStatus;
	private String workStatus;
	private String workStartDate;
	private String workEndDate;
	private String workStopDate;
	private String workReStartDate;
	private String workCancelDate;
	private String checkStatus;
	private String checkStartDate;
	private String checkEndDate;
	private String checkPass;
	private String checkStopDate;
	private String checkReStartDate;
	private String checkCancelDate;
	private String lotNo;
	private	String dtlOrdCnt;
	private String workRate;
	private String nonTime;
	private String outputQty;
	private String fairQty;
	private String faultyQty;
	private String lastYn;
	private String reworkYn;
	private String ordDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

	private String workYn;
	private String checkYn;
	
	private String contGubun; 
	private String contGubunNm; 
	private String ordCorpCd; 
	private String ordCorpNm;   
	private String mainGubun;
	private String startDate;
	private String endDate;
	private String workRegYn;
	
	
	
	//후가공 data
	private String capInputCount;
	private String capOutputCount;
	private String capFaultyCount;
	private String capOperStatus;
	private String weight;
	private String speed;
	private String packInputCount;
	private String packOutputCount;
	private String packFaultyCount;
	private String packOperStatus;
	private String boxLoadCount;
	private String boxTappingCount;
	private String boxPalletCount;
	private String boxWorkOrderNo;
	private String boxMoldCount;
	
	private String fillingWt;
	private String fillingCount;
	private String processTime;
	private String boxCount;
	
	private String totalOutputQty;
	private String totalFairQty;
	private String totalFaultyQty;
	
	//박스라벨 관리
	private String boxIdx;
	private String boxLabelNo;
	private String boxLabelDate;
	private String boxLabelChargr;
	private String boxLabelChargrNm;
	private String boxFillCnt;
	private String labelPrintYn;
	private String boxLabelDesc;
	
	
	
}
