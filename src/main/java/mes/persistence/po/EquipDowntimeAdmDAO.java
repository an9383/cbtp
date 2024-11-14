package mes.persistence.po;

import java.util.List;

import mes.domain.po.EquipDowntimeAdmVo;

public interface EquipDowntimeAdmDAO {

	//비가동등록 목록조회
	public List<EquipDowntimeAdmVo> listAll(EquipDowntimeAdmVo equipDowntimeAdmVo) throws Exception;
	
	//비가동등록 등록
	public void create(EquipDowntimeAdmVo equipDowntimeAdmVo) throws Exception;
	
	//비가동등록 삭제
	public void delete(EquipDowntimeAdmVo equipDowntimeAdmVo) throws Exception;
	
}