package mes.persistence.bs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bs.DaySalesPlanAdmVo;
import mes.domain.bs.MonSalesPlanAdmVo;

@Repository
public class SalesPlanAdmDAOImpl implements SalesPlanAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bs.salesPlanAdmMapper";
	
	// 월 판매계획관리 목록조회
	public List<MonSalesPlanAdmVo> monSalesPlanAdmList(MonSalesPlanAdmVo monSalesPlanAdmVo) throws Exception{
		return session.selectList(namespace+".monSalesPlanAdmList", monSalesPlanAdmVo);
	}
	
	// 소요량분석 - 월 생산계획관리 목록조회
	public List<MonSalesPlanAdmVo> bsMonProdPlanAdmList(MonSalesPlanAdmVo monSalesPlanAdmVo) throws Exception{
		return session.selectList(namespace+".bsMonProdPlanAdmList", monSalesPlanAdmVo);
	}
	
	// 월 판매계획관리 상세조회
	public int monSalesPlanAdmRead(MonSalesPlanAdmVo monSalesPlanAdmVo) throws Exception{
		return session.selectOne(namespace+".monSalesPlanAdmRead" ,monSalesPlanAdmVo );
	}
	
	// 월 판매계획관리 등록
	public void monSalesPlanAdmCreate(MonSalesPlanAdmVo monSalesPlanAdmVo) throws Exception{
		session.insert(namespace+".monSalesPlanAdmCreate", monSalesPlanAdmVo);
	}
	
	// 월 판매계획관리 수정
	public void monSalesPlanAdmUpdate(MonSalesPlanAdmVo monSalesPlanAdmVo) throws Exception{
		session.update(namespace+".monSalesPlanAdmUpdate" , monSalesPlanAdmVo);
	}
	
	// 일 판매계획관리 목록조회
	public List<DaySalesPlanAdmVo> daySalesPlanAdmList(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception{
		return session.selectList(namespace+".daySalesPlanAdmList" ,daySalesPlanAdmVo );
	}
	
	// 일 판매계획관리 상세조회
	public int daySalesPlanAdmRead(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception{
		return session.selectOne(namespace+".daySalesPlanAdmRead" ,daySalesPlanAdmVo );
	}
	
	// 일 판매계획관리 상세조회2
	public List<DaySalesPlanAdmVo> daySalesPlanAdmRead2(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception{
		return session.selectList(namespace+".daySalesPlanAdmRead2" , daySalesPlanAdmVo);
	}
	
	// 일 판매계획관리 등록
	public void daySalesPlanAdmCreate(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception{
		session.insert(namespace+".daySalesPlanAdmCreate" ,daySalesPlanAdmVo );
	}
	
	// 일 판매계획관리 수정
	public void daySalesPlanAdmUpdate(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception{
		session.update(namespace+".daySalesPlanAdmUpdate" , daySalesPlanAdmVo);
	}
	
	// 월판매계획 값 조회
	public int getSalesMonQty(DaySalesPlanAdmVo daySalesPlanAdmVo) throws Exception{
		return session.selectOne(namespace+".getSalesMonQty" ,daySalesPlanAdmVo);
	}
}
