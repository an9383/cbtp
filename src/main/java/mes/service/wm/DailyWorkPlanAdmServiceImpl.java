package mes.service.wm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.wm.DailyWorkPlanAdmVo;
import mes.persistence.wm.DailyWorkPlanAdmDAO;

@Service
public class DailyWorkPlanAdmServiceImpl implements DailyWorkPlanAdmService {
	
	@Inject
	private DailyWorkPlanAdmDAO dao;
	
	//일일작업계획 상세조회
	public List<DailyWorkPlanAdmVo> dailyWorkPlanAdmRead(DailyWorkPlanAdmVo dailyWorkPlanAdmVo) throws Exception{
		return dao.dailyWorkPlanAdmRead(dailyWorkPlanAdmVo);
	}
	//일일작업계획 등록
	public void dailyWorkPlanAdmCreate(DailyWorkPlanAdmVo dailyWorkPlanAdmVo) throws Exception{
		dao.dailyWorkPlanAdmCreate(dailyWorkPlanAdmVo);
	}
	
	//일일작업계획 삭제
	public void dailyWorkPlanAdmDelete(DailyWorkPlanAdmVo dailyWorkPlanAdmVo) throws Exception{
		dao.dailyWorkPlanAdmDelete(dailyWorkPlanAdmVo);
	}

}
