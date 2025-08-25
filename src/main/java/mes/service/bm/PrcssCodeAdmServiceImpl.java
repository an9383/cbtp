package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.PrcssCodeAdmVo;
import mes.persistence.bm.PrcssCodeAdmDAO;

@Service
public class PrcssCodeAdmServiceImpl implements PrcssCodeAdmService {

	@Inject
	private PrcssCodeAdmDAO dao;

	
	//공정정보관리 전체목록조회
	public List<PrcssCodeAdmVo> prcssCodeAdmAllList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return dao.prcssCodeAdmAllList(prcssCodeAdmVo);
	}
	
	//작업장 조회
	public List<PrcssCodeAdmVo> prcssItemWorkplace(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return dao.prcssItemWorkplace(prcssCodeAdmVo);
	}
	
	//공정정보관리 (소공정/중공정) 목록조회
	@Override
	public List<PrcssCodeAdmVo> prcssCodeAdmList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return dao.prcssCodeAdmList(prcssCodeAdmVo);
	}
	
	//공정정보관리(하위 소공정) 목록조회
	public List<PrcssCodeAdmVo> prcssCodeMidDtlList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return dao.prcssCodeMidDtlList(prcssCodeAdmVo);
	}
	
	//공정정보관리 상세조회
	@Override
	public PrcssCodeAdmVo prcssCodeAdmRead(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return dao.prcssCodeAdmRead(prcssCodeAdmVo);
	}
	
	//공정정보관리-sub 조회
	@Override
	public List<PrcssCodeAdmVo> prcssCodeSubList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return dao.prcssCodeSubList(prcssCodeAdmVo);
	}
	
	//개발관리-공정매칭 조회
	@Override
	public List<PrcssCodeAdmVo> prcssEbomList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return dao.prcssEbomList(prcssCodeAdmVo);
	}
	
	//공정정보관리 등록
	@Override
	public void prcssCodeAdmCreate(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		dao.prcssCodeAdmCreate(prcssCodeAdmVo);		
	}
	
	//공정정보관리 수정
	@Override
	public void prcssCodeAdmUpdate(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		dao.prcssCodeAdmUpdate(prcssCodeAdmVo);
	}

	//공정정보관리 공정시퀀스코드정보
	@Override
	public String getPrcssCodeSeqCd(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return dao.getPrcssCodeSeqCd(prcssCodeAdmVo);
	}
	
	//공정정보관리(소공정) 공정시퀀스 가져오기
	@Override
	public Integer getPrcssSeq(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return dao.getPrcssSeq(prcssCodeAdmVo);
	}
	
	
	//공정정보관리 삭제
	@Override
	public void prcssCodeAdmDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		dao.prcssCodeAdmDelete(prcssCodeAdmVo);
	}
	
	//중공정명 중복검사
	public Integer overlapPrcssNm(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return dao.overlapPrcssNm(prcssCodeAdmVo);
	}
	
	//소공정 중복검사
	@Override
	public Integer overlapPrcssCd(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return dao.overlapPrcssCd(prcssCodeAdmVo);
	}
	
	//공정순서 검사
	@Override
	public PrcssCodeAdmVo prcssSeqCheck(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return dao.prcssSeqCheck(prcssCodeAdmVo);
	}
	
	//공정별 설비목록조회
	@Override
	public PrcssCodeAdmVo prcssToEquipList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return  dao.prcssToEquipList(prcssCodeAdmVo);
	}
	
	// 설비정보 전체조회
	public List<PrcssCodeAdmVo> prcssEquipAdmList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return dao.prcssEquipAdmList(prcssCodeAdmVo);
	}
	
	//공정정보관리 설비정보 삭제
	@Override
	public void prcssEquipDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		dao.prcssEquipDelete(prcssCodeAdmVo);
	}
	
	//공정정보관리 설비정보 등록
	@Override
	public void prcssCodeEqCreate(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		dao.prcssCodeEqCreate(prcssCodeAdmVo);
	}

	//공정정보관리 설비정보 전체 삭제
	@Override
	public void prcssEquipAllDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		dao.prcssEquipAllDelete(prcssCodeAdmVo);
	}
	
	//공정정보관리-자재 전체 삭제
	@Override
	public void prcssItemAllDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		dao.prcssItemAllDelete(prcssCodeAdmVo);
	}
	
	//공정정보관리-자재 삭제
	@Override
	public void prcssItemDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		dao.prcssItemDelete(prcssCodeAdmVo);
	}
	
	//공정정보관리 자재 등록
	@Override
	public void prcssCodeItemCreate(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		dao.prcssCodeItemCreate(prcssCodeAdmVo);
	}
	
	// 공정정보관리-자재 전체조회
	public List<PrcssCodeAdmVo> prcssItemAdmList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return dao.prcssItemAdmList(prcssCodeAdmVo);
	}
	
	//개발관리 BOM 전체조회
	public List<PrcssCodeAdmVo> prcssEbomAdmList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return dao.prcssEbomAdmList(prcssCodeAdmVo);
	}
	
	//공정정보관리 기본 삭제
	@Override
	public void prcssAdmDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		dao.prcssAdmDelete(prcssCodeAdmVo);
	}
	
	//공정정보관리-sub 전체삭제
	@Override
	public void prcssSubAllDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		dao.prcssSubAllDelete(prcssCodeAdmVo);
	}
	
	//공정정보관리-sub 삭제
	@Override
	public void prcssSubDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		dao.prcssSubDelete(prcssCodeAdmVo);
	}
	
	//공정정보관리 작업자 둥록 목록조회
	public List<PrcssCodeAdmVo> prcssWorkerAdmList(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		return dao.prcssWorkerAdmList(prcssCodeAdmVo);
	}
	
	//공정정보관리 작업자 둥록 create
	@Override
	public void prcssWorkerCreate(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		dao.prcssWorkerCreate(prcssCodeAdmVo);
	}
	
	//공정정보관리 작업자 둥록 삭제
	@Override
	public void prcssWorkerDelete(PrcssCodeAdmVo prcssCodeAdmVo) throws Exception{
		dao.prcssWorkerDelete(prcssCodeAdmVo);
	}
	
}

	