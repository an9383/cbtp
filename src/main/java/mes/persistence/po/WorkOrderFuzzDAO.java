package mes.persistence.po;

import java.util.List;

import mes.domain.po.WorkOrderFuzzVo;

public interface WorkOrderFuzzDAO {
	
	//퍼징기록일지 조회
	public List<WorkOrderFuzzVo> workOrderFuzzList(WorkOrderFuzzVo workOrderFuzzVo) throws Exception;
	
	//퍼징기록일지 조회
	public WorkOrderFuzzVo workOrderFuzzRead(WorkOrderFuzzVo workOrderFuzzVo) throws Exception;
	
	//퍼징기록일지 등록
	public void workOrderFuzzCreate(WorkOrderFuzzVo workOrderFuzzVo) throws Exception;
	
	//퍼징기록일지 수정
	public void workOrderFuzzUpdate(WorkOrderFuzzVo workOrderFuzzVo) throws Exception;
	
	//퍼징기록일지 삭제
	public void workOrderFuzzDelete(WorkOrderFuzzVo workOrderFuzzVo) throws Exception;
	
	//총 퍼징횟수
	public String getTotalFuzzCnt(WorkOrderFuzzVo workOrderFuzzVo) throws Exception;
	
	
	//퍼징/런너 이력관리 조회
	public List<WorkOrderFuzzVo> frHistAdmList(WorkOrderFuzzVo workOrderFuzzVo) throws Exception;
	
	//퍼징/런너 이력관리 조회
	public WorkOrderFuzzVo frHistAdmRead(WorkOrderFuzzVo workOrderFuzzVo) throws Exception;
	
	//퍼징/런너 이력관리 등록
	public void frHistAdmCreate(WorkOrderFuzzVo workOrderFuzzVo) throws Exception;
	
	//퍼징/런너 이력관리 수정
	public void frHistAdmUpdate(WorkOrderFuzzVo workOrderFuzzVo) throws Exception;
	
	//퍼징/런너 이력관리 삭제
	public void frHistAdmDelete(WorkOrderFuzzVo workOrderFuzzVo) throws Exception;

	//퍼징/런너 이력관리번호 생성
	public String getFrHistNo(WorkOrderFuzzVo workOrderFuzzVo) throws Exception;

	//퍼징/런너 이력관리 차수 생성
	public int getFrHistSq(WorkOrderFuzzVo workOrderFuzzVo) throws Exception;
}
