package mes.service.tm;

import java.util.List;

import mes.domain.tm.StockAdjustAdmVo;

public interface StockAdjustAdmService {

	//자재,제품 목록조회
	public List<StockAdjustAdmVo> itemAllList(StockAdjustAdmVo stockAdjustAdmVo) throws Exception;
	
	//재고반영 목록조회
	public List<StockAdjustAdmVo> preStockList(StockAdjustAdmVo stockAdjustAdmVo) throws Exception;
	
	//초기재고 등록
	public int preStockCreate(StockAdjustAdmVo stockAdjustAdmVo) throws Exception;
	
	//초기재고 재고반영 수정
	public int approvalYnUpdate(StockAdjustAdmVo stockAdjustAdmVo) throws Exception;
	
	//전표번호 생성
	public String getSaNo(StockAdjustAdmVo stockAdjustAdmVo) throws Exception;
	
	//순번 생성
	public String getSaSeq(StockAdjustAdmVo stockAdjustAdmVo) throws Exception;
	
	//자재테이블 바코드 여부
	public String getSaBarcode(StockAdjustAdmVo stockAdjustAdmVo) throws Exception;
	
	//자재 바코드 생성
	public String getPartBarcodeNo(StockAdjustAdmVo stockAdjustAdmVo) throws Exception;
	
	//제품 바코드 생성
	public String getItemBarcodeNo(StockAdjustAdmVo stockAdjustAdmVo) throws Exception;

	//원자재 바코드 시퀀스 생성
	public String getPartBarcodeSeq(String barcodeNo) throws Exception;
	
	//재고조정테이블 존재유무확인
	public int stockAdjustAdmExistYn(StockAdjustAdmVo stockAdjustAdmVo) throws Exception;
	
	//초기재고 및 재고조정 삭제
	public void stockAdjustAdmDelete(StockAdjustAdmVo stockAdjustAdmVo) throws Exception;
	
	//재고수불테이블  삭제
	public void stockPaymentAdmDelete(StockAdjustAdmVo stockAdjustAdmVo) throws Exception;
	
	//출고테이블 삭제
	public void outWhsAdmDelete(StockAdjustAdmVo stockAdjustAdmVo) throws Exception;
	
	//재고조정관리
	//자재,제품 목록조회
	public List<StockAdjustAdmVo> itemAllList2(StockAdjustAdmVo stockAdjustAdmVo) throws Exception;
	
	
	//재고위치관리
	public List<StockAdjustAdmVo> stockLocList(String[] locArr) throws Exception;
}
