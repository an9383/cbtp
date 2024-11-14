package mes.persistence.bm;

import java.util.List;

import mes.domain.bm.DealCorpAdmVo;
import mes.domain.bm.PrcssCodeAdmVo;

public interface PrcssCodeAdmDAO {

	//공정정보관리 전체목록조회
	public List<PrcssCodeAdmVo> prcssCodeAdmAllList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//작업장 조회
	public List<PrcssCodeAdmVo> prcssItemWorkplace(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리(소공정/중공정) 목록조회
	public List<PrcssCodeAdmVo> prcssCodeAdmList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리(하위 소공정) 목록조회
	public List<PrcssCodeAdmVo> prcssCodeMidDtlList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리(Master, Sub) 상세조회
	public PrcssCodeAdmVo prcssCodeAdmRead(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리(Master)-sub 조회
	public List<PrcssCodeAdmVo> prcssCodeSubList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//개발관리-공정매칭 조회
	public List<PrcssCodeAdmVo> prcssEbomList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리 등록
	public void prcssCodeAdmCreate(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리 수정
	public void prcssCodeAdmUpdate(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;

	//공정정보관리(소공정) 공정시퀀스코드정보
	public String getPrcssCodeSeqCd(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;	
	
	//공정정보관리(소공정) 공정시퀀스 가져오기
	public Integer getPrcssSeq(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;	
	
	//공정정보관리 삭제
	public void prcssCodeAdmDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;

	//중공정명 중복검사
	public Integer overlapPrcssNm(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//소공정 중복검사
	public Integer overlapPrcssCd(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;

	//공정순서 검사
	public PrcssCodeAdmVo prcssSeqCheck(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정별 설비목록조회
	public PrcssCodeAdmVo prcssToEquipList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	// 설비정보 전체조회
	public List<PrcssCodeAdmVo> prcssEquipAdmList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리 설비정보 삭제
	public void prcssEquipDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리 설비정보 등록
	public void prcssCodeEqCreate(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리 설비정보 전체 삭제
	public void prcssEquipAllDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리-자재 전체 삭제
	public void prcssItemAllDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리-자재 삭제
	public void prcssItemDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리 자재 등록
	public void prcssCodeItemCreate(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	// 공정정보관리-자재 전체조회
	public List<PrcssCodeAdmVo> prcssItemAdmList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//개발관리 BOM 전체조회
	public List<PrcssCodeAdmVo> prcssEbomAdmList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리 기본 삭제
	public void prcssAdmDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리-sub 전체삭제
	public void prcssSubAllDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리-sub 삭제
	public void prcssSubDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리 작업자 둥록 목록조회
	public List<PrcssCodeAdmVo> prcssWorkerAdmList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리 작업자 둥록 create
	public void prcssWorkerCreate(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
	//공정정보관리 작업자 둥록 삭제
	public void prcssWorkerDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception;
	
}
