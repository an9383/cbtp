package mes.domain.cm;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;


@Data
public class CommonVo {

	

	private String startDate;
	private String endDate;
	private int month1;
	private String monthStr;
	private String prjCd;
	private String monthPivotStr;
    private List<String> dateList = new ArrayList<String>();

	
	
	
}
