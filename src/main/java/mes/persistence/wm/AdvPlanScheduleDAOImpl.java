package mes.persistence.wm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.wm.AdvPlanScheduleVo;
import mes.domain.wm.WorkStateVo;

@Repository
public class AdvPlanScheduleDAOImpl implements AdvPlanScheduleDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.wm.advPlanScheduleMapper";

	// APS 미배정된 수주목록 조회
	@Override
	public List<AdvPlanScheduleVo> advPlanScheduleNonAssignLst(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception {
		return session.selectList(namespace+".advPlanScheduleNonAssignLst", AdvPlanScheduleVo);
	}
	
	// APS 기간별 목록조회
	@Override
	public List<AdvPlanScheduleVo> advPlanScheduleLstByDate(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception {
		return session.selectList(namespace+".advPlanScheduleLstByDate", AdvPlanScheduleVo);
	}
	
	// APS 기간별 현황 목록조회
	@Override
	public List<AdvPlanScheduleVo> advPlanScheduleStatusLstByDate(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception {
		return session.selectList(namespace+".advPlanScheduleStatusLstByDate", AdvPlanScheduleVo);
	}
	
	// APS 특정일자 목록조회
	@Override
	public List<AdvPlanScheduleVo> advPlanScheduleLstOneByDate(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception {
		return session.selectList(namespace+".advPlanScheduleLstOneByDate", AdvPlanScheduleVo);
	}
	
	// APS 특정기간에 존재하는 목록조회
	@Override
	public List<AdvPlanScheduleVo> advPlanScheduleLstByStartEndDate(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception {
		return session.selectList(namespace+".advPlanScheduleLstByStartEndDate", AdvPlanScheduleVo);
	}
	
	// APS 상세조회
	@Override
	public AdvPlanScheduleVo advPlanScheduleSel(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception {
		return session.selectOne(namespace+".advPlanScheduleSel", AdvPlanScheduleVo);
	}
	
	// APS 등록
	@Override
	public void advPlanScheduleIns(List<AdvPlanScheduleVo> AdvPlanScheduleVo) throws Exception {
		session.insert(namespace+".advPlanScheduleIns", AdvPlanScheduleVo);
	}
	
	// APS 수정
	@Override
	public void advPlanScheduleUpd(List<AdvPlanScheduleVo> AdvPlanScheduleVo) throws Exception {
		session.update(namespace+".advPlanScheduleUpd", AdvPlanScheduleVo);
	}
	
	// APS 삭제
	@Override
	public void advPlanScheduleDel(AdvPlanScheduleVo AdvPlanScheduleVo) throws Exception {
		session.delete(namespace+".advPlanScheduleDel", AdvPlanScheduleVo);
	}
}