package mes.service.qm;

import java.util.List;

import mes.domain.qm.UnfitAdmVo;

public interface UnfitAdmService {

	//부적합관리대장(수입) 목록조회
	public List<UnfitAdmVo> unfitInspectAdmList(UnfitAdmVo unfitAdmVo) throws Exception;

	//부적합관리대장(공정) 목록조회
	public List<UnfitAdmVo> unfitPrcssAdmList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장(출하) 목록조회
	public List<UnfitAdmVo> unfitCompleteAdmList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장(레이저) 등록
	public void unfitAdmCreate(UnfitAdmVo unfitAdmVo) throws Exception;

	//부적합관리대장(레이저) 수정
	public void unfitAdmUpdate(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장(레이저) 승인여부 수정 
	public void unfitApprovalYnUpdate(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장(레이저) 중복확인
	public Integer unfitAdmCheck(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합번호 생성
	public String getUnfitNo(UnfitAdmVo unfitAdmVo) throws Exception;	
	
	//불량유형 합계(공정)
	public List<UnfitAdmVo> faultyTypeTotalList(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//불량유형 합계(수입)
	public List<UnfitAdmVo> faultyTypeTotalList2(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//불량유형 합계(출하)
	public List<UnfitAdmVo> faultyTypeTotalList3(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//불량cavity
	public List<UnfitAdmVo> faultyTypeCavityList(UnfitAdmVo unfitAdmVo) throws Exception;

	//부적합관리대장(봉제) 결과 등록
	public void unfitResultCreate(UnfitAdmVo unfitAdmVo) throws Exception;

	//부적합관리대장(봉제) 결과 수정
	public void unfitResultUpdate(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장(봉제) 결과 삭제
	public void unfitResultDel(UnfitAdmVo unfitAdmVo) throws Exception;
	
	//부적합관리대장 조회
	public List<UnfitAdmVo> unfitResultList(UnfitAdmVo unfitAdmVo) throws Exception;
		
	//부적합관리대장 상세조회
	public UnfitAdmVo unfitResultRead(UnfitAdmVo unfitAdmVo) throws Exception;
}
