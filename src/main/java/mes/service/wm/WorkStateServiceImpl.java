package mes.service.wm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.wm.WorkStateVo;
import mes.persistence.wm.WorkStateDAO;

@Service
public class WorkStateServiceImpl implements WorkStateService {

	@Inject
	private WorkStateDAO dao;
	
	// ================================== 기간별 생산 현황 =======================================
	// 기간별 생산 현황 목록조회
	@Override
	public List<WorkStateVo> workList(WorkStateVo workStateVo) throws Exception {
		return dao.workList(workStateVo);
	}
	
	// 기간별 생산 현황 목록조회(봉제)
	public List<WorkStateVo> workListByBongjae(WorkStateVo workStateVo) throws Exception{
		return dao.workListByBongjae(workStateVo);
	}
	
	// ================================== 기간별 자재사용 현황 =======================================
	// 기간별 자재사용 현황 목록조회
	@Override
	public List<WorkStateVo> materialList(WorkStateVo workStateVo) throws Exception {
		return dao.materialList(workStateVo);
	}
	
	
	// ================================== 기간별 가동 현황 =======================================
	// 기간별 비가동 현황 목록조회
	public List<WorkStateVo> uptimeList(WorkStateVo workStateVo) throws Exception{
		return dao.uptimeList(workStateVo);
	}
	
	
	// ================================== 기간별 비가동 현황 =======================================
	// 기간별 비가동 현황 목록조회
	@Override
	public List<WorkStateVo> downtimeList(WorkStateVo workStateVo) throws Exception {
		return dao.downtimeList(workStateVo);
	}
	
	// ================================== 기간별 작업조건 현황 =======================================
	// 기간별 작업조건 현황 목록조회
	@Override
	public List<WorkStateVo> workConditionList(WorkStateVo workStateVo) throws Exception {
		return dao.workConditionList(workStateVo);
	}
}
