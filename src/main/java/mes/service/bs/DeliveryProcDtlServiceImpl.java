package mes.service.bs;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bs.DeliveryProcDtlVo;
import mes.persistence.bs.DeliveryProcDtlDAO;

@Service
public class DeliveryProcDtlServiceImpl implements DeliveryProcDtlService {

	@Inject
	private DeliveryProcDtlDAO dao;
	
	//출고처리 조회
	public List<DeliveryProcDtlVo> deliveryProcDtlList(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		return dao.deliveryProcDtlList(deliveryProcDtlVo);
	}
	
	//출고처리 등록
	public void deliveryProcDtlIns(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		dao.deliveryProcDtlIns(deliveryProcDtlVo);
	}
	
	//출고처리 수정
	public void deliveryProcDtlUpd(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		dao.deliveryProcDtlUpd(deliveryProcDtlVo);
	}
	
	//출고처리 삭제
	public void deliveryProcDtlDel(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		dao.deliveryProcDtlDel(deliveryProcDtlVo);
	}
	
	//출고번호 생성
	public String getDpNo(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		return dao.getDpNo(deliveryProcDtlVo);
	}
	
	//바코드별 제품출고 모니터링 조회
	public List<DeliveryProcDtlVo> itemWhsAdmMonitoringList(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		return dao.itemWhsAdmMonitoringList(deliveryProcDtlVo);
	}
}
