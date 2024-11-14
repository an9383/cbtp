package mes.domain.bm;

import lombok.Data;

@Data
public class PrcssBomAdmVo {
	
	private String bomCd;
	private String itemSeq;
	private String itemNm;
	private String ecoCd;
	private String itemMaker;
	private String itemCus;
	
	private String devCost;
	private String confirCost;
	private String startDate;
	private String complDate;
	private String devStep;
	private String devStepNm;
	private String bomDesc;
	
	private String etc1;
	private String etc2;
	private String useYn;
	
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	//개발관리 - 공정매칭
	private String masterPrcssCd;
	private String subPrcssCd;
	private String bomSeq;
	
	//개발관리 - BOM
	private String itemConsumpt;
	
	//추가사항
	private String itemCd;
	private String itemModelNm;
	private String itemGubunNm;
	private String itemUnit;
	private String masterPrcssCdNm;
	private String subPrcssCdNm;
	
}
