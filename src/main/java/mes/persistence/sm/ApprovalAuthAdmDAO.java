package mes.persistence.sm;

import java.util.List;

import mes.domain.sm.ApprovalAuthAdmVo;

public interface ApprovalAuthAdmDAO {
	
	//승인관리 목록조회
	public List<ApprovalAuthAdmVo> approvalAuthAdmList(ApprovalAuthAdmVo approvalAuthAdm) throws Exception;
	
//	//승인관리 상세조회
//	public ApprovalHistVo read(ApprovalHistVo approvalAuthAdm) throws Exception;
	
	//승인관리 등록
	public void approvalAuthAdmCreate(ApprovalAuthAdmVo approvalAuthAdm) throws Exception;
//	
//	//승인관리 수정
//	public void update(ApprovalHistVo approvalAuthAdm) throws Exception;
	
	//승인관리 삭제
	public void approvalAuthAdmDelete(ApprovalAuthAdmVo approvalAuthAdm)throws Exception;
	
//	//사번 시퀀스
//	public String selectUserNumberSeq() throws Exception;
}
