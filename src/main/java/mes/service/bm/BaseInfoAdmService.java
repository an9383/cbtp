package mes.service.bm;

import java.util.List;

import mes.domain.bm.BaseInfoAdmVo;
import mes.domain.bm.PrcssBomAdmVo;
import mes.domain.bm.PrcssCodeAdmVo;

public interface BaseInfoAdmService {
	
	// 80 검사항목 관리
	// 검사항목 목록 조회
	public List<BaseInfoAdmVo>   baseInfoItList() throws Exception;

	// 검사항목 상세 조회
	public BaseInfoAdmVo baseInfoItRead(BaseInfoAdmVo baseInfoAdmVo) throws Exception;

	// 검사항목 등록
	public void baseInfoItCreate(BaseInfoAdmVo baseInfoAdmVo) throws Exception;

	// 검사항목 수정
	public void baseInfoItUpdate(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
	
	
	// 70 불량유형 관리
	// 불량유형 목록 조회
	public List<BaseInfoAdmVo> baseInfoFtList(BaseInfoAdmVo baseInfoAdmVo) throws Exception;

	// 불량유형 상세 조회
	public BaseInfoAdmVo baseInfoFtRead(BaseInfoAdmVo baseInfoAdmVo) throws Exception;

	// 불량유형 등록
	public void baseInfoFtCreate(BaseInfoAdmVo baseInfoAdmVo) throws Exception;

	// 불량유형 수정
	public void baseInfoFtUpdate(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
	
	//불량유형 삭제
	public void baseInfoFtDelete(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
	
	// 시퀀스 조회
	public String faultyTypeSeq(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
	
	
	//시퀀스 조회
	public String baseInfoSeq() throws Exception;
	
	//코드시퀀스 조회
	public String baseInfoCdSeq(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
	
	//삭제
	public void baseInfoFtDataDelete(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
	
	// 공정정보관리(봉제조립) 비가동항목설정 조회
	public List<BaseInfoAdmVo> prcssCodeNoList(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
	
	// 공정정보관리(봉제조립) 비가동항목설정 등록
	public void prcssCodeNoCreate(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
	
	// 공정정보관리(봉제조립) 비가동항목설정 삭제
	public void prcssCodeNoDelete(BaseInfoAdmVo baseInfoAdmVo) throws Exception;
	

}
