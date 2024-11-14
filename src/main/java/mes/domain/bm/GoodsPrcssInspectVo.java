package mes.domain.bm;

import java.util.Date;
import lombok.Data;

@Data
public class GoodsPrcssInspectVo {

	private String menuAuth;              //메뉴권한
	private String prcssSeq;
	private String goodsCd;
	private String prcssCd;
	private String inspectItem;
	private String inspectItemModel;
	private String inspectItemAllwncePlus;
	private String inspectItemAllwnceMinus;
	private String regId;
	private String regDate;
	private String updId;
	private String updDate;
	
}