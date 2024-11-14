package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.PrcssBomAdmVo;
import mes.domain.bm.PrcssBomDtlVo;
import mes.domain.bm.PrcssCodeAdmVo;
import mes.persistence.bm.PrcssBomAdmDAO;

@Service
public class PrcssBomAdmServiceImpl implements PrcssBomAdmService {

	@Inject
	private PrcssBomAdmDAO dao;

	@Override
	public List<PrcssBomAdmVo> prcssBomAdmList() throws Exception{
		return dao.prcssBomAdmList();
	}
	
	//BOM관리 상세조회
	@Override
	public PrcssBomAdmVo prcssBomAdmRead(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		return dao.prcssBomAdmRead(prcssBomAdmVo);
	}
	
	//BOM관리 등록
	@Override
	public void prcssBomAdmCreate(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		dao.prcssBomAdmCreate(prcssBomAdmVo);		
	}
	
	//BOM관리 수정
	@Override
	public void prcssBomAdmUpdate(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		dao.prcssBomAdmUpdate(prcssBomAdmVo);
	}

	//BOM관리 삭제
	@Override
	public void delete(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		dao.delete(prcssBomAdmVo);
	}
	
	//BOM 시퀀스 조회
	public String prcssBomCd() throws Exception {
		return dao.prcssBomCd();
	}
	
	//BOM상세 조회
	public List<PrcssBomDtlVo> prcssBomDtlList(PrcssBomDtlVo prcssBomDtlVo) throws Exception {
		return dao.prcssBomDtlList(prcssBomDtlVo);
	}
	
	//BOM상세 등록
	public void prcssBomDtlCreate(PrcssBomDtlVo prcssBomDtlVo) throws Exception {
		dao.prcssBomDtlCreate(prcssBomDtlVo);
	}
	
	//BOM상세 수정
	public void prcssBomDtlUpdate(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		dao.prcssBomDtlUpdate(prcssBomAdmVo);
	}
	
	//BOM상세 삭제
	public void prcssBomDtlDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		dao.prcssBomDtlDelete(prcssBomAdmVo);
	}
	
	//BOM상세 전체 삭제
	public void prcssBomDtlAllDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		dao.prcssBomDtlAllDelete(prcssBomAdmVo);
	}
	
	//BOM 시퀀스 조회
	public Integer prcssBomDtlSeq(PrcssBomDtlVo prcssBomDtlVo) throws Exception {
		return dao.prcssBomDtlSeq(prcssBomDtlVo);
	}
	
	//BOM상세 중복검사
	public Integer overlopPrcssCd(PrcssBomDtlVo prcssBomDtlVo) throws Exception{
		return dao.overlopPrcssCd(prcssBomDtlVo);
	}
	
	//전체 조회
	public List<PrcssBomAdmVo> prcssAllList() throws Exception {
		return dao.prcssAllList();
	}
	
	//기본정보 삭제
	public void prcssBomDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		dao.prcssBomDelete(prcssBomAdmVo);
	}
	
	//공정매칭 삭제
	public void prcssMbomDtlDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		dao.prcssMbomDtlDelete(prcssBomAdmVo);
	}
	
	//BOM 삭제
	public void prcssEbomDtlDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception {
		dao.prcssEbomDtlDelete(prcssBomAdmVo);
	}
	
	//개발관리 공정매칭 조회
	@Override
	public List<PrcssBomAdmVo> prcssCodeMbomList(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		return dao.prcssCodeMbomList(prcssBomAdmVo);
	}
	
	//개발관리 BOM 조회
	@Override
	public List<PrcssBomAdmVo> prcssCodeEbomList(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		return dao.prcssCodeEbomList(prcssBomAdmVo);
	}
	
	//개발관리 공정매칭 삭제
	@Override
	public void prcssMbomDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		dao.prcssMbomDelete(prcssBomAdmVo);
	}
	
	//개발관리 BOM 삭제
	@Override
	public void prcssEbomDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		dao.prcssEbomDelete(prcssBomAdmVo);
	}
	
	//개발관리 공정매칭 등록
	@Override
	public void prcssMbomCreate(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		dao.prcssMbomCreate(prcssBomAdmVo);
	}
	
	//개발관리 BOM 등록
	@Override
	public void prcssEbomCreate(PrcssBomAdmVo prcssBomAdmVo) throws Exception{
		dao.prcssEbomCreate(prcssBomAdmVo);
	}
	
}

	