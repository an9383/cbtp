package mes.service.mm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.po.WorkOrderVo;
import mes.persistence.mm.mmsc0110DAO;

@Service
public class mmsc0110ServiceImpl implements mmsc0110Service {

	@Inject
	private mmsc0110DAO dao;
	

	//수주접수(전체)
	public int countBizOrederAdmAll() throws Exception{
		return dao.countBizOrederAdmAll();
	}
	
	//수주접수(금일)
	public int countBizOrederAdmToday(String date) throws Exception{
		return dao.countBizOrederAdmToday(date);
	}
	
	//발주대기
	public int countPurchaseOrderDtl() throws Exception{
		return dao.countPurchaseOrderDtl();
	}
	
	//자재미입고
	public int countInOutWhsAdm() throws Exception{
		return dao.countInOutWhsAdm();
	}
	
	//공정현황
	public int countWorkOrderPrcssAdm() throws Exception{
		return dao.countWorkOrderPrcssAdm();
	}
	
	//생산지시수량(소형)
	public int countWorkOrdQty1(String date) throws Exception{
		return dao.countWorkOrdQty1(date);
	}
	
	//생산지시수량(중형)
	public int countWorkOrdQty2(String date) throws Exception{
		return dao.countWorkOrdQty2(date);
	}
	
	//생산량(소형,중형)
	public List<WorkOrderVo> countWorkOrdOutputQty(String date) throws Exception{
		return dao.countWorkOrdOutputQty(date);
	}
	
	//불량개수(소형)
	public int countFaultyRate1(String date) throws Exception{
		return dao.countFaultyRate1(date);
	}
	
	//불량개수(중형)
	public int countFaultyRate2(String date) throws Exception{
		return dao.countFaultyRate2(date);
	}
}

