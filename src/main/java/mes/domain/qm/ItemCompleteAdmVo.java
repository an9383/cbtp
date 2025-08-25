package mes.domain.qm;

import lombok.Data;

@Data
public class ItemCompleteAdmVo {
	
	private String menuAuth;
	
	private String doNo;		//출고요청번호
	private String doNoSub;		//출고요청서브번호
	private String doNoSev;		//출고요청서브번호
	private String doSeq;
	private String icaSeq;		//완제품검사 시퀀스

	private String doStatus;	 //출하상태(001:출고요청/002:검사완료/003:출하완료)
	private String lotNo;
	private String barcodeNo;
	private String itemCd;
	private String itemRev;
	private String mainGubun;
	private String inspectCnt;		//검사수량
	private String inspectDate;		//검사일자
	private String inspectChargr;	//검사자
	private String inspectChargrNm;
	private String inspectDesc;	
	private String qaEval;			//판정
	private String qaEvalNm;		//판정
	private String approvalYn; 		//승인여부
	private String approvalYnNm; 	//승인여부
	private String cavityCnt;		//cavity 수
	
	private String targetQty;		//요청수량
	private String doDate;			//요청일자


	private String pairQty;
	private String faultyQty;
	private String pairCnt;
	private String faultyCnt;
	private String judgment;
	private String judgmentNm;
	
	
	private String outputQty;
	private String outputCnt;
	private String inspectQty;
	private String lineRes;
	private String lineInd;
	private String backEmf;
	private String phaseCurr;
	private String completeDesc;
	private String specialDesc;
	private String shipReport;
	private String completeStatusCd;
	private String completeStatusNm;

	private String contDtlNo;
	private String middleClass;
	private String minorClass;
	private String middleClassNm;
	private String minorClassNm;
	private String itemNm;
	private String itemGubun;
	private String itemGubunNm;
	private String itemSeries;
	private String itemEncdr;
	private String itemCapa;
	private String frameSize;
	private String serialNo;
	
	private String startDate;
	private String endDate;
	
	private String lineResModal;
	private String directVolt;
	private String concenticity;
	private String encoder;
	private String phaseCurrModal;
	private String workFaulty;
	private String exteriorFaulty;
	private String vibeFaulty;
	private String specApplyFaulty;
	private String faultyQtyModal;
	private String brake;
	private String faultyType;
	
	private String writeDate;
	private String admDept;
	private String admChargr;
	private String admDeptNm;
	private String admChargrNm;
	private String faultyStatus;
	private String faultyCause;
	private String faultyAct;
	private String faultyDept;
	private String faultyDeptNm;
	private String faultyImprv;
	private String faultyEffect;
	private String faultyPcs;
	private byte[] faultyImage1;
	private byte[] faultyImage2;
	private String faultyImage1Nm;
	private String faultyImage2Nm;
	private String faultyFile1Nm;
	private String faultyFile2Nm;
	
	private String baseInfoGubun;
	private String baseInfoGubunNm;
	private String faultyPercent;
	
	private String value;

	private String faultyRate;
	private String targetRate;
	private String achvRate;
	
	//불량현상
	private String faultyTypeCd;
	private String faultyTypeSeq;
	private String faultyTypeNm;
	private String faultyTypeQty;
	private String faultyTypeDate;
	private String faultyTypeDesc;
	private String etc1;
	private String faultyTypeTotal;
	private String faultyTypeRate;
	
	private String qcObjYear;
	private String qcObjGubun;
	private String qcObjMon;
	private String qcObjValue;
	
	private String objGubun;
	private String objYear;
	private String objMonth;
	
	//작업지시선택 테이블
	private String upperWorkOrdNo;
	private String workOrdNo;
	private String preWorkOrdNo;
	private String workOrdDate;
	private String workEmerYn;
	private String ordLotNo;
	private String dtlOrdCnt;
	private String itemSeq;
	private String equipCd;
	private String ordDate;
	private String workStatusCd;
	private String dtlOrdQty;
	private String workOrdQty;
	private String outputDate;
	private String dlvDate;
	private String lastYn;
	private String reworkYn;
	private String reworkPrcssCd;
	private String groupPrcssCd;
	private String ordDesc;
	
	//추가사항
	private String itemModel;
	private String itemModelNm;
	private String workEndTime;
	private String fairQty;
	
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	

	private String itemGrade;
	private String inspResultGubun;
	private String inspResultGubunNm;
	private String equipCavity;
	private String equipNo;
	private String moldNm;
	private String moldCd;
    private String matrlNm;
    private String inspectGubun;
    private String inspectGubunNm;
    private String inspSeq;
    private String inspResult;
    private String inspResultNm;
    private String inspList;
    private String inspType;
    private String inspTypeNm;
    private String inspStandUpper;
    private String inspStandLower;
    private String inspX1;
    private String inspX2;
    private String inspX3;
    private String inspX4;
    private String inspX5;
    private String inspX6;
    private String inspCd;
    private String inspCheck;
    private String inspCheckNm;

    private String cavityNo1;
    private String cavityNo2;
    private String cavityNo3;
    private String cavityNo4;
    private String cavityNo5;
    private String inspSourceNo;
    private String inspSourceSubNo;
    private String date;
    
}
