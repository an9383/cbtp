package mes.persistence.em;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.em.EquipPrdcInspectAdmVo;


@Repository
public class EquipPrdcInspectAdmDAOImpl implements EquipPrdcInspectAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.em.equipPrdcInspectAdmMapper";
	
	//정기검사관리 목록 조회
	@Override
	public List<EquipPrdcInspectAdmVo> listAll(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo) throws Exception{
		return session.selectList(namespace + ".listAll",equipPrdcInspectAdmVo);
	}
	
	//정기검사관리 등록
	@Override
	public void create(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo) throws Exception{
		session.insert(namespace + ".create",equipPrdcInspectAdmVo);
	}
	
	//정기검사관리 삭제
	@Override
	public void delete(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo) throws Exception{
		session.delete(namespace + ".delete",equipPrdcInspectAdmVo);
	}
	
	//정기검사관리 상세
	public EquipPrdcInspectAdmVo read(EquipPrdcInspectAdmVo equipPrdcInspectAdmVo) throws Exception{
		return session.selectOne(namespace + ".read",equipPrdcInspectAdmVo);
	}
	
}