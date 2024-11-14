package mes.domain.bs;

import lombok.Data;

@Data
public class CustCmplnAdmVo {
	
	//일반정보(영업)
	private String custNo; 				//접수번호
	private String cmplnDate; 			//접수일
	private String rcvChargr; 			//접수자
	private String itemCd; 				//제품번호
	private String itemRev;	 			//리비전
	private String mfcDate; 			//제조일
	private String custNm; 				//고객명
	private String coChargr; 			//업체담당자
	private String coChargrMail; 		//업체이메일
	private String faultyCheckFn; 		//불량확인서 (파일)
	private String complReqDate; 		//완료요청일
	private String custConfirmCont;		//고객확인 및 의뢰사항
	private String custReqCont; 		//고객요구사항
	
	//검토부서(품질)
	private String faultyRheckDate; 	//불량확인일자
	private String faultyCheckChargr; 	//불량확인자
	private String coErrorYn; 			//당사과실유무
	private String inspectPassDate; 	//검사경과일
	private String faultyCheckCont; 	//불량확인내용
	
	//검토부서(영업)
	private String reviewDate; 			//검토일자
	private String reviewChargr; 		//검토확인자
	private String chargeYn; 			//유/무상
	private String custCheck; 			//고객확인 
	private String paymentProg; 		//의뢰후 납부경과
	private String confirmYn; 			//완료여부
	private String consultCont; 		//협의내용
	
	//재발방지(품질)
	private String faultyDept; 			//귀책부서
	private String caReqDate; 			//시정조치요구일
	private String caRecepDate; 		//시정조치수신일
	private String satisfyYn; 			//만족여부
	private String caNo; 				//시정조치no
	private String caNoCont; 			//시정조치no내용
	
	private String regId; 				//등록자
	private String regDate; 			//등록일
	private String updId; 				//수정자
	private String updDate; 			//수정일
	
	//추가내용
	private String startDate;
	private String endDate;
	private String url;
}                      
                       
                       