package mes.domain.qm;

import lombok.Data;

@Data
public class ItemMoisMeasureAdmVo {

	private String workOrdNo;
	private String matrlDate;
	private String moisSeq;
	private String moisDate;
	private String moisTime;
	private String moisChargr;
	private String moisChargrNm;
	private String moisPass;
	private String moisPassNm;
	private String moisTemp;
	private String moisTempNm;
	
	private String moisDesc1;
	private String moisDesc2;
	
	private String equipCd;		    	
	private String equipNm;				
	private String mainWorkChargr;		
	private String mainWorkChargrNm;		
	private String itemSeq;		    	
	private String itemModel;			
	private String itemModelNm;		    
	private String itemCd;				
	private String itemNm;		   
	private String matrlGrade;
	private String matrlSeq;				
	private String matrlCd;		    	
	private String matrlNm;		
	private String matrlUnitNm;
	private String matrlQty;		
	private String inspCd;
	private String inspX1;	//수분함유량
	
	private String startDate;				
	private String endDate;
		
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	//추가사항
	private String itemUnit;
	private String itemUnitNm;
}
