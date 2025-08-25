package mes.persistence.wm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.wm.WorkStateVo;

@Repository
public class WorkStateDAOImpl implements WorkStateDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.wm.workStateMapper";
	
	// ================================== 기간별 생산 현황 =======================================
	// 기간별 생산 현황 목록조회
	@Override
	public List<WorkStateVo> workList(WorkStateVo workStateVo) throws Exception {
		return session.selectList(namespace+".workList", workStateVo);
	}

	// 기간별 생산 현황 목록조회(봉제)
	public List<WorkStateVo> workListByBongjae(WorkStateVo workStateVo) throws Exception{
		return session.selectList(namespace+".workListByBongjae",workStateVo);
	}
	
	// ================================== 기간별 자재사용 현황 =======================================
	// 기간별 자재사용 현황 목록조회
	@Override
	public List<WorkStateVo> materialList(WorkStateVo workStateVo) throws Exception {
		return session.selectList(namespace+".materialList", workStateVo);
	}
	
	// ================================== 기간별 가동 현황 =======================================
	// 기간별 비가동 현황 목록조회
	public List<WorkStateVo> uptimeList(WorkStateVo workStateVo) throws Exception{
		return session.selectList(namespace+".uptimeList",workStateVo);
		
	}
	
	
	// ================================== 기간별 비가동 현황 =======================================
	// 기간별 비가동 현황 목록조회
	@Override
	public List<WorkStateVo> downtimeList(WorkStateVo workStateVo) throws Exception {
		return session.selectList(namespace+".downtimeList", workStateVo);
	}
	
	// ================================== 기간별 작업조건 현황 =======================================
	// 기간별 작업조건 현황 목록조회
	@Override
	public List<WorkStateVo> workConditionList(WorkStateVo workStateVo) throws Exception {
		return session.selectList(namespace+".workConditionList", workStateVo);
	}
}