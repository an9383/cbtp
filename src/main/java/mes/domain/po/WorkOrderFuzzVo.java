package mes.domain.po;

import lombok.Data;

@Data
public class WorkOrderFuzzVo {

	
	//퍼징 기록일지
	private String workOrdNo;
	private String fuzzNum;
	private String fuzzGubun;
	private String fuzzStartTime;
	private String fuzzEndTime;
	private String fuzzCnt;
	
	//퍼징/런너 이력관리
	private String frHistNo;
	private String frHistGb;
	private String frHistSq;
	private String frHistCnt;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private String today;

}
