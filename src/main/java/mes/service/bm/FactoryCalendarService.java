package mes.service.bm;

import java.util.List;

import mes.domain.bm.FactoryCalendarVo;

public interface FactoryCalendarService {

	//===================== 공장력 =========================
	//월별 공장력 목록조회
	public List<FactoryCalendarVo> factoryCalendarList(FactoryCalendarVo factoryCalendarVo) throws Exception;
	
	//기간별 공장력 목록조회
	public List<FactoryCalendarVo> factoryCalendarListByDate(FactoryCalendarVo factoryCalendarVo) throws Exception;
	
	//월별 공휴일 목록조회
	public List<FactoryCalendarVo> holidayList(FactoryCalendarVo factoryCalendarVo) throws Exception;
	
	//공정력 등록
	public void factoryCalendarCreate(FactoryCalendarVo factoryCalendarVo) throws Exception;
	
	//공정력 수정
	public void factoryCalendarUpdate(FactoryCalendarVo factoryCalendarVo) throws Exception;
}
