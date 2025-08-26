package mes.domain.wm;

import lombok.Data;

@Data
public class AdvPlanScheduleVo {	//APS

	private String startDate;
	private String endDate;
	
	private String idx;
	private String contDtlNo;
	private String workOrdNo;
	private String planEquipCd;
	private String planQty;
	private String planStartDate;
	private String planEndDate;
	private String planState;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private String contNo;
	private String bizGubun;
	private String contGubun;
	private String contGubunNm;
	private String poNo;
	private String ordCorpCd;
	private String rcvChargr;
	private String rcvChargrNm;
	private String rcvDate;
	private String inexGubun;
	private String inexGubunNm;
	private String itemSeq;
	private String itemCd;
	private String itemNm;
	private String itemRev;
	private String dtlOrdCnt;
	private String dealCorpNm;
	private String shipReqDate;
	private String planEquipNm;
	private String unitCost;
	private String equipCd;
	private String prcNm;
	
	private String readyTime;
	private String processTime;
}