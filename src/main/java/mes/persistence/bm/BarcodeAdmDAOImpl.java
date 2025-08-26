package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.AttachDataVo;
import mes.domain.bm.BarcodeAdmVo;
import mes.domain.bm.MeasureInstrmtAdmVo;

@Repository
public class BarcodeAdmDAOImpl implements BarcodeAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.barcodeAdmMapper";
	
	//자제 목록 조회
	public List<BarcodeAdmVo>barcodeAdmPartList(BarcodeAdmVo barcodeAdmVo) throws Exception {
		return session.selectList(namespace+".barcodeAdmPartList", barcodeAdmVo);
	}
	
	//제품 목록 조회
	public List<BarcodeAdmVo>barcodeAdmItemList(BarcodeAdmVo barcodeAdmVo) throws Exception {
		return session.selectList(namespace+".barcodeAdmItemList", barcodeAdmVo);
	}
}
