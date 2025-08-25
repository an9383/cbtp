package mes.domain.bm;

import lombok.Data;

@Data
public class LocationAdmVo {

	private String locNo;		
	private String mainGubun;	
	private String mainGubunNm;	
	private String locCd;		
	private String locNm;	
	private String areaCd;		
	private String areaNm;		
	private String floorCd;		
	private String floorNm;	
	private String locDesc;		
	private String useYn;		
	private String useYnNm;		
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	private String url;
	
	//추가사항
	private String[] locCdList;
}
