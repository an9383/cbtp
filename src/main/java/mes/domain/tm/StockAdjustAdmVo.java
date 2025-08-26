package mes.domain.tm;

import lombok.Data;

@Data
public class StockAdjustAdmVo {

	private String saNo;			//전표번호
	private String saSeq;			//순번
	private String saCd;			//자재,제품 코드
	private String saRev;			//자재,제품 리비전
	private String saNm;			//자재,제품 명
	private String saGubun;			//자재,제품 구분
	private String saSpec;			//자재,제품 규격
	private String saType;			//자재,제품 식별
	private String saTypeNm;		//자재,제품 식별명
	private String cmptStockQty;	//전산재고
	private String realStockQty;	//실사재고,조정재고
	private String diffQty;			//차이수량
	private String stockChargr;		//작성자,담당자
	private String barcodeNo;		//바코드번호
	private String locationCd;		//창고
	private String locationNm;		//창고명
	private String areaCd;			//구역
	private String areaNm;			//구역명
	private String floorCd;			//위치
	private String floorNm;			//위치
	private String locationNo;		//location No
	private String approvalDate;	//재고반영일자
	private String approvalYn;		//재고반영유무
	private String stockType;		//유형
	private String saDesc;			//비고
	private String regId;			//등록자
	private String regDate;			//등록일
	private String updId;			//수정자
	private String updDate;			//수정일
	
	private String gubun;
	private String date;
	private String lotDate;			//lot생성일자
	private String value;
	
	private String[] arr;	
	private String inQty;			//입고량
	private String outQty;			//출고량
	private String adjInQty;		//조정입고량
	private String adjOutQty;		//조정출고량
	private String tmQty;
	private String tmMon;			//전월
	
	//초기재고/재고조정시 보여야할 항목
	private String itemSeq;
	private String itemModel;
	private String itemMaker;
	private String itemColor;
	
	private String startDate;
	private String endDate;
	
	private int start;
	private int length;
	private int totalCount;	
	private String searchVal;
	private String ordDir;
	private String ordColumn;
	
	private String mainGubun;	
	private String mainGubunNm;	
	private String itemGubun;
	
	
}
