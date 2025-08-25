package mes.persistence.po;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.po.WorkOrderFaultyTypeVo;
import mes.domain.po.WorkOrderMatrlVo;

@Repository
public class WorkOrderFaultyTypeDAOImpl implements WorkOrderFaultyTypeDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "mes.mappers.po.workOrderFaultyTypeMapper";
	
	//작업지시 공정별 불량유형 목록조회
	@Override
	public List<WorkOrderFaultyTypeVo> listAll(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception{
		return session.selectList(namespace+".listAll" ,workOrderFaultyTypeVo);
	}
	
	//작업지시 공정별 불량유형 생성(list)
	@Override
	public void createList(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception{
		session.insert(namespace+".createList" ,workOrderFaultyTypeVo);
	}
	
	//작업지시 공정별 불량유형 수정
	@Override
	public void update(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception{
		session.update(namespace+".update" ,workOrderFaultyTypeVo);
	}
	
	//작업지시 공정별 불량유형 초기화
	@Override
	public void deleteAll(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception{
		session.delete(namespace+".deleteAll" ,workOrderFaultyTypeVo);
	}
	
	//작업지시 공정별 불량유형 승인등록
	public void approvalUpdate(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception{
		session.update(namespace+".approvalUpdate" , workOrderFaultyTypeVo);
	}
	
	//불량코드별 불량수량 합계
	public int getFaultyTypeSumQty(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception{
		return session.selectOne(namespace+".getFaultyTypeSumQty" , workOrderFaultyTypeVo);
	}
	
	//불량등록 조회
	@Override
	public List<WorkOrderFaultyTypeVo> workOrderFaultyList(WorkOrderFaultyTypeVo workOrderFaultyTypeVo) throws Exception{
		return session.selectList(namespace + ".workOrderFaultyList", workOrderFaultyTypeVo);
	}
	
}
