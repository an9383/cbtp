package mes.persistence.bm;

import java.util.List;

import mes.domain.bm.ItemPrcssAdmVo;

public interface ItemPrcssAdmDAO {
	
	//공정목록 조회
	public List<ItemPrcssAdmVo> itemPrcssAdmList(ItemPrcssAdmVo itemPrcssAdmVo) throws Exception;
	
	//공정목록 등록
	public int itemPrcssAdmIns(ItemPrcssAdmVo itemPrcssAdmVo) throws Exception;
	
	//공정목록 수정
	public int itemPrcssAdmUpd(ItemPrcssAdmVo itemPrcssAdmVo) throws Exception;
	
	//공정목록 삭제
	public int itemPrcssAdmDel(ItemPrcssAdmVo itemPrcssAdmVo) throws Exception;
	
	//공정시퀀스 생성 
	public String itemPrcssSeqSel(ItemPrcssAdmVo itemPrcssAdmVo) throws Exception;

}
