package mes.service.wm;

import java.util.List;

import mes.domain.wm.DailyWorkPlanAdmVo;

public interface DailyWorkPlanAdmService {

	//일일작업계획 상세조회
	public List<DailyWorkPlanAdmVo> dailyWorkPlanAdmRead(DailyWorkPlanAdmVo dailyWorkPlanAdmVo) throws Exception;

	//일일작업계획 등록
	public void dailyWorkPlanAdmCreate(DailyWorkPlanAdmVo dailyWorkPlanAdmVo) throws Exception;
	
	//일일작업계획 삭제
	public void dailyWorkPlanAdmDelete(DailyWorkPlanAdmVo dailyWorkPlanAdmVo) throws Exception;

}
