package mes.domain.po;

import lombok.Data;

@Data
public class GoodsProductInfoAdmVo {
	
	private String menuAuth;              //메뉴권한
	private String boxNo;
	private String tmpBoxNo;	
	private String goodsCd;
	private String goodsNm;	
	private String ordGubun;
	private String ordGubunNm;	
	private int packCnt;
	private String packDate;
	private String locationCd;
	private String goodsInDate;
	private String poNo;
	private String goodsStatus;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	private int boxSeq;
	private String workOrdNo;
	private int packDtlCnt;	
	private String packYn;		
	
}
