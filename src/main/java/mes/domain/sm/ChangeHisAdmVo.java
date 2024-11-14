package mes.domain.sm;

import lombok.Data;
import mes.domain.sm.SystemAccessLogVo;

@Data
public class ChangeHisAdmVo {
	
	private String mstIdx;
	private String itemSeq;
	private String revisionNum;
	private String processNum;
	private String revisionDate;
	private String customerEo;
	private String revisionDtl;
	private String mstDesc;
	private String relatedData;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	private String subIdx;
	private String baseCd;
	private String subYn;
	
	//추가사항
	private String[] changeArr;
	private String startDate;
	private String endDate;
	
	private String vo001;
	private String vo002;
	private String vo003;
	private String vo004;
	private String vo005;
	private String vo006;
	private String vo007;
	private String vo008;
	private String vo009;
	private String vo010;
	
	
}
