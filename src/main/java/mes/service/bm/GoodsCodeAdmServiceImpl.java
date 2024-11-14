package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.GoodsCodeAdmVo;
import mes.domain.bm.GoodsOutputMatrlVo;
import mes.domain.bm.GoodsPrcssBomVo;
import mes.domain.bm.GoodsPrcssImgVo;
import mes.domain.bm.GoodsPrcssInspectVo;
import mes.domain.bm.MatrlCodeAdmVo;
import mes.persistence.bm.GoodsCodeAdmDAO;

@Service
public class GoodsCodeAdmServiceImpl implements GoodsCodeAdmService {

	@Inject
	private GoodsCodeAdmDAO dao;

	//제품코드 목록조회
	@Override
	public List<GoodsCodeAdmVo> listAll() throws Exception {
		return dao.listAll();
	}
	
	//제품코드 목록조회
	@Override
	public List<GoodsCodeAdmVo> listAllCodeCd(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception {
		return dao.listAllCodeCd(goodsCodeAdmVo);
	}
	
	//제품코드 목록조회
	@Override
	public List<GoodsCodeAdmVo> listAllCodeNm(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception {
		return dao.listAllCodeNm(goodsCodeAdmVo);
	}
	
	//제품코드 목록조회
	@Override
	public List<GoodsCodeAdmVo> listAllCodeCdNm(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception {
		return dao.listAllCodeCdNm(goodsCodeAdmVo);
	}

	//제품코드 상세조회
	@Override
	public GoodsCodeAdmVo read(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception {
		return dao.read(goodsCodeAdmVo);	
	}
	
	//제품코드 등록
	@Override
	public void create(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception {
		dao.create(goodsCodeAdmVo);
	}
	
	//제품코드 코드시퀀스조회	
	@Override
	public String selectGoodsSeqCd() throws Exception{
		return dao.selectGoodsSeqCd();
	}
	
	//제품코드 수정
	@Override
	public void update(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception {
		dao.update(goodsCodeAdmVo);
	}
	
	//제품코드 품목 중복 확인	
	@Override
	public int overlapChack(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception{
		return dao.overlapChack(goodsCodeAdmVo);
	}
	
	
	
	//제품코드 BOM ------------------------------------------------------------------
	//제품코드 BOM 존재확인
	@Override
	public String selectBomState(String goodsCd) throws Exception{
		return dao.selectBomState(goodsCd);
	}

	//제품코드 BOM 목록조회
	@Override
	public List<GoodsPrcssBomVo> listAllBom(String goodsCd) throws Exception {
		return dao.listAllBom(goodsCd);
	}
	
	//제품코드 투입자재 테이블 비우기
	@Override
	public void deleteBom(String goodsCd) throws Exception{
		dao.deleteBom(goodsCd);
	}
	
	//제품코드 투입자재 등록
	@Override
	public void updateBom(GoodsPrcssBomVo goodsPrcssBomVo) throws Exception{
		dao.updateBom(goodsPrcssBomVo);
	}
	
	
	
	//제품코드 투입자재 ------------------------------------------------------------------
	//제품코드 투입자재 존재확인
	@Override
	public String selectMatrlState(String goodsCd) throws Exception{
		return dao.selectMatrlState(goodsCd);
	}
	
	//제품코드 목록조회
	@Override
	public List<GoodsOutputMatrlVo> listAllMatrl(String goodsCd) throws Exception {
		return dao.listAllMatrl(goodsCd);
	}
	
	//제품코드 투입자재 테이블 비우기
	@Override
	public void deleteMatrl(String goodsCd) throws Exception{
		dao.deleteMatrl(goodsCd);
	}
	
	//제품코드 투입자재 등록
	@Override
	public void updateMatrl(GoodsOutputMatrlVo goodsOutputMatrlVo) throws Exception{
		dao.updateMatrl(goodsOutputMatrlVo);
	}
	
	
	
	//제품코드 사진 ------------------------------------------------------------------
	//제품코드 사진 존재확인
	@Override
	public String selectImgState(String goodsCd) throws Exception{
		return dao.selectImgState(goodsCd);
	}
	
	//제품코드 사진 목록조회
	@Override
	public List<GoodsPrcssImgVo> listAllImg(String goodsCd) throws Exception {
		return dao.listAllImg(goodsCd);
	}
	
	//제품코드 사진 등록
	@Override
	public void createImg(GoodsPrcssImgVo goodsPrcssImgVo) throws Exception {
		dao.createImg(goodsPrcssImgVo);
	}
	
	//제품코드 사진 삭제
	@Override
	public void deleteImg(GoodsPrcssImgVo goodsPrcssImgVo) throws Exception{
		dao.deleteImg(goodsPrcssImgVo);
	}
	
	//제품코드 상세조회
	@Override
	public GoodsPrcssImgVo readImg(GoodsPrcssImgVo goodsPrcssImgVo) throws Exception {
		return dao.readImg(goodsPrcssImgVo);	
	}
	
	
	//제품코드 공정검사 ------------------------------------------------------------------
	//제품코드 공정검사 존재확인
	@Override
	public String selectPrcssState(String goodsCd) throws Exception{
		return dao.selectPrcssState(goodsCd);
	}
	
	//제품코드 공정검사 목록조회
	@Override
	public List<GoodsPrcssInspectVo> listAllPrcss(GoodsPrcssInspectVo goodsPrcssInspectVo) throws Exception {
		return dao.listAllPrcss(goodsPrcssInspectVo);
	}
	
	//제품코드 공정검사 등록
	@Override
	public void createInspect(GoodsPrcssInspectVo goodsPrcssInspectVo) throws Exception {
		dao.createInspect(goodsPrcssInspectVo);
	}
	
	//제품코드 투입자재 테이블 비우기
	@Override
	public void deletePrcssInspect(GoodsPrcssInspectVo goodsPrcssInspectVo) throws Exception{
		dao.deletePrcssInspect(goodsPrcssInspectVo);
	}
}

	