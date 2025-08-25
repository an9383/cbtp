package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.FactoryCalendarVo;
import mes.persistence.bm.FactoryCalendarDAO;

@Service
public class FactoryCalendarServiceImpl implements FactoryCalendarService {
	
	@Inject
	private FactoryCalendarDAO dao;
	
	//===================== 공장력 =========================
	//월별 공장력 목록조회
	@Override
	public List<FactoryCalendarVo> factoryCalendarList(FactoryCalendarVo factoryCalendarVo) throws Exception {
		return dao.factoryCalendarList(factoryCalendarVo);
	}
	
	//기간별 공장력 목록조회
	@Override
	public List<FactoryCalendarVo> factoryCalendarListByDate(FactoryCalendarVo factoryCalendarVo) throws Exception {
		return dao.factoryCalendarListByDate(factoryCalendarVo);
	}
	
	//월별 공휴일 목록조회
	@Override
	public List<FactoryCalendarVo> holidayList(FactoryCalendarVo factoryCalendarVo) throws Exception {
		return dao.holidayList(factoryCalendarVo);
	}
	
	//공정력 등록
	@Override
	public void factoryCalendarCreate(FactoryCalendarVo factoryCalendarVo) throws Exception {
		dao.factoryCalendarCreate(factoryCalendarVo);
	}
	
	//공정력 수정
	@Override
	public void factoryCalendarUpdate(FactoryCalendarVo factoryCalendarVo) throws Exception {
		dao.factoryCalendarUpdate(factoryCalendarVo);
	}
}
