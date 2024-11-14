package mes.domain.bs;

import lombok.Data;

@Data
public class BizOrderConsumptVo {

	private String mrpNo;
	private String mrpSeq;
	private String itemSeq;
	private String itemCd;
	private String itemNm;
	private String reqQty;
	private String tmQty;
	private String unuseQty;
	private String availStock;
	private String purPredQty;
	private String originOrdQty;
	private String ordPredQty;
	private String stockUseYn;
	private String ordCorpCd;
	private String ordCorpNm;
	private String[] itemSeqArray;	
	private String salesYear;	
	private String salesMon;	
	
	
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	//추가사항
	private String reloadCheck;
	private String deleteCheck;
	private String itemModel;
	private String itemModelNm;
	private String itemCus;
	private String itemCusNm;
	private String showReqQty;
	private String itemGubun;
	private String monPlanQty;
	private String prodGubun;
	
}
