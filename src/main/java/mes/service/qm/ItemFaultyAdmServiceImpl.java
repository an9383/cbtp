package mes.service.qm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.qm.ItemFaultyAdmVo;
import mes.persistence.qm.ItemFaultyAdmDAO;

@Service
public class ItemFaultyAdmServiceImpl implements ItemFaultyAdmService {

	@Inject
	private ItemFaultyAdmDAO dao;
	
	// 부적합관리(수입검사) master list
	public List<ItemFaultyAdmVo> itemFaultyAdmMasterList(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		return dao.itemFaultyAdmMasterList(itemFaultyAdmVo);
	}
	
	// 부적합관리 목록조회
	public List<ItemFaultyAdmVo> itemFaultyAdmList(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		return dao.itemFaultyAdmList(itemFaultyAdmVo);
	}
	
	// 부적합관리 상세조회
	public ItemFaultyAdmVo itemFaultyAdmRead(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		return dao.itemFaultyAdmRead(itemFaultyAdmVo);
	}
	
	//부적합관리 등록
	public void itemFaultyAdmCreate(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		dao.itemFaultyAdmCreate(itemFaultyAdmVo);
	}
	
	//부적합관리 수정
	public void itemFaultyAdmUpdate(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		dao.itemFaultyAdmUpdate(itemFaultyAdmVo);
	}
	
	// 부적합관리 상세조회
	public ItemFaultyAdmVo itemFaultyImageList(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		return dao.itemFaultyImageList(itemFaultyAdmVo);
	}
	
	//부적합관리 이미지삭제
	public void itemFaultyImageDelete(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		dao.itemFaultyImageDelete(itemFaultyAdmVo);
	}
	
	//부적합관리 이미지삭제
	public Integer getItemFaultySeq(ItemFaultyAdmVo itemFaultyAdmVo) throws Exception{
		return dao.getItemFaultySeq(itemFaultyAdmVo);
	}
}
