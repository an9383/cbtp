package mes.service.sm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bs.BizOrderConsumptVo;
import mes.domain.sm.ApprovalAuthAdmVo;
import mes.persistence.sm.ApprovalAuthAdmDAO;

@Service
public class ApprovalAuthAdmServiceImpl implements ApprovalAuthAdmService{
	
	@Inject
	private ApprovalAuthAdmDAO dao;
	
	//승인관리 목록조회
	@Override
	public List<ApprovalAuthAdmVo> approvalAuthAdmList(ApprovalAuthAdmVo approvalAuthAdm) throws Exception{
		return dao.approvalAuthAdmList(approvalAuthAdm);
	}

//	//승인관리 상세조회
//	@Override
//	public ApprovalHistVo read(ApprovalHistVo approvalAuthAdm) throws Exception{
//		return dao.read(approvalAuthAdm);
//	}
//	
	//승인관리 등록
	@Override
	public void approvalAuthAdmCreate(ApprovalAuthAdmVo approvalAuthAdm) throws Exception{
		dao.approvalAuthAdmCreate(approvalAuthAdm);
	}				
//	
//	//승인관리 수정
//	@Override
//	public void update(ApprovalHistVo approvalAuthAdm) throws Exception{
//		dao.update(approvalAuthAdm);
//	}
	
	//승인관리 삭제
	public void approvalAuthAdmDelete(ApprovalAuthAdmVo approvalAuthAdm)throws Exception{
		dao.approvalAuthAdmDelete(approvalAuthAdm);
	}
	
//	@Override
//	//사번 시퀀스
//	public String selectUserNumberSeq() throws Exception{
//		return dao.selectUserNumberSeq();
//	}
	
}
