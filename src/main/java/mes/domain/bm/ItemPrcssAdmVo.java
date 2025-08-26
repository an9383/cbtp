package mes.domain.bm;

import lombok.Data;

@Data
public class ItemPrcssAdmVo {

	private String itemSeq;
	private String itemPrcssSeq;
	private String itemPrcssOrd;
	private String itemPrcssCd;
	private String itemPrcssNm;
	private String dealCorpCd;
	private String dealCorpNm;
	private String itemPrcssDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	//추가사항
	private String itemPrcssCdCheck;

}
