package mes.service.qm;

import java.util.List;

import mes.domain.qm.ItemPrcssCompleteAdmVo;

public interface ItemPrcssCompleteAdmService {

	// 공정검사 목록조회
	public List<ItemPrcssCompleteAdmVo> listAll(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception;
	
	// 공정검사 목록조회(봉제)
	public List<ItemPrcssCompleteAdmVo> listAllByBongjae(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception;
	
	// 공정검사 상세조회
	public ItemPrcssCompleteAdmVo read(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception;
	
	// 공정검사 생성
	public void create(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception;
	
	// 공정검사 수정
	public void update(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception;
	
	// 공정검사 삭제
	public void delete(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception;
	
	// 공정검사 원재료 목록조회
	public List<ItemPrcssCompleteAdmVo> matrlList(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception;
	
	// 자주검사 목록조회
	public List<ItemPrcssCompleteAdmVo> jajuList(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception;
	
	// 기간별 검사결과 조회(자주검사/공정검사) 목록조회
	public List<ItemPrcssCompleteAdmVo> testResultList(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception;
}
