package mes.domain.po;

import lombok.Data;

@Data
public class WorkOrderEquipDailyCheckVo {

	private String dcNo;
	private String workOrdNo;
	private String mainGubun;
	private String equipCd;
	private String equipNm;
	private String checkSeq;
	private String checkList;
	private String checkMethod;
	private String checkSpec;
	private String inspInputMethod;
	private String checkPass;
	private String checkResult;
	private String checkDate;
	private String checkChargr;
	
	private String allCount;
	private String okCount;
	private String totalPass;
	
	private String startDate;
	private String endDate;
	
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

	private String today;
}
