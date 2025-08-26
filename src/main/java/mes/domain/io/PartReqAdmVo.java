package mes.domain.io;

import lombok.Data;

@Data
public class PartReqAdmVo {

	private String	partReqNo;			//부품요청번호
//	private String	partReqSeq;			//시퀀스
	private String  partReqChargr;		//요청자
//	private String	partReqChargrNm;  	
	private String 	partReqDept;  		//요청부서
//	private String 	partReqDeptNm;	
//	private String	workOrdNo;			// 작업지시번호
//	private String 	prcssCd;			// 소공정
//	private String 	prcssNm;			
//	private String 	partCd;				// 부품코드
//	private String 	partRev;			// 리비전
//	private String 	partNm;				// 부품명
//	private String 	partGubun;			// 부품구분
//	private String 	reqQty;				// 요청수량
	private String 	partReqDate;		// 부품요청일
//	private String 	outReqDate;			// 출고요청일
//	private String 	emerYn;				// 긴급여부
//	private String	emerYnNm;
//	private String 	reqStatus;			// 요청상태
	private	String 	approvalCd;
	private String 	partReqDesc;		//비고
	private String 	partReqGubun;		//구분자
	private String 	regId;				// 등록자
	private String 	regDate;			// 등록일
	private String 	updId;				// 수정자
	private String 	updDate;			// 수정일
	
	//추가항목
//	private String arrayData;
//	private String startDate;
//	private String endDate;
//	private String partUnitNm;
//	private String partSpec;
//	private String reqGubun;
	
}
