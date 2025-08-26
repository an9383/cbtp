package mes.persistence.em;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.em.EquipRepairHistAdmVo;

@Repository
public class EquipRepairHistAdmDAOImpl implements EquipRepairHistAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.em.equipRepairHistAdmMapper";

	//전체 리스트
	@Override
	public List<EquipRepairHistAdmVo> EquipRepairHistAdmList(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {		
		return session.selectList(namespace + ".equipRepairHistAdmList", equipRepairHistAdmVo);
	}

	//수리이력관리 등록
	@Override
	public void EquipRepairHistAdmCreate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		session.insert(namespace + ".equipRepairHistAdmCreate",equipRepairHistAdmVo);
	}

	//수리이력관리 읽기
	@Override
	public EquipRepairHistAdmVo EquipRepairHistAdmRead(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {		
		return session.selectOne(namespace + ".equipRepairHistAdmRead",equipRepairHistAdmVo);
	}

	//수리이력관리 수정
	@Override
	public void EquipRepairHistAdmUpdate(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		session.update(namespace + ".equipRepairHistAdmUpdate", equipRepairHistAdmVo);		
	}
	
	//수리이력관리 삭제
	@Override
	public void equipRepairHistAdmDelete(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		session.delete(namespace + ".equipRepairHistAdmDelete", equipRepairHistAdmVo);		
	}
	
	//등록번호 시퀀스
	@Override
	public String EquipRepairHistAdmSeq() throws Exception{
		return session.selectOne(namespace + ".equipRepairHistAdmSeq");
	}

	@Override
	public EquipRepairHistAdmVo EquipRepairHistAdmImgUpload(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		return session.selectOne(namespace + ".equipRepairHistAdmImgUpload", equipRepairHistAdmVo);
	}
	
	@Override
	public EquipRepairHistAdmVo EquipRepairHistAdmImgRead(EquipRepairHistAdmVo equipRepairHistAdmVo) throws Exception {
		return session.selectOne(namespace + ".equipRepairHistAdmImgRead", equipRepairHistAdmVo);
	}

	//등록일자 시퀀스
	/*
	@Override
	public String regSeq(String time) throws Exception{
		return session.selectOne(namespace + ".repairRegDateCreate", time);
	}*/
	
}