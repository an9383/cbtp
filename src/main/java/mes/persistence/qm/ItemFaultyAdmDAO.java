package mes.persistence.qm;

import java.util.List;

import mes.domain.qm.ItemFaultyAdmVo;

public interface ItemFaultyAdmDAO {

	// 부적합관리 목록조회
	public List<ItemFaultyAdmVo> itemFaultyAdmMasterList(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception;
	
	// 부적합관리 목록조회
	public List<ItemFaultyAdmVo> itemFaultyAdmList(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception;
	
	// 부적합관리 상세조회
	public ItemFaultyAdmVo itemFaultyAdmRead(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception;
	
	//부적합관리 등록
	public void itemFaultyAdmCreate(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception;
	
	//부적합관리 수정
	public void itemFaultyAdmUpdate(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception;
	
	// 부적합관리 상세조회
	public ItemFaultyAdmVo itemFaultyImageList(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception;
	
	//부적합관리 이미지삭제
	public void itemFaultyImageDelete(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception;
	
	//부적합관리 이미지삭제
	public Integer getItemFaultySeq(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception;
}
