package mes.service.bm;

import java.util.List;

import mes.domain.bm.PrcssBomAdmVo;
import mes.domain.bm.PrcssBomDtlVo;
import mes.domain.bm.PrcssCodeAdmVo;

public interface PrcssBomAdmService {
	
	//BOM관리 목록조회
	public List<PrcssBomAdmVo> prcssBomAdmList() throws Exception;
	
	//BOM관리 상세조회
	public PrcssBomAdmVo prcssBomAdmRead(PrcssBomAdmVo prcssBomAdmVo) throws Exception;
	
	//BOM관리 등록
	public void prcssBomAdmCreate(PrcssBomAdmVo prcssBomAdmVo) throws Exception;
	
	//BOM관리 수정
	public void prcssBomAdmUpdate(PrcssBomAdmVo prcssBomAdmVo) throws Exception;

	//BOM관리 삭제
	public void delete(PrcssBomAdmVo prcssBomAdmVo) throws Exception;
	
	//BOM 시퀀스 조회
	public String prcssBomCd() throws Exception;
	
	//BOM상세 조회
	public List<PrcssBomDtlVo> prcssBomDtlList(PrcssBomDtlVo prcssBomDtlVo) throws Exception;
	
	//BOM상세 등록
	public void prcssBomDtlCreate(PrcssBomDtlVo prcssBomDtlVo) throws Exception;
	
	//BOM상세 수정
	public void prcssBomDtlUpdate(PrcssBomAdmVo prcssBomAdmVo) throws Exception;
	
	//BOM상세 삭제
	public void prcssBomDtlDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception;
	
	//BOM상세 전체 삭제
	public void prcssBomDtlAllDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception;
	
	//BOM 시퀀스 조회
	public Integer prcssBomDtlSeq(PrcssBomDtlVo prcssBomDtlVo) throws Exception;
	
	//BOM상세 중복검사
	public Integer overlopPrcssCd(PrcssBomDtlVo prcssBomDtlVo) throws Exception;
	
	//전체 조회
	public List<PrcssBomAdmVo> prcssAllList() throws Exception;
	
	//기본정보 삭제
	public void prcssBomDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception;
	
	//공정매칭 삭제
	public void prcssMbomDtlDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception;
	
	//BOM 삭제
	public void prcssEbomDtlDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception;
	
	//개발관리 공정매칭 목록조회
	public List<PrcssBomAdmVo> prcssCodeMbomList(PrcssBomAdmVo prcssBomAdmVo) throws Exception;
	
	//개발관리 BOM 목록조회
	public List<PrcssBomAdmVo> prcssCodeEbomList(PrcssBomAdmVo prcssBomAdmVo) throws Exception;
	
	//개발관리 공정매칭 삭제
	public void prcssMbomDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception;
	
	//개발관리 BOM 삭제
	public void prcssEbomDelete(PrcssBomAdmVo prcssBomAdmVo) throws Exception;
	
	//개발관리 공정매칭 등록
	public void prcssMbomCreate(PrcssBomAdmVo prcssBomAdmVo) throws Exception;
	
	//개발관리 BOM 등록
	public void prcssEbomCreate(PrcssBomAdmVo prcssBomAdmVo) throws Exception;
	
}
