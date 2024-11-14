package mes.domain.tm;

import lombok.Data;

@Data
public class StockPaymentAdmVo {

	private String rowId;		//ROWID
	private String spNo;		//전표번호
	private String spSeq;		//순번
	private String spType;		//품목구분
	private String spTypeNm;		//품목구분
	private String spCd;		//품목코드
	private String spRev;		//품목리비전
	private String spNm;		//품목명
	private String spSpec;		//품목규격
	private String spUnit;		//품목단위
	private String unitCost;	//단가
	private String spGubun;		//구분(입고,출고)
	private String spGubunNm;	//구분(입고,출고)
	private String spSubGubun;		//
	private String spSubGubunNm;	//
	private String itemFifoGubun;	//선입선출유무
	private String cutSize;			//CUT SIZE
	private String itemColor;		//PNL SIZE
	private String fillingWt;		//충진중량
	private String inDate;			//입고일자
	
	private String spDate;		//일자
	private String spQty;		//수량
	private String inQty;		//입고수량
	private String outQty;		//출고수량
	private String adjInQty;	//조정입고수량
	private String adjOutQty;   //조정출고수량
	private String tmMon;		//전월
	private String tmDate;		//일자
	private String tmQty;		//전월재고
	private String realQty;		//현재고
	private String barcodeNo;	//바코드번호
	private String sourceNo;	//원천번호
	private String locationCd;	//창고번호
	private String locMainGubun;	//창고메인구분
	private String locMainGubunNm;	//창고메인구분명
	private String locationNm;	//창고번호
	private String areaCd;		//구역번호
	private String areaNm;		//구역번호
	private String floorCd;		//위치번호
	private String floorNm;
	private String locationNo;	//창고바코드번호
	private String spDesc;		//비고
	private String regId;		//등록자
	private String regDate;		//등록일
	private String updId;		//수정자
	private String updDate;		//수정일
	
	private String spSubGubunYn;	//이동전표 내역 보기 사용유무
	private String dateRange;		//입고일자 경과범례
	
	private String[] array;	
	
	private String partCd;		
	private String partRev;	
	private String partNm;		
	private String partUnitNm;		
	private String partSpec;	
	private String realQtyOption;
	private String startDate;
	private String endDate;
	
	//추가사항
	private String itemSeq;
	private String mainGubun;
	private String mainGubunNm;
	private String itemGubun;
	private String itemGubunNm;
	private String itemModel;
	private String itemModelNm;
	private String itemCd;
	private String itemNm;
	private String itemMaker;
	private String lhrhCd;
	private String lhrhCdNm;
	private String boxCount;
	private String itemUnit;
	private String itemUnitNm;
	private String aQty;
	private String bQty;
	private String cQty;
	private String dQty;
	private String locationCdNm;
	private String areaCdNm;

	
	private String lotNo;
	private String qaEval;
	private String itemCus;
	
	private String initQty;
	private String sumQty;
	private String nowInQty;
	private String nowOutQty;
	
	private String fifoOption;	//자재 조건(사출)
	private String fifoOption2;	//제품 조건(사출)
	private String fifoOption3;	//자재 조건(봉제)
	private String fifoOption4;	//제품 조건(봉제)
	
	private String fifoBarcodeNo;
	private String ordLotNoDate;
	
	private String importCost;
	private String exportCost;
	private String initStockQty;
	private String spImQty1;
	private String spImQty2;
	private String spImQty3;
	private String spImQty4;
	private String spImQty5;
	private String spImQty6;
	private String spImQty7;
	private String spImQty8;
	private String spImQty9;
	private String spImQty10;
	private String spImQty11;
	private String spImQty12;
	private String spExQty1;
	private String spExQty2;
	private String spExQty3;
	private String spExQty4;
	private String spExQty5;
	private String spExQty6;
	private String spExQty7;
	private String spExQty8;
	private String spExQty9;
	private String spExQty10;
	private String spExQty11;
	private String spExQty12;
	private String spStockQty1;
	private String spStockQty2;
	private String spStockQty3;
	private String spStockQty4;
	private String spStockQty5;
	private String spStockQty6;
	private String spStockQty7;
	private String spStockQty8;
	private String spStockQty9;
	private String spStockQty10;
	private String spStockQty11;
	private String spStockQty12;
	private String stockYear;

}
