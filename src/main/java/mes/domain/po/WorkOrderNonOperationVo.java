package mes.domain.po;

import lombok.Data;

@Data
public class WorkOrderNonOperationVo {
	
	private String workOrdNo;
	private String workOrdSeq;
	private String minorPrcssCd;
	private String middlePrcssCd;
	private String noSeq;
	private String noGubun;
	private String noReason;
	private String noReasonNm;
	private String noStartDate;
	private String noStartTime;
	private String noEndDate;
	private String noEndTime;
	private String noTime;
	private String noDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private String startDate;
	private String endDate;
	
	private String workNonTime;
	
	private String workOrdDate;
	private String equipNm;
	private String itemCd;
	private String itemNm;
}
