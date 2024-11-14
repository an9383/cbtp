package mes.domain.cm;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class LoginVo{
	
	private String loginNo;		// 로그인 번호
	private String userId;		// 사용자명
	private String logDate;		// 로그인 시각
	private String userNm;		// 사용자명
	private String ipAddress;	// ip주소
	private String logGubun;	// 로그인 구분
	private String logEtc;		// 기타
	private String date;		// 시퀀스 생성 일자
}
