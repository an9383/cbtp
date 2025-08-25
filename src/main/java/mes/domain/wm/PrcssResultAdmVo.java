package mes.domain.wm;

import lombok.Data;

@Data
public class PrcssResultAdmVo {
	
	private String workProgNo;
	private String prcssCd;
	private String userNumber;
	private String resultQty;
	private String writeDate;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	//추가사항
	private String prcssNm;
	private String userNm;

	
}
