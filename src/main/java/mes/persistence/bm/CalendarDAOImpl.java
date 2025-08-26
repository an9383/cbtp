package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.CalendarVo;

@Repository
public class CalendarDAOImpl implements CalendarDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.calendarMapper";
	
	//월별 날짜조회
	@Override
	public List<CalendarVo>calendarListToMonth(CalendarVo calendarVo) throws Exception {
		return session.selectList(namespace+".calendarListToMonth", calendarVo);
	}
}
