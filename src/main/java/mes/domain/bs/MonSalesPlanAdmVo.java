package mes.domain.bs;

import lombok.Data;

@Data
public class MonSalesPlanAdmVo {

	private String salesYear;
	private String salesMon;
	private String itemSeq;
	private String itemCd;
	private String itemNm;
	private String accCd;
	private String accNm;
	private String itemModel;
	private String itemGubun;
	private String itemGubunNm;
	
	private String itemModelNm;

	private String salesAvgQty;
	private String salesTmQty;
	private String salesPlanQty;
	private String confirmYn;
	private String confirmYnNm;
	
	private String m3;
	private String m2;
	private String m1;
	
	private String tmQty;
	
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	//추가사항
	private String itemCus;
	private String itemCusNm;
	private String mainGubun;
	private String mainGubunNm;
	
}
