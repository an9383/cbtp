package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.PrcssMiddleVo;
import mes.persistence.bm.PrcssMiddleDAO;

@Service
public class PrcssMiddleServiceImple implements PrcssMiddleService {

	@Inject
	private PrcssMiddleDAO dao;
	
	//중공정 정보 전체 조회
	@Override
	public List<PrcssMiddleVo> prcssMiddleAdmList() throws Exception {
		return dao.prcssMiddleAdmList();
	}

	//중공정 정보 가져오기
	@Override
	public PrcssMiddleVo prcssMiddleAdmRead(PrcssMiddleVo Vo) throws Exception {
		return dao.prcssMiddleAdmRead(Vo);
	}
	
	//중공정 정보 등록
	@Override
	public int prcssMiddleAdmCreate(PrcssMiddleVo Vo) throws Exception {
		return dao.prcssMiddleAdmCreate(Vo);
	}
	
	//종공정 공정코드 시퀀스 값
	@Override
	public String prcssMiddleCd() throws Exception {
		return dao.prcssMiddleCd();
	}

	//중공정 정보 수정
	@Override
	public int prcssMiddleAdmUpdate(PrcssMiddleVo Vo) throws Exception {
		return dao.prcssMiddleAdmUpdate(Vo);
	}
	
	//중공정 정보 상세 조회
	@Override
	public List<PrcssMiddleVo> prcssMiddleDtlList(PrcssMiddleVo Vo) throws Exception {
		return dao.prcssMiddleDtlList(Vo);
	}
	
	//중공정 정보 등록
	@Override
	public int prcssMiddleDtlCreate(PrcssMiddleVo Vo) throws Exception {
		return dao.prcssMiddleDtlCreate(Vo);
	}
	
	//중공정 정보 삭제
	@Override
	public int prcssMiddleDtlDelete(PrcssMiddleVo Vo) throws Exception {
		return dao.prcssMiddleDtlDelete(Vo);
	}
	
	//중공정 정보 전체 삭제
	@Override
	public int prcssMiddleDtlDeleteAll(PrcssMiddleVo Vo) throws Exception {
		return dao.prcssMiddleDtlDeleteAll(Vo);
	}
	
	//중공정 상세 공정 시퀀스
	@Override
	public int prcssSeq(PrcssMiddleVo Vo) throws Exception {
		return dao.prcssSeq(Vo);
	}
	
	//중공정 상세 공정 코드
	@Override
	public String prcssCd(PrcssMiddleVo Vo) throws Exception {
		return dao.prcssCd(Vo);
	}
}
