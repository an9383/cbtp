package mes.domain.bm;

import lombok.Data;

@Data
public class InspAdmVo {
	//검사항목 관리
	private String inspCd;				//검사항목코드
	private String inspGubun;			//검사항목구분
	private String itemSeq;				//품목시퀀스

	
	private String seqCheck;		
	private String mainGubun;			
	private String itemCd;				
	private String itemCus;		
	private String itemCusNm;			
	private String itemNm;				
	private String stateCd;	
	
	private String inspDesc1;
	private String inspDesc2;
	private String inspDesc3;
	private String inspDesc4;
	
	
	
	//검사항목 상세
	private String inspType;			//검사항목 유형
	private String inspSeq;				//검사항목 시퀀스
	private String inspList;			//검사항목 목록
	private String inspStandUpper;		//검사항목 기준(상한)
	private String inspStandLower;		//검사항목 기준(하한)
	private String inspPlanDate;		//일정일자
	private String inspPlan;			//계획
	private String inspReport;			//실적
	private String inspInputMethod;		//입력방식
	private String inspCheck;			//확인방법
	private String inspSpc; 			//특별특성
	private String inspOrder; 			//검사항목 순서
	private String inspStandGubun;		//검사항목 기준구분(전체,상한,하한)
	
	//검사항목 결과
	private String inspResultGubun;		//구분
	private String inspSourceNo;		//연계번호
	private String inspSourceSubNo;		//연계서브번호
	
	private String poNo;				//발주번호	
	private String poSeq;				//발주시퀀스
	private String inSeq;				//가입고시퀀스
	private String inspResult;			//검사결과(판정,실행여부)
	private String inspX1;				//검사결과(수치,숫자)1
	private String inspX2;				//검사결과(수치,숫자)2
	private String inspX3;				//검사결과(수치,숫자)3
	private String inspX4;				//검사결과(수치,숫자)4
	private String inspX5;				//검사결과(수치,숫자)5
	private String inspX6;				//검사결과(수치,숫자)6
	private String inspX7;				//검사결과(수치,숫자)7
	private String inspX8;				//검사결과(수치,숫자)8
	private String inspX9;				//검사결과(수치,숫자)9
	private String inspX10;				//검사결과(수치,숫자)10
	private String inspX11;				//검사결과(수치,숫자)11
	private String inspX12;				//검사결과(수치,숫자)12
	private String inspX13;				//검사결과(수치,숫자)13
	private String inspX14;				//검사결과(수치,숫자)14
	private String inspX15;				//검사결과(수치,숫자)15
	private String inspX16;				//검사결과(수치,숫자)16
	private String inspX17;				//검사결과(수치,숫자)17
	private String inspX18;				//검사결과(수치,숫자)18
	private String inspX19;				//검사결과(수치,숫자)19
	private String inspX20;				//검사결과(수치,숫자)20
	private String inspX21;				//검사결과(수치,숫자)21
	private String inspX22;				//검사결과(수치,숫자)22
	private String inspX23;				//검사결과(수치,숫자)23
	private String inspX24;				//검사결과(수치,숫자)24
	private String inspectGubun;		//초,중,종물
	private String inspPass;			//합불
	private String inspCavity;			//검사cavity
	private String cavityCnt;			//cavity 수
	private String[] inspTypeArr;		//검사항목 타입배열			

	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

	//캐비티 TB_INSP_CAVITY_ADM
	private String cavityNo1;
	private String cavityNo2;
	private String cavityNo3;
	private String cavityNo4;
	private String cavityNo5;
	
	//추가사항
	private String inspCheckNm;
	
}
