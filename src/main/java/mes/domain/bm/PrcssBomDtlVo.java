package mes.domain.bm;

import lombok.Data;

@Data
public class PrcssBomDtlVo {

	private String bomCd;			//BOM코드
	private Integer prcssSeq;		//공정시퀀스
	private String prcssCd;			//공정코드
	private String prcssNm;			//공정코드명
	private String prcssInitial;	//이니셜
	private String prcssGubun; 		//공정구분
	private String equipCd;			//설비코드
	private String equipNm;			//설비코드명
	private String osrcCorpCd;		//외주처
	private String osrcCorpNm;		//외주처명
	private String prcssDesc;			//등록자
	private String regId;			//등록자
	private String regDate;			//등록일
	private String updId;			//수정자
	private String updDate;			//수정일

}
