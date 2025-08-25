package mes.domain.mt;

import lombok.Data;

@Data
public class LaserOperInfoVo {
	// 정보
	private String contDtlNo;		// 작지번호
	private String equipNm;			// 설비목록
	private String itemNm;			// 제품
	private String outputQty;		// 수량
	private String itemPowerMax;	// 출력(상한)
	private String itemPowerMin;	// 출력(하한)
	private String itemTempMax;		// 온도(상한)
	private String itemTempMin;		// 온도(하한)

	private String workOrdNo;	// 상세작지
	private String MES_WorkOrdNo;	// 상세작지
	private String laserRa;			// 출력
	private String laserTemperature;// 온도
	
	private String regId;			// 등록인
	private String regDate;			// 등록일
	private String updId;			// 수정인
	private String updDate;			// 수정일
}