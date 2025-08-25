package mes.service.tm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.tm.StockPaymentAdmVo;
import mes.persistence.tm.StockPaymentAdmDAO;

@Service
public class StockPaymentAdmServiceImpl implements StockPaymentAdmService {

	@Inject
	private StockPaymentAdmDAO dao;
	
	//수불관리 조회(코드별)
	@Override
	public List<StockPaymentAdmVo> stockPaymentAdmList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return dao.stockPaymentAdmList(stockPaymentAdmVo);
	}
	
	//수불관리 상세조회
	@Override
	public List<StockPaymentAdmVo> stockPaymentAdmRead(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		 return dao.stockPaymentAdmRead(stockPaymentAdmVo);
	}
	
	//수불관리 조회(바코드별)
	public List<StockPaymentAdmVo> stockPaymentAdmBarcodeList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return dao.stockPaymentAdmBarcodeList(stockPaymentAdmVo);
	}
	
	//수불관리 조회(창고별)
	public List<StockPaymentAdmVo> stockPaymentAdmLocList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return dao.stockPaymentAdmLocList(stockPaymentAdmVo);
	}
	
	//수불관리 조회(구역별)
	public List<StockPaymentAdmVo> stockPaymentAdmAreaList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return dao.stockPaymentAdmAreaList(stockPaymentAdmVo);
	}
		
	//수불관리 등록
	@Override
	public void stockPaymentAdmCreate(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		dao.stockPaymentAdmCreate(stockPaymentAdmVo);
	}
	
	//수불관리 수정
	@Override
	public void stockPaymentAdmUpdate(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		dao.stockPaymentAdmUpdate(stockPaymentAdmVo);
	}
	
	//수불관리 삭제
	@Override
	public void stockPaymentAdmDelete(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		dao.stockPaymentAdmDelete(stockPaymentAdmVo);
	}
	
	//수불 전표번호 시퀀스 가져오기 
	@Override
	public String getSpNo(String date) throws Exception{
		return dao.getSpNo(date);
	}
	
	//수불 순번 가져오기 
	@Override
	public String getSpSeq(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return dao.getSpSeq(stockPaymentAdmVo);
	}
	
	//제품 BarcodeNo 생성
	@Override
	public String getItemBarcodeNo(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return dao.getItemBarcodeNo(stockPaymentAdmVo);
	}
	
	
	//재고위치관리
	@Override
	public List<StockPaymentAdmVo> stockLocList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return dao.stockLocList(stockPaymentAdmVo);
	}
	
	//수불 부품 바코드 상세조회
	@Override
	public StockPaymentAdmVo itemPartRead(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return dao.itemPartRead(stockPaymentAdmVo);
	}
	
	// ================================== 모니터링(재고현황) =======================================
	// 원자재 목록조회
	@Override
	public List<StockPaymentAdmVo> stockPaymentAdmDtlList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return dao.stockPaymentAdmDtlList(stockPaymentAdmVo);
	}
	
	// 원자재 창고별 현재고 목록조회
	@Override
	public List<StockPaymentAdmVo> locationToStockPayment(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return dao.locationToStockPayment(stockPaymentAdmVo);
	}
	
	// 원자재 창고별 입고일자별 현재고 목록조회
	@Override
	public List<StockPaymentAdmVo> locationDateToStockPayment(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return dao.locationDateToStockPayment(stockPaymentAdmVo);
	}
	
	// 창고별 LOT 목록조회
	@Override
	public List<StockPaymentAdmVo> locationToLot(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return dao.locationToLot(stockPaymentAdmVo);
	}
	
	// 위치별 품목 재고 목록조회
	@Override
	public List<StockPaymentAdmVo> floorToStockPayment(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return dao.floorToStockPayment(stockPaymentAdmVo);
	}
	
	// 바코드별 위치별 재고 조회(pda 재고 현황)
	@Override
	public List<StockPaymentAdmVo> locationGroupStockQtyList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return dao.locationGroupStockQtyList(stockPaymentAdmVo);
	}
	
	//입고관리 테이블의 바코드 존재 여부 확인
	@Override
	public int inOutBarcodeCheck(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return dao.inOutBarcodeCheck(stockPaymentAdmVo);
	}
	
	//제품입출고관리 테이블의 바코드 존재 여부 확인
	@Override
	public int itemBarcodeCheck(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return dao.itemBarcodeCheck(stockPaymentAdmVo);
	}
	
	//해당하는 바코드에 맞는 자재 정보 읽어오기
	@Override
	public StockPaymentAdmVo itemInfoAdmRead1(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return dao.itemInfoAdmRead1(stockPaymentAdmVo);
	}
	
	//해당하는 바코드에 맞는 제품 정보 읽어오기
	@Override
	public StockPaymentAdmVo itemInfoAdmRead2(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return dao.itemInfoAdmRead2(stockPaymentAdmVo);
	}
	
	//수불부 현황 목록조회
	@Override
	public List<StockPaymentAdmVo> stockPaymentStatusList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return dao.stockPaymentStatusList(stockPaymentAdmVo);
	}
	
}
