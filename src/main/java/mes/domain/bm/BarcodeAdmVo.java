package mes.domain.bm;

import lombok.Data;

@Data
public class BarcodeAdmVo {
	private String poNo;
	private Integer poSeq;
	private Integer inSeq;
	private String lotNo;
	private String barcodeNo;
	private String partCd;
	private String partRev;
	private String partNm;
	private String partSpec;
	private String partUnit;
	private String partGubun;
	private String locationCd;
	private String locationNm;
	private String preInWhsDate;
	private String inWhsDate;
	private String preOutWhsDate;
	private Integer inWhsQty;
	private Integer preInWhsQty;
	private Integer preOutQty;
	
	private String itemCd;
	private String itemRev;
	private String itemGubun;
	private String itemNm;
	private String serialNo;
	private String inDate;
	private String outDate;
	private Integer inQty;
	private Integer outQty;
	private String inLoc;
	private Integer dtlOrdQty;
	
	private String startDate;
	private String endDate;
	
	//추가사항
	private String spNo;
	private String spSeq;
	private String spType;
	private String spCd;
	private String spGubun;
	private String spDate;
	private String spQty;
	private String sourceNo;
	private String areaCd;
	private String floorCd;
	private String locationNo;
	private String spDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	private String itemGubunNm;
	private String mainGubunNm;
	private String aQty;
	private String bQty;
	private String cQty;
	private String dQty;
	private String itemModelNm;
	private String mainGubun;

	private String areaCdNm;
	private String dealCorpNm;
	private String floorNm;
	
	private String workChargrNm;


}
