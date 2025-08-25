package mes.service.bm;

import java.util.List;

import mes.domain.bm.GoodsCodeAdmVo;
import mes.domain.bm.GoodsOutputMatrlVo;
import mes.domain.bm.GoodsPrcssBomVo;
import mes.domain.bm.GoodsPrcssImgVo;
import mes.domain.bm.GoodsPrcssInspectVo;

public interface GoodsCodeAdmService {
	
	//제품코드 목록조회
	public List<GoodsCodeAdmVo> listAll() throws Exception;
	
	//제품코드 제품코드 조회
	public List<GoodsCodeAdmVo> listAllCodeCd(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception;
	
	//제품코드 제품명 조회
	public List<GoodsCodeAdmVo> listAllCodeNm(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception;
	
	//제품코드 제품코드 + 제품명 조회
	public List<GoodsCodeAdmVo> listAllCodeCdNm(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception;

	//제품코드 상세조회
	public GoodsCodeAdmVo read(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception;
	
	//제품코드 등록
	public void create(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception;
	
	//제품코드 코드조회
	public String selectGoodsSeqCd() throws Exception;
	
	//제품코드 수정
	public void update(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception;
	
	//제품코드 품번 중목 확인
	public int overlapChack(GoodsCodeAdmVo goodsCodeAdmVo) throws Exception;
	
	
	
	//제품코드 BOM ------------------------------------------------------------------
	//제품코드 BOM 존재확인
	public String selectBomState(String goodsCd) throws Exception;
	
	//제품코드 BOM 목록조회
	public List<GoodsPrcssBomVo> listAllBom(String goodsCd) throws Exception;
	
	//제품코드 투입자재 테이블 비우기
	public void deleteBom(String goodsCd) throws Exception;
	
	//제품코드 투입자재 등록
	public void updateBom(GoodsPrcssBomVo goodsPrcssBomVo) throws Exception;
	
	
	
	//제품코드 투입자재 ------------------------------------------------------------------
	//제품코드 투입자재 존재확인
	public String selectMatrlState(String goodsCd) throws Exception;
	
	//제품코드 투입자재 목록조회
	public List<GoodsOutputMatrlVo> listAllMatrl(String goodsCd) throws Exception;
	
	//제품코드 투입자재 테이블 비우기
	public void deleteMatrl(String goodsCd) throws Exception;
	
	//제품코드 투입자재 등록
	public void updateMatrl(GoodsOutputMatrlVo goodsOutputMatrlVo) throws Exception;
	
	
	
	//제품코드 사진 ------------------------------------------------------------------
	//제품코드 사진 존재확인
	public String selectImgState(String goodsCd) throws Exception;
	
	//제품코드 사진 목록조회
	public List<GoodsPrcssImgVo> listAllImg(String goodsCd) throws Exception;
	
	//제품코드 사진 등록
	public void createImg(GoodsPrcssImgVo goodsPrcssImgVo) throws Exception;
	
	//제품코드 투입자재 테이블 비우기
	public void deleteImg(GoodsPrcssImgVo goodsPrcssImgVo) throws Exception;
	
	//제품코드 사진조회
	public GoodsPrcssImgVo readImg(GoodsPrcssImgVo goodsPrcssImgVo) throws Exception;
	
	
	//제품코드 공정검사 ------------------------------------------------------------------
	//제품코드 공정검사 존재확인
	public String selectPrcssState(String goodsCd) throws Exception;
	
	//제품코드 공정검사 목록조회
	public List<GoodsPrcssInspectVo> listAllPrcss(GoodsPrcssInspectVo goodsPrcssInspectVo) throws Exception;
	
	//제품코드 공정검사 등록
	public void createInspect(GoodsPrcssInspectVo goodsPrcssInspectVo) throws Exception;

	//제품코드 공정검사 테이블 비우기
	public void deletePrcssInspect(GoodsPrcssInspectVo goodsPrcssInspectVo) throws Exception;
}
