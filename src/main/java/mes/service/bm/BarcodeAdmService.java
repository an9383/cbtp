package mes.service.bm;

import java.util.List;

import mes.domain.bm.AttachDataVo;
import mes.domain.bm.BarcodeAdmVo;

public interface BarcodeAdmService {
	
	//자재 목록 조회
	public List<BarcodeAdmVo>barcodeAdmPartList(BarcodeAdmVo barcodeAdmVo) throws Exception;

	//제품 목록 조회
	public List<BarcodeAdmVo>barcodeAdmItemList(BarcodeAdmVo barcodeAdmVo) throws Exception;
}
