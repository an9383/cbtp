package mes.persistence.po;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import mes.domain.po.EquipPrcssFaultyAdmVo;
import mes.persistence.po.EquipPrcssFaultyAdmDAO;

@Repository
public class EquipPrcssFaultyAdmDAOImpl implements EquipPrcssFaultyAdmDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "mes.mappers.po.equipPrcssFaultyAdmMapper";

	//불량 조회
	@Override
	public EquipPrcssFaultyAdmVo readPrcssFaulty(EquipPrcssFaultyAdmVo equipPrcssFaultyAdmVo) throws Exception {
		return session.selectOne(namespace + ".readPrcssFaulty", equipPrcssFaultyAdmVo);
	}
	
	//불량 등록
	@Override
	public void createPrcssFaulty(EquipPrcssFaultyAdmVo equipPrcssFaultyAdmVo) throws Exception {
		session.insert(namespace + ".createPrcssFaulty", equipPrcssFaultyAdmVo);
	}	 
	 
	//불량 수정
	@Override
	public void updatePrcssFaulty(EquipPrcssFaultyAdmVo equipPrcssFaultyAdmVo) throws Exception {
		session.update(namespace + ".updatePrcssFaulty", equipPrcssFaultyAdmVo);
	}
		 
}
