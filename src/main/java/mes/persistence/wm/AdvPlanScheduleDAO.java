package mes.persistence.wm;

import java.util.List;

import mes.domain.wm.AdvPlanScheduleVo;

public interface AdvPlanScheduleDAO {

	// APS 미배정된 수주목록 조회
	public List<AdvPlanScheduleVo> advPlanScheduleNonAssignLst(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception;
	
	// APS 기간별 목록조회
	public List<AdvPlanScheduleVo> advPlanScheduleLstByDate(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception;
	
	// APS 기간별 현황 목록조회
	public List<AdvPlanScheduleVo> advPlanScheduleStatusLstByDate(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception;
	
	// APS 특정일자 목록조회
	public List<AdvPlanScheduleVo> advPlanScheduleLstOneByDate(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception;
	
	// APS 특정기간에 존재하는 목록조회
	public List<AdvPlanScheduleVo> advPlanScheduleLstByStartEndDate(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception;
	
	// APS 상세조회
	public AdvPlanScheduleVo advPlanScheduleSel(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception;
	
	// APS 등록
	public void advPlanScheduleIns(List<AdvPlanScheduleVo> AdvPlanScheduleVo) throws Exception;
	
	// APS 수정
	public void advPlanScheduleUpd(List<AdvPlanScheduleVo> AdvPlanScheduleVo) throws Exception;
	
	// APS 삭제
	public void advPlanScheduleDel(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception;
}