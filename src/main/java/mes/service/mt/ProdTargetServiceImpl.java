package mes.service.mt;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.mt.ProdTargetVo;
import mes.persistence.mt.ProdTargetDAO;

@Service
public class ProdTargetServiceImpl implements ProdTargetService {

	@Inject
	private ProdTargetDAO dao;
	
	// 생산목표대비실적(레이저) 리스트
	@Override
	public List<ProdTargetVo> prodTargetTotalList(ProdTargetVo prodTargetVo) throws Exception {
		return dao.prodTargetTotalList(prodTargetVo);
	}
	
	// 생산목표대비실적(레이저) 불량수량 리스트
	@Override
	public List<ProdTargetVo> prodTargetFaultyList(ProdTargetVo prodTargetVo) throws Exception {
		return dao.prodTargetFaultyList(prodTargetVo);
	}
	
	// 생산목표대비실적(레이저) 생산수량 리스트
	@Override
	public List<ProdTargetVo> prodTargetProdList(ProdTargetVo prodTargetVo) throws Exception {
		return dao.prodTargetProdList(prodTargetVo);
	}
	
	// 생산목표대비실적(후가공) 리스트
	public List<ProdTargetVo> prodTargetFinishList(ProdTargetVo prodTargetVo) throws Exception {
		return dao.prodTargetFinishList(prodTargetVo);
	}
}
