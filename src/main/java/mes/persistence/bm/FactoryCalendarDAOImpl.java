package mes.persistence.bm;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mes.domain.bm.FactoryCalendarVo;

@Repository
public class FactoryCalendarDAOImpl implements FactoryCalendarDAO {

	@Autowired @Resource(name="sqlSession")
	private SqlSession session;

	private static final String namespace = "mes.mapper.bm.factoryCalendarMapper";
	
	//===================== 공장력 =========================
	//월별 공장력 목록조회
	@Override
	public List<FactoryCalendarVo> factoryCalendarList(FactoryCalendarVo factoryCalendarVo) throws Exception {
		return session.selectList(namespace + ".factoryCalendarList", factoryCalendarVo);
	}
	
	//기간별 공장력 목록조회
	@Override
	public List<FactoryCalendarVo> factoryCalendarListByDate(FactoryCalendarVo factoryCalendarVo) throws Exception {
		return session.selectList(namespace + ".factoryCalendarListByDate", factoryCalendarVo);
	}
	
	//월별 공휴일 목록조회
	@Override
	public List<FactoryCalendarVo> holidayList(FactoryCalendarVo factoryCalendarVo) throws Exception {
		return session.selectList(namespace + ".holidayList", factoryCalendarVo);
	}
	
	//공정력 등록
	@Override
	public void factoryCalendarCreate(FactoryCalendarVo factoryCalendarVo) throws Exception {
		session.insert(namespace + ".factoryCalendarCreate", factoryCalendarVo);
	}
	
	//공정력 수정
	@Override
	public void factoryCalendarUpdate(FactoryCalendarVo factoryCalendarVo) throws Exception {
		session.update(namespace + ".factoryCalendarUpdate", factoryCalendarVo);
	}
}