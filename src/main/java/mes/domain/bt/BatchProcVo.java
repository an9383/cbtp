package mes.domain.bt;

import lombok.Data;

@Data
public class BatchProcVo {

	private String batchId;
	private String batchNm;
	private String batchGubun;
	private String batchStartTime;
	private String batchEndTime;
	private String successYn;
	private String batchDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private String tmMon;
}
