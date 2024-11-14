package mes.service.wm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.wm.DailyWorkPlanAdmVo;
import mes.domain.wm.PrcssResultAdmVo;
import mes.persistence.wm.DailyWorkPlanAdmDAO;
import mes.persistence.wm.PrcssResultAdmDAO;

@Service
public class PrcssResultAdmServiceImpl implements PrcssResultAdmService {
	
	@Inject
	private PrcssResultAdmDAO dao;
	
	//Read
	@Override
	public PrcssResultAdmVo prcssResultAdmRead(PrcssResultAdmVo prcssResultAdmVo) throws Exception {
	    return dao.prcssResultAdmRead(prcssResultAdmVo);
	}

	//Create
	@Override
	public void prcssResultAdmCreate(PrcssResultAdmVo prcssResultAdmVo) throws Exception {
	    dao.prcssResultAdmCreate(prcssResultAdmVo);
	}

	//Update
	@Override
	public void prcssResultAdmUpdate(PrcssResultAdmVo prcssResultAdmVo) throws Exception {
	    dao.prcssResultAdmUpdate(prcssResultAdmVo);
	}
	
}
