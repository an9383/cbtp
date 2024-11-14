package mes.persistence.po;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.po.WorkOrderEquipDailyCheckVo;

@Repository
public class WorkOrderEquipDailyCheckDAOImpl implements WorkOrderEquipDailyCheckDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.po.workOrderEquipDailyCheckMapper";

	//일상점검 목록조회
	@Override
	public List<WorkOrderEquipDailyCheckVo> listAll(WorkOrderEquipDailyCheckVo checkVo)throws Exception{
		return session.selectList(namespace+".listAll" , checkVo);
	}
	
	
	//일상점검 상세조회
	public WorkOrderEquipDailyCheckVo read(WorkOrderEquipDailyCheckVo checkVo)throws Exception{
		return session.selectOne(namespace+".read" , checkVo);
	}	
	
	//일상점검 설비별 목록조회
	public List<WorkOrderEquipDailyCheckVo> workOrderEquipDailyCheckByEquipCd(WorkOrderEquipDailyCheckVo checkVo)throws Exception{
		return session.selectList(namespace+".workOrderEquipDailyCheckByEquipCd" , checkVo);
	}
	
	//일상점검 총 점검
	public WorkOrderEquipDailyCheckVo getTotalPass(WorkOrderEquipDailyCheckVo checkVo)throws Exception{
		return session.selectOne(namespace+".getTotalPass" , checkVo);
	}

	
	//일상점검 등록
	@Override	
	public void create(WorkOrderEquipDailyCheckVo checkVo)throws Exception{
		session.insert(namespace+".create" , checkVo);
	}
	
	//일상점검 수정
	@Override
	public void update(WorkOrderEquipDailyCheckVo checkVo)throws Exception{
		session.update(namespace+".update" , checkVo);
	}
	
	//일상점검 삭제
	@Override
	public void delete(WorkOrderEquipDailyCheckVo checkVo)throws Exception{
		session.delete(namespace+".delete",checkVo);
	}
	
	//일상점검번호 생성
	@Override
	public String getDcNo(WorkOrderEquipDailyCheckVo checkVo)throws Exception{
		return session.selectOne(namespace+".getDcNo" , checkVo);
	}
}
