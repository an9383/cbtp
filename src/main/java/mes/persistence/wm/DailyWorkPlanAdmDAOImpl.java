package mes.persistence.wm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.wm.DailyWorkPlanAdmVo;

@Repository
public class DailyWorkPlanAdmDAOImpl implements DailyWorkPlanAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.wm.dailyWorkPlanAdmMapper";
	
	//일일작업계획 상세조회
	public List<DailyWorkPlanAdmVo> dailyWorkPlanAdmRead(DailyWorkPlanAdmVo dailyWorkPlanAdmVo) throws Exception{
		return session.selectList(namespace+".dailyWorkPlanAdmRead" ,dailyWorkPlanAdmVo);
	}

	//일일작업계획 등록
	public void dailyWorkPlanAdmCreate(DailyWorkPlanAdmVo dailyWorkPlanAdmVo) throws Exception{
		session.insert(namespace+".dailyWorkPlanAdmCreate" ,dailyWorkPlanAdmVo);
	}
	
	//일일작업계획 삭제
	public void dailyWorkPlanAdmDelete(DailyWorkPlanAdmVo dailyWorkPlanAdmVo) throws Exception{
		 session.delete(namespace+".dailyWorkPlanAdmDelete" ,dailyWorkPlanAdmVo);
	}
}
