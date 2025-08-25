package mes.domain.bm;

import lombok.Data;

@Data
public class ItemMotorVo {
	
	private String itemCd;				// 제품코드
	private String itemSeq;				// 아이템시퀀스
	private String itemNm;				// 제품명
	private String itemRev;				// 리비전
	private String itemGubun;			// 제품구분
	private String itemGubunNm;			// 제품구분명
	private String itemSeries;			// 시리즈
	private String frameSize;			// 프레임크기
	private String itemCapa;			// 용량
	private String itemEncdr;			// 인코더
	private String itemType;			// 유형
	private String ipClass;				// IP클래스
	private String serialNo;			// 시리얼넘버
	private String itemVoltage;			//전압
	private String itemOutput;			//출력
	private String itemSize;			//크기
	private String itemGubun2;			//스페셜/표준
	private String itemCable;			//케이블
	private Integer tmQty;				// 재고
	private String useYn;				// 사용여부
	private String itemDesc;			// 비고
	private byte[] imageFile1;
	private byte[] imageFile2;
	private byte[] imageFile3;
	private byte[] imageFile4;
	private String imageFile1Nm;
	private String imageFile2Nm;
	private String imageFile3Nm;
	private String imageFile4Nm;
	private String regId;				// 등록자
	private String regNm;				// 등록자
	private String regDate;				// 등록일
	private String updId;				// 수정자
	private String updDate;				// 수정일
	
	//EBOM
	private String partCd;				// 부품코드
	private String partRev;				// 리비전
	private String partSeq;				// 시퀀스
	private float partConsumpt;			// 소모량
	private float totalConsumpt;		// 총소모량
	private String ebomDesc;			// 비고
	private String partUnit;			// 부품 단위
	private String partUnitNm;			// 부품 단위명
	private String partSpec;			// 부품 spec
	private String partNm;				// 부품 이름
	private String partGubun;			// 부품 구분
	private String partGubunNm;			// 부품 구분명
	private String partType;			// 부품 타입
	private String partTypeNm;			// 부품 타입명
	
	//MBOM
	private String bomCd;				// 공정코드
	private String prcssCd;				// 공정코드(중공정/소공정)
	private String prcssNm;				// 공정먕
	private String prcssSeq;			// 공정시퀀스
	private String prcssInitial;		// 이니셜
	private String equipCd;				// 설비코드
	private String equipNm;				// 설비명
	private String osrcCorpCd;			// 외주처
	private String osrcCorpNm;			// 외주처 이름
	private String prcssGubun;			// 공정구분
	
	//작업표준서
	private byte[] workStandard;		//작업표준서
	private String workStandardNm;		//작업표준서
	private String workStandardSeq;		//작업표준서
	
	private String value;
	
	private Integer unitCost;			//단가
	private String preOrdQty;			//기발주내역
	private String url;
	
	private String preOutQty;		
	private String floorCd;
	private String workOrdNo;
	
	//특주,사양서
	private String fileType;
	private String fileSeq;
	private String fileDate;
	private String fileContent;
	private String fileNm;
	
	//추가
	private String itemCdTo;
	private String itemRevTo;
	private String arrayData;
	private String arrayData2;
	
	private String[] itemCdArr;
 
}
