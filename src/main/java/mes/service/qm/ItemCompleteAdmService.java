package mes.service.qm;

import java.util.List;

import mes.domain.qm.ItemCompleteAdmVo;
import mes.domain.qm.ItemInspectAdmVo;

public interface ItemCompleteAdmService {

	// 완제품관리 목록조회
	public List<ItemCompleteAdmVo> listAll(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	//완제품관리 생산 lot별 목록조회
	public List<ItemCompleteAdmVo> itemCompleteAdmList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리 상세조회
	public ItemCompleteAdmVo read(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리 마스터 번호생성
	public String getDoNo(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리 마스터 등록
	public void itemCompleteMasterCreate(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리 마스터 수정
	public void itemCompleteMasterUpdate(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리 등록
	public void createComplete(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리 수정
	public void updateComplete(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리 삭제
	public void deleteComplete(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리 시퀀스 생성
	public String getDoSeq(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리 불량내역 생성
	public void createFaulty(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리 불량내역 수정
	public void updateFaulty(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;

	// 완제품관리 불량내역 삭제
	public void deleteFaulty(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
		
	// 완제품관리 승인상태 수정
	public void updateStatus(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리 제품입고 여부확인
	public Integer checkItemWhsYn(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리 성적서 삭제
	public void completeFileDelete(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 바코드 유무 확인
	public String checkBarcodeNo(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 바코드 생성
	public void updateBarcodeNo(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	
	
	// 완제품검사 불량유형조회
	public List<ItemCompleteAdmVo> itemCompleteFaultyTypeList (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품검사 불량유형조회
	public List<ItemCompleteAdmVo> itemCompleteFaultyTypeRead (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품검사 등록
	public void itemCompleteFaultyTypeCreate(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품검사 삭제
	public void itemCompleteFaultyTypeDelete(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품검사 총 수량조회
	public ItemCompleteAdmVo itemInspectQtyRead(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	
	
	
	//******************모니터링*********************
	// 완제품검사 품질경향 분석 목록조회(일별)
	public List<ItemCompleteAdmVo> qualityTrendAnlyDayList (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
		
	// 완제품검사 품질경향 분석 목록조회 
	public List<ItemCompleteAdmVo> qualityTrendAnlyList (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품검사 품질경향 분석 목록조회 
	public List<ItemCompleteAdmVo> qualityTrendAnlyList11 (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품검사 원인별 불량누적현황 목록조회 
	public List<ItemCompleteAdmVo> faultyStatusList (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 불량유형 개수
	public Integer faultyTypeCount(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 누적 유형별 점유율 목록조회
	public List<ItemCompleteAdmVo> itemCompleteMonthList (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 기간별 완제품검사결과조회
	public List<ItemCompleteAdmVo> testResultCompleteList (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;

	//검사항목결과관리 연계번호 조회
	public List<ItemCompleteAdmVo> inspResultAdmList (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
}
