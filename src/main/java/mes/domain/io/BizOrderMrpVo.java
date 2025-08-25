package mes.domain.io;

import lombok.Data;

@Data
public class BizOrderMrpVo {

	private String mrpNo;
	private Integer mrpSeq;
	private String mainGubun;
	private String confirmYn;
	private String confirmYnNm;
	private String mrpChargr;
	private String mrpChargrNm;
	private String mrpYear;
	private String mrpMon;
	private String mrpDate;
	private String mrpDesc;
	private String regId;
	private String regDate;
	private String startDate;
	private String endDate;
	private String date;
}
