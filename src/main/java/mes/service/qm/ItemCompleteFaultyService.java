package mes.service.qm;

import java.util.List;

import mes.domain.qm.ItemCompleteAdmVo;

public interface ItemCompleteFaultyService {

	// 완제품관리(부적합) master list
	public List<ItemCompleteAdmVo> itemCompleteAdmMasterList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리(부적합) 목록조회
	public List<ItemCompleteAdmVo> itemCompleteAdmDetailList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리(부적합) 목록조회
	public List<ItemCompleteAdmVo> listAll(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리(부적합) 상세조회
	public ItemCompleteAdmVo read(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리(부적합) 이미지리스트
	public ItemCompleteAdmVo itemCompleteFaultyImageList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리(부적합)생성
	public void create(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
	// 완제품관리(부적합) 수정
	public void update(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;	
	
	// 완제품관리(부적합) 이미지 삭제
	public void itemCompleteFaultyImageDelete(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception;
	
}
