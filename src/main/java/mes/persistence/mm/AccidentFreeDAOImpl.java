package mes.persistence.mm;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.mm.AccidentFreeVo;

@Repository
public class AccidentFreeDAOImpl implements AccidentFreeDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.mm.accidentFreeMapper";
	
	// 조회
	@Override
	public AccidentFreeVo read(AccidentFreeVo accidentFreeVo) throws Exception {
		return session.selectOne(namespace+".read", accidentFreeVo);
	}
	
	// 수정
	@Override
	public void edit(AccidentFreeVo accidentFreeVo) throws Exception {
		session.update(namespace+".edit", accidentFreeVo);
	}
}