package mes.domain.bm;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class PlanStopVo {
	
	private String stopDate;
	private String stopSequence;
	private String stopType;
	private String equipCd;
	private String timeCode;
	private String startTime;
	private String endTime;
	private String stopTime;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	private String sumTime;
	private String timeChangeYn;
	private String searchMonth;
	
	private String startDate;
	private String endDate;
	private String timeCodeNm;
	private String startDatetime;
	private String endDatetime;
}