package mes.service.bs;

import java.util.List;

import mes.domain.bs.DeliveryOrderAdmVo;

public interface DeliveryOrderAdmService {

	//출고요청등록 조회
	public List<DeliveryOrderAdmVo> deliveryOrderAdmList(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고요청등록 조회
	public DeliveryOrderAdmVo deliveryOrderAdmRead(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고요청등록 등록
	public void deliveryOrderAdmIns(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고요청등록 수정
	public void deliveryOrderAdmUpd(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
	
	//출고요청등록 삭제
	public void deliveryOrderAdmDel(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;

	//출고요청번호 생성
	public String getDoNo(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception;
}
