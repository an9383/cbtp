package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.BarcodeAdmVo;
import mes.persistence.bm.BarcodeAdmDAO;

@Service
public class BarcodeAdmServiceImpl implements BarcodeAdmService {
	
	@Inject
	private BarcodeAdmDAO dao;
	
	//자재 목록 조회
	@Override
	public List<BarcodeAdmVo>barcodeAdmPartList(BarcodeAdmVo barcodeAdmVo) throws Exception {
		return dao.barcodeAdmPartList(barcodeAdmVo);
	}

	//제품 목록 조회
	@Override
	public List<BarcodeAdmVo>barcodeAdmItemList(BarcodeAdmVo barcodeAdmVo) throws Exception {
		return dao.barcodeAdmItemList(barcodeAdmVo);
	}
}
