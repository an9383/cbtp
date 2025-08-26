package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.GoodsCodeAdmVo;
import mes.domain.bm.GoodsOutputMatrlVo;
import mes.domain.bm.GoodsPrcssBomVo;
import mes.domain.bm.GoodsPrcssImgVo;
import mes.domain.bm.GoodsPrcssInspectVo;
import mes.domain.bm.MatrlCodeAdmVo;


@Repository
public class GoodsCodeAdmDAOImpl implements GoodsCodeAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.goodsCodeAdmMapper";
	
	//제품코드 목록조회
	@Override
	public List<GoodsCodeAdmVo> listAll() throws Exception{
		return session.selectList(namespace+".listAll");
	}
	
	//제품코드 목록조회
	@Override
	public List<GoodsCodeAdmVo> listAllCodeCd(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception{
		return session.selectList(namespace+".listAllCodeCd", goodsCodeAdmVo);
	}
	
	//제품코드 목록조회
	@Override
	public List<GoodsCodeAdmVo> listAllCodeNm(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception{
		return session.selectList(namespace+".listAllCodeNm", goodsCodeAdmVo);
	}
	
	//제품코드 목록조회
	@Override
	public List<GoodsCodeAdmVo> listAllCodeCdNm(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception{
		return session.selectList(namespace+".listAllCodeCdNm", goodsCodeAdmVo);
	}

	//제품코드 상세조회
	@Override
	public GoodsCodeAdmVo read(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception {
		return session.selectOne(namespace+".read", goodsCodeAdmVo);
	}
	
	//제품코드 등록
	@Override
	public void create(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception {
		session.insert(namespace+".create", goodsCodeAdmVo);
	}
	
	//제품코드 코드시퀀스조회	
	@Override
	public String selectGoodsSeqCd() throws Exception{
		return session.selectOne(namespace + ".selectGoodsSeqCd");
	}
	
	//제품코드 수정
	@Override
	public void update(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception {
		session.update(namespace+".update", goodsCodeAdmVo);
	}
	
	//제품코드 품번 중복 확인	
	@Override
	public int overlapChack(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception{
		return session.selectOne(namespace + ".overlapChack", goodsCodeAdmVo);
	}
	
	
	
	//제품코드 BOM ------------------------------------------------------------------
	//제품코드 BOM 존재확인
	@Override
	public String selectBomState(String goodsCd) throws Exception {
		return session.selectOne(namespace+".selectBomState", goodsCd);
	}
	
	//제품코드 BOM 목록조회
	@Override
	public List<GoodsPrcssBomVo> listAllBom(String goodsCd) throws Exception{
		return session.selectList(namespace+".listAllBom", goodsCd);
	}
	
	//제품코드 BOM 테이블 비우기
	@Override
	public void deleteBom(String goodsCd) throws Exception{
		session.delete(namespace+".deleteBom", goodsCd);
	}
	
	//제품코드 BOM 등록
	@Override
	public void updateBom(GoodsPrcssBomVo goodsPrcssBomVo) throws Exception{
		session.insert(namespace+".updateBom", goodsPrcssBomVo);
	}
	
	
	
	//제품코드 투입자재 ------------------------------------------------------------------
	//제품코드 투입자재 존재확인
	@Override
	public String selectMatrlState(String goodsCd) throws Exception {
		return session.selectOne(namespace+".selectMatrlState", goodsCd);
	}
	
	//제품코드 목록조회
	@Override
	public List<GoodsOutputMatrlVo> listAllMatrl(String goodsCd) throws Exception{
		return session.selectList(namespace+".listAllMatrl", goodsCd);
	}
	
	//제품코드 투입자재 테이블 비우기
	@Override
	public void deleteMatrl(String goodsCd) throws Exception{
		session.delete(namespace+".deleteMatrl", goodsCd);
	}
	
	//제품코드 투입자재 등록
	@Override
	public void updateMatrl(GoodsOutputMatrlVo goodsOutputMatrlVo) throws Exception{
		session.insert(namespace+".updateMatrl", goodsOutputMatrlVo);
	}
	
	
	
	//제품코드 사진 ------------------------------------------------------------------
	//제품코드 사진 존재확인
	@Override
	public String selectImgState(String goodsCd) throws Exception {
		return session.selectOne(namespace+".selectImgState", goodsCd);
	}
	
	//제품코드 사진 목록조회
	@Override
	public List<GoodsPrcssImgVo> listAllImg(String goodsCd) throws Exception{
		return session.selectList(namespace+".listAllImg", goodsCd);
	}
	
	//제품코드 사진 등록
	@Override
	public void createImg(GoodsPrcssImgVo goodsPrcssImgVo) throws Exception {
		session.insert(namespace+".createImg", goodsPrcssImgVo);
	}
	
	//제품코드 사진 삭제
	@Override
	public void deleteImg(GoodsPrcssImgVo goodsPrcssImgVo) throws Exception{
		session.delete(namespace+".deleteImg", goodsPrcssImgVo);
	}
	
	//제품코드 상세조회
	@Override
	public GoodsPrcssImgVo readImg(GoodsPrcssImgVo goodsPrcssImgVo) throws Exception {
		return session.selectOne(namespace+".readImg", goodsPrcssImgVo);
	}
	
	
	
	//제품코드 공정검사 ------------------------------------------------------------------
	//제품코드 공정검사 존재확인
	@Override
	public String selectPrcssState(String goodsCd) throws Exception {
		return session.selectOne(namespace+".selectPrcssState", goodsCd);
	}
	
	//제품코드 공정검사 목록조회
	@Override
	public List<GoodsPrcssInspectVo> listAllPrcss(GoodsPrcssInspectVo goodsPrcssInspectVo) throws Exception{
		return session.selectList(namespace+".listAllPrcss", goodsPrcssInspectVo);
	}
	
	//제품코드 공정검사 등록
	@Override
	public void createInspect(GoodsPrcssInspectVo goodsPrcssInspectVo) throws Exception {
		session.insert(namespace+".createInspect", goodsPrcssInspectVo);
	}
	
	//제품코드 투입자재 테이블 비우기
	@Override
	public void deletePrcssInspect(GoodsPrcssInspectVo goodsPrcssInspectVo) throws Exception{
		session.delete(namespace+".deletePrcssInspect", goodsPrcssInspectVo);
	}
	
	
}