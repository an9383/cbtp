package mes.service.ir;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import mes.domain.ir.IronMoldAdmVo;
import mes.persistence.ir.IronMoldAdmDAO;

@Service
public class IronMoldAdmServiceImpl implements IronMoldAdmService {

	@Inject
	private IronMoldAdmDAO ironMoldAdmDAO;

	//철형타수이력 목록조회
	@Override
	public List<IronMoldAdmVo> ironShotList(IronMoldAdmVo ironMoldAdmVo) throws Exception {
		return ironMoldAdmDAO.ironShotList(ironMoldAdmVo);
	}
	
	//철형타수이력 일 조회
	@Override
	public List<IronMoldAdmVo> ironDayList(IronMoldAdmVo ironMoldAdmVo) throws Exception {
		return ironMoldAdmDAO.ironDayList(ironMoldAdmVo);
	}
	
	//철형타수이력 이력 월 조회
	@Override
	public List<IronMoldAdmVo> ironMonthList(IronMoldAdmVo ironMoldAdmVo) throws Exception {
		return ironMoldAdmDAO.ironMonthList(ironMoldAdmVo);
	}
	
	//철형타수이력 이력 년 조회
	@Override
	public List<IronMoldAdmVo> ironYearList(IronMoldAdmVo ironMoldAdmVo) throws Exception {
		return ironMoldAdmDAO.ironYearList(ironMoldAdmVo);
	}
		
}
