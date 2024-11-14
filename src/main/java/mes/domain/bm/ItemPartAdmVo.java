package mes.domain.bm;

import lombok.Data;

@Data
public class ItemPartAdmVo {

	private String itemSeq;
	private String mainGubun;
	private String mainGubunNm;
	private String itemCd;
	private String itemRev;
	private String itemGubun;
	private String itemCus;
	private String accCd;
	private String itemNm;
	private String itemModel;
	private String itemSpec;
	private String itemType;
	private String itemMaker;
	private String exportCd;
	private String itemGenre;
	private String importYn;
	private String stateCd;
	private String itemColor;
	private String locationCd;
	private String locationNm;
	private String moldCd;
	private String savelocCd;
	private String savelocCdNm;
	private String locNo;
	private String itemWorkplace;
	private String itemWorkplaceNm;
	private String safetyStock;
	private String payMethodCd;
	private String moldOne;
	private String useYnOne;
	private String moldTwo;
	private String useYnTwo;
	private String moldThree;
	private String useYnThree;
	private String importCost;
	private String importDate;
	private String exportCost;
	private String exportDate;
	private String lhrhCd;
	private String paleBox;
	private String boxCount;
	private String itemJustGubun;
	private String itemFifoGubun;
	private String useYn;
	private String itemTransDate;
	private String itemUnit;
	private String itemUnitNm;
	private String itemGrade;
	private String itemCel;
	private String itemHr;
	private String itemPower;
	private String itemTemp;
	private String itemSeal;
	private String itemPress;
	private String itemDesc;
	private String workDesc;
	private String readyTime;
	private String processTime;
	private String hallCount;
	private String fillingCount;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	//추가사항
	private String itemAttachSeq;
	private String contents;
	private String fileNm;
	
	private String itemCostSeq;
	private String changeDate;
	private String itemReason;
	
	private String regNm;
	private String itemTypeNm;
	private String itemModelNm;
	private String itemGubunNm;
	private String lhrhCdNm;
	private String itemGubunFive;
	private String stateCdNm;
	private String itemGubunFour;
	private String itemGubunThree;
	private String equipNo;
	private String equipNm;
	private String equipCavity;
	private String mfcCorpCd;
	private String mfcDate;
	private String itemCusNm;
	private String accCdNm;
	private String tmQty;
	
	private String bomCd;
	private String ecoCd;
	private String devCost;
	private String confirCost;
	private String devStep;
	private String startDate;
	private String endDate;
	private String complDate;
	private String bomCheck;
	
	private String areaCd;
	private String areaNm;
	private String floorNm;
	private String locCd;
	
	//개발관리
	private String lowerItemSeq;
	private String lowerItemNm;
	private String upperItemSeq;
	private String upperItemCd;
	private String upperItemNm;
	
	private String itemPowerMax;
	private String itemPowerMin;
	private String itemTempMax;
	private String itemTempMin;
	private String itemPressMax;
	private String itemPressMin;
	private String itemTimeMax;
	private String itemTimeMin;
	
	private String itemConsumpt;
	private String prcssCd;
	private String prcssNm;
	private String ebomDesc;
	private String sSort;
	private String seqCon;
	private String itemLvl;
	private String bomYn;
	
	//추가사항
	private String inspGubun;
	private byte[] imageFile1;
	private byte[] imageFile2;
	private byte[] imageFile3;
	private byte[] imageFile4;
	private String imageFile1Nm;
	private String imageFile2Nm;
	private String imageFile3Nm;
	private String imageFile4Nm;
	private String value;
	private String smallPackage;
	private String upperAmtCel;
	private String upperAmtHr;
	private String lowerAmtCel;
	private String lowerAmtHr;
	
	
	//스페어 관리
	private String spaBarcode;
	private String spaSpec;
	private String spaSafyStock;
	private String spaEquip;
	private String spaWhse;
	
	//중량
	private String fillingWt;
	private String prodWt;
	private String srWt;
	private String shotWt;

	
	//원단위 관리
	private String mon;	//월
	private String inQty;		//입고량
	private String inCost;		//입고금액
	private String outputQty;		//생산량
	private String convOutputQty;		//생산량
	private String outputCost;	//생산금액
	private String convFaultyQty;	//불량량
	private String faultyQty;	//불량량
	private String initFaultyQty; //초기허용불량
	private String faultyCost;	//불량금액
	private String frHistCnt;	//로스량
	private String frHistCost;	//로스금액
	
	private String itemInfo; //원재료 품번/품명 키인

	private String[] itemGubunList;
	private String[] itemSeqList;
	private String menuPath;	//메뉴경로
	
	private String prodGubun;
	
	private String cutSize;		//커팅사이즈
	private String laserWorkNo;
}
