package mes.domain.wm;

import lombok.Data;

@Data
public class ItemWhsAdmVo {

	private String barcodeNo;
	private String workOrdNo;
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
	private String inDate;
	private int inQty;
	private String outDate;
	private int outQty;
	private int remainQty;
	
	private String exportCost;	 //출고단가(출고단가적용일 기준)
	private String supplyPrice;  //공급가액(출고량*출고단가)
	private String vat; 		 //부가세(공급가액*0.1)
	private String total; 		 //합계(공급가액+부가세)
	
	private String itemCus;	 
	private String itemCusNm;  
	private String lhrhCd; 		
	private String lhrhNm;  
	private String itemColor; 		
	
	
	private String inChargr;
	private String inChargrNm;
	private String inLoc;
	private String inLocNm;
	private String inArea;
	private String inAreaNm;
	private String inFloor;
	private String inFloorNm;
	private String locationCd;
	private String locationNm;
	private String locationNo;
	private String serialNo;
	private String itemCapa;
	private String pairQty;
	private String diffQty;
	private String inspectDate;
	private String completeStatusCd;
	private String completeStatusNm;
	private String judgment;
	private String judgmentNm;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private String startDate;
	private String endDate;

	//추가사항
	private String ordCorpCd;
	private String ordCorpNm;
	private String outCorpCd;
	private String outCorpNm;
	private String contNo;
	private String contDtlNo;
	private String bizGubun;
	private String bizGubunNm;
	private String doNo;
	private String doDate;
	private String doQty;
	private String doChargr;
	private String doChargrNm;
	private String doStatus;
	private String doStatusNm;
	private String doDesc;
	private String dtlOrdCnt;
	private String dpNo;
	private String dpQty;
	private String dpDate;
	private String dpDesc;
	private String spNo;
	private String locCd;
	private String locNm;
	private String locNo;
	private String areaCd;
	private String areaNm;
}
