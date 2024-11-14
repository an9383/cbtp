package mes.service.qm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.io.PurchaseOrderAdmVo;
import mes.domain.qm.ItemInspectAdmVo;
import mes.persistence.qm.ItemInspectAdmDAO;


@Service
public class ItemInspectAdmServiceImpl implements ItemInspectAdmService {
	
	@Inject
	private ItemInspectAdmDAO dao;
	
	// 수입검사 목록 조회
	public List<ItemInspectAdmVo> itemInspectAdmList (ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		return dao.itemInspectAdmList(itemInspectAdmVo);
	}
	
	// 수입검사 수량 조회
	public ItemInspectAdmVo itemInspectQtyRead (ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		return dao.itemInspectQtyRead(itemInspectAdmVo);
	}
	
	// 수입검사 상세 조회
	public ItemInspectAdmVo itemInspectAdmRead (ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		return dao.itemInspectAdmRead(itemInspectAdmVo);
	}
	
	// 수입검사 등록
	public void itemInspectAdmCreate(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		dao.itemInspectAdmCreate(itemInspectAdmVo);
	}
	
	// 수입검사 수정
	public void itemInspectAdmUpdate(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		dao.itemInspectAdmUpdate(itemInspectAdmVo);
	}
	
	// 수입검사 삭제
	public void itemInspectAdmDelete(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		dao.itemInspectAdmDelete(itemInspectAdmVo);
	}
	
	// 수입검사 등록여부
	public int countInspectAdmList(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		return dao.countInspectAdmList(itemInspectAdmVo);
	}
	
	// 수입검사 마스터 등록
	public void itemInspectMasterCreate(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		dao.itemInspectMasterCreate(itemInspectAdmVo);
	}
	
	// 수입검사 마스터 수정
	public void itemInspectMasterUpdate(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		dao.itemInspectMasterUpdate(itemInspectAdmVo);
	}
	
	//수입검사 성적서 파일 삭제
	public void inspectFileDelete(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		dao.inspectFileDelete(itemInspectAdmVo);
	}
	
	// 수입검사 성적서 파일명 가져오기
	public ItemInspectAdmVo getInspectFileNm(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		return dao.getInspectFileNm(itemInspectAdmVo);
	}

	
	//발주마감 발주상태 확인
	public String statusCdCheck(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		return dao.statusCdCheck(itemInspectAdmVo);
	}
	
	//입출고관리 수정
	public void inOutWhsAdmUpdate(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		dao.inOutWhsAdmUpdate(itemInspectAdmVo);
	}
	
	
	// 수입검사 불량유형조회
	public List<ItemInspectAdmVo> itemInspectFaultyTypeList (ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		return dao.itemInspectFaultyTypeList(itemInspectAdmVo);
	}
	
	// 수입검사 불량유형조회
	public List<ItemInspectAdmVo> itemInspectFaultyTypeRead (ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		return dao.itemInspectFaultyTypeRead(itemInspectAdmVo);
	}
	
	// 수입검사 등록
	public void itemInspectFaultyTypeCreate(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		dao.itemInspectFaultyTypeCreate(itemInspectAdmVo);
	}
	
	// 수입검사 수정
	public void itemInspectFaultyTypeUpdate(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		dao.itemInspectFaultyTypeUpdate(itemInspectAdmVo);
	}
	
	// 수입검사 삭제
	public void itemInspectFaultyTypeDelete(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		dao.itemInspectFaultyTypeDelete(itemInspectAdmVo);
	}
	
	// 수입검사팝업 목록 조회 
	public List<ItemInspectAdmVo> itemInspectAdmPopUpList (ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		return dao.itemInspectAdmPopUpList(itemInspectAdmVo);
	}
	
	// 수입검사팝업(반품) 목록 조회
	public List<ItemInspectAdmVo> itemInspectReturnPopUpList (ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		return dao.itemInspectReturnPopUpList(itemInspectAdmVo);
	}
	
	// 이미지 등록
	public void itemInspectImageUpload(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		dao.itemInspectImageUpload(itemInspectAdmVo);
	}
	
	// 이미지 보여주기
	public ItemInspectAdmVo itemInspectImgRead(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		return dao.itemInspectImgRead(itemInspectAdmVo);
	}
	
	//이미지 삭제
	public void itemInspectImageDelete(ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		dao.itemInspectImageDelete(itemInspectAdmVo);
	}
	
	//******************모니터링*********************
	// 수입검사 품질경향 분석 목록조회(일별)
	public List<ItemInspectAdmVo> qualityTrendAnlyDayList (ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		return dao.qualityTrendAnlyDayList(itemInspectAdmVo);
	}
	
	// 수입검사 품질경향 분석 목록조회 
	public List<ItemInspectAdmVo> qualityTrendAnlyList (ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		return dao.qualityTrendAnlyList(itemInspectAdmVo);
	}
	
	// 수입검사 품질경향 분석 목록조회 
//	public List<ItemInspectAdmVo> qualityTrendAnlyList11 (ItemInspectAdmVo itemInspectAdmVo) throws Exception{
//		return dao.qualityTrendAnlyList11(itemInspectAdmVo);
//	}

	// 수입검사 원인별불량누적 목록조회 
	public List<ItemInspectAdmVo> faultyStatusList (ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		return dao.faultyStatusList(itemInspectAdmVo);
	}
	
	// 불량유형 개수
	public Integer faultyTypeCount (ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		return dao.faultyTypeCount(itemInspectAdmVo);
	}
	
	// 수입검사 누적 유형별 점유율 목록조회
	public List<ItemInspectAdmVo> itemInspectMonthList (ItemInspectAdmVo itemInspectAdmVo) throws Exception{
		return dao.itemInspectMonthList(itemInspectAdmVo);
	}
}
