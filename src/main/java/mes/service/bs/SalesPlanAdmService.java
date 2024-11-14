package mes.service.bs;

import java.util.List;

import mes.domain.bs.DaySalesPlanAdmVo;
import mes.domain.bs.MonSalesPlanAdmVo;

public interface SalesPlanAdmService {

	// 월 판매계획관리 목록조회
	public List<MonSalesPlanAdmVo> monSalesPlanAdmList(MonSalesPlanAdmVo monSalesPlanAdmVo) throws Exception;
	
	// 소요량분석 - 월 생산계획관리 목록조회
	public List<MonSalesPlanAdmVo> bsMonProdPlanAdmList(MonSalesPlanAdmVo monSalesPlanAdmVo) throws Exception;
	
	// 월 판매계획관리 상세조회
	public int monSalesPlanAdmRead(MonSalesPlanAdmVo monSalesPlanAdmVo) throws Exception;
	
	// 월 판매계획관리 등록
	public void monSalesPlanAdmCreate(MonSalesPlanAdmVo monSalesPlanAdmVo) throws Exception;
	
	// 월 판매계획관리 수정
	public void monSalesPlanAdmUpdate(MonSalesPlanAdmVo monSalesPlanAdmVo) throws Exception;
	
	
	// 일 판매계획관리 목록조회
	public List<DaySalesPlanAdmVo> daySalesPlanAdmList(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception;
	
	// 일 판매계획관리 상세조회
	public int daySalesPlanAdmRead(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception;
	
	// 일 판매계획관리 상세조회2
	public List<DaySalesPlanAdmVo> daySalesPlanAdmRead2(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception;
	
	// 일 판매계획관리 등록
	public void daySalesPlanAdmCreate(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception;
	
	// 일 판매계획관리 수정
	public void daySalesPlanAdmUpdate(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception;
	
	// 월판매계획 값 조회
	public int getSalesMonQty(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception;
}
