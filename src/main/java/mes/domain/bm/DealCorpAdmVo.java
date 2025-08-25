package mes.domain.bm;

import lombok.Data;

@Data
public class DealCorpAdmVo {

	private String menuAuth;			//메뉴권한
	private String dealCorpCd;			//거래처코드
	private String dealCorpNm;			//거래처명
	private String initial;				//이니셜
	private String presidentNm;			//대표자명
	private String country;				//국가명
	private String corpNo;				//사업자번호
	private String registNo;			//법인주민번호		
	private String bizCond;				//업태
	private String bizType;				//업종
	private String addrNo;				//우편번호
	private String addrBase;			//주소
	private String addrDtl;				//주소상세
	private String companyGubun;		//회사구분
	private String telNo;				//전화번호
	private String faxNo;				//팩스번호
	private String emailAddr;			//메일
	private String tax;					//과세
	private String officeCharger;		//업무담당
	private String bizCharger;			//영업담당
	private String dealGubun;			//거래구분
	private String useYn;				//사용여부
	private String dealCorpDesc;		//비고
	private String visitSeq;          	//시퀀스
	private String fileNm;              //파일명
	private String visitDate;           //파일명
	private String visitContent;        //내용
	private String regId;				//등록자
	private String regNm;				//등록자
	private String regDate;				//등록일
	private String updId;				//수정자			
	private String updDate;				//수정일
	private String url;

	private int start;
	private int length;
	private int totalCount;	
	private String searchVal;
	private String ordDir;
	private String ordColumn;
	private String[] dealArr;
	
	//추가
	private String repreItem;
	private String dealGubunNm;
	private String dealHomepage;
	private String taxEmail;
	private String orderByDcn;
	
}