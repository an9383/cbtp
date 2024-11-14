package mes.service.qm;

import mes.domain.qm.ItemCompleteFaultyJdgAdmVo;

public interface ItemCompleteFaultyJdgService {

	public ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmRead(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo ) throws Exception;
	
	public void itemCompleteFaultyJdgAdmCreate(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo) throws Exception;
	
	public void itemCompleteFaultyJdgAdmUpdate(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo) throws Exception;
	
	public void updateApprovalYn(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo) throws Exception;
}
