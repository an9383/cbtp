package mes.persistence.wm;

import java.util.List;

import mes.domain.wm.DayProdPlanAdmVo;
import mes.domain.wm.MonProdPlanAdmVo;

public interface ProdPlanAdmDAO {

	//월 생산계획 목록조회
	public List<MonProdPlanAdmVo> monProdPlanAdmList(MonProdPlanAdmVo monProdPlanAdmVo)throws Exception;
	
	//월 생산계획 상세조회
	public int monProdPlanAdmRead(MonProdPlanAdmVo monProdPlanAdmVo)throws Exception;
	
	//월 생산계획 등록
	public void monProdPlanAdmCreate(MonProdPlanAdmVo monProdPlanAdmVo)throws Exception;
	
	//월 생산계획 수정
	public void monProdPlanAdmUpdate(MonProdPlanAdmVo monProdPlanAdmVo)throws Exception;
	
	
	//일 생산계획 목록조회
	public List<DayProdPlanAdmVo>dayProdPlanAdmList(DayProdPlanAdmVo dayProdPlanAdmVo)throws Exception;
	
	//일 생산계획 상세조회
	public int dayProdPlanAdmRead(DayProdPlanAdmVo dayProdPlanAdmVo)throws Exception;
	
	//일 생산계획 상세조회2
	public List<DayProdPlanAdmVo> dayProdPlanAdmRead2(DayProdPlanAdmVo dayProdPlanAdmVo)throws Exception;
	
	//일 생산계획 등록
	public void dayProdPlanAdmCreate(DayProdPlanAdmVo dayProdPlanAdmVo)throws Exception;
	
	//일 생산계획 수정
	public void dayProdPlanAdmUpdate(DayProdPlanAdmVo dayProdPlanAdmVo)throws Exception;
}
