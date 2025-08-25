package mes.domain.io;

import lombok.Data;

@Data
public class PurchaseOrderReturnVo {

	private String retnNo;			
	private String unfitResultNo;	
	private String itemSeq;		    
	private String itemCd;		    
	private String itemNm;		    
	private String itemGubun;		
	private String itemGubunNm;		
	private String returnQty;		
	private String returnDate;		
	private String returnChargr;		
	private String returnChargrNm;	
	private String approvalYn;		
	private String approvalYnNm;		
	private String returnDesc;		
	private String dealCorpCd;		
	private String dealCorpNm;		
	private String startDate;		
	private String endDate;			
	private String regId;			
	private String regDate;			
	private String updId;			
	private String updDate;		
	
	private String date;
	private String unfitNo;	
	private String mainGubun;
	
	private String unfitFaultyDate;
	private String unfitFaultyChargr;	
	private String unfitFaultyChargrNm;
	private String unfitLot;
	
	private String faultyDtl;
	private String faultyQty;
	
}
