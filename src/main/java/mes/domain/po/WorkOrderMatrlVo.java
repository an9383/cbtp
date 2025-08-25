package mes.domain.po;

import lombok.Data;

@Data
public class WorkOrderMatrlVo {
	
	private String menuAuth;              //메뉴권한
	private String workOrdNo;
	private String workOrdSeq;
	private String minorPrcssCd;
	private String middlePrcssCd;
	private String minorPrcssNm;
	private String middlePrcssNm;
	private String workProgNo;
	
	private String itemSeq;
	private String itemGubun;
	private String itemCd;
	private String itemNm;
	private String itemColor;
	private String itemModel;
	private String itemModelNm;
	
	private String itemCel;		//건조기준
	private String itemHr;		//건조기준
	private String upperAmtCel;
	private String lowerAmtCel;	
	private String upperAmtHr;
	private String lowerAmtHr;	
	
	private String matrlCel;	//건조조건
	private String matrlHr;		//건조조건
	private String moisPass;	//수분측정
	private String moisPassNm;	//수분측정
	
	private String locationCd;
	private String locationNm;
	private String areaCd;
	private String areaNm;		
	private String floorCd;		
	private String floorNm;		
	private String locationNo;
	
	
	private Float partConsumpt;
	private Float totalConsumpt;
	private String useQty;
	private String matrlDate;	//투입일자
	private String barcodeNo;

	private String itemRev;
	private String partCd;
	private String partNm;
	private String partGubun;
	private String partGubunNm;
	private String partUnit;
	private String partUnitNm;
	private String partRev;
	private String totalConsumptSum;
	private String prcssCd;
	private String realQty;
	
	private String inWhsDate;
	private String inWhsQty;
	private String areaCdNm;
	private String spQty;
	private String inspectDate;
	private String doDtlDate;
	private String outputDtlQty;
	private String ordLotNo;
	
	private String prcssSeq;
	private String prevPrcssSeq;
	private String prevMiddlePrcssCd;
	private String prevLowerPrcssCd;
	private String nextPrcssSeq;
	private String nextMiddlePrcssCd;
	private String nextLowerPrcssCd;
	
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	//추가사항
	private String locCdNm;
	
}
