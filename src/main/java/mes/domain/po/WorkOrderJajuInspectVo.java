package mes.domain.po;

import lombok.Data;

@Data
public class WorkOrderJajuInspectVo {
	
	private String workOrdNo;
	private String workOrdSeq;
	private String minorPrcssCd;
	private String middlePrcssCd;
	private int jajuSeq;
	private String jajuDesc;
	private String jajuRegDate;
	private String itemNm;
	private String itemCont;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
}
