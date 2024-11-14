package mes.persistence.po;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.po.WorkOrderPrcssVo;
import mes.domain.po.WorkOrderVo;

@Repository
public class ReworkOrderDAOImpl implements ReworkOrderDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "mes.mappers.po.reworkOrderMapper";
	
	//재작업지시 목록 조회
	@Override
	public List<WorkOrderVo> listAll(WorkOrderVo workOrderVo) throws Exception{
		return session.selectList(namespace +".listAll",workOrderVo);
	}
	
	//재작업지시 상세 조회
	@Override
	public WorkOrderVo reworkOrdRead(WorkOrderVo workOrderVo) throws Exception{
		return session.selectOne(namespace +".reworkOrdRead",workOrderVo);
	}
	
	//작업지시 모달조회
	@Override
	public List<WorkOrderPrcssVo> reworkOrdList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return session.selectList(namespace +".reworkOrdList",workOrderPrcssVo);
	}
	
	//기존작지 업데이트
	@Override
	public void lastYnUpdate(WorkOrderVo workOrderVo) throws Exception{
		session.update(namespace +".lastYnUpdate",workOrderVo);
	}
	
	//재작업작지 수정
	@Override
	public void reworkOrdUpdate(WorkOrderVo workOrderVo) throws Exception{
		session.update(namespace +".reworkOrdUpdate",workOrderVo);
	}

}
