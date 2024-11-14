package mes.domain.po;

import java.util.Date;
import lombok.Data;

@Data
public class WorkOrderPlanVo {
	
	private String menuAuth;              //메뉴권한
	private String workOrdNo;
	private String prcssCd;
	private String prcssNm;
	private String equipCd;
	private String equipNm;
	private String goodsCd;
	private String goodsNm;
	private String goodsNo;
	private String workOrdPrcss;
	private String autoKind;
	private String autoKindNm;
	private String ordLotNo;
	private String ordPlanNo;
	private String ordPlanDate;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

}
