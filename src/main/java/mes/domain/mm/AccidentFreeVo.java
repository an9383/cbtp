package mes.domain.mm;

import lombok.Data;

@Data
public class AccidentFreeVo {

	private String startDate;
	private String endDate;
	
	private String number;
	private String targetDate;
	private String accidentStartDate;
	private String accidentEndDate;
	private String mainGubun;
}