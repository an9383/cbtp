package mes.persistence.bm;

import java.util.List;

import mes.domain.bm.CalendarVo;

public interface CalendarDAO {
	
	//월별 날짜조회
	public List<CalendarVo>calendarListToMonth(CalendarVo calendarVo) throws Exception;
}
