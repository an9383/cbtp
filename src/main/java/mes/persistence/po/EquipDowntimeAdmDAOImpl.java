package mes.persistence.po;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.po.EquipDowntimeAdmVo;

@Repository
public class EquipDowntimeAdmDAOImpl implements EquipDowntimeAdmDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "mes.mappers.po.equipDowntimeAdmMapper";
	
	//비가동등록 목록조회
	@Override
	public List<EquipDowntimeAdmVo> listAll(EquipDowntimeAdmVo equipDowntimeAdmVo) throws Exception{
		return session.selectList(namespace+".listAll", equipDowntimeAdmVo);
	}
	
	//비가동등록 등록
	@Override
	public void create(EquipDowntimeAdmVo equipDowntimeAdmVo) throws Exception {
		session.insert(namespace+".create", equipDowntimeAdmVo);
	}
	
	//비가동등록 삭제
	@Override
	public void delete(EquipDowntimeAdmVo equipDowntimeAdmVo) throws Exception {
		session.delete(namespace+".delete", equipDowntimeAdmVo);
	}
}
