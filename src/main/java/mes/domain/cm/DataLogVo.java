package mes.domain.cm;

import lombok.Data;

@Data
public class DataLogVo extends CommonVo {
	
	private String idx;
	private String data_count;		// 데이터 건수
	private String page_name;		// 테이블명
	private String table_name;		// 테이블명
	private String table_rows;		// row count
	private String data_date;		// 데이터 기간
	private String data_size;		// 데이터 크기
	
	private String save_date;		// 저장일자
	private String save_time;		// 저장시간
	private String contact_id;		// 접속ID

	private String searchStartDate;		// 데이터 검색 시작 기간
	private String searchEndDate;		// 데이터 검색 종료 기간
	private String searchDate;		// 데이터 검색 시작 기간
}
