package mes.persistence.ir;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.ir.IronMoldAdmVo;

@Repository
public class IronMoldAdmDAOImpl implements IronMoldAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.ir.ironMoldAdmMapper";
	
	//철형타수이력 목록조회
	@Override
	public List<IronMoldAdmVo> ironShotList(IronMoldAdmVo ironMoldAdmVo) throws Exception {
		return session.selectList(namespace + ".ironShotList", ironMoldAdmVo);
	}
	
	//철형타수이력 일 조회
	@Override
	public List<IronMoldAdmVo> ironDayList(IronMoldAdmVo ironMoldAdmVo) throws Exception {
		return session.selectList(namespace + ".ironDayList", ironMoldAdmVo);
	}
	
	//철형타수이력 월 조회
	@Override
	public List<IronMoldAdmVo> ironMonthList(IronMoldAdmVo ironMoldAdmVo) throws Exception {
		return session.selectList(namespace + ".ironMonthList", ironMoldAdmVo);
	}
	
	//철형타수이력 년 조회
	@Override
	public List<IronMoldAdmVo> ironYearList(IronMoldAdmVo ironMoldAdmVo) throws Exception {
		return session.selectList(namespace + ".ironYearList", ironMoldAdmVo);
	}
	
}