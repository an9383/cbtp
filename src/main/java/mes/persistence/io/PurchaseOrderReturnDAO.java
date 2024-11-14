package mes.persistence.io;

import java.util.List;

import mes.domain.io.PurchaseOrderReturnVo;

public interface PurchaseOrderReturnDAO {

	//반품번호 생성
	public String getRetnNo(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;
	
	//반품 목록조회
	public List<PurchaseOrderReturnVo> purchaseOrderReturnList(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;

	//반품 등록
	public void purchaseOrderReturnCreate(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;

	//반품 수정
	public void purchaseOrderReturnUpdate(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;

	//반품 삭제
	public void purchaseOrderReturnDelete(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception;

}
