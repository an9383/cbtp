package mes.persistence.po;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.po.GoodsProductInfoAdmVo;
import mes.domain.po.WorkOrderVo;

@Repository
public class GoodsPackDAOImpl implements GoodsPackDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "mes.mappers.po.goodsPackMapper";

	//작업지시서 계획 목록조회
	 @Override
	 public List<WorkOrderVo> workOrderPackDataList(WorkOrderVo workOrderVo) throws Exception {
		 return session.selectList(namespace + ".workOrderPackDataList", workOrderVo);
	 }
	 
	 //작업지시서 오더별 양품수량 수정
	 @Override
	 public void updateWorkOrdAppearCnt(WorkOrderVo workOrderVo)  throws Exception {
		 session.update(namespace + ".updateWorkOrdAppearCnt", workOrderVo);
	 }	
	 
	//제품포장 목록조회(해외1,해외2,국내)
	 @Override
	 public List<GoodsProductInfoAdmVo> goodsPackList(GoodsProductInfoAdmVo goodsProductInfoAdmVo) throws Exception {
		 return session.selectList(namespace + ".goodsPackList", goodsProductInfoAdmVo);
	 }	 
	 
	//생산실적라벨발행 등록
	 @Override
	 public void createGoodsLabelPublish(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 session.insert(namespace + ".createGoodsLabelPublish", goodsProductInfoAdmVo);
	 }	 
	 
	//생산실적라벨발행 상세  등록
	 @Override
	 public void createGoodsLabelPublishDtl(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 session.insert(namespace + ".createGoodsLabelPublishDtl", goodsProductInfoAdmVo);
	 }	
	 
	//생산실적라벨발행 수정
	 @Override
	 public void updateGoodsLabelPublish(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 session.update(namespace + ".updateGoodsLabelPublish", goodsProductInfoAdmVo);
	 }	
	 
	//생산실적라벨발행 상세 수정
	 @Override
	 public void updateGoodsLabelPublishDtl(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 session.update(namespace + ".updateGoodsLabelPublishDtl", goodsProductInfoAdmVo);
	 }	
	 
	 //생산실적라벨발행 미포장 목록조회(해외1,해외2,국내)
	 @Override
	 public GoodsProductInfoAdmVo goodsPackTmpInfo(GoodsProductInfoAdmVo goodsProductInfoAdmVo) throws Exception {
		 return session.selectOne(namespace + ".goodsPackTmpInfo", goodsProductInfoAdmVo);
	 }	 
	 //생산실적라벨발행 미포장 정보 포장정보로 등록(해외1,해외2,국내)
	 @Override
	 public void createGoodsPackTmpToDtl(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 session.insert(namespace + ".createGoodsPackTmpToDtl", goodsProductInfoAdmVo);
	 }
	 
	 //생산실적라벨발행 미포장 정보 등록
	 @Override
	 public void createGoodsLabelTmp(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 session.insert(namespace + ".createGoodsLabelTmp", goodsProductInfoAdmVo);
	 }
	 
	 //생산실적라벨발행 미포장 정보 삭제
	 @Override
	 public void deleteGoodsLabelTmp(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 session.delete(namespace + ".deleteGoodsLabelTmp", goodsProductInfoAdmVo);
	 }
	 
	 //생산실적라벨발행 시퀀스 조회-
	 @Override
	 public int selectGoodsPackSeqCd(GoodsProductInfoAdmVo goodsProductInfoAdmVo) throws Exception {
		 return session.selectOne(namespace + ".selectGoodsPackSeqCd", goodsProductInfoAdmVo);
	 }
	 
	 //생산실적 작지 라벨발행 상태 수정
	 @Override
	 public void updateWorkOrdPublish(GoodsProductInfoAdmVo goodsProductInfoAdmVo) throws Exception {
		 session.update(namespace + ".updateWorkOrdPublish", goodsProductInfoAdmVo); 
	 }
	 
	 //생산실적라벨발행 포장 Temp 복원정보 삭제
	 @Override
	 public void deleteGoodsUnlabelTmp(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 session.delete(namespace + ".deleteGoodsUnlabelTmp", goodsProductInfoAdmVo);
	 }
	 
	 //생산실적라벨발행 포장 복원정보 삭제(포장단위)
	 @Override
	 public void deleteGoodsUnlabelPackUnitInfo(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 session.delete(namespace + ".deleteGoodsUnlabelPackUnitInfo", goodsProductInfoAdmVo);
	 }
	 
	 //생산실적라벨발행 포장 상세 복원정보 삭제(포장단위)
	 @Override
	 public void deleteGoodsUnlabelPackUnitDtl(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 session.delete(namespace + ".deleteGoodsUnlabelPackUnitDtl", goodsProductInfoAdmVo);
	 }
	 
	 //생산실적라벨발행 포장상세정보 미포장정보로 이동 등록(해외1,해외2,국내)
	 @Override
	 public void createGoodsPackDtlToTmp(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 session.insert(namespace + ".createGoodsPackDtlToTmp", goodsProductInfoAdmVo);
	 }
	 
	 //생산실적라벨발행 포장 복원정보 삭제(포장단위보다 작은 경우)
	 @Override
	 public void deleteGoodsUnlabelNoPackUnitInfo(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 session.delete(namespace + ".deleteGoodsUnlabelNoPackUnitInfo", goodsProductInfoAdmVo);
	 }
	 
	 //생산실적라벨발행 포장 상세 복원정보 삭제(포장단위보다 작은 경우)
	 @Override
	 public void deleteGoodsUnlabelNoPackUnitDtl(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 session.delete(namespace + ".deleteGoodsUnlabelNoPackUnitDtl", goodsProductInfoAdmVo);
	 }	 
	 
	 //생산실적라벨발행 복원후 마지막 작지번호 조회
	 @Override
	 public String selectGoodsPackLastWorkOrdNo(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 return session.selectOne(namespace + ".selectGoodsPackLastWorkOrdNo", goodsProductInfoAdmVo);
	 } 
	 
}

