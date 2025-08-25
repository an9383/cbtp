package mes.persistence.po;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.po.EqWorkHisAdmVo;

@Repository
public class EqWorkHisAdmDAOImpl implements EqWorkHisAdmDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.po.eqWorkHisAdmMapper";
	
	//작업조건 목록조회
	@Override
	public EqWorkHisAdmVo listAll(EqWorkHisAdmVo eqWorkHisAdmVo) throws Exception{
		return session.selectOne(namespace+".listAll" , eqWorkHisAdmVo);
	}

	//작업조건 등록유무
	@Override
	public int listCount(EqWorkHisAdmVo eqWorkHisAdmVo) throws Exception{
		return session.selectOne(namespace+".listCount" , eqWorkHisAdmVo);
	}
	
	//작업조건 등록
	@Override
	public void create(EqWorkHisAdmVo eqWorkHisAdmVo) throws Exception{
		session.insert(namespace+".create", eqWorkHisAdmVo);
	}
	

	//작업조건 수정
	@Override
	public void update(EqWorkHisAdmVo eqWorkHisAdmVo) throws Exception{
		session.update(namespace+".update", eqWorkHisAdmVo);
	}

}
