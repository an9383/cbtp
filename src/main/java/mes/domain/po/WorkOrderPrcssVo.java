package mes.domain.po;

import lombok.Data;

@Data
public class WorkOrderPrcssVo {
	
	private String menuAuth;              //메뉴권한
	private String mainGubun;
	private String workOrdNo;
	private int workOrdSeq;
	private String workGubun;
	private String workGubunNm;
	private String minorPrcssCd;
	private String middlePrcssCd;
	private String minorPrcssNm;
	private String middlePrcssNm;
	private Integer dtlOrdCnt;
	private Integer workOrdQty;
	private String ordLotNo;
	private String equipCd;
	private String equipNm;
	private String itemCd;
	private String itemNm;
	private String itemRev;
	private String itemGubun;
	private String itemGubunNm;
	private String itemModel;
	private String itemModelNm;
	private String ordDate;
	private String workStatusCd;
	private String workStatus;
	private String workStatusNm;
	private String workChargr;
	private String workChargrNm;
	private String inspectGubun;	//검사취출
	private String inspectGubunNm;	//검사취출
	private String targetQty;
	private String outputQty;
	private String fairQty;
	private String faultyQty;
	private String etcQty;
	private String outQty;
	private String diffOutputQty;
	
	private String totalFuzzQty;
	private String fuzzQty;
	private String runnerQty;
	
	private String workTime;
	private String workNonTime;
	
	private String remainQty;
	private String dealCorpCd;
	private String dealCorpNm;
	private String workStartTime;
	private String workEndTime;
	private String packYn;
	private String packYnNm;
	private String labelPrintYn;	//라벨출력여부
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private String nextPrcssCd;
	private String prcssCd;
	private String prcssSeq;
	private String prevPrcssSeq;
	private String prevMiddlePrcssCd;
	private String prevLowerPrcssCd;
	private String nextPrcssSeq;
	private String nextMiddlePrcssCd;
	private String nextLowerPrcssCd;
	
	private String approvalCho;
	private String approvalJung;
	private String approvalJong;
	
	
	private String bomCd;
	private String m00001;
	private String m00002;
	private String m00003;
	private String m00004;
	private String m00005;
	private String m00006;
	private String m00007;
	private String m00008;
	private String m00009;
	private String m00010;
	private String m00011;
	private String m00012;
	private String m00013;
	private String m00014;
	private String m00015;
	private String m00016;
	private String m00017;
	private String m00018;
	private String m00019;
	private String m00020;
	private String m00021;
	private String m00022;
	private String m00023;
	private String m00024;
	private String m00025;
	private String m00026;
	private String m00027;
	
	private String startDate;
	private String endDate;
	
	private String inQty;
	private String lotDesc;
	private String partNm;
	private String lotNo;
	private String inCorpNm;
	private String partSpec;

	
	//설비연동
	private String deviceNum;
	private Integer deviceMulti;
	private Integer deviceCount;
	
	//추가사항
	private String itemSeq;
	private String lotTrackGubun;	
	private String barcodeNo;
	
	private String inspectDate;
	private String outDate;	
	private String poCorpCd;
	private String poCorpNm;	
	private String ordLotNoDate;

	private String inLoc;	
	private String inArea;
	private String inFloor;	
	private String locationNo;
	
	private String floorNm;	
	private String areaCdNm;
	private String outputInspectDate;
	private String outputDate;
	
	private String boxCount;
	private String smallPackage;
	
	private String mdInspectYn;		//중물검사 여부
	private String orderYn;
	
	private String itemWorkplace;		
	private String itemDesc;
	private String itemColor;
	
	//제조리드타임
	private String regDateFrom; 
	private String regDateTo; 
	private String workStartTimeFrom; 
	private String workStartTimeTo; 
	private String workEndTimeFrom;
	private String workEndTimeTo; 
	private String leadCount;
	private String leadTime;
	private String hourTime;
	private String minTime;
	private String secTime;
	private String TotalLeadTime;
	private String avgLeadTime;

	private String f000006;
	private String f000007;
	private String f000008;
	private String f000009;
	private String f000010;
	private String f000011;
	private String f000012;
	private String f000013;
	private String f000014;
	private String f000024;
	private String f000026;
	private String f000027;

	private String faultyRate;
	private String workProgNo;
	private String faultyCount;
	
	private String locCd;
	private String locCdNm;
	private String itemCus;
	
	private String contDtlNo;
	private String workOrdDate;
	private String workStartDate;
	private String workEndDate;
	private String checkStatus;
	private String checkStartDate;
	private String checkEndDate;
	private String checkPass;
}

