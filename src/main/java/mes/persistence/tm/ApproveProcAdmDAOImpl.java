package mes.persistence.tm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.tm.ApproveProcAdmVo;

@Repository
public class ApproveProcAdmDAOImpl implements ApproveProcAdmDAO {

	@Inject
	private static String namespace = "mes.mappers.tm.approveProcAdmMapper";
	
	@Inject
	private SqlSession session;
	
	//목록조회1
	public List<ApproveProcAdmVo> approveProcAdmList1(ApproveProcAdmVo approveProcAdmVo) throws Exception{
		return session.selectList(namespace+".approveProcAdmList1" , approveProcAdmVo);
	}
	
	//목록조회1
	public List<ApproveProcAdmVo> approveProcAdmList2(ApproveProcAdmVo approveProcAdmVo) throws Exception{
		return session.selectList(namespace+".approveProcAdmList2" , approveProcAdmVo);
	}
	
	//목록조회1
	public List<ApproveProcAdmVo> approveProcAdmList3(ApproveProcAdmVo approveProcAdmVo) throws Exception{
		return session.selectList(namespace+".approveProcAdmList3" , approveProcAdmVo);
	}
	
	//목록조회1
	public List<ApproveProcAdmVo> approveProcAdmList4(ApproveProcAdmVo approveProcAdmVo) throws Exception{
		return session.selectList(namespace+".approveProcAdmList4" , approveProcAdmVo);
	}
	
	//목록조회1
	public List<ApproveProcAdmVo> approveProcAdmList5(ApproveProcAdmVo approveProcAdmVo) throws Exception{
		return session.selectList(namespace+".approveProcAdmList5" , approveProcAdmVo);
	}
	
	//승인처리 등록
	public int approveProcAdmCreate(ApproveProcAdmVo approveProcAdmVo) throws Exception{
		return session.insert(namespace+".approveProcAdmCreate" , approveProcAdmVo);
	}
	
	//승인처리 시퀀스 가져오기
	public String getApSeq(ApproveProcAdmVo approveProcAdmVo) throws Exception{
		return session.selectOne(namespace+".getApSeq" , approveProcAdmVo);
	}
}
