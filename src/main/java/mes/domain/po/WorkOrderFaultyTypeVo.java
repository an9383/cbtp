package mes.domain.po;

import lombok.Data;

@Data
public class WorkOrderFaultyTypeVo {
	
	private String menuAuth;              //메뉴권한
	private String workOrdNo;
	private String workOrdSeq;
	private String minorPrcssCd;
	private String middlePrcssCd;
	private String minorPrcssNm;
	private String middlePrcssNm;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private String faultyTypeSeq;
	private String faultyTypeCd;
	private String faultyCavity;	//불량cavity구분
	private String faultyTypeNm;
	private String faultyTypeQty;
	private String faultyTypeDate;
	private String faultyTypeDesc;
	
	private String baseInfoSeq; 		//기준 정보 시퀀스
	private String baseInfoType; 		//기준정보유형
	private String baseInfoGubunNm;		//기준정보구분이름
	private String baseInfoGubun; 		//기중정보구분
	private String baseInfoCd; 			//기준정보코드
	private String baseInfoNm; 			//기준정보코드명
	private String etc1; 				//체크1
	private String etc1Nm; 				//이름
	private String etc2; 				//체크2
	private String etc3; 				//체크3
	private String etc4; 				//체크4
	private String etc5; 				//체크5
	private String useYn; 				//사용여부
	private String useYnNm;				//사용여부이름
	private String baseInfoDesc; 		//비고
	private String approvalYn;			//승인여부
	private String workStatus; 			//상태
	private String ordLotNo;			//생산LOTNO
	private String areaCd; 				//구역코드
	private String areaNm; 				//구역명
	
	private String faultyTypeQtyNat;
}
