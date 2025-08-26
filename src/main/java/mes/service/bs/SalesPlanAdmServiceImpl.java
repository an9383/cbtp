package mes.service.bs;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bs.DaySalesPlanAdmVo;
import mes.domain.bs.MonSalesPlanAdmVo;
import mes.persistence.bs.SalesPlanAdmDAO;

@Service
public class SalesPlanAdmServiceImpl implements SalesPlanAdmService {

	@Inject
	private SalesPlanAdmDAO dao;
	
	// 월 판매계획관리 목록조회
	public List<MonSalesPlanAdmVo> monSalesPlanAdmList(MonSalesPlanAdmVo monSalesPlanAdmVo) throws Exception{
		return dao.monSalesPlanAdmList(monSalesPlanAdmVo);
	}
	
	// 소요량분석 - 월 생산계획관리 목록조회
	public List<MonSalesPlanAdmVo> bsMonProdPlanAdmList(MonSalesPlanAdmVo monSalesPlanAdmVo) throws Exception{
		return dao.bsMonProdPlanAdmList(monSalesPlanAdmVo);
	}
	
	// 월 판매계획관리 상세조회
	public int monSalesPlanAdmRead(MonSalesPlanAdmVo monSalesPlanAdmVo) throws Exception{
		return dao.monSalesPlanAdmRead(monSalesPlanAdmVo);
	}
	
	// 월 판매계획관리 등록
	public void monSalesPlanAdmCreate(MonSalesPlanAdmVo monSalesPlanAdmVo) throws Exception{
		dao.monSalesPlanAdmCreate(monSalesPlanAdmVo);
	}
	
	// 월 판매계획관리 수정
	public void monSalesPlanAdmUpdate(MonSalesPlanAdmVo monSalesPlanAdmVo) throws Exception{
		dao.monSalesPlanAdmUpdate(monSalesPlanAdmVo);
	}
	
	
	// 일 판매계획관리 목록조회
	public List<DaySalesPlanAdmVo> daySalesPlanAdmList(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception{
		return dao.daySalesPlanAdmList(daySalesPlanAdmVo);
	}
	
	// 일 판매계획관리 상세조회
	public int daySalesPlanAdmRead(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception{
		return dao.daySalesPlanAdmRead(daySalesPlanAdmVo);
	}
	
	// 일 판매계획관리 상세조회2
	public List<DaySalesPlanAdmVo> daySalesPlanAdmRead2(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception{
		return dao.daySalesPlanAdmRead2(daySalesPlanAdmVo);
	}

	// 일 판매계획관리 등록
	public void daySalesPlanAdmCreate(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception{
		dao.daySalesPlanAdmCreate(daySalesPlanAdmVo);
	}
	
	// 일 판매계획관리 수정
	public void daySalesPlanAdmUpdate(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception{
		dao.daySalesPlanAdmUpdate(daySalesPlanAdmVo);
	}
	
	// 월판매계획 값 조회
	public int getSalesMonQty(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception{
		return dao.getSalesMonQty(daySalesPlanAdmVo);
	}
}
