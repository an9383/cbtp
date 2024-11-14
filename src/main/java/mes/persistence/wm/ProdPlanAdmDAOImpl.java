package mes.persistence.wm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.wm.DayProdPlanAdmVo;
import mes.domain.wm.MonProdPlanAdmVo;

@Repository
public class ProdPlanAdmDAOImpl implements ProdPlanAdmDAO {
	
	@Inject
	private SqlSession session;
	
	@Inject
	private static String namespace = "mes.mappers.wm.prodPlanAdmMapper";
	
	//월 생산계획 목록조회
	public List<MonProdPlanAdmVo> monProdPlanAdmList(MonProdPlanAdmVo monProdPlanAdmVo)throws Exception{
		return session.selectList(namespace+".monProdPlanAdmList" ,monProdPlanAdmVo );
	}
	
	//월 생산계획 상세조회
	public int monProdPlanAdmRead(MonProdPlanAdmVo monProdPlanAdmVo)throws Exception{
		return session.selectOne(namespace+".monProdPlanAdmRead" , monProdPlanAdmVo);
	}
	
	//월 생산계획 등록
	public void monProdPlanAdmCreate(MonProdPlanAdmVo monProdPlanAdmVo)throws Exception{
		session.insert(namespace+".monProdPlanAdmCreate" , monProdPlanAdmVo);
	}
	
	//월 생산계획 수정
	public void monProdPlanAdmUpdate(MonProdPlanAdmVo monProdPlanAdmVo)throws Exception{
		session.update(namespace+".monProdPlanAdmUpdate" ,monProdPlanAdmVo );
	}
	
	
	//일 생산계획 목록조회
	public List<DayProdPlanAdmVo> dayProdPlanAdmList(DayProdPlanAdmVo dayProdPlanAdmVo)throws Exception{
		return session.selectList(namespace+".dayProdPlanAdmList" ,dayProdPlanAdmVo);
	}
	
	//일 생산계획 상세조회
	public int dayProdPlanAdmRead(DayProdPlanAdmVo dayProdPlanAdmVo)throws Exception{
		return session.selectOne(namespace+".dayProdPlanAdmRead" , dayProdPlanAdmVo);
	}
	
	//일 생산계획 상세조회2
	public List<DayProdPlanAdmVo> dayProdPlanAdmRead2(DayProdPlanAdmVo dayProdPlanAdmVo)throws Exception{
		return session.selectList(namespace+".dayProdPlanAdmRead2" ,dayProdPlanAdmVo);
	}	
	
	//일 생산계획 등록
	public void dayProdPlanAdmCreate(DayProdPlanAdmVo dayProdPlanAdmVo)throws Exception{
		session.insert(namespace+".dayProdPlanAdmCreate" , dayProdPlanAdmVo);
	}
	
	//일 생산계획 수정
	public void dayProdPlanAdmUpdate(DayProdPlanAdmVo dayProdPlanAdmVo)throws Exception{
		session.update(namespace+".dayProdPlanAdmUpdate" ,dayProdPlanAdmVo );
	}

}
