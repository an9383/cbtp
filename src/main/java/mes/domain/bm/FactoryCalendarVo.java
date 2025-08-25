package mes.domain.bm;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class FactoryCalendarVo {
	
	private String startDate;
	private String endDate;
	
	private String factoryDate;
	private String factoryType;
	private String timeCode;
	private String timeName;
	private String startTime;
	private String endTime;
	private String runningTime;
	private String breakTime;
	
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private String holiday;
	private String weekend;
	private String searchMonth;
	
}