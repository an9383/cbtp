package mes.domain.em;

import java.util.Date;
import lombok.Data;

@Data
public class EquipInspectBaseAdmVo {

	private String menuAuth;             //메뉴권한	
	private String equipCd;
	private String equipNm;
	private String prcssCd;
	private String prcssNm;
	private String inspcetCycle;
	private String inspcetCycleNm;
	private String inspcetDept;
	private String inspcetDeptNm;
	private String inspcetChargr;
	private String inspcetChargrNm;
	private String inspcetDesc;
	private String inspctRegDate;
	private String inspcetSeq;
	private String inspcetItem;
	private String inspcetBase;

	private String regId;                //등록자
	private Date regDate;                //등록일
	private String updId;                //수정자
	private Date updDate;                //수정일
	
	private String equipGubun;
	private String equipGubunNm;
	private String model;
	private String equipGroup;
	private String admNo;
	private String mfcCorpCd;
	private String equipGrade;
	private String buyDate;
	private String buyCorpCd;
	private String telNo;
	private String admDept;
	private String useSource;
	private String mainChargr;
	private String subChargr;
	private String useYn;
	private String equipDesc;
	private String imageFile1;
	private String imageFile2;
	private String imageFile3;
	private String imageFile4;
	private String inspectResult;
	private String startDate;
	private String endDate;



}