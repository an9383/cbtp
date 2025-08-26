package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.DealCorpAdmVo;
import mes.persistence.bm.DealCorpAdmDAO;

@Service
public class DealCorpAdmServiceImpl implements DealCorpAdmService {

	@Inject
	private DealCorpAdmDAO dao;

	//거래처정보관리 목록조회
	@Override
	public List<DealCorpAdmVo> listAll(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		return dao.listAll(dealCorpAdmVo);
	}
	
	//거래처정보관리 목록조회2
	@Override
	public List<DealCorpAdmVo> dealCorpDataJustList(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		return dao.dealCorpDataJustList(dealCorpAdmVo);
	}

	//거래처정보관리 상세조회
	@Override
	public DealCorpAdmVo read(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		return dao.read(dealCorpAdmVo);	
	}
	
	//거래처정보관리 등록
	@Override
	public void create(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		dao.create(dealCorpAdmVo);
	}
	
	//거래처정보관리 수정
	@Override
	public void update(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		dao.update(dealCorpAdmVo);
	}
	
	//거래처정보관리 거래처명 중복검사
	public Integer overlapDealCorpNm(DealCorpAdmVo dealCorpAdmVo) throws Exception{
		return dao.overlapDealCorpNm(dealCorpAdmVo);
	}
	
	//거래처정보관리 거래처명 중복검사
	public Integer overlapDealCordCd(DealCorpAdmVo dealCorpAdmVo) throws Exception{
		return dao.overlapDealCordCd(dealCorpAdmVo);
	}
	
	//방문관련자료 목록 조회
	@Override
	public List<DealCorpAdmVo> dealCorpVisitList(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		return dao.dealCorpVisitList(dealCorpAdmVo);
	}
	
	//방문관련자료 등록
	@Override
	public int dealCorpVisitCreate(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		return dao.dealCorpVisitCreate(dealCorpAdmVo);
	}
	
	//방문관련자료 삭제
	@Override
	public int dealCorpVisitDelete(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		return dao.dealCorpVisitDelete(dealCorpAdmVo);
	}
	
	//방문자관련자료 시퀀스 값
	@Override
	public String dealCorpVisitSeq(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		return dao.dealCorpVisitSeq(dealCorpAdmVo);
	}
	
	//파일명 가져오기
	@Override
	public String getFileNm(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		return dao.getFileNm(dealCorpAdmVo);
	}
	
	//삭제
	@Override
	public void dealCorpDataDelete(DealCorpAdmVo dealCorpAdmVo) throws Exception {
		dao.dealCorpDataDelete(dealCorpAdmVo);
	}
	
}

	