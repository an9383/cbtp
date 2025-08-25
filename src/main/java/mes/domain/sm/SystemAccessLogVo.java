package mes.domain.sm;

import lombok.Data;
import mes.domain.sm.SystemAccessLogVo;

@Data
public class SystemAccessLogVo {
	
	private String userNumber;
	private String userId;
	private String userNm;
	private String departmentCd;
	private String menuId;
	private String menuPath;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	private String departmentNm;
	private String ipAddr;	//ip주소
	
	private String startDate;
	private String endDate;
	
	//추가
	private String menuNm;
	private String LastDate;
	private String postNm;
	private String changeHis;
	private String menuDtlNm;

	
}
