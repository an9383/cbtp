package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.CalendarVo;
import mes.persistence.bm.CalendarDAO;

@Service
public class CalendarServiceImpl implements CalendarService {
	@Inject
	private CalendarDAO dao;
	
	//월별 날짜조회
	@Override
	public List<CalendarVo>calendarListToMonth(CalendarVo calendarVo) throws Exception {
		return dao.calendarListToMonth(calendarVo);
	}
}
