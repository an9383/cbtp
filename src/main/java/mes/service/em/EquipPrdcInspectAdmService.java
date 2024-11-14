package mes.service.em;

import java.util.List;

import mes.domain.em.EquipPrdcInspectAdmVo;

public interface EquipPrdcInspectAdmService {
	
	//정기검사관리 목록 조회
	public List<EquipPrdcInspectAdmVo> listAll(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo) throws Exception;
	
	//정기검사관리 등록
	public void create(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo) throws Exception;
	
	//정기검사관리 삭제
	public void delete(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo) throws Exception;
	
	//정기검사관리 상세
	public EquipPrdcInspectAdmVo read(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo) throws Exception;
	
}
