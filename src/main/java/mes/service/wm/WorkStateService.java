package mes.service.wm;

import java.util.List;

import mes.domain.wm.DayProdPlanAdmVo;
import mes.domain.wm.MonProdPlanAdmVo;
import mes.domain.wm.WorkStateVo;

public interface WorkStateService {

	// ================================== 기간별 생산 현황 =======================================
	// 기간별 생산 현황 목록조회
	public List<WorkStateVo> workList(WorkStateVo workStateVo) throws Exception;
	
	// 기간별 생산 현황 목록조회(봉제)
	public List<WorkStateVo> workListByBongjae(WorkStateVo workStateVo) throws Exception;
	
	// ================================== 기간별 자재사용 현황 =======================================
	// 기간별 자재사용 현황 목록조회
	public List<WorkStateVo> materialList(WorkStateVo workStateVo) throws Exception;
	
	
	// ================================== 기간별 가동 현황 =======================================
	// 기간별 비가동 현황 목록조회
	public List<WorkStateVo> uptimeList(WorkStateVo workStateVo) throws Exception;
	
	// ================================== 기간별 비가동 현황 =======================================
	// 기간별 비가동 현황 목록조회
	public List<WorkStateVo> downtimeList(WorkStateVo workStateVo) throws Exception;
	
	// ================================== 기간별 작업조건 현황 =======================================
	// 기간별 작업조건 현황 목록조회
	public List<WorkStateVo> workConditionList(WorkStateVo workStateVo) throws Exception;
}
