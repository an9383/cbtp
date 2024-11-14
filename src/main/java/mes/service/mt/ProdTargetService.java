package mes.service.mt;

import java.util.List;

import mes.domain.mt.ControllSystemVo;
import mes.domain.mt.LaserOperInfoVo;
import mes.domain.mt.ProdTargetVo;

public interface ProdTargetService {
	
	// 생산목표대비실적(레이저) 리스트
	public List<ProdTargetVo> prodTargetTotalList(ProdTargetVo prodTargetVo) throws Exception;
	
	// 생산목표대비실적(레이저) 불량수량 리스트
	public List<ProdTargetVo> prodTargetFaultyList(ProdTargetVo prodTargetVo) throws Exception;
	
	// 생산목표대비실적(레이저) 생산수량 리스트
	public List<ProdTargetVo> prodTargetProdList(ProdTargetVo prodTargetVo) throws Exception;
	
	// 생산목표대비실적(후가공) 리스트
	public List<ProdTargetVo> prodTargetFinishList(ProdTargetVo prodTargetVo) throws Exception;
}
