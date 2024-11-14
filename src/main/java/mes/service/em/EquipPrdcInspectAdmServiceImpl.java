package mes.service.em;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.em.EquipPrdcInspectAdmVo;
import mes.persistence.em.EquipPrdcInspectAdmDAO;

@Service
public class EquipPrdcInspectAdmServiceImpl implements EquipPrdcInspectAdmService {

	@Inject
	private EquipPrdcInspectAdmDAO dao;

	//정기검사관리 목록 조회
	@Override
	public List<EquipPrdcInspectAdmVo> listAll(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo) throws Exception{
		return dao.listAll(equipPrdcInspectAdmVo);
	}
	
	//정기검사관리 등록
	@Override
	public void create(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo) throws Exception{
		dao.create(equipPrdcInspectAdmVo);
	}
	
	//정기검사관리 삭제
	@Override
	public void delete(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo) throws Exception{
		dao.delete(equipPrdcInspectAdmVo);
	}
	
	//정기검사관리 상세
	@Override
	public EquipPrdcInspectAdmVo read(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo) throws Exception{
		return dao.read(equipPrdcInspectAdmVo);
	}
}

	