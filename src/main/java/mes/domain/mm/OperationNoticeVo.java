package mes.domain.mm;

import lombok.Data;

@Data
public class OperationNoticeVo {

	private String startDate;
	private String endDate;
	
	private String idx;
	private String type;
	private String gubun;
	private String origin;
	private String originPrcss;
	private String originContents;
	private String originAction;
	private String noticeStartDate;
	private String noticeEndDate;
	private String manager;
	private String manageNumber;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
}