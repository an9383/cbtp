package mes.service.bm;

import java.util.List;

import mes.domain.bm.FactoryCalendarVo;
import mes.domain.bm.PlanStopVo;

public interface PlanStopService {

	//월별 계획정지 목록조회
	public List<PlanStopVo> planStopList(PlanStopVo planStopVo) throws Exception;
	
	//월, 설비별 누적시간 조회
	public List<PlanStopVo> planStopMonthSummaryList(PlanStopVo planStopVo) throws Exception;
	
	//일, 설비별 목록 조회
	public List<PlanStopVo> planStopDaySummaryList(PlanStopVo planStopVo) throws Exception;
	
	// 기간별 목록 조회
	public List<PlanStopVo> planStopLstByDate(PlanStopVo planStopVo) throws Exception;
	
	// 기간별 목록 조회(날짜 그룹)
	public List<PlanStopVo> planStopLstByDateGroup(PlanStopVo planStopVo) throws Exception;
	
	//계획정지 등록
	public void planStopCreate(PlanStopVo planStopVo) throws Exception;
	
	//계획정지 수정
	public void planStopDelete(PlanStopVo planStopVo) throws Exception;
	
	//계획정지 리스트 등록
	public void planStopListCreate(List<PlanStopVo> planStopVo) throws Exception;
}
