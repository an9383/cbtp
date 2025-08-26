package mes.domain.po;

import java.util.Date;
import lombok.Data;

@Data
public class WorkOrderResultVo {
	
	private String menuAuth;              //메뉴권한
	private String workOrdNo;
	private String prcssCd;
	private String prcssNm;
	private String prcssGubun;
	private String prcssGubunNm;
	private String equipCd;
	private String equipNm;
	private String goodsCd;
	private String goodsNm;
	private String goodsNo;
	private String workOrdPrcss;
	private String autoKind;
	private String autoKindNm;
	private String ordLotNo;
	private String workOrdPlanNo;
	private String ordDate;
	private String workStartTime;
	private String workEndTime;
	private String workStatus;
	private String workChargr;
	private String targetCnt;
	private String outputCnt;
	private String fairCnt;
	private String faultyCnt;
	private String sitaCnt;
	private String etcCnt;
	private String dealCorpCd;
	private String dealCorpNm;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private String selStartDate;
	private String selEndDate;

}
