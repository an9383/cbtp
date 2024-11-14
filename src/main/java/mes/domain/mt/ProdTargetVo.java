package mes.domain.mt;

import lombok.Data;

@Data
public class ProdTargetVo {
	private String salesMon;		// 월
	private String prodTotalQty;	// 목표수량
	private String prodQty;			// 생산수량
	private String prodFaultyQty;	// 불량수량
	
	private String salesYear;		// 조회년도
}