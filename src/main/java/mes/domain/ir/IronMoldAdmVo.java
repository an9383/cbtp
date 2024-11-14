package mes.domain.ir;

import lombok.Data;

@Data
public class IronMoldAdmVo {
	
	private String equipCd;
	private String equipNo;
	private String itemModel;
	private String itemModelNm;
	private String itemCd;
	private String itemNm;
	private String warrantyLife;
	private String accPunch;
	private String remainPunch;
	private String moldCd;
	private String workYear;
	private String outputQty;
	private String equipCavity;
	private String shotCount;
	private String shotCountAll;
	
	//추가사항
	private String stateCd;
	private String selectMonth;
	
}