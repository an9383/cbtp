package mes.persistence.mm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.mm.ProdDailyAdmVo;

@Repository
public class prodDailyAdmDAOImpl implements prodDailyAdmDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.mm.ProdDailyAdmMapper";
	
	
	//생산일보관리
	public List<ProdDailyAdmVo> listAll(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectList(namespace+".listAll" , prodDailyAdmVo);
	}
	
	public List<ProdDailyAdmVo> statListAll(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectList(namespace+".statListAll" , prodDailyAdmVo );
	}

	public List<ProdDailyAdmVo> read(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectList(namespace+".read" ,prodDailyAdmVo );
	}
	
	public void create(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		session.insert(namespace+".create" ,prodDailyAdmVo );
	}
	
	public void delete(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		session.delete(namespace+".delete" , prodDailyAdmVo);
	}
	
	public List<ProdDailyAdmVo> getSumProdData(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectList(namespace+".getSumProdData" ,prodDailyAdmVo );
	}
	
	
	
	
	//공수월별
	public List<ProdDailyAdmVo> monthList(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectList(namespace+".monthList" ,prodDailyAdmVo );
	}
	
	public List<ProdDailyAdmVo> getSumProdData2(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectList(namespace+".getSumProdData2" , prodDailyAdmVo);
	}
	
	
	//공수일별
	public List<ProdDailyAdmVo> dateList(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectList(namespace+".dateList" , prodDailyAdmVo);
	}
	
	public List<ProdDailyAdmVo> getSumProdData3(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectList(namespace+".getSumProdData3" , prodDailyAdmVo);
	}
	
	public List<ProdDailyAdmVo> headerList(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectList(namespace+".headerList" ,prodDailyAdmVo );
	}
	
	
	
	//생산일보관리(구분)
	//인원현황 탭
	//유실공수 TOP(3)목록조회
	public List<ProdDailyAdmVo> manHourTop3List(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectList(namespace+".manHourTop3List" , prodDailyAdmVo);
	}
	
	//생산가동율 목록조회
	public ProdDailyAdmVo prodUtilList(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectOne(namespace+".prodUtilList" , prodDailyAdmVo);
	}
	
	
	//인원현황 목록조회
	public ProdDailyAdmVo personStatList(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectOne(namespace+".personStatList" ,prodDailyAdmVo );
	}
	
	
	//공수현황탭
	//생산목표 수량 조회
	public String getWorkOrdQty(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectOne(namespace+".getWorkOrdQty" ,prodDailyAdmVo );
	}
	
	//생산실적현황 목록조회
	public List<ProdDailyAdmVo> prodResultStatList(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectList(namespace+".prodResultStatList" , prodDailyAdmVo);
	}
	
	//생산공정현황 목록조회
	public List<ProdDailyAdmVo> prodProcStatList(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectList(namespace+".prodProcStatList" , prodDailyAdmVo);
	}
	
	
	//생산일보관리(전체)
	//인원현황 탭
	//인원현황 목록조회
	public ProdDailyAdmVo personStatListAll(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectOne(namespace+".personStatListAll" ,prodDailyAdmVo );
	}
	
	//월 누적생산량 조회
	public int getMonCumProdQty(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectOne(namespace+".getMonCumProdQty" , prodDailyAdmVo);
	}
	
	//일일 공정작업수 조회
	public int getDayProcWorkQty(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectOne(namespace+".getDayProcWorkQty" , prodDailyAdmVo);
	}
	
	//불량수량 조회
	public int getDayFaultyQty(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectOne(namespace+".getDayFaultyQty" , prodDailyAdmVo);
	}
	
	
	
	
	
	
	//주요 업무 및 이슈관리
	//조회
	public ProdDailyAdmVo mainIssueAdmList(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectOne(namespace+".mainIssueAdmList" , prodDailyAdmVo);
	}
	
	//ServoMotor 조회
	public ProdDailyAdmVo mainIssueAdmServoMotor(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectOne(namespace+".mainIssueAdmServoMotor" , prodDailyAdmVo);
	}
	
	//등록
	public void mainIssueAdmCreate(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		session.insert(namespace+".mainIssueAdmCreate" , prodDailyAdmVo);
	}
	
	//수정
	public void mainIssueAdmUpdate(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		session.update(namespace+".mainIssueAdmUpdate" ,prodDailyAdmVo );
	}
	
	
	
	
	
	
	//*****************모니터링****************
	//생산성지표 조회
	public List<ProdDailyAdmVo> prodIndicaList(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectList(namespace+".prodIndicaList" ,prodDailyAdmVo );
	}
	
	//공정불량 그래프 조회
	public List<ProdDailyAdmVo> procFaultyRateList(ProdDailyAdmVo prodDailyAdmVo) throws Exception{
		return session.selectList(namespace+".procFaultyRateList" ,prodDailyAdmVo );
	}
}
