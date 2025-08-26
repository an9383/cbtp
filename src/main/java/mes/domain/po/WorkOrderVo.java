package mes.domain.po;

import lombok.Data;

@Data
public class WorkOrderVo {
	
	private String menuAuth;              //메뉴권한
	private String workOrdNo;
	private String upperWorkOrdNo;
	private String preWorkOrdNo;
	private String contDtlNo;
	private String barcodeNo;
	private String ordLotNo;
	private Integer dtlOrdCnt;	
	private String itemRev;
	private String itemGubun;
	private String itemGubunNm;
	private String ordDate;
	private String workStatusCd;
	private String workGubun;
	private String workGubunNm;
	private String dtlOrdQty;
	private String workOrdQty;
	private String workOrdQtyRate;
	private String outputQty;
	private String faultyQty;
	private String initFaultyQty;
	private String fuzzQty;
	private String runnerQty;
	private String fairQty;
	private String outputDate;
	private String dlvDate;
	private String lastYn;
	private String lastYnNm;
	private String reworkYn;
	private String reworkYnNm;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	private String startDate;
	private String endDate;
	private String etcDate;
	private String etcCont;
	private String ordDesc;
	private String itemCd;
	private String itemNm;
	private String itemSeries;
	private String itemCapa;
	private String itemCable;
	private String pairQty;
	private String inLoc;
	private String inspectDate;
	private String completeStatusCd;
	private String boxCount;
	
	private String workOrdDate;
	private String workEmerYn;
	private String workEmerYnNm;
	
	private String bomCd;
	private String bomNm;
	private String prcssCd;
	private String prcssNm;
	private String lowerPrcssCd;
	private String lowerPrcssNm;
	
	private String partRev;
	private String partUnitNm;
	private String partUnit;
	private String partCd;
	private String partNm;
	private String partSeq;
	private String partConsumpt;
	
	private String equipCd1;
	private String equipCd2;
	private String equipCd3;
	private String equipCd4;
	private String equipCd5;
	private String equipNm1;
	private String equipNm2;
	private String equipNm3;
	private String equipNm4;
	private String equipNm5;

	private String minorPrcssCd;
	private String middlePrcssCd;
	private String minorPrcssNm;
	private String middlePrcssNm;
	private String equipCd;
	private String equipNm;
	private String workMethod;
	private String workMethodNm;
	private String workStatusNm;
	private String mainWorkChargr;
	private String subWorkChargr;
	private String mainWorkChargrNm;
	private String subWorkChargrNm;
	
	private String targetQty;
	private String dealCorpCd;
	private String dealCorpNm;
	private String workStartTime;
	private String workEndTime;
	private String workTime;
	private String packYn;
	private String packYnNm;
	private String workOrdSeq;
	private String endStatusNm;
	private String endStatusCd;
	private String targetAllQty;
	private String prdcQty;
	private String remainQty;
	private String dtlRegDate;
	private String ordCorpCd;
	private String ordCorpNm;
	private String rcvChargr;
	private String rcvChargrNm;
	
	private String prcssSeq;
	
	private String contNo;
	private String prdcRate;
	private String outRate;
	private String progress;
	
	private String poStatus;
	private String inStatus;
	private String preOutStatus;
	private String outStatus;
	private String itemInspectStatus; //제품출하검사상태
	
	private String doDtlDate;
	private String workChargrNm;
	
	private String selStartDate;
	private String selEndDate;

	private String rcvDate;
	private String shipReqDate;
	private Integer reworkQty;
	private String reworkType;
	private String confirmYn;
	
	private String value;
	private String etcGubun;
	private String etcSeq;
	private String itemSeq;
	
	//추가사항
	private String itemModel;
	private String itemModelNm;
	private String itemCus;
	private String itemCusNm;
	private String moldCd;
	private String moldNo;
	private String mainGubun;
	private String mainGubunNm;
	private String equipCavity;
	private String moldLocation;
	private String tmQty;
	
	private String locNo;
	private String locCd;
	private String areaCd;
	private String floorNm;
	
	private String outLocNo;
	private String outLocCd;
	private String outLocNm;
	private String outAreaCd;
	private String outFloorNm;
	
	private String ebomItemNm;
	private String mdInspectYn;		//중물검사 여부
	
	private String workStartDate;	//생산시작일자
	
	private String userNumber;	
	private String userNm;		
	private String departmentNm;	
	private String postNm;		
	private String chargeDutyNm;
	private String cavityCnt;
	private String workChargr;
	private String workStatusWe;
	private String inLocNo;
	private String inLocCd;
	private String inAreaCd;
	private String inFloorNm;
	private String empCd;
	private String sampleCnt;
	
	//workOrderProgress테이블
	private String workProgNo;
	private String[] workProgNoArr;
	private String workProgDate;
	private String workProgQty;
	private String workProgOrd;
	private String workProgCorp;
	private String workStatus;
	private String workProgDesc;
	
	private String tbGubun;	//일생산계획 상단/하단 구분
	private String outCorpNm;

	
}
