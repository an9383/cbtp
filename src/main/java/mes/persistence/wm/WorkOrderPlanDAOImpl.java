package mes.persistence.wm;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import mes.domain.wm.WorkOrderPlanVo;

@Repository
public class WorkOrderPlanDAOImpl implements WorkOrderPlanDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.wm.workOrderPlanMapper";
	
	//해당 설비&해당날짜 주간조 조회
	@Override
	public WorkOrderPlanVo searchDay(WorkOrderPlanVo Vo) throws Exception{
		return session.selectOne(namespace+".searchDay", Vo);
	}
	
	//해당 설비&해당날짜 야간조 조회
	@Override
	public WorkOrderPlanVo searchNight(WorkOrderPlanVo Vo) throws Exception{
		return session.selectOne(namespace+".searchNight", Vo);
	}

	//해당 설비&해당날짜 작업지시 등록
	@Override
	public void create(WorkOrderPlanVo Vo) throws Exception{
		session.insert(namespace+".create", Vo);
	}
	
	//해당 설비&해당날짜 작업지시 수정
	@Override
	public void update(WorkOrderPlanVo Vo) throws Exception{
		session.update(namespace+".update", Vo);
	}
	

}