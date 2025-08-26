package mes.domain.bm;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Data
public class SystemCommonCodeVo {
	
	private String menuAuth;        //메뉴권한
	private String baseCd;          //기초코드
	private String baseNm;       	//기초코드명
	private String baseAbbr;     	//기초코드약어명
	private String baseGroupCd;		//기초그룹코드
	private String baseDesc;     	//기초코드상세
	private String etc1;            //기초코드기타1
	private String etc2;            //기초코드기타2
	private String etc3;            //기초코드기타3
	private String etc4;            //기초코드기타4
	private String etc5;            //기초코드기타5
	private String useYn;       	//사용여부
	private String useYnNm;         //사용여부명
	private String regId;           //등록자
	private Date regDate;           //등록일
	private String updId;           //수정자
	private Date updDate;           //수정일

}
