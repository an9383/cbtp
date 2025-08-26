package mes.domain.po;

import lombok.Data;

@Data
public class EqWorkHisAdmVo {

	//작업표준
	private String workOrdNo;		//작업번호
	private String histSeq;			//작업차수
	
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
	private String inFixedOne;
	private String inFixedTwo;
	private String inFixedThree;
	private String inMovingOne;
	private String inMovingTwo;
	private String inMovingThree;
	
	
	
	//작업조건
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
	
	
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

}
