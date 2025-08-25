package mes.service.qm;

import mes.domain.qm.ItemJajuFaultyJdgAdmVo;

public interface ItemJajuFaultyJdgService {

	//부적합 판정관리 상세조회
	public ItemJajuFaultyJdgAdmVo itemJajuFaultyJdgAdmRead(ItemJajuFaultyJdgAdmVo itemJajuFaultyJdgAdmVo) throws Exception;
	
	//부적합 판정관리 등록
	public void itemJajuFaultyJdgAdmCreate(ItemJajuFaultyJdgAdmVo itemJajuFaultyJdgAdmVo) throws Exception;
	
	//부적합 판정관리 수정
	public void itemJajuFaultyJdgAdmUpdate(ItemJajuFaultyJdgAdmVo itemJajuFaultyJdgAdmVo) throws Exception;
}
