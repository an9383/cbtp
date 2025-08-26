package mes.domain.fr;

import lombok.Data;

@Data
public class FileReferenceVo {
	private String idx;
	private String gubun;
	private String fileName;
	private byte[] fileBlob;
	private String fileGubun;
	private String fileManager;
	private String fileInputDate;
	private String fileDesc;
	private String fileInfo1;
	private String fileInfo2;
	private String fileInfo3;
	private String welcomeText;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
	private String fileManagerNm;
	private String fileManagerDepartmentNm;
	private String fileManagerDepartmentCd;
	
}