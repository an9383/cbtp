package mes.service.wm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.wm.AdvPlanScheduleVo;
import mes.persistence.wm.AdvPlanScheduleDAO;

@Service
public class AdvPlanScheduleServiceImpl implements AdvPlanScheduleService {

	@Inject
	private AdvPlanScheduleDAO dao;
	
	// APS 미배정된 수주목록 조회
	@Override
	public List<AdvPlanScheduleVo> advPlanScheduleNonAssignLst(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception {
		return dao.advPlanScheduleNonAssignLst(AdvPlanScheduleVo);
	}
	
	// APS 기간별 목록조회
	@Override
	public List<AdvPlanScheduleVo> advPlanScheduleLstByDate(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception {
		return dao.advPlanScheduleLstByDate(AdvPlanScheduleVo);
	}
	
	// APS 기간별 현황 목록조회
	@Override
	public List<AdvPlanScheduleVo> advPlanScheduleStatusLstByDate(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception {
		return dao.advPlanScheduleStatusLstByDate(AdvPlanScheduleVo);
	}
	
	// APS 특정일자 목록조회
	@Override
	public List<AdvPlanScheduleVo> advPlanScheduleLstOneByDate(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception {
		return dao.advPlanScheduleLstOneByDate(AdvPlanScheduleVo);
	}
	
	// APS 특정기간에 존재하는 목록조회
	@Override
	public List<AdvPlanScheduleVo> advPlanScheduleLstByStartEndDate(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception {
		return dao.advPlanScheduleLstByStartEndDate(AdvPlanScheduleVo);
	}
	
	// APS 상세조회
	@Override
	public AdvPlanScheduleVo advPlanScheduleSel(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception {
		return dao.advPlanScheduleSel(AdvPlanScheduleVo);
	}
	
	// APS 등록
	@Override
	public void advPlanScheduleIns(List<AdvPlanScheduleVo> AdvPlanScheduleVo) throws Exception {
		dao.advPlanScheduleIns(AdvPlanScheduleVo);
	}
	
	// APS 수정
	@Override
	public void advPlanScheduleUpd(List<AdvPlanScheduleVo> AdvPlanScheduleVo) throws Exception {
		dao.advPlanScheduleUpd(AdvPlanScheduleVo);
	}
	
	// APS 삭제
	@Override
	public void advPlanScheduleDel(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception {
		dao.advPlanScheduleDel(AdvPlanScheduleVo);
	}
}
