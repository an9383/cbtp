package mes.persistence.qm;

import mes.domain.qm.ItemCompleteFaultyJdgAdmVo;

public interface ItemCompleteFaultyJdgDAO {


	public ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmRead(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo ) throws Exception;
	
	public void itemCompleteFaultyJdgAdmCreate(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo) throws Exception;
	
	public void itemCompleteFaultyJdgAdmUpdate(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo) throws Exception;
	
	public void updateApprovalYn(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo) throws Exception;
	
}
