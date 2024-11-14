package mes.domain.bs;

import lombok.Data;

@Data
public class DeliveryOrderAdmVo {

	private String doNo;
	private String contDtlNo;
	private String mainGubun;
	private String mainGubunNm;
	private String itemSeq;
	private String itemCd;
	private String itemNm;
	private String ordCorpCd;
	private String ordCorpNm;
	
	private String outCorpCd;
	private String outCorpNm;
	
	private String doDate;
	private String doQty;
	private String doChargr;
	private String dueDate;
	private String doStatus;
	private String doStatus2;
	private String doDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private String contNo;
	private String bizGubun;
	private String bizGubunNm;
	private String itemUnit;
	private String dtlOrdCnt;
	private String doChargrNm;
	private String doStatusNm;
	
	private String startDate;
	private String endDate;
	private String date;
	
	private String dpNo;
	private String barcodeNo;
	private String dpQty;
	private String dpDate;
	private String inspectDate;
	
	private String supplyPrice;
	private String vat;
	private String total;
	private String exportCost;
}
