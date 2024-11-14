package mes.domain.wm;

import java.util.Date;
import lombok.Data;

@Data
public class WorkStateVo {	//작업지시계획(설비별생산계획)

	private String startDate;
	private String endDate;
	
	// 기간별 생산 현황
	private String workOrdNo;
	private String workOrdDate;
	private String workGubun;
	private String workGubunNm;
	private String equipCd;
	private String equipNm;
	private String workChargr;
	private String workChargrNm;
	private String itemCd;
	private String itemNm;
	private String itemColor;
	private String itemModel;
	private String itemModelNm;
	private String cutSize;
	private String fillingWt;
	
	private String mainGubun;
	private String itemCus;
	private String itemCusNm;
	private String itemGubun;
	private String itemGubunNm;
	
	private String prcssCd;
	private String prcssNm;
	private String itemSeq;
	private String matrlItemNm;
	private String matrlItemGrade;
	private String moldCd;
	private String equipNo;
	private String cavity;
	private String outputQty;
	private String fairQty;
	private String faultyQty;
	private String workTime;
	private String noTime;
	private String fuzzCnt;
	private String fuzzQty;
	private String runnerQty;
	private String faultyTypeQty0;
	private String faultyTypeQty1;
	private String faultyTypeQty2;
	private String faultyTypeQty3;
	private String faultyTypeQty4;
	private String faultyTypeQty5;
	private String faultyTypeQty6;
	private String faultyTypeQty7;
	private String faultyTypeQty8;
	private String faultyTypeQty9;
	private String faultyTypeQty10;
	private String faultyTypeQty11;
	private String faultyTypeQty12;
	private String faultyTypeQty13;
	private String faultyTypeQty14;
	private String faultyTypeQty15;
	private String faultyTypeQtySum;
	private String[] faultyTypeQtyList;
	private String noTime0;
	private String noTime1;
	private String noTime2;
	private String noTime3;
	private String noTime4;
	private String noTime5;
	private String noTime6;
	private String noTime7;
	private String noTime8;
	private String noTime9;
	private String noTime10;
	private String noTime11;
	private String noTime12;
	private String noTime13;
	private String noTime14;
	private String noTime15;
	private String noTimeSum;
	private String[] noTimeList;
	
	private String biTimeSum;	//비가동시간
	private String noTimeRate;	//가동률
	private String biTimeRate;	//비가동률
	
	// 기간별 자재사용 현황
	private String matrlItemCd;
	private String barcodeNo;
	private String totalConsumpt;
	private String matrlItemCel;
	private String matrlItemHr;
	private String matrlCel;
	private String matrlHr;
	private String matrlDate;
	
	// 기간별 비가동 현황
	private String noGubun;
	private String noGubunNm;
	private String noReason;
	private String noStartDate;
	private String noStartTime;
	private String noEndDate;
	private String noEndTime;
	
	// 기간별 작업조건 현황
	private String histSeq;
	private String histSeqNm;
	
	private String stNzTemperature;
	private String stH1Temperature;
	private String stH2Temperature;
	private String stH3Temperature;
	private String stH4Temperature;
	private String stChgPosition1;
	private String stChgPosition2;
	private String stChgPosition3;
	private String stChgPosition4;
	private String stSuckBack;
	private String stInjPressure1;
	private String stInjPressure2;
	private String stInjPressure3;
	private String stInjVelocity1;
	private String stInjVelocity2;
	private String stInjVelocity3;
	private String stInjPosition1;
	private String stInjPosition2;
	private String stInjPosition3;
	private String stBackPressure1;
	private String stBackPressure2;
	private String stBackPressure3;
	private String stBackPressure4;
	private String stHldPressure1;
	private String stHldPressure2;
	private String stHldPressure3;
	private String stHldVel1;
	private String stHldVel2;
	private String stHldVel3;
	private String stThermostat;
	private String stHydraulicOil;
	private String stCoolwaterIn;
	private String stCoolwaterOut;
	private String stMoldFixed;
	private String stMoldMoving;
	
	private String cdNzTemperature;
	private String cdH1Temperature;
	private String cdH2Temperature;
	private String cdH3Temperature;
	private String cdH4Temperature;
	private String cdChgPosition1;
	private String cdChgPosition2;
	private String cdChgPosition3;
	private String cdChgPosition4;
	private String cdSuckBack;
	private String cdInjPressure1;
	private String cdInjPressure2;
	private String cdInjPressure3;
	private String cdInjVelocity1;
	private String cdInjVelocity2;
	private String cdInjVelocity3;
	private String cdInjPosition1;
	private String cdInjPosition2;
	private String cdInjPosition3;
	private String cdBackPressure1;
	private String cdBackPressure2;
	private String cdBackPressure3;
	private String cdBackPressure4;
	private String cdHldPressure1;
	private String cdHldPressure2;
	private String cdHldPressure3;
	private String cdHldVel1;
	private String cdHldVel2;
	private String cdHldVel3;
	private String cdThermostat;
	private String cdHydraulicOil;
	private String cdCoolwaterIn;
	private String cdCoolwaterOut;
	private String cdMoldFixed;
	private String cdMoldMoving;
	
	private String inFixTemp1;
	private String inFixTemp2;
	private String inFixTemp3;
	private String inMoveTemp1;
	private String inMoveTemp2;
	private String inMoveTemp3;
	
	//추가사항
	private String ordCorpCd;
	private String ordCorpNm;
	private String workStartDate;
	private String workEndDate;
	private String faultyTypeCd;
	private String faultyTypeNm;
	private String rcvDate;
	private String dtlRegDate;
	private String dtlOrdCnt;
	
	private String useQty;
	private String partCd;
	private String partNm;
	private String itemUnit;
	private String itemUnitNm;
	
	private String fillingCount;
	private String boxCount;
	private String regDate;
}