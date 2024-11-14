package mes.persistence.tm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.tm.StockPaymentAdmVo;

@Repository
public class StockPaymentAdmDAOImpl implements StockPaymentAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.tm.stockPaymentAdmMapper";

	//수불관리 조회(코드별)
	public List<StockPaymentAdmVo> stockPaymentAdmList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return session.selectList(namespace+".stockPaymentAdmList" , stockPaymentAdmVo);
	}
	
	//수불관리 상세조회
	public List<StockPaymentAdmVo> stockPaymentAdmRead(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return session.selectList(namespace+".stockPaymentAdmRead" , stockPaymentAdmVo);
	}
	
	//수불관리 조회(바코드별)
	public List<StockPaymentAdmVo> stockPaymentAdmBarcodeList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return session.selectList(namespace+".stockPaymentAdmBarcodeList" ,stockPaymentAdmVo );
	}
	
	//수불관리 조회(창고별)
	public List<StockPaymentAdmVo> stockPaymentAdmLocList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return session.selectList(namespace+".stockPaymentAdmLocList" , stockPaymentAdmVo);
	}
	
	//수불관리 조회(구역별)
	public List<StockPaymentAdmVo> stockPaymentAdmAreaList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return session.selectList(namespace+".stockPaymentAdmAreaList" , stockPaymentAdmVo);
	}
	
	//수불관리 등록
	public void stockPaymentAdmCreate(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		session.insert(namespace+".stockPaymentAdmCreate" , stockPaymentAdmVo);
	}

	//수불관리 수정
	public void stockPaymentAdmUpdate(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		session.update(namespace+".stockPaymentAdmUpdate" , stockPaymentAdmVo);
	}
	
	//수불관리 삭제
	public void stockPaymentAdmDelete(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		session.delete(namespace+".stockPaymentAdmDelete" ,stockPaymentAdmVo );
	}
	
	//수불 전표번호 시퀀스 가져오기 
	public String getSpNo(String date) throws Exception{
		return session.selectOne(namespace+".getSpNo",date);
	}
	
	//수불 순번 가져오기 
	public String getSpSeq(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return session.selectOne(namespace+".getSpSeq" , stockPaymentAdmVo);
	}
	
	//제품 BarcodeNo 생성
	@Override
	public String getItemBarcodeNo(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return session.selectOne(namespace+".getItemBarcodeNo" , stockPaymentAdmVo);
	}
	
	
	//재고위치관리
	public List<StockPaymentAdmVo> stockLocList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return session.selectList(namespace+".stockLocList" ,stockPaymentAdmVo );
	}
	
	//수불 부품 바코드 상세조회
	public StockPaymentAdmVo itemPartRead(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return session.selectOne(namespace+".itemPartRead" , stockPaymentAdmVo);
	}

	// ================================== 모니터링(재고현황) =======================================
	// 원자재 목록조회
	@Override
	public List<StockPaymentAdmVo> stockPaymentAdmDtlList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectList(namespace+".stockPaymentAdmDtlList" , stockPaymentAdmVo);
	}
	
	// 원자재 창고별 현재고 목록조회
	@Override
	public List<StockPaymentAdmVo> locationToStockPayment(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectList(namespace+".locationToStockPayment" , stockPaymentAdmVo);
	}
	
	// 원자재 창고별 입고일자별 현재고 목록조회
	@Override
	public List<StockPaymentAdmVo> locationDateToStockPayment(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectList(namespace+".locationDateToStockPayment" , stockPaymentAdmVo);
	}
	
	// 창고별 LOT 목록조회
	@Override
	public List<StockPaymentAdmVo> locationToLot(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectList(namespace+".locationToLot" , stockPaymentAdmVo);
	}
	
	// 위치별 품목 재고 목록조회
	@Override
	public List<StockPaymentAdmVo> floorToStockPayment(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectList(namespace+".floorToStockPayment" , stockPaymentAdmVo);
	}
	
	// 바코드별 위치별 재고 조회(pda 재고 현황)
	@Override
	public List<StockPaymentAdmVo> locationGroupStockQtyList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectList(namespace+".locationGroupStockQtyList" , stockPaymentAdmVo);
	}
	
	//입고관리 테이블의 바코드 존재 여부 확인
	@Override
	public int inOutBarcodeCheck(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectOne(namespace+".inOutBarcodeCheck" , stockPaymentAdmVo);
	}
	
	//제품입출고관리 테이블의 바코드 존재 여부 확인
	@Override
	public int itemBarcodeCheck(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectOne(namespace+".itemBarcodeCheck" , stockPaymentAdmVo);
	}
	
	//해당하는 바코드에 맞는 자재 정보 읽어오기
	@Override
	public StockPaymentAdmVo itemInfoAdmRead1(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectOne(namespace+".itemInfoAdmRead1" , stockPaymentAdmVo);
	}
	
	//해당하는 바코드에 맞는 제품 정보 읽어오기
	@Override
	public StockPaymentAdmVo itemInfoAdmRead2(StockPaymentAdmVo stockPaymentAdmVo) throws Exception {
		return session.selectOne(namespace+".itemInfoAdmRead2" , stockPaymentAdmVo);
	}
	
	//수불부 현황 목록조회
	public List<StockPaymentAdmVo> stockPaymentStatusList(StockPaymentAdmVo stockPaymentAdmVo) throws Exception{
		return session.selectList(namespace + ".stockPaymentStatusList", stockPaymentAdmVo);
	}
	
}
