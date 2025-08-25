package mes.service.qm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.qm.ItemCompleteAdmVo;
import mes.persistence.qm.ItemCompleteFaultyDAO;

@Service
public class ItemCompleteFaultyServiceImpl implements ItemCompleteFaultyService {

	@Inject
	private ItemCompleteFaultyDAO dao;
	
	
	// 완제품관리(부적합) master list
	public List<ItemCompleteAdmVo> itemCompleteAdmMasterList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return dao.itemCompleteAdmMasterList(itemCompleteAdmVo);
	}
	
	// 완제품관리(부적합) 목록조회
	public List<ItemCompleteAdmVo> itemCompleteAdmDetailList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return dao.itemCompleteAdmDetailList(itemCompleteAdmVo);
	}
	
	
	// 완제품관리(부적합) 목록조회
	@Override
	public List<ItemCompleteAdmVo> listAll(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return dao.listAll(itemCompleteAdmVo);
	}
	
	// 완제품관리(부적합) 상세조회
	@Override
	public ItemCompleteAdmVo read(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return dao.read(itemCompleteAdmVo);
	}
	
	// 완제품관리(부적합) 이미지리스트
	@Override
	public ItemCompleteAdmVo itemCompleteFaultyImageList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return dao.itemCompleteFaultyImageList(itemCompleteAdmVo);
	}
	
	// 완제품관리(부적합)생성
	@Override
	public void create(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		dao.create(itemCompleteAdmVo);
	}
	
	// 완제품관리(부적합) 수정
	@Override
	public void update(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		dao.update(itemCompleteAdmVo);
	}
	
	// 완제품관리(부적합) 이미지 삭제
	@Override
	public void itemCompleteFaultyImageDelete(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		dao.itemCompleteFaultyImageDelete(itemCompleteAdmVo);
	}
	
}
