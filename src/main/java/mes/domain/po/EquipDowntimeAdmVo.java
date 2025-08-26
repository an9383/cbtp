package mes.domain.po;

import java.util.Date;
import lombok.Data;

@Data
public class EquipDowntimeAdmVo {
	
	private String menuAuth;              //메뉴권한
	private String workOrdNo;
	private String prcssCd;
	private String downtimeSeq;
	private String downtimeGubun;
	private String downtimeCause;
	private String startTime;
	private String endTime;
	private String stopTime;
	private String downtimeDesc;
	private String downtimeRegDate;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
}
