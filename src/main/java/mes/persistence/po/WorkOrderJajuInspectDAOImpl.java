package mes.persistence.po;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.po.WorkOrderJajuInspectVo;
import mes.domain.po.WorkOrderVo;

@Repository
public class WorkOrderJajuInspectDAOImpl implements WorkOrderJajuInspectDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "mes.mappers.po.workOrderJajuInspectMapper";
	
	
	//자주검사 리스트 조회
	@Override
	public List<WorkOrderJajuInspectVo> workOrderJajuInspectRead(WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception {
		return session.selectList(namespace+".workOrderJajuInspectRead",workOrderJajuInspectVo);
	}
	
	//기준정보의 자주검사 관리항목 조회
	@Override
	public List<WorkOrderJajuInspectVo> jajuInspectRead(WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception {
		return session.selectList(namespace+".jajuInspectRead",workOrderJajuInspectVo);
	}
	
	//자주검사가 존재하는지 확인
	@Override
	public int existWorkOrderJajuInspect(WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception {
		return session.selectOne(namespace+".existWorkOrderJajuInspect",workOrderJajuInspectVo);
	}

	//작업지시 생성
	@Override
	public void workOrderJajuInspectCreate(WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception {
		session.insert(namespace+".workOrderJajuInspectCreate",workOrderJajuInspectVo);
	}
	
	//작업지시 삭제
	@Override
	public void workOrderJajuInspectDelete(WorkOrderJajuInspectVo workOrderJajuInspectVo) throws Exception {
		session.delete(namespace+".workOrderJajuInspectDelete",workOrderJajuInspectVo);
	}

}
