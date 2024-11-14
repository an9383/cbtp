package mes.persistence.qm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.qm.UnfitAdmVo;

@Repository
public class UnfitAdmDAOImpl implements UnfitAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.qm.unfitAdmMapper";
	
	//부적합관리대장(수입) 목록조회
	@Override
	public List<UnfitAdmVo> unfitInspectAdmList(UnfitAdmVo unfitAdmVo) throws Exception{
		return session.selectList(namespace + ".unfitInspectAdmList", unfitAdmVo);
	}

	//부적합관리대장(공정) 목록조회
	@Override
	public List<UnfitAdmVo> unfitPrcssAdmList(UnfitAdmVo unfitAdmVo) throws Exception{
		return session.selectList(namespace + ".unfitPrcssAdmList", unfitAdmVo);
	}
	
	//부적합관리대장(출하) 목록조회
	@Override
	public List<UnfitAdmVo> unfitCompleteAdmList(UnfitAdmVo unfitAdmVo) throws Exception{
		return session.selectList(namespace + ".unfitCompleteAdmList", unfitAdmVo);
	}
	
	//부적합관리대장(레이저) 등록
	@Override
	public void unfitAdmCreate(UnfitAdmVo unfitAdmVo) throws Exception{
		session.insert(namespace + ".unfitAdmCreate", unfitAdmVo);
	}

	//부적합관리대장(레이저) 수정
	@Override
	public void unfitAdmUpdate(UnfitAdmVo unfitAdmVo) throws Exception{
		session.update(namespace + ".unfitAdmUpdate", unfitAdmVo);
	}
	
	//부적합관리대장(레이저) 승인여부 수정 
	@Override
	public void unfitApprovalYnUpdate(UnfitAdmVo unfitAdmVo) throws Exception{
		session.update(namespace+".unfitApprovalYnUpdate",unfitAdmVo);
	}
	
	//부적합관리대장(레이저) 중복확인
	@Override
	public Integer unfitAdmCheck(UnfitAdmVo unfitAdmVo) throws Exception{
		return session.selectOne(namespace + ".unfitAdmCheck", unfitAdmVo);
	}
	
	//부적합번호 생성
	@Override
	public String getUnfitNo(UnfitAdmVo unfitAdmVo) throws Exception{
		return session.selectOne(namespace + ".getUnfitNo", unfitAdmVo);
	}
	
	//불량유형 합계(공정)
	@Override
	public List<UnfitAdmVo> faultyTypeTotalList(UnfitAdmVo unfitAdmVo) throws Exception{
		return session.selectList(namespace+".faultyTypeTotalList",unfitAdmVo);
	}
	
	//불량유형 합계(수입)
	@Override
	public List<UnfitAdmVo> faultyTypeTotalList2(UnfitAdmVo unfitAdmVo) throws Exception{
		return session.selectList(namespace+".faultyTypeTotalList2" , unfitAdmVo);
	}
	
	//불량유형 합계(출하)
	@Override
	public List<UnfitAdmVo> faultyTypeTotalList3(UnfitAdmVo unfitAdmVo) throws Exception{
		return session.selectList(namespace+".faultyTypeTotalList3" ,unfitAdmVo);
	}
	
	//불량cavity
	@Override
	public List<UnfitAdmVo> faultyTypeCavityList(UnfitAdmVo unfitAdmVo) throws Exception{
		return session.selectList(namespace+".faultyTypeCavityList",unfitAdmVo);
	}
	
	//부적합관리대장(봉제) 결과 등록
	@Override
	public void unfitResultCreate(UnfitAdmVo unfitAdmVo) throws Exception{
		session.insert(namespace + ".unfitResultCreate", unfitAdmVo);
	}

	//부적합관리대장(봉제) 결과 수정
	@Override
	public void unfitResultUpdate(UnfitAdmVo unfitAdmVo) throws Exception{
		session.update(namespace + ".unfitResultUpdate", unfitAdmVo);
	}
	
	//부적합관리대장(봉제) 결과 삭제
	@Override
	public void unfitResultDel(UnfitAdmVo unfitAdmVo) throws Exception{
		session.delete(namespace+".unfitResultDel" ,unfitAdmVo );
	}
	
	//부적합관리대장 조회
	@Override
	public List<UnfitAdmVo> unfitResultList(UnfitAdmVo unfitAdmVo) throws Exception{
		return session.selectList(namespace + ".unfitResultList", unfitAdmVo);
	}
		
	
	//부적합관리대장 상세조회
	@Override
	public UnfitAdmVo unfitResultRead(UnfitAdmVo unfitAdmVo) throws Exception {
		return session.selectOne(namespace+".unfitResultRead", unfitAdmVo);
	}
}
