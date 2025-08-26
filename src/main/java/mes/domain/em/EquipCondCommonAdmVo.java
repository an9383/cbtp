package mes.domain.em;

import java.util.Date;
import lombok.Data;

@Data
public class EquipCondCommonAdmVo {

	private String menuAuth;        //메뉴권한	
	private String equipCondSeq;    //설비코드SEQ
	private String equipCd;         //설비코드
	private String goodsCd;         //제품코드
	private String condRegDate;     //조건등록일
	private String useYnCd;         //사용여부
	private String regId;           //등록자
	private Date regDate;           //등록일
	private String updId;           //수정자
	private Date updDate;           //수정일
	
	
	private String goodsNm;			// bm/goodsCodAdmVo와 join
	private String model;
	private String modelNo;
	private String alnicuMatrlCd;
	private String alnicuMatrlNm;	
	private String filmMatrlCd;
	private String filmMatrlNm;
	private String qutyCd;	
	private String qutyNm;	
	private String surfaceTrtmtCd;	
	private String surfaceTrtmtNm;		
	private String gubunNm;
	private String chamferYnNm;	
	private String gravity;
	private String dealCorpCd;
	private String dealCorpNm;	
	private String tmUnitCd;
	private String tmUnitNm;	
	private String packUnitCd;
	private String packUnitNm;	
	private String etc1;
	private String goodsDesc;
	private String useYnNm;	
	private String equipNm;

}