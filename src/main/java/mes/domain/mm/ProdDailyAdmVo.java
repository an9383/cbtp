package mes.domain.mm;

import lombok.Data;

@Data
public class ProdDailyAdmVo {

	private String prodGubun;		//생산일보구분
	private String personalGubun; 	//공수인원구분
	private String prodDate;		//생산일보일자
	private String prodYear;		//생산일보일자
	private String prodMon;			//월
	private String preYear;			//전년
	
	
	private String userNumber;		//사번
	private String userNm;			//사원명
	private String prodCd;			//공정코드
	private String prodNm;			//공정명
	private String prodData;		//공수DATA(분)

	//공수관리TABLE
	private String mhGubun;			//공수구분
	private String mhCd;			//공수코드
	private String mhNm;			//공수명
	private String mhInitial;		//공수이니셜(C,S,M..)
	private String totalUser;		//소형 보유인원
	private String totalUser2;		//중형 보유인원
	private String nowUser;			//현재인원
	
	//공정관리TABLE
	private String itemCd;			//제품코드
	private String itemRev;			//제품rev
	private String itemNm;			//제품명
	private String prcssCd;			//소공정코드
	private String prcssNm;			//소공정명
	private String workOrdQty;		//지시수량
	private String outputQty;		//작업수량	
	private String faultyQty;		//불량수량
	private String sumTime;			//투입시간
	private String ppm;				//PPM
		
	private String mh01;
	private String mh02;
	private String mh03;
	private String mh04;
	private String mh05;
	private String mh06;
	private String mh07;
	private String mh08;
	private String mh09;
	private String mh10;
	private String mh11;
	private String mh12;
	private String mh13;
	private String mh14;
	private String mh15;
	private String mh16;
	private String mh17;
	private String mh18;
	private String mh19;
	private String mh20;
	private String mh21;
	private String mh22;
	private String mh23;
	private String mh24;
	private String mh25;
	private String mh26;
	private String mh27;
	private String mh28;
	private String mh29;
	private String mh30;
	
	
	//통계
	private String mhValue1;
	private String mhValue2;
	private String mhValue3;
	private String mhValue4;
	private String mhValue5;
	private String mhValue6;
	private String mhValue7;
	private String mhValue8;
	private String mhValue9;
	private String mhValue10;
	private String mhValue11;
	private String mhValue12;
	
	//공수월별
	private String m01;
	private String m02;
	private String m03;
	private String m04;
	private String m05;
	private String m06;
	private String m07;
	private String m08;
	private String m09;
	private String m10;
	private String m11;
	private String m12;
	
	
	//공수일별
	private String d01;
	private String d02;
	private String d03;
	private String d04;
	private String d05;
	private String d06;
	private String d07;
	private String d08;
	private String d09;
	private String d10;
	private String d11;
	private String d12;
	private String d13;
	private String d14;
	private String d15;
	private String d16;
	private String d17;
	private String d18;
	private String d19;
	private String d20;
	private String d21;
	private String d22;
	private String d23;
	private String d24;
	private String d25;
	private String d26;
	private String d27;
	private String d28;
	private String d29;
	private String d30;
	private String d31;
	
	//주요 업무 및 이슈
	private String issueDate;		//이슈등록일자
	private String issueContents;	//이슈내용
	
	private String startDate;		//시작일
	private String endDate;			//종료일
	
	private String regId;			//등록자
	private String regDate;			//등록일
	private String updId;			//수정자
	private String updDate;			//수정일
	
	//추가항목
	private String itemGubun;		//구분
	private String doNo;

}



