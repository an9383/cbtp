package mes.persistence.mm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.po.WorkOrderVo;

@Repository
public class mmsc0110DAOImpl implements mmsc0110DAO {
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.mm.mmsc0110Mapper";
	
	//수주접수(전체)
	public int countBizOrederAdmAll() throws Exception{
		return session.selectOne(namespace+".countBizOrederAdmAll");
	}
	
	//수주접수(금일)
	public int countBizOrederAdmToday(String date) throws Exception{
		return session.selectOne(namespace+".countBizOrederAdmToday" , date);
	}
	
	//발주대기
	public int countPurchaseOrderDtl() throws Exception{
		return session.selectOne(namespace+".countPurchaseOrderDtl");
	}
	
	//자재미입고
	public int countInOutWhsAdm() throws Exception{
		return session.selectOne(namespace+".countInOutWhsAdm");
	}
	
	//공정현황
	public int countWorkOrderPrcssAdm() throws Exception{
		return session.selectOne(namespace+".countWorkOrderPrcssAdm");
	}
	
	//생산지시수량(소형)
	public int countWorkOrdQty1(String date) throws Exception{
		return session.selectOne(namespace+".countWorkOrdQty1" ,date);
	}
	
	//생산지시수량(중형)
	public int countWorkOrdQty2(String date) throws Exception{
		return session.selectOne(namespace+".countWorkOrdQty2" ,date);
	}
	
	//생산량(소형,중형)
	public List<WorkOrderVo> countWorkOrdOutputQty(String date) throws Exception{
		return session.selectList(namespace+".countWorkOrdOutputQty",date);
	}
	
	//불량개수(소형)
	public int countFaultyRate1(String date) throws Exception{
		return session.selectOne(namespace+".countFaultyRate1",date);
	}
	
	//불량개수(중형)
	public int countFaultyRate2(String date) throws Exception{
		return session.selectOne(namespace+".countFaultyRate2",date);
	}
}
