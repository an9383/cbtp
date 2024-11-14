package mes.persistence.po;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.po.WorkOrderResultVo;

@Repository
public class WorkOrderResultDAOImpl implements WorkOrderResultDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "mes.mappers.po.workOrderResultMapper";
	
	//작업지시 목록조회
	@Override
	public List<WorkOrderResultVo> listAll(WorkOrderResultVo workOrderResultVo) throws Exception{
		return session.selectList(namespace+".listAll", workOrderResultVo);
	}
}