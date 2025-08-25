package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.ItemPrcssAdmVo;
import mes.persistence.bm.ItemPrcssAdmDAO;

@Service
public class ItemPrcssAdmServiceImpl implements ItemPrcssAdmService {

	@Inject
	private ItemPrcssAdmDAO dao;
	
	//공정목록 조회
	public List<ItemPrcssAdmVo> itemPrcssAdmList(ItemPrcssAdmVo itemPrcssAdmVo) throws Exception{
		return dao.itemPrcssAdmList(itemPrcssAdmVo);
	}
	
	//공정목록 등록
	public int itemPrcssAdmIns(ItemPrcssAdmVo itemPrcssAdmVo) throws Exception{
		return dao.itemPrcssAdmIns(itemPrcssAdmVo);	
	}
	
	//공정목록 수정
	public int itemPrcssAdmUpd(ItemPrcssAdmVo itemPrcssAdmVo) throws Exception{
		return dao.itemPrcssAdmUpd(itemPrcssAdmVo);	
	}
	
	//공정목록 삭제
	public int itemPrcssAdmDel(ItemPrcssAdmVo itemPrcssAdmVo) throws Exception{
		return dao.itemPrcssAdmDel(itemPrcssAdmVo);	
	}
	
	//공정시퀀스 생성 
	public String itemPrcssSeqSel(ItemPrcssAdmVo itemPrcssAdmVo) throws Exception{
		return dao.itemPrcssSeqSel(itemPrcssAdmVo);
	}
}
