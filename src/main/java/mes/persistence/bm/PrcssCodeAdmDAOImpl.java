package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.PrcssCodeAdmVo;


@Repository
public class PrcssCodeAdmDAOImpl implements PrcssCodeAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.prcssCodeAdmMapper";
		
	//공정정보관리 전체목록조회
	public List<PrcssCodeAdmVo> prcssCodeAdmAllList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return session.selectList(namespace + ".prcssCodeAdmAllList" , prcssCodeAdmVo);
	}
	
	//작업장 조회
	public List<PrcssCodeAdmVo> prcssItemWorkplace(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return session.selectList(namespace + ".prcssItemWorkplace" , prcssCodeAdmVo);
	}
	
	//공정정보관리(소공정/중공정) 목록조회
	@Override
	public List<PrcssCodeAdmVo> prcssCodeAdmList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return session.selectList(namespace+".prcssCodeAdmList",prcssCodeAdmVo);
	}
	
	//공정정보관리(하위 소공정) 목록조회
	public List<PrcssCodeAdmVo> prcssCodeMidDtlList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return session.selectList(namespace +".prcssCodeMidDtlList" , prcssCodeAdmVo);
	}
	
	//공정정보관리 상세조회
	@Override
	public PrcssCodeAdmVo prcssCodeAdmRead(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return session.selectOne(namespace+".prcssCodeAdmRead",prcssCodeAdmVo);
	}
	
	//공정정보관리-sub 조회
	@Override
	public List<PrcssCodeAdmVo> prcssCodeSubList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return session.selectList(namespace+".prcssCodeSubList",prcssCodeAdmVo);
	}
	
	//개발관리 공정매칭 조회
	@Override
	public List<PrcssCodeAdmVo> prcssEbomList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return session.selectList(namespace + ".prcssEbomList", prcssCodeAdmVo);
	}
	
	//공정정보관리 등록
	@Override
	public void prcssCodeAdmCreate(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		session.insert(namespace + ".prcssCodeAdmCreate", prcssCodeAdmVo);
	}
	
	//공정정보관리 수정
	@Override
	public void prcssCodeAdmUpdate(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		session.update(namespace + ".prcssCodeAdmUpdate", prcssCodeAdmVo);
	}

	//공정정보관리 공정시퀀스코드정보
	@Override
	public String getPrcssCodeSeqCd(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return session.selectOne(namespace + ".getPrcssCodeSeqCd", prcssCodeAdmVo);
	}
	
	//공정정보관리(소공정) 공정시퀀스 가져오기
	@Override
	public Integer getPrcssSeq(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return session.selectOne(namespace +".getPrcssSeq" ,prcssCodeAdmVo);
	}
	
	//공정정보관리 삭제
	@Override
	public void prcssCodeAdmDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		session.delete(namespace + ".prcssCodeAdmDelete" ,prcssCodeAdmVo);
	}
	
	//중공정명 중복검사
	public Integer overlapPrcssNm(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return session.selectOne(namespace +".overlapPrcssNm" , prcssCodeAdmVo);
	}
	
	//소공정 중복검사
	@Override
	public Integer overlapPrcssCd(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return session.selectOne(namespace +".overlapPrcssCd" , prcssCodeAdmVo);
	}
	
	//공정별 설비목록조회
	@Override
	public PrcssCodeAdmVo prcssToEquipList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return  session.selectOne(namespace +".prcssToEquipList" , prcssCodeAdmVo);
	}

	//공정순서 검사
	public PrcssCodeAdmVo prcssSeqCheck(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return  session.selectOne(namespace +".prcssSeqCheck" , prcssCodeAdmVo);
	}
	
	// 설비정보 전체조회
	public List<PrcssCodeAdmVo> prcssEquipAdmList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return session.selectList(namespace + ".prcssEquipAdmList" , prcssCodeAdmVo);
	}
	
	//공정정보관리 설비정보 삭제
	@Override
	public void prcssEquipDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		session.delete(namespace + ".prcssEquipDelete", prcssCodeAdmVo);
	}
	
	//공정정보관리 설비정보 등록
	@Override
	public void prcssCodeEqCreate(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		session.insert(namespace + ".prcssCodeEqCreate", prcssCodeAdmVo);
	}
	
	//공정정보관리 설비정보 전체 삭제
	@Override
	public void prcssEquipAllDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		session.delete(namespace + ".prcssEquipAllDelete", prcssCodeAdmVo);
	}
	
	//공정정보관리-자재 전체 삭제
	@Override
	public void prcssItemAllDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		session.delete(namespace + ".prcssItemAllDelete", prcssCodeAdmVo);
	}
	
	//공정정보관리-자재 삭제
	@Override
	public void prcssItemDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		session.delete(namespace + ".prcssItemDelete", prcssCodeAdmVo);
	}
	
	//공정정보관리 자재 등록
	@Override
	public void prcssCodeItemCreate(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		session.insert(namespace + ".prcssCodeItemCreate", prcssCodeAdmVo);
	}
	
	// 공정정보관리-자재 전체조회
	public List<PrcssCodeAdmVo> prcssItemAdmList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return session.selectList(namespace + ".prcssItemAdmList" , prcssCodeAdmVo);
	}
	
	//개발관리 BOM 전체조회
	public List<PrcssCodeAdmVo> prcssEbomAdmList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return session.selectList(namespace + ".prcssEbomAdmList" , prcssCodeAdmVo);
	}
	
	//공정정보관리 기본 삭제
	@Override
	public void prcssAdmDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		session.delete(namespace + ".prcssAdmDelete", prcssCodeAdmVo);
	}
	
	//공정정보관리-sub 전체삭제
	@Override
	public void prcssSubAllDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		session.delete(namespace + ".prcssSubAllDelete", prcssCodeAdmVo);
	}

	//공정정보관리-sub 삭제
	@Override
	public void prcssSubDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		session.delete(namespace + ".prcssSubDelete", prcssCodeAdmVo);
	}
	
	//공정정보관리 작업자 둥록 목록조회
	public List<PrcssCodeAdmVo> prcssWorkerAdmList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return session.selectList(namespace + ".prcssWorkerAdmList", prcssCodeAdmVo);
	}
	
	//공정정보관리 작업자 둥록 create
	@Override
	public void prcssWorkerCreate(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		session.insert(namespace + ".prcssWorkerCreate", prcssCodeAdmVo);
	}
	
	//공정정보관리 작업자 둥록 삭제
	@Override
	public void prcssWorkerDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		session.delete(namespace + ".prcssWorkerDelete", prcssCodeAdmVo);
	}
	
}