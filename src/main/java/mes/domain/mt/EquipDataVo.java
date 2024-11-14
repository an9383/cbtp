package mes.domain.mt;

import lombok.Data;

@Data
public class EquipDataVo {
	private String no;
	private String workOrdNo;
	private String itemSeq;
	private String equipCd;
	private String equipNm;
	private String recipeNo;
	private String stageNo;
	private String xAxis;
	private String yAxis;
	private String zAxis;
	private String sizeX;
	private String sizeY;
	private String workStatus;
	private String workStatusPrev;
	private String workStatusPrev2;
	private String itemNm;
	private String processTime;
	private String hallCount;
	
	private String dateType;
	private String searchDate;
	private String mainGubun;
	
	private String holdTime;
	private String operationTime;
	
	private String productionQty;
	private String planQty;
	private String faultyQty;
	private String faultyCd;
	private String faultyNm;
	
	private String dtlOrdCnt;
	private String capOutputCount;
	private String workEndDate;
	private String equipCapa;
	private String dayCount;
	private String inputQty;
	
	private String theoryCt;
	private String loadTime;
	
	private String recipeGb;
	private String processStatus;
	private String nowWorkStatus;
	private String nowCheckStatus;
	private String woaCheckStatus;
	
	private String startDatetime;
	private String endDatetime;
	private String workCnt;
	private String prcNm;
}