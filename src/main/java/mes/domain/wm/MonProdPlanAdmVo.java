package mes.domain.wm;

import lombok.Data;

@Data
public class MonProdPlanAdmVo {

	private String prodYear;
	private String prodMon;
	private String itemSeq;
	private String itemCd;
	private String itemNm;
	private String itemModel;
	private String itemGenre;
	private String itemType;
	private String itemWorkplace;
	private String itemWorkplaceNm;
	private String accCd;
	private String accNm;
	
	private String exportCost;
	private String unitCost;
	
	private String safyStockQty;
	private String initStockQty;
	private String salesOrderQty;
	private String prodTotalQty;
	private String endStockQty;

	private String safyStockAmt;
	private String initStockAmt;
	private String salesOrderAmt;
	private String prodTotalAmt;
	private String endStockAmt;
	private String confirmYn;
	private String confirmYnNm;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	//추가사항
	private String mainGubun;
	private String mainGubunNm;
	private String itemCus;
	private String itemCusNm;

	
}
