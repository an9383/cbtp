package mes.persistence.po;

import java.util.List;

import mes.domain.po.WorkOrderEquipDailyCheckVo;

public interface WorkOrderEquipDailyCheckDAO {
	
	//일상점검 목록조회
	public List<WorkOrderEquipDailyCheckVo> listAll(WorkOrderEquipDailyCheckVo checkVo)throws Exception;
	
	//일상점검 상세조회
	public WorkOrderEquipDailyCheckVo read(WorkOrderEquipDailyCheckVo checkVo)throws Exception;
	
	//일상점검 설비별 목록조회
	public List<WorkOrderEquipDailyCheckVo> workOrderEquipDailyCheckByEquipCd(WorkOrderEquipDailyCheckVo checkVo)throws Exception;
	
	//일상점검 총 점검
	public WorkOrderEquipDailyCheckVo getTotalPass(WorkOrderEquipDailyCheckVo checkVo)throws Exception;
	
	//일상점검 등록
	public void create(WorkOrderEquipDailyCheckVo checkVo)throws Exception;
	
	//일상점검 수정
	public void update(WorkOrderEquipDailyCheckVo checkVo)throws Exception;
	
	//일상점검 삭제
	public void delete(WorkOrderEquipDailyCheckVo checkVo)throws Exception;
	
	//일상점검번호 생성
	public String getDcNo(WorkOrderEquipDailyCheckVo checkVo)throws Exception;
	
}
