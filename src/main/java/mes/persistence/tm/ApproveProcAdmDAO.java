package mes.persistence.tm;

import java.util.List;

import mes.domain.tm.ApproveProcAdmVo;

public interface ApproveProcAdmDAO {

	
	//목록조회1
	public List<ApproveProcAdmVo> approveProcAdmList1(ApproveProcAdmVo approveProcAdmVo) throws Exception;
	
	//목록조회1
	public List<ApproveProcAdmVo> approveProcAdmList2(ApproveProcAdmVo approveProcAdmVo) throws Exception;
	
	//목록조회1
	public List<ApproveProcAdmVo> approveProcAdmList3(ApproveProcAdmVo approveProcAdmVo) throws Exception;
	
	//목록조회1
	public List<ApproveProcAdmVo> approveProcAdmList4(ApproveProcAdmVo approveProcAdmVo) throws Exception;
	
	//목록조회1
	public List<ApproveProcAdmVo> approveProcAdmList5(ApproveProcAdmVo approveProcAdmVo) throws Exception;
	
	//승인처리 등록
	public int approveProcAdmCreate(ApproveProcAdmVo approveProcAdmVo) throws Exception;
	
	//승인처리 시퀀스 가져오기
	public String getApSeq(ApproveProcAdmVo approveProcAdmVo) throws Exception;
}
