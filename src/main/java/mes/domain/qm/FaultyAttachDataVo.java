package mes.domain.qm;

import lombok.Data;

@Data
public class FaultyAttachDataVo {

	private String attachGubun;		//자료구분
	private String attachCd;		//자료코드
	private String sourceNo;		//원천번호
	private String attachContent;	//내용
	private String attachFn;		//첨부파일명
	private String attachPath;		//첨부패서
	private String attachRegDate;	//첨부등록일
	private String regId;			//등록자
	private String regNm;			//등록자명
	private String regDate;			//등록일
	private String updId;			//수정자
	private String updDate;			//수정일
	private String index;

}
