package mes.domain.bm;

import lombok.Data;

@Data
public class AttachDataVo {
	
	private String attachGubun;
	private String attachCd;
	private String attachSeq;
	private String contents;
	private String attachFn;
	private String attachPath;
	private String attachRegDate;
	private String etc1;
	private String etc2;
	private String etc3;
	private String etc4;
	private String etc5;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	//추가사항
	private String regNm;
	private String idCheck;
	private String etc1Nm;
	private String userNm;
	private String departmentNm;
	private String attachType;

}
