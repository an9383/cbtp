package mes.service.qm;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.qm.ItemCompleteFaultyJdgAdmVo;
import mes.persistence.qm.ItemCompleteFaultyJdgDAO;

@Service
public class ItemCompleteFaultyJdgServiceImpl implements ItemCompleteFaultyJdgService {

	@Inject
	private ItemCompleteFaultyJdgDAO dao;
	
	
	public ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmRead(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo ) throws Exception{
		return dao.itemCompleteFaultyJdgAdmRead(itemCompleteFaultyJdgAdmVo);
	}
	
	public void itemCompleteFaultyJdgAdmCreate(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo) throws Exception{
		dao.itemCompleteFaultyJdgAdmCreate(itemCompleteFaultyJdgAdmVo);
	}
	
	public void itemCompleteFaultyJdgAdmUpdate(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo) throws Exception{
		dao.itemCompleteFaultyJdgAdmUpdate(itemCompleteFaultyJdgAdmVo);
	}
	
	public void updateApprovalYn(ItemCompleteFaultyJdgAdmVo itemCompleteFaultyJdgAdmVo) throws Exception{
		dao.updateApprovalYn(itemCompleteFaultyJdgAdmVo);
	}
}
