package mes.domain.qm;

import lombok.Data;

@Data
public class ItemInspectAdmVo {

	private String inSlipNo;  //입고전표
	private String inSlipSeq; //입고전표시퀀스
	
	private String poNo;
	private Integer poSeq;
	private Integer inSeq;
	
	private String itemSeq;		       
	private String itemCd;				
	private String itemNm;
	private String mainGubun;
	private String itemModel;				
	private String itemUnit;		
	private String itemGubun;				
	
	
	private String partCd;
	private String partRev;
	private String inspectLvl;
	private String inspectCnt;
	private String pairCnt;
	private String faultyCnt;
	private String outputCnt;
	private String outputDate;
	private String inspectDate;
	private String inspectChargr;
	private String inspectChargrNm;
	private String qaEval;
	private String inspectDesc;
	private String matrlFileNm;		//재질성적서
	private String surfaceFileNm;	//표면처리성적서
	private String heatFileNm;		//열처리성적서
	private String productFileNm;	//품질보증서(COC)
	private String reportsFileNm;	//검사성적서
	
	private String preInWhsDate;
	private String dealCorpNm;
	private String partNm;
	private String partSpec;
	private String preInWhsQty;
	private String partUnit;
	private String receiptGubun;
	private String partGubun;
	private String statusCd;
	private String approvalCd;
	private String approvalYn; //승인여부 : 합격(001)/ 일부합격(002)/ 불합격(003)
	
	private String startDate;
	private String endDate;
	private String value;
	
	private String faultyRate;
	private String targetRate;
	private String achvRate;
	
	//불량유형관리 
	private String faultyTypeCd;	//불량유형코드
	private String faultyTypeSeq;
	private String faultyTypeNm;	//불량유형명
	private String faultyTypeQty;	//불량수량
	private String faultyTypeDate;	//불량등록일
	private String faultyTypeDesc;	//불량비고
	private String etc1;
	private String faultyTypeTotal;
	private String faultyTypeRate;
	
	private String qcObjYear;
	private String qcObjGubun;
	private String qcObjMon;
	private String qcObjDate;
	private String qcObjValue;
	
	private String objGubun;
	private String objYear;
	private String objMonth;
	
	private String spplyCorpCd;
	private String spplyCorpNm;
	
	//반품관리
	private String returnQty;
	private String returnDate;
	private String faultyChargrNm;
	
	private String barcodeNo;
	
	//추가사항
	private byte[] imageFile1;
	private byte[] imageFile2;
	private byte[] imageFile3;
	private byte[] imageFile4;
	private String imageFile1Nm;
	private String imageFile2Nm;
	private String imageFile3Nm;
	private String imageFile4Nm;
	private String inWhsQty;
	private String cavityCnt;
	
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

	
}
