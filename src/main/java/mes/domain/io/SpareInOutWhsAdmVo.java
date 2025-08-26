package mes.domain.io;

import lombok.Data;

@Data
public class SpareInOutWhsAdmVo {

	private String spaIoNo;
	private String spaIoSeq;
	private String itemSeq;
	private String itemNm;
	
	private String mainGubun;
	private String spaWhse;	
	private String spaBarcode;
	private String spaSpec;	
	private String spaSafyStock;
	private String spaEquip;		
	
	
	private String itemCus;
	private String barcodeNo;
	private String spaIoGubun;
	private String spaIoDate;
	private String spaIoQty;
	private String realQty;
	private String spaIoDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private String startDate;
	private String endDate;
	private String today;

}
