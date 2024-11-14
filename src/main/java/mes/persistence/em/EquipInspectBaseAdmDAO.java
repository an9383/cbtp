package mes.persistence.em;

import java.util.List;

import mes.domain.em.EquipInspectBaseAdmVo;

public interface EquipInspectBaseAdmDAO {

	//설비일상점검 목록조회
	public List<EquipInspectBaseAdmVo> listAll(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception;
	
	//설비일상점검 리스트조회
	public List<EquipInspectBaseAdmVo> listDtl(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception;
	
	//설비일상점검 상세조회
	public EquipInspectBaseAdmVo readAdm(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception;	
	
	//설비일상점검 Adm 등록
	public void createAdm(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception;
	
	//설비일상점검 Dtl 등록
	public void createDtl(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception;	
	
	//설비일상점검 Adm 등록
	public void updateAdm(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception;
	
	//설비일상점검 Dtl 삭제
	public void delete(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception;
	
	// 시퀀스 조회
	public String inspcetSeq(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception;
}