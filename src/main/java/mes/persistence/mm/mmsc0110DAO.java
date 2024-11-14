package mes.persistence.mm;

import java.util.List;

import mes.domain.po.WorkOrderVo;

public interface mmsc0110DAO {

	//수주접수(전체)
	public int countBizOrederAdmAll() throws Exception;
	
	//수주접수(금일)
	public int countBizOrederAdmToday(String date) throws Exception;
	
	//발주대기
	public int countPurchaseOrderDtl() throws Exception;
	
	//자재미입고
	public int countInOutWhsAdm() throws Exception;
	
	//공정현황
	public int countWorkOrderPrcssAdm() throws Exception;
	
	//생산지시수량(소형)
	public int countWorkOrdQty1(String date) throws Exception;
	
	//생산지시수량(중형)
	public int countWorkOrdQty2(String date) throws Exception;
	
	//생산량(소형,중형)
	public List<WorkOrderVo> countWorkOrdOutputQty(String date) throws Exception;
	
	//불량개수(소형)
	public int countFaultyRate1(String date) throws Exception;
	
	//불량개수(중형)
	public int countFaultyRate2(String date) throws Exception;

}
