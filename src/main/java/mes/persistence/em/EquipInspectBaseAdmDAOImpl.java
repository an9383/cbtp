package mes.persistence.em;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.em.EquipInspectBaseAdmVo;

@Repository
public class EquipInspectBaseAdmDAOImpl implements EquipInspectBaseAdmDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "mes.mappers.em.equipInspectBaseAdmMapper";
	

	//설비일상점검 목록조회
	@Override
	public List<EquipInspectBaseAdmVo> listAll(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception{
		return session.selectList(namespace + ".listAll", equipInspectBaseAdmVo);
	}
	
	//설비일상점검 리스트조회
	@Override
	public List<EquipInspectBaseAdmVo> listDtl(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception{
		return session.selectList(namespace + ".listDtl", equipInspectBaseAdmVo);
	}
	
	//설비일상점검 상세조회
	@Override
	public EquipInspectBaseAdmVo readAdm(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception{
		return session.selectOne(namespace + ".readAdm", equipInspectBaseAdmVo);
	}
	
	//설비일상점검 Adm 등록
	@Override
	public void createAdm(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception{
		session.insert(namespace + ".createAdm", equipInspectBaseAdmVo);
	}
	
	//설비일상점검 Dtl 등록
	@Override
	public void createDtl(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception{
		session.insert(namespace + ".createDtl", equipInspectBaseAdmVo);
	}
	
	//설비일상점검 Adm 등록
	@Override
	public void updateAdm(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception{
		session.update(namespace + ".updateAdm", equipInspectBaseAdmVo);
	}
	
	//설비일상점검 Dtl 삭제
	@Override
	public void delete(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception{
		session.delete(namespace + ".delete", equipInspectBaseAdmVo);
	}
	
	// 시퀀스 조회
	@Override
	public String inspcetSeq(EquipInspectBaseAdmVo equipInspectBaseAdmVo) throws Exception{
		return session.selectOne(namespace + ".inspcetSeq", equipInspectBaseAdmVo);
	}
}
