package mes.persistence.ir;

import java.util.List;
import mes.domain.ir.IronMoldAdmVo;

public interface IronMoldAdmDAO {
	
	//철형타수이력 목록조회
	public List<IronMoldAdmVo> ironShotList(IronMoldAdmVo ironMoldAdmVo) throws Exception;
	
	//철형타수이력 일 조회
	public List<IronMoldAdmVo> ironDayList(IronMoldAdmVo ironMoldAdmVo) throws Exception;
	
	//철형타수이력 월 조회
	public List<IronMoldAdmVo> ironMonthList(IronMoldAdmVo ironMoldAdmVo) throws Exception;
	
	//철형타수이력 년 조회
	public List<IronMoldAdmVo> ironYearList(IronMoldAdmVo ironMoldAdmVo) throws Exception;
	
}