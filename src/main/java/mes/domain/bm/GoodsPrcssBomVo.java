package mes.domain.bm;

import java.util.Date;
import lombok.Data;

@Data
public class GoodsPrcssBomVo {

	private String menuAuth;              //메뉴권한
	private String prcssSeq;
	private String goodsCd;
	private String prcssCd;
	private String prcssNm;
	private String prcssGubun;
	private String prcssGubunNm;
	private String equipCd;
	private String equipNm;
	private String outsrcingCorpCd;
	private String outsrcingCorpNm;
	private String prcssDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
}