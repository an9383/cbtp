package mes.domain.tm;

import lombok.Data;

@Data
public class PartInventoryAdmVo {
	
	private String partCd;
	private String partRev;
	private String partGubun;
	private String partGubunNm;
	private String partSpec;
	private String partUnit;
	private String partUnitNm;
	private String partNm;
	private String tmMon;
	private Integer inQty;
	private Integer outQty;
	private Integer preTmQty;
	private Integer tmQty;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;

	private String locationCd;
	private String locationNm;
	private String areaCd;
	private String areaNm;
	
	private String lotNo;
}
