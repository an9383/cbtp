package mes.domain.bm;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CalendarVo {
	
	private String wk;
	private String su;
	private String mo;
	private String tu;
	private String we;
	private String th;
	private String fr;
	private String sa;
	
	private String searchMonth;
	
}