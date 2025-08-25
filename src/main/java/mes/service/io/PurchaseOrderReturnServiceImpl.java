package mes.service.io;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.io.PurchaseOrderAdmVo;
import mes.domain.io.PurchaseOrderReturnVo;
import mes.persistence.io.PurchaseOrderReturnDAO;

@Service
public class PurchaseOrderReturnServiceImpl implements PurchaseOrderReturnService {
	
	@Inject
	private PurchaseOrderReturnDAO dao;
	
	//반품번호 생성
	public String getRetnNo(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return dao.getRetnNo(purchaseOrderReturnVo);
	}
	
	//반품 목록조회
	public List<PurchaseOrderReturnVo> purchaseOrderReturnList(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return dao.purchaseOrderReturnList(purchaseOrderReturnVo);
	}

	//반품 등록
	public void purchaseOrderReturnCreate(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		dao.purchaseOrderReturnCreate(purchaseOrderReturnVo);
	}

	//반품 수정
	public void purchaseOrderReturnUpdate(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		dao.purchaseOrderReturnUpdate(purchaseOrderReturnVo);
	}

	//반품 삭제
	public void purchaseOrderReturnDelete(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		dao.purchaseOrderReturnDelete(purchaseOrderReturnVo);
	}
}
