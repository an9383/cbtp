package mes.persistence.em;

import java.util.List;

import mes.domain.em.EquipRepairHistAdmVo;

public interface EquipRepairHistAdmDAO {
	
	//전체 리스트
	public List<EquipRepairHistAdmVo> EquipRepairHistAdmList(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
		
	//수리이력관리 등록
	public void EquipRepairHistAdmCreate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//수리이력관리 읽기
	public EquipRepairHistAdmVo EquipRepairHistAdmRead(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;

	//수리이력관리 수정
	public void EquipRepairHistAdmUpdate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//수리이력관리 삭제
	public void equipRepairHistAdmDelete(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//등록번호 시퀀스
	public String EquipRepairHistAdmSeq() throws Exception;
	
	//이미지 경로
	public EquipRepairHistAdmVo EquipRepairHistAdmImgUpload(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;

	public EquipRepairHistAdmVo EquipRepairHistAdmImgRead(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception;
	
	//등록일자 시퀀스
	//public String regSeq(String time) throws Exception;
		
}
