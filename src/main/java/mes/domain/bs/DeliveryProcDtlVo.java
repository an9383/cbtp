package mes.domain.bs;

import lombok.Data;

@Data
public class DeliveryProcDtlVo {

	private String dpNo; 	
	private String doNo; 	
	private String dpQty; 	
	private String dpDate; 	
	private String dpDesc; 	
	private String barcodeNo;
	private String outCorpCd;
	private String outCorpNm;
	private String itemSeq; 	
	private String itemCd; 	
	private String itemNm; 	
	private String itemGubun;
	private String itemGubunNm;
	private String regId;	
	private String regDate;	
	private String updId;	
	private String updDate;	
	private String startDate;
	private String endDate;
	
	private String contDtlNo;
	private String date;
	
	private String spNo;
	private String locationCd;
	private String locationNo;
	private String[] dpNoArr;
	private int[] dpQtyArr;
}
