package mes.domain.bm;

import lombok.Data;

@Data
public class CorrDataListVo {
	private String mitCd;
	private String corrSeq;
	private String corrGubun;
	private String corrDate;
	private String corrWillDate;
	private String corrNo;
	private String attachFn;
	private String attachPath;
	private String attachRegDate;
	private String regId;
	private String regNm;
	private String regDate;
	private String updId;
	private String updDate;
	
	//추가사항
	private String corrYear;
	private String corrDateVal;
	private String corrDateCheck;
}
