package mes.persistence.wm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.wm.DailyWorkPlanAdmVo;
import mes.domain.wm.PrcssResultAdmVo;

@Repository
public class PrcssResultAdmDAOImpl implements PrcssResultAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.wm.prcssResultAdmMapper";
	
	//Read
	@Override
	public PrcssResultAdmVo prcssResultAdmRead(PrcssResultAdmVo prcssResultAdmVo) throws Exception {
	    return session.selectOne(namespace + ".prcssResultAdmRead", prcssResultAdmVo);
	}
	
	//Create
	@Override
	public void prcssResultAdmCreate(PrcssResultAdmVo prcssResultAdmVo) throws Exception {
	    session.insert(namespace + ".prcssResultAdmCreate", prcssResultAdmVo);
	}

	//Update
	@Override
	public void prcssResultAdmUpdate(PrcssResultAdmVo prcssResultAdmVo) throws Exception {
	    session.update(namespace + ".prcssResultAdmUpdate", prcssResultAdmVo);
	}
	
}
