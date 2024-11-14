package mes.domain.qm;

import lombok.Data;

@Data
public class MonPriManageAdmVo {

	private String monPriNo;	//중점관리 번호
	private String monPriType;	//중점관리 구분
	private String monPriCont;	//중점관리 내용
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

	
}
