package mes.service.qm;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.qm.ItemFaultyJdgAdmVo;
import mes.persistence.qm.ItemFaultyJdgAdmDAO;

@Service
public class ItemFaultyJdgAdmServiceImpl implements ItemFaultyJdgAdmService {

	@Inject
	private ItemFaultyJdgAdmDAO dao;
	
	public ItemFaultyJdgAdmVo itemFaultyJdgAdmRead(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception{
		return dao.itemFaultyJdgAdmRead(itemFaultyJdgAdmVo);
	}
		
	public void itemFaultyJdgAdmCreate(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception{
		dao.itemFaultyJdgAdmCreate(itemFaultyJdgAdmVo);
	}

	public void itemFaultyJdgAdmUpdate(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception{
		dao.itemFaultyJdgAdmUpdate(itemFaultyJdgAdmVo);
	}
	
	public void updateInOutWhsFaultyQty(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception{
		dao.updateInOutWhsFaultyQty(itemFaultyJdgAdmVo);
	}
	
	
	public ItemFaultyJdgAdmVo getInWhsQty(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception{
		return dao.getInWhsQty(itemFaultyJdgAdmVo);
	}
	
	public void updateApprovalYn(ItemFaultyJdgAdmVo itemFaultyJdgAdmVo) throws Exception{
		dao.updateApprovalYn(itemFaultyJdgAdmVo);
	}
}
