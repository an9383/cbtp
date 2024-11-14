package mes.persistence.wm;

import java.util.List;
import mes.domain.wm.WorkOrderPlanVo;

public interface WorkOrderPlanDAO {

	//해당 설비&해당날짜 주간조 조회
	public WorkOrderPlanVo searchDay(WorkOrderPlanVo Vo) throws Exception;
	
	//해당 설비&해당날짜 야간조 조회
	public WorkOrderPlanVo searchNight(WorkOrderPlanVo Vo) throws Exception;
	
	//해당 설비&해당날짜 작업지시 등록
	public void create(WorkOrderPlanVo Vo) throws Exception;
	
	//해당 설비&해당날짜 작업지시 수정
	public void update(WorkOrderPlanVo Vo) throws Exception;
	
}
