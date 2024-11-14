package mes.service.em;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.em.EquipRepairHistAdmVo;
import mes.persistence.em.EquipRepairHistAdmDAO;

@Service
public class EquipRepairHistAdmServiceImpl implements EquipRepairHistAdmService {

	@Inject
	private EquipRepairHistAdmDAO dao;
	
	//전체 리스트
	@Override
	public List<EquipRepairHistAdmVo> EquipRepairHistAdmList(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		return dao.EquipRepairHistAdmList(equipRepairHistAdmVo);
	}
		
	//수리이력관리 등록
	@Override
	public void EquipRepairHistAdmCreate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		dao.EquipRepairHistAdmCreate(equipRepairHistAdmVo);
	}
	
	//수리이력관리 읽기
	@Override
	public EquipRepairHistAdmVo EquipRepairHistAdmRead(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		return dao. EquipRepairHistAdmRead(equipRepairHistAdmVo);
	}

	//수리이력관리 수정
	@Override
	public void EquipRepairHistAdmUpdate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		dao.EquipRepairHistAdmUpdate(equipRepairHistAdmVo);
	}
	
	//수리이력관리 삭제
	@Override
	public void equipRepairHistAdmDelete(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception{
		dao.equipRepairHistAdmDelete(equipRepairHistAdmVo);
	}

	//등록번호 시퀀스
	@Override
	public String EquipRepairHistAdmSeq() throws Exception{
		return dao.EquipRepairHistAdmSeq();
	}

	//이미지 업로드
	@Override
	public EquipRepairHistAdmVo EquipRepairHistAdmImgUpload(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		return dao.EquipRepairHistAdmImgUpload(equipRepairHistAdmVo);
	}
	
	//이미지 경로
	@Override
	public EquipRepairHistAdmVo EquipRepairHistAdmImgRead(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		return dao.EquipRepairHistAdmImgRead(equipRepairHistAdmVo);
	}
	
	//등록일자 시퀀스
/*	@Override
	public String regSeq(String time) throws Exception{
		return dao.regSeq(time);
	}*/
}

	