package mes.domain.io;

import lombok.Data;

@Data
public class OutsourcingDtlVo {
	
	private String outsrcNo;
	private Integer outsrcSeq;
	private Integer outsrcDtlQty;
	private Integer outsrcRemainQty;
	private String outsrcDtlDate;
	private String outsrcCorpCd;
	private String outsrcChargr;
	private String outsrcDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

}
