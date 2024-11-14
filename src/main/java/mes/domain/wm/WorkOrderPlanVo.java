package mes.domain.wm;

import java.util.Date;
import lombok.Data;

@Data
public class WorkOrderPlanVo {	//작업지시계획(설비별생산계획)
	
	private String menuAuth;          //메뉴권한
	private String equipCd;           //설비코드
	private String goodsCd;           //제품코드
	private String workGubunCd;       //작업지시구분
	private String planRegDate;       //조건등록일
	private String regId;             //등록자
	private Date regDate;             //등록일
	private String updId;             //수정자
	private Date updDate;             //수정일
	private String equipCondSeq;	  //BOM 정보 SEQ
	
	
	//join시 사용
	private String goodsNm;			//제품코드관리 - 제품명
	private String model;			//제품코드관리 규격
	private String modelNo;			//제품코드관리 모델No
	private String qutyCd;			//자재코드관리 - 자재코드(A, F, N)
	private String qutyNm;			//자재코드관리 - 자재코드명 (AL, DNP, Nicu)
	private String chamferYnNm;		//자재코드관리 - 면취(압연) 유무
	private String surfaceTrtmtCd;  //자재코드관리 - 표면처리코드
	private String surfaceTrtmtNm;  //자재코드관리 - 표면처리명
	
}