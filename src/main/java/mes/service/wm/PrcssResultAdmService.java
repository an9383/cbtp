package mes.service.wm;

import java.util.List;

import mes.domain.wm.DailyWorkPlanAdmVo;
import mes.domain.wm.PrcssResultAdmVo;

public interface PrcssResultAdmService {

	//Read
	public PrcssResultAdmVo prcssResultAdmRead(PrcssResultAdmVo prcssResultAdmVo) throws Exception;

	//Create
	public void prcssResultAdmCreate(PrcssResultAdmVo prcssResultAdmVo) throws Exception;

	//Update
	public void prcssResultAdmUpdate(PrcssResultAdmVo prcssResultAdmVo) throws Exception;
	
}
