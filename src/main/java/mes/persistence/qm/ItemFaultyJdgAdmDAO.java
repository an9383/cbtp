package mes.persistence.qm;

import mes.domain.qm.ItemFaultyJdgAdmVo;

public interface ItemFaultyJdgAdmDAO {

	public ItemFaultyJdgAdmVo itemFaultyJdgAdmRead(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception;
	
	public void itemFaultyJdgAdmCreate(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception;
	
	public void itemFaultyJdgAdmUpdate(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception;
	
	public void updateInOutWhsFaultyQty(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception;
	
	public ItemFaultyJdgAdmVo getInWhsQty(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception;
	
	public void updateApprovalYn(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception;
}
