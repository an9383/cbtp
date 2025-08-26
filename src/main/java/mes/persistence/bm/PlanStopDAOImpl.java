package mes.persistence.bm;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mes.domain.bm.FactoryCalendarVo;
import mes.domain.bm.PlanStopVo;

@Repository
public class PlanStopDAOImpl implements PlanStopDAO {

	@Autowired @Resource(name="sqlSession")
	private SqlSession session;

	private static final String namespace = "mes.mapper.bm.planStopMapper";
	
	//월별 계획정지 목록조회
	@Override
	public List<PlanStopVo> planStopList(PlanStopVo planStopVo) throws Exception {
		return session.selectList(namespace + ".planStopList", planStopVo);		
	}
	
	//월, 설비별 누적시간 조회
	@Override
	public List<PlanStopVo> planStopMonthSummaryList(PlanStopVo planStopVo) throws Exception {
		return session.selectList(namespace + ".planStopMonthSummaryList", planStopVo);		
	}
	
	//일, 설비별 목록 조회
	@Override
	public List<PlanStopVo> planStopDaySummaryList(PlanStopVo planStopVo) throws Exception {
		return session.selectList(namespace + ".planStopDaySummaryList", planStopVo);		
	}
	
	// 기간별 목록 조회
	@Override
	public List<PlanStopVo> planStopLstByDate(PlanStopVo planStopVo) throws Exception {
		return session.selectList(namespace + ".planStopLstByDate", planStopVo);		
	}
	
	// 기간별 목록 조회(날짜 그룹)
	@Override
	public List<PlanStopVo> planStopLstByDateGroup(PlanStopVo planStopVo) throws Exception {
		return session.selectList(namespace + ".planStopLstByDateGroup", planStopVo);		
	}
	
	//계획정지 등록
	@Override
	public void planStopCreate(PlanStopVo planStopVo) throws Exception {
		session.insert(namespace + ".planStopCreate", planStopVo);
	}
	
	//계획정지 수정
	@Override
	public void planStopDelete(PlanStopVo planStopVo) throws Exception {
		session.delete(namespace + ".planStopDelete", planStopVo);
	}
	
	//계획정지 리스트 등록
	@Override
	public void planStopListCreate(List<PlanStopVo> planStopVo) throws Exception {
		session.insert(namespace + ".planStopListCreate", planStopVo);
	}
}