package mes.domain.mm;

import lombok.Data;

@Data
public class WorkStatusVo {

	private String startDate;
	private String endDate;
	
	private String workDate;
	private String workTimeBtime;
	private String workTimeLtime;
	private String workTimeDesc;
	private String workPerBtime;
	private String workPerLtime;
	private String workPerDesc;
	private String workFairBtime;
	private String workFairLtime;
	private String workFairDesc;
}