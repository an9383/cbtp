package mes.domain.bs;

import lombok.Data;


@Data
public class CustSatisAdmVo {
	private int satisNo;
	private String customer;
	private String callNum;
	private String faxNum;
	private String model;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	private String userNm;
	private String startDate;
	private String endDate;
	private int satisSeq;
}
