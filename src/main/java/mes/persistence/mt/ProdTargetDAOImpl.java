package mes.persistence.mt;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.mt.ProdTargetVo;

@Repository
public class ProdTargetDAOImpl implements ProdTargetDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.mt.prodTargetMapper";
	
	// 생산목표대비실적(레이저) 리스트
	@Override
	public List<ProdTargetVo> prodTargetTotalList(ProdTargetVo prodTargetVo) throws Exception {
		return session.selectList(namespace+".prodTargetTotalList", prodTargetVo);
	}
	
	// 생산목표대비실적(레이저) 불량수량 리스트
	@Override
	public List<ProdTargetVo> prodTargetFaultyList(ProdTargetVo prodTargetVo) throws Exception {
		return session.selectList(namespace+".prodTargetFaultyList", prodTargetVo);
	}
	
	// 생산목표대비실적(레이저) 생산수량 리스트
	@Override
	public List<ProdTargetVo> prodTargetProdList(ProdTargetVo prodTargetVo) throws Exception {
		return session.selectList(namespace+".prodTargetProdList", prodTargetVo);
	}
	
	// 생산목표대비실적(후가공) 리스트
	@Override
	public List<ProdTargetVo> prodTargetFinishList(ProdTargetVo prodTargetVo) throws Exception {
		return session.selectList(namespace+".prodTargetFinishList", prodTargetVo);
	}
}