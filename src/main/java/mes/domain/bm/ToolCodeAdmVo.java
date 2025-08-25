package mes.domain.bm;

import lombok.Data;

@Data
public class ToolCodeAdmVo {
	
	private String idx;
	private String mainGubun;
	private String equipCd;
	private String equipNo;
	private String equipNm;
	private String equipInitial;
	private String prcNm;
	private String equipType;
	private String moldLocation;
	private String equipCavity;
	private String mfcCorpCd;
	private String mfcDate;
	private String endDate;
	private String assetCd;
	private String assetGubun;
	private String buyAmt;
	private String equipCond;
	private String upperAmt;
	private String lowerAmt;
	private String ancEquipNm;
	private String ancDate;
	private String ancCorpCd;
	private String expNm;
	private String ancEquipType;
	private String buyCorpNm;
	private String disposeDate;
	private String moldGrade;
	private String warrantyLife;
	private String earlyPunchNum;
	private String effectiveDate;
	private String useYn;
	private String equipmanageNo;
	private String equipModel;
	private String purchaseDate;
	private String purchasePrice;
	private byte[] imageFile1;
	private byte[] imageFile2;
	private byte[] imageFile3;
	private byte[] imageFile4;
	private String imageFile1Nm;
	private String imageFile2Nm;
	private String imageFile3Nm;
	private String imageFile4Nm;
	private String imageFile1Con;
	private String imageFile2Con;
	private String imageFile3Con;
	private String imageFile4Con;
	private String equipDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	//교정내역
	private String corrRegDate;
	private String corrCont;
	private String corrActOrgan;
	private String corrDesc;
	
	//기타
	private Integer etcSeq;
	private String etcGubun;
	private String etcCont;
	private String value;

	//모니터링 - 설비가동/비가동현황
	private String equipStatus;
	private String pd;
	private String wi;
	private String wc;
	
	private String url;
	
	//설비작업표준 연동관리
	private String itemSeq;
	private String timeStamp;
	private String nzTemperature;
	private String h1Temperature;
	private String h2Temperature;
	private String h3Temperature;
	private String h4Temperature;
	private String chgPosition1;
	private String chgPosition2;
	private String chgPosition3;
	private String chgPosition4;
	private String suckBack;
	private String injPressure1;
	private String injPressure2;
	private String injPressure3;
	private String injVelocity1;
	private String injVelocity2;
	private String injVelocity3;
	private String injPosition1;
	private String injPosition2;
	private String injPosition3;
	private String backPressure1;
	private String backPressure2;
	private String backPressure3;
	private String backPressure4;
	private String hldPressure1;
	private String hldPressure2;
	private String hldPressure3;
	private String hldVel1;
	private String hldVel2;
	private String hldVel3;
	private String thermostat;
	private String hydraulicOil;
	private String coolwaterIn;
	private String coolwaterOut;
	private String moldFixed;
	private String moldMoving;

	//추가사항
	private String prcRealNm;
	private String workcondiCheck;
	private String equipGubun;
	private String equipGubunNm;
	private String mainEquipCd;
	private String equipWidth;
	private String equipLength;
	private String equipHeight;
	private String popUpCheck;
	private String moldGradeNm;
	private String useYnNm;
	private String noStartDate;
	private String noStartTime;
	private String noEndDate;
	private String noEndTime;
	private String workOrdNo;
	private String noGubun;
	private String noGubunNm;
	private String noReason;
	private String noTime;
	private String workChargr;
	private String userNm;
	private String noSeq;
	private String attachCheck; 
	private String ancFacCheck; 
	private String[] equipArr;
	
	//부속품
	private String partSeq;
	private String partArticle;
	private String exchangeCycle;
	
	//금형수명관리
	private String remainPunch;
	private String accPunch;
	private String lastMonth;
	private String thisMonth;
	private String startDate;
	private String dayList;
	private String punch1;
	private String punch2;
	private String punch3;
	private String punch4;
	private String punch5;
	private String punch6;
	private String punch7;
	private String punch8;
	private String punch9;
	private String punch10;
	private String punch11;
	private String punch12;
	private String punch13;
	private String punch14;
	private String punch15;
	private String punch16;
	private String punch17;
	private String punch18;
	private String punch19;
	private String punch20;
	private String punch21;
	private String punch22;
	private String punch23;
	private String punch24;
	private String punch25;
	private String punch26;
	private String punch27;
	private String punch28;
	private String punch29;
	private String punch30;
	private String punch31;

	private String itemCd;
	private String itemModel;
	private String itemModelNm;
	private String itemNm;
	
	//추가사항 
	private String itemSeqCheck;
	private String equipStandard;
	private String equipWeight;
	private String equipCompany;
	private String equipStorage;
	private String equipYangsan;
	private String equipUsed;
	private String equipCore;
	
	private String checkSeq;
	private String checkState;
	private String checkMethod;
	private String checkStandard;
	private String checkDesc;
	
	private String equipPart;
	private String equipUnit;
	private String equipDc;
	private String equipSeq;
	private String equipCompanyNm;

	private String asChargr;
	private String asPhoneNumber;
	private String equipUsedNm;
	private String mainEquipNm;
	private String workerJung;
	
	private String moldCd;
	private String workYear;
	private String outputQty;
	private String shotCount;
	private String stateCd;
	private String shotCountAll;
	private String selectYear;
	private String selectMonth;
	private String locNo;
	private String locCd;
	private String locCdNm;
	private String areaCd;
	private String floorNm;
	private String inFixedOne;
	private String inFixedTwo;
	private String inFixedThree;
	private String inMovingOne;
	private String inMovingTwo;
	private String inMovingThree;

	private String corrYear;
	private String corrDate;
	private String corrWillDate;
	private String corrCheck;
	private String monthOne;
	private String monthTwo;
	private String monthThree;
	private String monthFour;
	private String monthFive;
	private String monthSix;
	private String monthSeven;
	private String monthEight;
	private String monthNine;
	private String monthTen;
	private String monthEleven;
	private String monthTwelve;
	private String corrGubun;
	private String corrGubunNm;
	private String mitCd;
	private String checkCycle;
	private String checkCycleNm;
	private String checkCount;
	private String prcNmNm;
	private String listGubun;
	
	private String checkList;
	private String checkSpec;
	private String inspInputMethod;
	
	//철형차종정보관리 추가사항
	private String carType;
	private String ironDesc;
	private String etc1;
	private String etc2;
	private String etc3;
	
	private String equipCapa;
	
}