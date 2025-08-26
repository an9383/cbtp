package mes.domain.po;

import java.util.Date;
import lombok.Data;

@Data
public class WorkOrderDtlVo {
	
	private String menuAuth;              //메뉴권한
	private String workOrdNo;
	private String matrlCd;
	private String matrlNm;
	private String inWhsSeq;
	private String barcodeNo;
	private String matrlLotNo;
	private String matrlGubun;
	private String matrlGubunNm;
	private String inputWeight;
	private String inputCnt;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

}