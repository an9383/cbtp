package mes.domain.bs;
import lombok.Data;

@Data
public class BizOrderAdmVo {

	private String contNo;
	private String contDtlNo;
	private String[] contDtlNoArr;
	private String bizGubun;
	private String bizGubunNm;
	private String rcvDate;
	private String rcvChargr;
	private String rcvChargrNm;
	private String ordNo;
	private String ordCorpCd;
	private String ordCorpNm;
	private String shipReqDate;
	private String inexGubun;
	private String inexGubunNm;
	private String contGubun;
	private String contGubunNm;
	private String itemSeries;
	private String itemSeq;
	private String itemCd;
	private String itemRev;
	private String itemNm;
	private String itemMaker;
	private String itemUnit;
	private String itemUnitNm;
	private Integer ordCnt;
	private Integer delayCnt;
	private String confirmYn;
	private String confirmYnNm;
	private String contClient;
	private String bizOrdDtl;
	private String bizDtlDesc;
	private String ordRegDate;
	private String useYn;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	private String startDate;
	private String endDate;
	private String poNo;
	
	private String itemVoltage;			//전압
	private String itemOutput;			//출력
	private String itemSize;			//크기
	private String itemGubun2;			//스페셜/표준
	

	//영업주문상세
	private String workOrdNo;
	private String contSeq;
	private Integer dtlOrdCnt;
	private Integer shipCnt;
	private String lotNo;
	private String ordDtlDesc;
	private String dtlRegDate;
	
	//영업주문기타(etc)
	private String etcGubun;
	private String etcSeq;
	private String etcDept;
	private String etcCont;
	private String etcDate;
	private String etcCharger;
	private String etcChargerNm;
	private String etcDesc;
	private Integer leftCnt;
	
	private String etcSd;
	private String etcDl;
	private String etcPc;
	private String etcDa;
	
	private String date;
	private Integer unitCost;
	
	private String mrpNo;
	private Integer mrpSeq;

	private String approveStatus;


}
