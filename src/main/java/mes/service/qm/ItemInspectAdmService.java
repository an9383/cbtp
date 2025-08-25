package mes.service.qm;

import java.util.List;

import mes.domain.io.PurchaseOrderAdmVo;
import mes.domain.qm.ItemInspectAdmVo;

public interface ItemInspectAdmService {

	// 수입검사 목록 조회
	public List<ItemInspectAdmVo> itemInspectAdmList (ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사 수량 조회
	public ItemInspectAdmVo itemInspectQtyRead (ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사 상세 조회
	public ItemInspectAdmVo itemInspectAdmRead (ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사 등록
	public void itemInspectAdmCreate(ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사 수정
	public void itemInspectAdmUpdate(ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사 삭제
	public void itemInspectAdmDelete(ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사 등록여부
	public int countInspectAdmList(ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사 마스터 등록
	public void itemInspectMasterCreate(ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사 마스터 수정
	public void itemInspectMasterUpdate(ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	//수입검사 성적서 파일 삭제
	public void inspectFileDelete(ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사 성적서 파일명 가져오기
	public ItemInspectAdmVo getInspectFileNm(ItemInspectAdmVo itemInspectAdmVo) throws Exception;

	//발주마감 발주상태 확인
	public String statusCdCheck(ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	//입출고관리 수정
	public void inOutWhsAdmUpdate(ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	
	// 수입검사 불량유형조회
	public List<ItemInspectAdmVo> itemInspectFaultyTypeList (ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사 불량유형조회
	public List<ItemInspectAdmVo> itemInspectFaultyTypeRead (ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사 등록
	public void itemInspectFaultyTypeCreate(ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사 수정
	public void itemInspectFaultyTypeUpdate(ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사 삭제
	public void itemInspectFaultyTypeDelete(ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사팝업 목록 조회 
	public List<ItemInspectAdmVo> itemInspectAdmPopUpList (ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사팝업(반품) 목록 조회 
	public List<ItemInspectAdmVo> itemInspectReturnPopUpList (ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 이미지 등록
	public void itemInspectImageUpload(ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 이미지 보여주기
	public ItemInspectAdmVo itemInspectImgRead(ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	//이미지 삭제
	public void itemInspectImageDelete(ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	
	//******************모니터링*********************
	// 수입검사 품질경향 분석 목록조회(일별)
	public List<ItemInspectAdmVo> qualityTrendAnlyDayList (ItemInspectAdmVo itemInspectAdmVo) throws Exception;
		
	// 수입검사 품질경향 분석 목록조회 
	public List<ItemInspectAdmVo> qualityTrendAnlyList (ItemInspectAdmVo itemInspectAdmVo) throws Exception;
		
	// 수입검사 품질경향 분석 목록조회 
//	public List<ItemInspectAdmVo> qualityTrendAnlyList11 (ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사 원인별불량누적 목록조회 
	public List<ItemInspectAdmVo> faultyStatusList (ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 불량유형 개수
	public Integer faultyTypeCount (ItemInspectAdmVo itemInspectAdmVo) throws Exception;
	
	// 수입검사 누적 유형별 점유율 목록조회
	public List<ItemInspectAdmVo> itemInspectMonthList (ItemInspectAdmVo itemInspectAdmVo) throws Exception;
}
