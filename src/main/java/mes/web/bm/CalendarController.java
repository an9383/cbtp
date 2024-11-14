
package mes.web.bm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CalendarVo;
import mes.service.bm.CalendarService;
import mes.web.ut.Utils;

@Controller
public class CalendarController {
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);

	@Inject
	private CalendarService calendarService;
	
	// 월별 날짜조회
	@RequestMapping(value = "bm/calendarListToMonth", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> calendarListToMonth(CalendarVo calendarVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		logger.info("월별 날짜조회");
		try {
			List<CalendarVo> calendarList = calendarService.calendarListToMonth(calendarVo);
			jsonData.put("data", calendarList);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}

		return jsonData;
	}
}

