package mes.domain.qm;

import lombok.Data;

@Data
public class SamJung5SAdmVo {

	private String sjCd; //관리코드
	private String sjArea; //구역
	private String sjDept; //담당부서
	private String checkChargr; //점검자
	private String checkDate; //점검일자
	private String compChargr; //완료자
	private String compDate; //완료일자
	private String sjDesc; //비고
	private byte[]  image1; //이미지파일(개선전)
	private byte[]  image2; //이미지파일(개선후)
	private String imageNm1; //이미지파일명(개선전)
	private String imageNm2; //이미지파일명(개선후)
	private String errorList; //지적사항
	private String improvList; //개선사항
	private String fileNm1; //첨부파일1
	private String fileNm2; //첨부파일2
	private String regId; //등록자 
	private String regDate; //등록일
	private String updId; //수정자 
	private String updDate; //수정일
	
	private String checkChargrName; //점검자이름
	private String compChargrName; //완료자이름
	private String imageStatus1;
	private String imageStatus2;
	private String fileStatus1;
	private String fileStatus2;
	private String value;
}
