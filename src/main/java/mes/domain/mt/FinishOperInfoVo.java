package mes.domain.mt;

import lombok.Data;

@Data
public class FinishOperInfoVo {
	private String workOrdNo;
	private String equipCd;
	private String setupWeight;
	private String startSignal;
	private String speed;
	private String weight;
	private String outputCount;
	private String temperature;
	private String pressure;
	private String time;
	private String operStatus;
	private String faultyType;
	private String eventAlarm;
	private String capInputCount;
	private String capOutputCount;
	private String capOperStatus;
	private String capFaultyCount;
	private String packInputCount;
	private String packOutputCount;
	private String packFaultyCount;
	private String packOperStatus;
	private String boxCount;
	private String boxLoadCount;
	private String boxTappingCount;
	private String boxPalletCount;
	private String boxWorkOrderNo;
	private String regId;
	private String regDate;	
	private String equipNm;
	private String workStatus;
	private String itemNm;
	private String dealCorpNm;
	
	private String itemTempMax;
	private String itemTempMin;
	private String itemPressMax;
	private String itemPressMin;
	private String itemTimeMax;
	private String itemTimeMin;
	private String contDtlNo;
	private String outputQty;
	
	private String fillPvFrontTemp;	
	private String fillSvFrontTemp;	
	private String fillPvBackTemp;	
	private String fillSvBackTemp;	
	private String fillPressure;		
	private String fillNozzle1OpenTime;	
	private String fillTime;
	private String capUnit;	//캡핑수량
	
}			
