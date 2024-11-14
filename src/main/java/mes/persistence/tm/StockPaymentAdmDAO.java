package mes.persistence.tm;

import java.util.List;

import mes.domain.tm.StockPaymentAdmVo;

public interface StockPaymentAdmDAO {

	//수불관리 조회(코드별)
	public List<StockPaymentAdmVo> stockPaymentAdmList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	//수불관리 상세조회
	public List<StockPaymentAdmVo> stockPaymentAdmRead(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
		
	//수불관리 조회(바코드별)
	public List<StockPaymentAdmVo> stockPaymentAdmBarcodeList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	//수불관리 조회(창고별)
	public List<StockPaymentAdmVo> stockPaymentAdmLocList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	//수불관리 조회(창고별)
	public List<StockPaymentAdmVo> stockPaymentAdmAreaList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	//수불관리 등록
	public void stockPaymentAdmCreate(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	//수불관리 수정
	public void stockPaymentAdmUpdate(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	//수불관리 삭제
	public void stockPaymentAdmDelete(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	//수불 전표번호 시퀀스 가져오기 
	public String getSpNo(String date) throws Exception;
	
	//수불 순번 가져오기 
	public String getSpSeq(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	//제품 BarcodeNo 생성
	public String getItemBarcodeNo(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	//재고위치관리
	public List<StockPaymentAdmVo> stockLocList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	
	
	//수불 부품 바코드 상세조회
	public StockPaymentAdmVo itemPartRead(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	// ================================== 모니터링(재고현황) =======================================
	// 원자재 목록조회
	public List<StockPaymentAdmVo> stockPaymentAdmDtlList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	// 원자재 창고별 현재고 목록조회
	public List<StockPaymentAdmVo> locationToStockPayment(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	// 원자재 창고별 입고일자별 현재고 목록조회
	public List<StockPaymentAdmVo> locationDateToStockPayment(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	// 창고별 LOT 목록조회
	public List<StockPaymentAdmVo> locationToLot(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	// 위치별 품목 재고 목록조회
	public List<StockPaymentAdmVo> floorToStockPayment(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	// 바코드별 위치별 재고 조회(pda 재고 현황)
	public List<StockPaymentAdmVo> locationGroupStockQtyList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	//입고관리 테이블의 바코드 존재 여부 확인
	public int inOutBarcodeCheck(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	//제품입출고관리 테이블의 바코드 존재 여부 확인 
	public int itemBarcodeCheck(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	//해당하는 바코드에 맞는 자재 정보 읽어오기
	public StockPaymentAdmVo itemInfoAdmRead1(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	//해당하는 바코드에 맞는 제품 정보 읽어오기
	public StockPaymentAdmVo itemInfoAdmRead2(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
	//수불부 현황 목록조회
	public List<StockPaymentAdmVo> stockPaymentStatusList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception;
	
}
