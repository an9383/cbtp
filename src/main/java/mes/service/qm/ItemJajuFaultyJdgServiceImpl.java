package mes.service.qm;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.qm.ItemJajuFaultyJdgAdmVo;
import mes.persistence.qm.ItemJajuFaultyJdgDAO;

@Service
public class ItemJajuFaultyJdgServiceImpl implements ItemJajuFaultyJdgService {

	@Inject
	private ItemJajuFaultyJdgDAO dao;
	
	//부적합 판정관리 상세조회
	public ItemJajuFaultyJdgAdmVo itemJajuFaultyJdgAdmRead(ItemJajuFaultyJdgAdmVo itemJajuFaultyJdgAdmVo) throws Exception{
		return dao.itemJajuFaultyJdgAdmRead(itemJajuFaultyJdgAdmVo);
	}
	
	//부적합 판정관리 등록
	public void itemJajuFaultyJdgAdmCreate(ItemJajuFaultyJdgAdmVo itemJajuFaultyJdgAdmVo) throws Exception{
		dao.itemJajuFaultyJdgAdmCreate(itemJajuFaultyJdgAdmVo);
	}
	
	//부적합 판정관리 수정
	public void itemJajuFaultyJdgAdmUpdate(ItemJajuFaultyJdgAdmVo itemJajuFaultyJdgAdmVo) throws Exception{
		dao.itemJajuFaultyJdgAdmUpdate(itemJajuFaultyJdgAdmVo);
	}
}
