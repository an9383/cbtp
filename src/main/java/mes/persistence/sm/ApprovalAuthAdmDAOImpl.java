package mes.persistence.sm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bs.BizOrderConsumptVo;
import mes.domain.sm.ApprovalAuthAdmVo;

@Repository
public class ApprovalAuthAdmDAOImpl implements ApprovalAuthAdmDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "mes.mappers.sm.approvalAuthAdmMapper";
	
	//승인관리 목록조회
	@Override
	public List<ApprovalAuthAdmVo> approvalAuthAdmList(ApprovalAuthAdmVo approvalAuthAdm) throws Exception{
		return session.selectList(namespace + ".approvalAuthAdmList" , approvalAuthAdm);
	}
	
//	//승인관리 상세조회
//	@Override
//	public ApprovalHistVo read(ApprovalHistVo approvalAuthAdm) throws Exception{
//		return session.selectOne(namespace + ".read", approvalAuthAdm);
//	}
//	
	//승인관리 등록
	@Override
	public void approvalAuthAdmCreate(ApprovalAuthAdmVo approvalAuthAdm) throws Exception{
		session.insert(namespace + ".approvalAuthAdmCreate", approvalAuthAdm);
	}
//	
//	//승인관리 수정
//	@Override
//	public void update(ApprovalHistVo approvalAuthAdm) throws Exception{
//		session.update(namespace + ".update", approvalAuthAdm);
//	}
	
	//승인관리 삭제
	public void approvalAuthAdmDelete(ApprovalAuthAdmVo approvalAuthAdm)throws Exception{
		session.delete(namespace + ".approvalAuthAdmDelete" ,approvalAuthAdm );
	}
	
//	//사번 시퀀스
//	@Override
//	public String selectUserNumberSeq() throws Exception{
//		return session.selectOne(namespace + ".selectUserNumberSeq");
//	}
}
