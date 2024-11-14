package mes.persistence.sm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.sm.ChangeHisAdmVo;

@Repository
public class ChangeHisAdmDAOImpl implements ChangeHisAdmDAO {

	@Inject
	private SqlSession session;
	
	private static final String namespace = "mes.mappers.sm.changeHisAdmMapper";
	
	//List
	@Override
	public List<ChangeHisAdmVo> changeHisAdmList(ChangeHisAdmVo changeHisAdmVo) throws Exception {
	    return session.selectList(namespace + ".changeHisAdmList", changeHisAdmVo);
	}

	//Read - 마스터
	@Override
	public ChangeHisAdmVo changeHisAdmRead(ChangeHisAdmVo changeHisAdmVo) throws Exception {
	    return session.selectOne(namespace + ".changeHisAdmRead", changeHisAdmVo);
	}

	//Read - 서브
	@Override
	public ChangeHisAdmVo changeHisAdmSubRead(ChangeHisAdmVo changeHisAdmVo) throws Exception {
		return session.selectOne(namespace + ".changeHisAdmSubRead", changeHisAdmVo);
	}
	
	//Create - 마스터
	@Override
	public String changeHisAdmCreate(ChangeHisAdmVo changeHisAdmVo) throws Exception {
		return session.selectOne(namespace + ".changeHisAdmCreate", changeHisAdmVo);
	}

	//Create - 서브
	@Override
	public void changeHisAdmSubCreate(ChangeHisAdmVo changeHisAdmVo) throws Exception {
		session.insert(namespace + ".changeHisAdmSubCreate", changeHisAdmVo);
	}
	
	//Update - 마스터
	@Override
	public void changeHisAdmUpdate(ChangeHisAdmVo changeHisAdmVo) throws Exception {
	    session.update(namespace + ".changeHisAdmUpdate", changeHisAdmVo);
	}

	//Update - 서브
	@Override
	public void changeHisAdmSubUpdate(ChangeHisAdmVo changeHisAdmVo) throws Exception {
		session.update(namespace + ".changeHisAdmSubUpdate", changeHisAdmVo);
	}
	
	//Delete - 마스터
	@Override
	public void changeHisAdmDelete(ChangeHisAdmVo changeHisAdmVo) throws Exception {
	    session.delete(namespace + ".changeHisAdmDelete", changeHisAdmVo);
	}

	//Delete - 서브
	@Override
	public void changeHisAdmSubDelete(ChangeHisAdmVo changeHisAdmVo) throws Exception {
		session.delete(namespace + ".changeHisAdmSubDelete", changeHisAdmVo);
	}
	
}
