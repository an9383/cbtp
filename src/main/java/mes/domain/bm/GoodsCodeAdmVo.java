package mes.domain.bm;

import java.util.Date;
import lombok.Data;

@Data
public class GoodsCodeAdmVo {

	private String menuAuth;              //메뉴권한
	private String goodsCd;
	private String goodsNm;
	private String dealCorpCd;
	private String dealCorpNm;
	private String autoKind;
	private String autoKindNm;
	private String goodsNo;
	private String matrlCd;
	private String matrlNm;
	private String goodsThickness;
	private String goodsCutWidth;
	private String goodsPitch;
	private String goodsGravity;
	private String tmUnit;
	private String tmUnitNm;
	private String packUnit;
	private String useYn;
	private String useYnNm;
	private String goodsDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

	
}