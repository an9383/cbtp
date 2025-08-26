package mes.domain.sm;

import lombok.Data;

@Data
public class MenuAuthVo {
	private String menuId;
	private String departmentCd;
	private String departmentNm;
	private String userNumber;
	private String gradeCd;
	private String gradeNm;
	private String useYnCd;
	private String useYnNm;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	private int cnt;

	private String mainGubun;
}
