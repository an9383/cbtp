package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.FactoryCalendarVo;
import mes.domain.bm.PlanStopVo;
import mes.persistence.bm.PlanStopDAO;

@Service
public class PlanStopServiceImpl implements PlanStopService {
	
	@Inject
	private PlanStopDAO dao;
	

	//월별 계획정지 목록조회
	@Override
	public List<PlanStopVo> planStopList(PlanStopVo planStopVo) throws Exception {
		return dao.planStopList(planStopVo);
	}
	
	//월, 설비별 누적시간 조회
	@Override
	public List<PlanStopVo> planStopMonthSummaryList(PlanStopVo planStopVo) throws Exception {
		return dao.planStopMonthSummaryList(planStopVo);
	}
	
	//일, 설비별 목록 조회
	@Override
	public List<PlanStopVo> planStopDaySummaryList(PlanStopVo planStopVo) throws Exception {
		return dao.planStopDaySummaryList(planStopVo);
	}
	
	// 기간별 목록 조회
	@Override
	public List<PlanStopVo> planStopLstByDate(PlanStopVo planStopVo) throws Exception {
		return dao.planStopLstByDate(planStopVo);
	}
	
	// 기간별 목록 조회(날짜 그룹)
	@Override
	public List<PlanStopVo> planStopLstByDateGroup(PlanStopVo planStopVo) throws Exception {
		return dao.planStopLstByDateGroup(planStopVo);
	}
	
	//계획정지 등록
	@Override
	public void planStopCreate(PlanStopVo planStopVo) throws Exception {
		dao.planStopCreate(planStopVo);
	}
	
	//계획정지 수정
	@Override
	public void planStopDelete(PlanStopVo planStopVo) throws Exception {
		dao.planStopDelete(planStopVo);
	}
	
	//계획정지 리스트 등록
	@Override
	public void planStopListCreate(List<PlanStopVo> planStopVo) throws Exception {
		dao.planStopListCreate(planStopVo);
	}
}
