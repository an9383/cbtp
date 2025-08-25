package mes.persistence.po;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.po.WorkOrderFuzzVo;


@Repository
public class WorkOrderFuzzDAOImpl implements WorkOrderFuzzDAO {
	
	private static final String namespace = "mes.mappers.po.workOrderFuzzMapper";
	
	@Inject
	private SqlSession session;
	
	//퍼징기록일지 조회
	public List<WorkOrderFuzzVo> workOrderFuzzList(WorkOrderFuzzVo workOrderFuzzVo) throws Exception{
		return session.selectList(namespace+".workOrderFuzzList" ,workOrderFuzzVo );
	}
	
	//퍼징기록일지 조회
	public WorkOrderFuzzVo workOrderFuzzRead(WorkOrderFuzzVo workOrderFuzzVo) throws Exception{
		return session.selectOne(namespace+".workOrderFuzzRead",workOrderFuzzVo);
	}
	
	//퍼징기록일지 등록
	public void workOrderFuzzCreate(WorkOrderFuzzVo workOrderFuzzVo) throws Exception{
		session.insert(namespace+".workOrderFuzzCreate" , workOrderFuzzVo);
	}
	
	//퍼징기록일지 수정
	public void workOrderFuzzUpdate(WorkOrderFuzzVo workOrderFuzzVo) throws Exception{
		session.update(namespace+".workOrderFuzzUpdate",workOrderFuzzVo);
	}
	
	//퍼징기록일지 삭제
	public void workOrderFuzzDelete(WorkOrderFuzzVo workOrderFuzzVo) throws Exception{
		session.delete(namespace+".workOrderFuzzDelete" ,workOrderFuzzVo );
	}
	
	//총 퍼징횟수
	public String getTotalFuzzCnt(WorkOrderFuzzVo workOrderFuzzVo) throws Exception{
		return session.selectOne(namespace+".getTotalFuzzCnt" , workOrderFuzzVo);
	}
	//퍼징/런너 이력관리 조회
	public List<WorkOrderFuzzVo> frHistAdmList(WorkOrderFuzzVo workOrderFuzzVo) throws Exception{
		return session.selectList(namespace+".frHistAdmList" , workOrderFuzzVo);
	}
	
	//퍼징/런너 이력관리 조회
	public WorkOrderFuzzVo frHistAdmRead(WorkOrderFuzzVo workOrderFuzzVo) throws Exception{
		return session.selectOne(namespace+".frHistAdmRead" , workOrderFuzzVo);
	}
	
	//퍼징/런너 이력관리 등록
	public void frHistAdmCreate(WorkOrderFuzzVo workOrderFuzzVo) throws Exception{
		session.insert(namespace+".frHistAdmCreate" , workOrderFuzzVo);
	}
	
	//퍼징/런너 이력관리 수정
	public void frHistAdmUpdate(WorkOrderFuzzVo workOrderFuzzVo) throws Exception{
		session.update(namespace+".frHistAdmUpdate",workOrderFuzzVo);
	}
	
	//퍼징/런너 이력관리 삭제
	public void frHistAdmDelete(WorkOrderFuzzVo workOrderFuzzVo) throws Exception{
		session.delete(namespace+".frHistAdmDelete" , workOrderFuzzVo);
	}

	//퍼징/런너 이력관리번호 생성
	public String getFrHistNo(WorkOrderFuzzVo workOrderFuzzVo) throws Exception{
		return session.selectOne(namespace+".getFrHistNo" , workOrderFuzzVo);
	}

	//퍼징/런너 이력관리 차수 생성
	public int getFrHistSq(WorkOrderFuzzVo workOrderFuzzVo) throws Exception{
		return session.selectOne(namespace+".getFrHistSq" , workOrderFuzzVo);
	}
}
