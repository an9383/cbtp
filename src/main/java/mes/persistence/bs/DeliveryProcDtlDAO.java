package mes.persistence.bs;

import java.util.List;

import mes.domain.bs.DeliveryProcDtlVo;

public interface DeliveryProcDtlDAO {

	//출고처리 조회
	public List<DeliveryProcDtlVo> deliveryProcDtlList(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception;
	
	//출고처리 등록
	public void deliveryProcDtlIns(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception;
	
	//출고처리 수정
	public void deliveryProcDtlUpd(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception;
	
	//출고처리 삭제
	public void deliveryProcDtlDel(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception;
	
	//출고번호 생성
	public String getDpNo(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception;
	
	//바코드별 제품출고 모니터링 조회
	public List<DeliveryProcDtlVo> itemWhsAdmMonitoringList(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception;
}
