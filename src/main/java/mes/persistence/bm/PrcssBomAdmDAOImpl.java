package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.PrcssBomAdmVo;
import mes.domain.bm.PrcssBomDtlVo;
import mes.domain.bm.PrcssCodeAdmVo;


@Repository
public class PrcssBomAdmDAOImpl implements PrcssBomAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.prcssBomAdmMapper";
		
	//BOM관리 목록조회
	@Override
	public List<PrcssBomAdmVo> prcssBomAdmList() throws Exception{
		return session.selectList(namespace+".prcssBomAdmList");
	}
	
	//BOM관리 상세조회
	@Override
	public PrcssBomAdmVo prcssBomAdmRead(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		return session.selectOne(namespace+".prcssBomAdmRead",prcssBomAdmVo);
	}
	
	//BOM관리 등록
	@Override
	public void prcssBomAdmCreate(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		session.insert(namespace + ".prcssBomAdmCreate", prcssBomAdmVo);
	}
	
	//BOM관리 수정
	@Override
	public void prcssBomAdmUpdate(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		session.update(namespace + ".prcssBomAdmUpdate", prcssBomAdmVo);
	}
	
	//BOM정보관리 삭제
	@Override
	public void delete(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		session.delete(namespace + ".delete", prcssBomAdmVo);
	}
	
	//BOM 시퀀스 조회
	@Override
	public String prcssBomCd() throws Exception {
		return session.selectOne(namespace + ".prcssBomCd");
	}

	//BOM상세 조회
	public List<PrcssBomDtlVo> prcssBomDtlList(PrcssBomDtlVo prcssBomDtlVo) throws Exception {
		return session.selectList(namespace+".prcssBomDtlList", prcssBomDtlVo);
	}
	
	//BOM상세 등록
	public void prcssBomDtlCreate(PrcssBomDtlVo prcssBomDtlVo) throws Exception {
		session.insert(namespace + ".prcssBomDtlCreate", prcssBomDtlVo);
	}
	
	//BOM상세 수정
	public void prcssBomDtlUpdate(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		session.update(namespace + ".prcssBomDtlUpdate", prcssBomAdmVo);
	}
	
	//BOM상세 삭제
	public void prcssBomDtlDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		session.delete(namespace + ".prcssBomDtlDelete", prcssBomAdmVo);
	}
	
	//BOM상세 전체 삭제
	public void prcssBomDtlAllDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		session.delete(namespace + ".prcssBomDtlAllDelete", prcssBomAdmVo);
	}
	
	//BOM 시퀀스 조회
	public Integer prcssBomDtlSeq(PrcssBomDtlVo prcssBomDtlVo) throws Exception {
		return session.selectOne(namespace + ".prcssBomDtlSeq", prcssBomDtlVo);
	}
	
	//BOM상세 중복검사
	public Integer overlopPrcssCd(PrcssBomDtlVo prcssBomDtlVo) throws Exception {
		return session.selectOne(namespace +".overlopPrcssCd" , prcssBomDtlVo);
	}
	
	//전체 조회
	public List<PrcssBomAdmVo> prcssAllList() throws Exception {
		return session.selectList(namespace+".prcssAllList");
	}
	
	//기본정보 삭제
	public void prcssBomDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		session.delete(namespace + ".prcssBomDelete", prcssBomAdmVo);
	}
	
	//공정매칭 삭제
	public void prcssMbomDtlDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		session.delete(namespace + ".prcssMbomDtlDelete", prcssBomAdmVo);
	}
	
	//BOM 삭제
	public void prcssEbomDtlDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		session.delete(namespace + ".prcssEbomDtlDelete", prcssBomAdmVo);
	}
	
	//개발관리 공정매칭 목록조회
	@Override
	public List<PrcssBomAdmVo> prcssCodeMbomList(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		return session.selectList(namespace + ".prcssCodeMbomList", prcssBomAdmVo);
	}
	
	//개발관리 BOM 목록조회
	@Override
	public List<PrcssBomAdmVo> prcssCodeEbomList(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		return session.selectList(namespace + ".prcssCodeEbomList", prcssBomAdmVo);
	}
	
	//개발관리 공정매칭 삭제
	@Override
	public void prcssMbomDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		session.delete(namespace + ".prcssMbomDelete", prcssBomAdmVo);
	}
	
	//개발관리 BOM 삭제
	@Override
	public void prcssEbomDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		session.delete(namespace + ".prcssEbomDelete", prcssBomAdmVo);
	}
	
	//개발관리 공정매칭 등록
	@Override
	public void prcssMbomCreate(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		session.insert(namespace + ".prcssMbomCreate", prcssBomAdmVo);
	}
	
	//개발관리 BOM 등록
	@Override
	public void prcssEbomCreate(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		session.insert(namespace + ".prcssEbomCreate", prcssBomAdmVo);
	}
	
}