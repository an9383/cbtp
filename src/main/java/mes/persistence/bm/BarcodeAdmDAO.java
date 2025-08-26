package mes.persistence.bm;

import java.util.List;

import mes.domain.bm.AttachDataVo;
import mes.domain.bm.BarcodeAdmVo;
import mes.domain.bm.MeasureInstrmtAdmVo;

public interface BarcodeAdmDAO {
	
	//자제 목록 조회
	public List<BarcodeAdmVo>barcodeAdmPartList(BarcodeAdmVo barcodeAdmVo) throws Exception;
	
	//제품 목록 조회
	public List<BarcodeAdmVo>barcodeAdmItemList(BarcodeAdmVo barcodeAdmVo) throws Exception;
}
