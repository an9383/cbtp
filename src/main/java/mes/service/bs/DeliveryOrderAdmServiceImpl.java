package mes.service.bs;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bs.DeliveryOrderAdmVo;
import mes.persistence.bs.DeliveryOrderAdmDAO;

@Service
public class DeliveryOrderAdmServiceImpl implements DeliveryOrderAdmService {

	@Inject
	private DeliveryOrderAdmDAO dao;
	
	//출고요청등록 조회
	@Override
	public List<DeliveryOrderAdmVo> deliveryOrderAdmList(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return dao.deliveryOrderAdmList(deliveryOrderAdmVo);
	}
	
	//출고요청등록 조회
	public DeliveryOrderAdmVo deliveryOrderAdmRead(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return dao.deliveryOrderAdmRead(deliveryOrderAdmVo);
	}
	
	//출고요청등록 조회
	@Override
	public void deliveryOrderAdmIns(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		dao.deliveryOrderAdmIns(deliveryOrderAdmVo);
	}
	
	//출고요청등록 조회
	@Override
	public void deliveryOrderAdmUpd(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		dao.deliveryOrderAdmUpd(deliveryOrderAdmVo);
	}
	
	//출고요청등록 조회
	@Override
	public void deliveryOrderAdmDel(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		dao.deliveryOrderAdmDel(deliveryOrderAdmVo);
	}
	
	//출고요청등록 조회
	@Override
	public String getDoNo(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return dao.getDoNo(deliveryOrderAdmVo);
	}
	
	
}
