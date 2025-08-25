package mes.domain.io;

import lombok.Data;

@Data
public class InsourcingDtlVo {

	private String outsrcNo;
	private Integer insrcSeq;
	private Integer insrcDtlQty;
	private Integer insrcRemainQty;
	private String insrcDtlDate;
	private String insrcCorpCd;
	private String insrcChargr;
	private String insrcDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
}
