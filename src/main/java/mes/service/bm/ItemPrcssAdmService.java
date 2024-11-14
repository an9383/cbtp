package mes.service.bm;

import java.util.List;

import mes.domain.bm.ItemPrcssAdmVo;

public interface ItemPrcssAdmService {

	//공정목록 조회
	public List<ItemPrcssAdmVo> itemPrcssAdmList(ItemPrcssAdmVo vo) throws Exception;
	
	//공정목록 등록
	public int itemPrcssAdmIns(ItemPrcssAdmVo vo) throws Exception;
	
	//공정목록 수정
	public int itemPrcssAdmUpd(ItemPrcssAdmVo vo) throws Exception;
	
	//공정목록 삭제
	public int itemPrcssAdmDel(ItemPrcssAdmVo vo) throws Exception;
	
	//공정시퀀스 생성 
	public String itemPrcssSeqSel(ItemPrcssAdmVo itemPrcssAdmVo) throws Exception;
}
