package mes.service.po;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.po.WorkOrderEquipDailyCheckVo;
import mes.persistence.po.WorkOrderEquipDailyCheckDAO;

@Service
public class WorkOrderEquipDailyCheckServiceImpl implements WorkOrderEquipDailyCheckService {
	
	@Inject
	private WorkOrderEquipDailyCheckDAO dao;
	
	//일상점검 목록조회
	@Override
	public List<WorkOrderEquipDailyCheckVo> listAll(WorkOrderEquipDailyCheckVo checkVo)throws Exception{
		return dao.listAll(checkVo);
	}
	
	//일상점검 상세조회
	public WorkOrderEquipDailyCheckVo read(WorkOrderEquipDailyCheckVo checkVo)throws Exception{
		return dao.read(checkVo);
	}
	
	//일상점검 설비별 목록조회
	public List<WorkOrderEquipDailyCheckVo> workOrderEquipDailyCheckByEquipCd(WorkOrderEquipDailyCheckVo checkVo)throws Exception{
		return dao.workOrderEquipDailyCheckByEquipCd(checkVo);
	}
	
	//일상점검 총 점검
	public WorkOrderEquipDailyCheckVo getTotalPass(WorkOrderEquipDailyCheckVo checkVo)throws Exception{
		return dao.getTotalPass(checkVo);
	}
	
	//일상점검 등록
	@Override
	public void create(WorkOrderEquipDailyCheckVo checkVo)throws Exception{
		dao.create(checkVo);
	}
	
	//일상점검 수정
	@Override
	public void update(WorkOrderEquipDailyCheckVo checkVo)throws Exception{
		dao.update(checkVo);
	}
	
	//일상점검 삭제
	@Override
	public void delete(WorkOrderEquipDailyCheckVo checkVo)throws Exception{
		dao.delete(checkVo);
	}
	
	//일상점검번호 생성
	@Override
	public String getDcNo(WorkOrderEquipDailyCheckVo checkVo)throws Exception{
		return dao.getDcNo(checkVo);
	}

}
