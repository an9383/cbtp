package mes.service.bm;

import java.util.List;

import mes.domain.bm.CalendarVo;

public interface CalendarService {
	
	//월별 날짜조회
	public List<CalendarVo>calendarListToMonth(CalendarVo calendarVo) throws Exception;
}
