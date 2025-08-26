package mes.persistence.bm;

import java.util.List;

import mes.domain.bm.DealCorpAdmVo;

public interface DealCorpAdmDAO {

	//거래처정보관리 목록조회
	public List<DealCorpAdmVo> listAll(DealCorpAdmVo dealCorpAdmVo) throws Exception;
	
	//거래처정보관리 목록조회2
	public List<DealCorpAdmVo> dealCorpDataJustList(DealCorpAdmVo dealCorpAdmVo) throws Exception;
	
	//거래처정보관리 상세조회
	public DealCorpAdmVo read(DealCorpAdmVo dealCorpAdmVo) throws Exception;
	
	//거래처정보관리 등록
	public void create(DealCorpAdmVo dealCorpAdmVo) throws Exception;
	
	//거래처정보관리 수정
	public void update(DealCorpAdmVo dealCorpAdmVo) throws Exception;
	
	//거래처정보관리 거래처명 중복검사
	public Integer overlapDealCorpNm(DealCorpAdmVo dealCorpAdmVo) throws Exception;
	
	//거래처정보관리 거래처명 중복검사
	public Integer overlapDealCordCd(DealCorpAdmVo dealCorpAdmVo) throws Exception;
	
	//방문관련자료 목록 조회
	public List<DealCorpAdmVo> dealCorpVisitList(DealCorpAdmVo dealCorpAdmVo) throws Exception;
	
	//방문관련자료 등록
	public int dealCorpVisitCreate(DealCorpAdmVo dealCorpAdmVo) throws Exception;
	
	//방문관련자료 삭제
	public int dealCorpVisitDelete(DealCorpAdmVo dealCorpAdmVo) throws Exception;
	
	//방문관련자료 시퀀스 값
	public String dealCorpVisitSeq(DealCorpAdmVo dealCorpAdmVo) throws Exception;
	
	//파일명 가져오기
	public String getFileNm(DealCorpAdmVo dealCorpAdmVo) throws Exception;
	
	//삭제
	public void dealCorpDataDelete(DealCorpAdmVo dealCorpAdmVo) throws Exception;
}
