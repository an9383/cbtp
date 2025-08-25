package mes.domain.po;

import java.util.Date;
import lombok.Data;

@Data
public class WorkOrderMatrlDtlVo {
	
	private String menuAuth;              //메뉴권한
	private String workOrdNo;
	private String matrlCd;
	private String inWhsSeq;
	private String barcodeNo;
	private String matrlLotNo;
	private String matrlGubun;
	private String inputWeight;
	private String inputCnt;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

}
