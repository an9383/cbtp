package mes.domain.io;

import lombok.Data;

@Data
public class PurchaseOrderAdmVo {

	//발주 ADM
	private String poNo;
	private String dealCorpCd;
	private String dealCorpNm;
	private String poDate;
	private String mainChargr;
	private String mainChargrNm;
	private String receiptGubun;
	private String receiptGubunNm;
	private String poDesc;
	private String boxCount;		//포장수량
	private String importYn;
	
	//발주 DTL
	private String poSeq;
	private String mrpNo;
	private String mrpSeq;
	private String itemSeq;
	private String itemCd;
	private String itemRev;
	private String itemNm;
	private String itemModel;
	private String itemModelNm;
	private String mainGubun;
	private String mainGubunNm;
	
	private String itemGubun;
	private String itemGubunNm;
	private String itemUnit;
	private String itemUnitNm;
	private String itemGrade;
	private String itemColor;
	private String inspectYn;
	private String ordQty;			//발주확정수량
	private String ordPredQty;		//발주예정수량
	private String addQty;
	private String ordUnitCost;
	private String ordAmt;
	private String dlvDate;
	private String dlvChangeDate;
	private String poStatus;
	private String poStatusNm;
	private String poEndDate;
	private String barcodeNo;
	private String lotNo;
	
	private String ordCorpCd;
	private String ordCorpNm;
	private String preInWhsQty;		//가입고량
	private String preInWhsDate; 	//가입고일
	private String inWhsDate;		//입고일
	private String inWhsQty; 		//입고량
	
	private String diffCnt;			//미입고량
	private String faultyQty;		
	private String pairQty;		
	private String inspectQty;	
	private String inspectDate;		//검사일
	private String inspectChargr;		
	private String inspectChargrNm;		
	private String inspectDesc;
	private String qaEval;
	private String qaEvalNm;
	private String approvalYn;
	private String approvalYnNm;
	private String unitCost; 		//단가

	
	private String savelocCd;		//저장위치
	private String savelocNm;		//저장위치명
	
	//발주DTL(발주서 출력 수정)부분 추가
	private String documentSubmitted; 		//제출서류
	private String paymentWay; 				//결제방법
	private String deliveryPlace; 			//납품장소
	private String reference; 				//참조
	private String runDate; 				//시행일자
	private String reception; 				//수신
	private String designation; 			//명칭
	private String title; 					//제목
	private String cooperationDepartment;	//협조부서
	private String purchaseHistory; 		//구매내역
	private String printWhether; 			//출력여부
	private String tmQty; 					//현재고
	private String dtlOrdCnt;
	private String faxNo;
	private String officeCharger;
	
	private String arrayData;
	private String poNoGubun;
	private String searchOption;
	
	private String value;

	private float preOrderQty;
	private float orderQty;
	private float unOrderQty;
	
	private String poStatusOption;	//발주상태 옵션
	private String approvalCd;
	private String statusCd;
	
	private String faultyPcs;
	private String faultyPcsNm;
	
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	private String startDate;
	private String endDate;
	private String today;
	
	//추가사항
	private String itemCus;
	
	private String areaCd;
	private String areaCdNm;
	private String floorNm;
	private String inSlipNo;
	private String inSlipDate;
	private String gubun;
	
	//수입검사결과조회화면 
	
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
    
    //추가사항
    private String locNo;
    private String locCd;
    private String locationNm;
    private String inspCd;
    private String inspCheck;
    private String inspCheckNm;
    private String preOrderQtyCost;
    private String orderQtyCost;
    private String unOrderQtyCost;
    private String cavityCnt;


}
