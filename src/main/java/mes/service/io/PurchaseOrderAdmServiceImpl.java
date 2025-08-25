package mes.service.io;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.io.PurchaseOrderAdmVo;
import mes.persistence.io.PurchaseOrderAdmDAO;

@Service
public class PurchaseOrderAdmServiceImpl implements PurchaseOrderAdmService {

	@Inject
	private PurchaseOrderAdmDAO dao;
	
	@Override
	public List<PurchaseOrderAdmVo> purchaseOrderList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception {
		return dao.purchaseOrderList(purchaseOrderAdmVo);
	}
	

	//발주관리 기본조회
	public List<PurchaseOrderAdmVo> purchaseOrderRead(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		return dao.purchaseOrderRead(purchaseOrderAdmVo);
	}
	

	//발주관리 상세조회
	@Override
	public List<PurchaseOrderAdmVo> purchaseOrderDetailRead(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception {
		return dao.purchaseOrderDetailRead(purchaseOrderAdmVo);
	}
	
	//발주관리 부품정보 목록조회
	public List<PurchaseOrderAdmVo> purchaseOrderDtlList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		return dao.purchaseOrderDtlList(purchaseOrderAdmVo);
	}
	
	//발주관리 등록
	@Override
	public void purchaseOrderAdmCreate(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception {
		dao.purchaseOrderAdmCreate(purchaseOrderAdmVo);
	}
	
	//발주상세 등록
	public void purchaseOrderDtlCreate(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		dao.purchaseOrderDtlCreate(purchaseOrderAdmVo);
	}
	
	//발주관리 수정
	@Override
	public void purchaseOrderAdmUpdate(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception {
		dao.purchaseOrderAdmUpdate(purchaseOrderAdmVo);
	}
	
	//발주상세 수정
	public void purchaseOrderDtlUpdate(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		dao.purchaseOrderDtlUpdate(purchaseOrderAdmVo);
	}

	//발주관리 삭제
	public void purchaseOrderDelete(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		dao.purchaseOrderDelete(purchaseOrderAdmVo);
	}
	
	//발주상세 삭제
	public void purchaseOrderDtlDelete(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		dao.purchaseOrderDtlDelete(purchaseOrderAdmVo);
	}
	
	//발주금액 수정 
	public void ordAmtUpdate(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		dao.ordAmtUpdate(purchaseOrderAdmVo);
	}
	
	//발주번호 생성
	@Override
	public String getPoNo(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception {
		return dao.getPoNo(purchaseOrderAdmVo);
	}
	
	//발주시퀀스 생성
	public Integer getPoSeq(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		return dao.getPoSeq(purchaseOrderAdmVo);
	}
	
	//발주번호 중복확인
	public Integer overlapPoNo(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		return dao.overlapPoNo(purchaseOrderAdmVo);
	}
	
	
	//변경납기일 수정
	public void dlvChangeDateUpdate(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		dao.dlvChangeDateUpdate(purchaseOrderAdmVo);
	}
	
	//발주예정수량과 발주수량 비교
	public PurchaseOrderAdmVo compareOrderQty(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		 return dao.compareOrderQty(purchaseOrderAdmVo);
	}
	
	//발주상태 수정(발주예정일<=발주수량)
	public void poStatusYUpdate(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		dao.poStatusYUpdate(purchaseOrderAdmVo);
	}
	
	//발주현황
	public List<PurchaseOrderAdmVo> purchaseOrderStatusList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		return dao.purchaseOrderStatusList(purchaseOrderAdmVo);
	}
	
	//입고등록(봉제) 공급사 조회
	public List<PurchaseOrderAdmVo> purchaseDealCorpList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		return dao.purchaseDealCorpList(purchaseOrderAdmVo);
	}
	
	//발주서출력 목록조회
	public List<PurchaseOrderAdmVo> purchaseOrderPrintList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		return dao.purchaseOrderPrintList(purchaseOrderAdmVo);
	}
	
	//발주서출력 목록 조회2
	public List<PurchaseOrderAdmVo> purchaseOrderPrintToList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		return dao.purchaseOrderPrintToList(purchaseOrderAdmVo);
	}
	
	//발주서 출력 표1 목록 조회
	public List<PurchaseOrderAdmVo> purchaseOrderPrintTableList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		return dao.purchaseOrderPrintTableList(purchaseOrderAdmVo);
	}
	
	//발주서출력 상세보기
	@Override
	public PurchaseOrderAdmVo purchaseOrderStatusRead(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception {
		return dao.purchaseOrderStatusRead(purchaseOrderAdmVo);
	}
	
	//발주서출력 수정
	public void purchaseOrderPrintUpdate(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		dao.purchaseOrderPrintUpdate(purchaseOrderAdmVo);
	}
	
	//발주서출력 출력여부
	public void purchaseOrderPrintWhetherUpdate(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		dao.purchaseOrderPrintWhetherUpdate(purchaseOrderAdmVo);
	}
	
	//발주마감 발주상태 확인
	public String poStatusCheck(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		return dao.poStatusCheck(purchaseOrderAdmVo);
	}
	
	//발주마감 발주종료일 수정
	public void poEndDateUpdate(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		dao.poEndDateUpdate(purchaseOrderAdmVo);
	}
	
	//발주마감 발주상태 수정
	public void poStatusUpdate(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		dao.poStatusUpdate(purchaseOrderAdmVo);
	}
	
	//발주 모니터링 목록조회
	public List<PurchaseOrderAdmVo> poMonitoringList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		return dao.poMonitoringList(purchaseOrderAdmVo);
	}
	
	//발주 일자 가져오기
	public PurchaseOrderAdmVo poDateList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		return dao.poDateList(purchaseOrderAdmVo);
	}
	
	//수입검사 관리대장 목록조회
	public List<PurchaseOrderAdmVo> itemInspectMasterAdmList (PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		return dao.itemInspectMasterAdmList(purchaseOrderAdmVo);
	}
	
	// 기간별 수입검사 결과조회 
	public List<PurchaseOrderAdmVo> inspTestResultList(PurchaseOrderAdmVo purchaseOrderAdmVo) throws Exception{
		return dao.inspTestResultList(purchaseOrderAdmVo);
	}
}
