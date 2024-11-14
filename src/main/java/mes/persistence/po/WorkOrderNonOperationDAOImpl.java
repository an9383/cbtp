package mes.persistence.po;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.po.WorkOrderJajuInspectVo;
import mes.domain.po.WorkOrderNonOperationVo;

@Repository
public class WorkOrderNonOperationDAOImpl implements WorkOrderNonOperationDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "mes.mappers.po.workOrderNonOperationMapper";
	
	
	//비가동등록 리스트 조회
	@Override
	public List<WorkOrderNonOperationVo> workOrderNonOperationRead(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		return session.selectList(namespace+".workOrderNonOperationRead",workOrderNonOperationVo);
	}
	
	//비가동등록 생성
	@Override
	public void workOrderNonOperationCreate(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		session.insert(namespace+".workOrderNonOperationCreate",workOrderNonOperationVo);
	}
	
	//비가동등록 수정
	public void workOrderNonOperationUpdate(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception{
		session.update(namespace+".workOrderNonOperationUpdate" ,workOrderNonOperationVo );
	}
	
	
	//비가동등록 삭제
	@Override
	public void workOrderNonOperationDelete(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		session.delete(namespace+".workOrderNonOperationDelete",workOrderNonOperationVo);
	}
	
	//작업 상태 비가동으로 변경
	@Override
	public void workOrderPrcssNonOperation(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception {
		session.update(namespace+".workOrderPrcssNonOperation",workOrderNonOperationVo);
	}
	
	//비가동시간 계산
	@Override
	public String getWorkNonTime(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception{
		return session.selectOne(namespace+".getWorkNonTime" ,workOrderNonOperationVo );
	}

	//비가동 시퀀스 생성
	public String createNoSeq(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception{
		return session.selectOne(namespace+".createNoSeq" ,workOrderNonOperationVo );
	}
	
	//가동 시퀀스 가져오기
	public String getNoSeq(WorkOrderNonOperationVo workOrderNonOperationVo) throws Exception{
		return session.selectOne(namespace+".getNoSeq" ,workOrderNonOperationVo );
	}

}
