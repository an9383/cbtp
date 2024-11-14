package mes.domain.mt;

import lombok.Data;

@Data
public class ControllSystemVo {
	// 정보
	private String idx;				// 식별자
	private String factoryGubun;	// 레이저/후가공 구분자
	private String beCd;			// 수집 코드
	private String beDate;			// 수집 날짜
	private String beDateMonth;		// 수집 월
	private String beDateDay;		// 수집 일
	private String beDateHour;		// 수집 시간
	private String beData;			// 수집 데이터
	private String regId;			// 등록인
	private String regDate;			// 등록일
	private String updId;			// 수정인
	private String updDate;			// 수정일
	
	private String startDate;		// 시작일자
	private String endDate;			// 끝일자
	
	private String airCondTemp;		// 후가공 온도
	private String airCondHumi;		// 후가공 습도
	private String laserRoomTemp;	// 레이저 온도
	private String laserRoomHumi;	// 레이저 습도
}