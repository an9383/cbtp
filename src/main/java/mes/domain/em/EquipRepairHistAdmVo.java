package mes.domain.em;

import lombok.Data;

@Data
public class EquipRepairHistAdmVo {
	private String repairNo;
	private String equipCd;
	private String equipGubun;
	private String equipGubunNm;
	private String changeTime;
	private String repairRegDate;
	private String troubleDate;
	private String troublePart;
	private String troubleCont;
	private String troubleCause;
	private String repairCorpNm;
	private String repairMan;
	private String repairStatus;
	private String repairStartDate;
	private String repairEndDate;
	private byte[] beforeImageFile;
	private byte[] afterImageFile;
	private String beforeImageFileNm;
	private String afterImageFileNm;
	private String repairDesc;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	private String equipNm;
	private String equipModelNm;
	
	//추가사항
	private String assetCd;
	private String admNo;
	private String repairCost;
	private String partCost;
	private String totalCost;
	private String mfcCorpCd;
	private String equipNo;
	private String mainGubun;
	private String repairStatusNm;
	private String equipType;
	private String workResult;
	private String qualityCheck;
	private String attachFnOne;
	private String attachSeqOne;
	private String attachFnTwo;
	private String attachSeqTwo;

}
