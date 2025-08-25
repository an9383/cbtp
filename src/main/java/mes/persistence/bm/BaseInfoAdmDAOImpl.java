package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.BaseInfoAdmVo;

@Repository
public class BaseInfoAdmDAOImpl implements BaseInfoAdmDAO{
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.baseInfoAdmMapper";
	
	
	// 80 검사항목 관리
	//검사항목 목록 조회
	@Override
	public List<BaseInfoAdmVo> baseInfoItList() throws Exception {
		return session.selectList(namespace+".baseInfoItList");
	}

	//검사항목 상세 조회
	@Override
	public BaseInfoAdmVo baseInfoItRead(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		return session.selectOne(namespace+".baseInfoItRead", baseInfoAdmVo);
	}

	//검사항목 등록
	@Override
	public void baseInfoItCreate(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		session.insert(namespace+".baseInfoItCreate", baseInfoAdmVo);
		
	}

	//검사항목 수정
	@Override
	public void baseInfoItUpdate(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		session.update(namespace+".baseInfoItUpdate", baseInfoAdmVo);
	}

	
	// 70 불량유형 관리
	//불량유형 목록 조회
	@Override
	public List<BaseInfoAdmVo> baseInfoFtList(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		return session.selectList(namespace+".baseInfoFtList", baseInfoAdmVo);
	}

	//불량유형 상세 조회
	@Override
	public BaseInfoAdmVo baseInfoFtRead(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		return session.selectOne(namespace+".baseInfoFtRead", baseInfoAdmVo);
	}

	//불량유형 등록
	@Override
	public void baseInfoFtCreate(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		session.insert(namespace+".baseInfoFtCreate", baseInfoAdmVo);
	}

	//불량유형 수정
	@Override
	public void baseInfoFtUpdate(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		session.update(namespace+".baseInfoFtUpdate", baseInfoAdmVo);
		
	}
	
	//불량유형 삭제
	public void baseInfoFtDelete(BaseInfoAdmVo baseInfoAdmVo) throws Exception{
		session.delete(namespace+".baseInfoFtDelete" ,baseInfoAdmVo );
	}
	
	// 시퀀스 조회
	public String faultyTypeSeq(BaseInfoAdmVo baseInfoAdmVo) throws Exception{
		return session.selectOne(namespace+".faultyTypeSeq",baseInfoAdmVo);
	}

	// 시퀀스 조회
	@Override
	public String baseInfoSeq() throws Exception{
		return session.selectOne(namespace+".baseInfoSeq");
	}
	
	// 코드시퀀스 조회
	@Override
	public String baseInfoCdSeq(BaseInfoAdmVo baseInfoAdmVo) throws Exception{
		return session.selectOne(namespace+".baseInfoCdSeq", baseInfoAdmVo);
	}
	
	//삭제
	public void baseInfoFtDataDelete(BaseInfoAdmVo baseInfoAdmVo) throws Exception{
		session.delete(namespace + ".baseInfoFtDataDelete", baseInfoAdmVo);
	}
	
	//검사항목 목록 조회
	@Override
	public List<BaseInfoAdmVo> prcssCodeNoList(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		return session.selectList(namespace+".prcssCodeNoList", baseInfoAdmVo);
	}
	
	// 공정정보관리(봉제조립) 비가동항목설정 등록
	@Override
	public void prcssCodeNoCreate(BaseInfoAdmVo baseInfoAdmVo) throws Exception {
		session.insert(namespace + ".prcssCodeNoCreate", baseInfoAdmVo);
	}
	
	// 공정정보관리(봉제조립) 비가동항목설정 삭제
	public void prcssCodeNoDelete(BaseInfoAdmVo baseInfoAdmVo) throws Exception{
		session.delete(namespace+".prcssCodeNoDelete", baseInfoAdmVo );
	}

	
}
