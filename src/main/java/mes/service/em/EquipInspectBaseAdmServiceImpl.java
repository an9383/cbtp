package mes.service.em;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.em.EquipInspectBaseAdmVo;
import mes.persistence.em.EquipInspectBaseAdmDAO;

@Service
public class EquipInspectBaseAdmServiceImpl implements EquipInspectBaseAdmService {

	@Inject
	private EquipInspectBaseAdmDAO dao;
	
	//설비일상점검 목록조회
	@Override
	public List<EquipInspectBaseAdmVo> listAll(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception{
		return dao.listAll(equipInspectBaseAdmVo);
	}
	
	//설비일상점검 리스트조회
	@Override
	public List<EquipInspectBaseAdmVo> listDtl(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception{
		return dao.listDtl(equipInspectBaseAdmVo);
	}
	
	//설비일상점검 상세조회
	@Override
	public EquipInspectBaseAdmVo readAdm(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception{
		return dao.readAdm(equipInspectBaseAdmVo);
	}
	
	//설비일상점검 Adm 등록
	@Override
	public void createAdm(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception{
		dao.createAdm(equipInspectBaseAdmVo);
	}
	
	//설비일상점검 Dtl 등록
	@Override
	public void createDtl(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception{
		dao.createDtl(equipInspectBaseAdmVo);
	}
	
	//설비일상점검 Adm 등록
	@Override
	public void updateAdm(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception{
		dao.updateAdm(equipInspectBaseAdmVo);
	}
	
	//설비일상점검 Dtl 삭제
	@Override
	public void delete(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception{
		dao.delete(equipInspectBaseAdmVo);
	}
	
	// 시퀀스 조회
	@Override
	public String inspcetSeq(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception{
		return dao.inspcetSeq(equipInspectBaseAdmVo);
	}
	
}

	