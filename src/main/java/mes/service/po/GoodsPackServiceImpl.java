package mes.service.po;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.po.GoodsProductInfoAdmVo;
import mes.domain.po.WorkOrderVo;
import mes.persistence.po.GoodsPackDAO;

@Service
public class GoodsPackServiceImpl implements GoodsPackService {

	@Inject
	private GoodsPackDAO dao;

	//작업지시서 목록조회
	 @Override
	 public List<WorkOrderVo> workOrderPackDataList(WorkOrderVo workOrderVo) throws Exception {
		 return dao.workOrderPackDataList(workOrderVo);
	 }
	 
	 //생산실적 작지 오더별 양품정보  수정
	 @Override
	 public void updateWorkOrdAppearCnt(WorkOrderVo workOrderVo)  throws Exception {
		 dao.updateWorkOrdAppearCnt(workOrderVo);
	 }
	//제품포장 목록조회(해외1,해외2,국내)
	 @Override
	 public List<GoodsProductInfoAdmVo> goodsPackList(GoodsProductInfoAdmVo goodsProductInfoAdmVo) throws Exception {
		 return dao.goodsPackList(goodsProductInfoAdmVo);
	 }	 
	 
	//생산실적라벨발행 등록
	 @Override
	 public void createGoodsLabelPublish(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 dao.createGoodsLabelPublish(goodsProductInfoAdmVo);
	 }	 
	 
	//생산실적라벨발행 상세  등록
	 @Override
	 public void createGoodsLabelPublishDtl(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 dao.createGoodsLabelPublishDtl(goodsProductInfoAdmVo);
	 }	
	 
	//생산실적라벨발행 수정
	 @Override
	 public void updateGoodsLabelPublish(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 dao.updateGoodsLabelPublish(goodsProductInfoAdmVo);
	 }
	 
	//생산실적라벨발행 상세 수정
	 @Override
	 public void updateGoodsLabelPublishDtl(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 dao.updateGoodsLabelPublishDtl(goodsProductInfoAdmVo);
	 }
	 
	 //생산실적라벨발행 미포장 목록조회(해외1,해외2,국내)
	 @Override
	 public GoodsProductInfoAdmVo goodsPackTmpInfo(GoodsProductInfoAdmVo goodsProductInfoAdmVo) throws Exception {
		 return dao.goodsPackTmpInfo(goodsProductInfoAdmVo);
	 }	 	

	 //생산실적라벨발행 미포장 정보 포장정보로 등록(해외1,해외2,국내)
	 @Override
	 public void createGoodsPackTmpToDtl(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 dao.createGoodsPackTmpToDtl(goodsProductInfoAdmVo);
	 }
	 
	 //생산실적라벨발행 미포장 정보 등록
	 @Override
	 public void createGoodsLabelTmp(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 dao.createGoodsLabelTmp(goodsProductInfoAdmVo);
	 }
	 //생산실적라벨발행 미포장 정보 삭제
	 @Override
	 public void deleteGoodsLabelTmp(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 dao.deleteGoodsLabelTmp(goodsProductInfoAdmVo);
	 }	 
	 
	 //생산실적라벨발행 시퀀스 조회
	 @Override
	 public int selectGoodsPackSeqCd(GoodsProductInfoAdmVo goodsProductInfoAdmVo) throws Exception {
		 return dao.selectGoodsPackSeqCd(goodsProductInfoAdmVo);
	 }
	 
	 //생산실적 작지 라벨발행 상태 수정
	 @Override
	 public void updateWorkOrdPublish(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 dao.updateWorkOrdPublish(goodsProductInfoAdmVo);
	 }
	 //생산실적라벨발행 포장 Temp 복원정보 삭제
	 @Override
	 public void deleteGoodsUnlabelTmp(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 dao.deleteGoodsUnlabelTmp(goodsProductInfoAdmVo);
	 }
	 
	 //생산실적라벨발행 포장 복원정보 삭제(포장단위)
	 @Override
	 public void deleteGoodsUnlabelPackUnitInfo(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 dao.deleteGoodsUnlabelPackUnitInfo(goodsProductInfoAdmVo);
	 }
	 
	 //생산실적라벨발행 포장 상세 복원정보 삭제(포장단위)
	 @Override
	 public void deleteGoodsUnlabelPackUnitDtl(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 dao.deleteGoodsUnlabelPackUnitDtl(goodsProductInfoAdmVo);
	 }
	 
	 //생산실적라벨발행 포장상세정보 미포장정보로 이동 등록(해외1,해외2,국내)
	 @Override
	 public void createGoodsPackDtlToTmp(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 dao.createGoodsPackDtlToTmp(goodsProductInfoAdmVo);
	 }
	 
	 //생산실적라벨발행 포장 복원정보 삭제(포장단위보다 작은 경우)
	 @Override
	 public void deleteGoodsUnlabelNoPackUnitInfo(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 dao.deleteGoodsUnlabelNoPackUnitInfo(goodsProductInfoAdmVo);
	 }
	 
	 //생산실적라벨발행 포장 상세 복원정보 삭제(포장단위보다 작은 경우)
	 @Override
	 public void deleteGoodsUnlabelNoPackUnitDtl(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 dao.deleteGoodsUnlabelNoPackUnitDtl(goodsProductInfoAdmVo);
	 }	 
	 //생산실적라벨발행 복원후 마지막 작지번호 조회
	 @Override
	 public String selectGoodsPackLastWorkOrdNo(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception {
		 return  dao.selectGoodsPackLastWorkOrdNo(goodsProductInfoAdmVo);
	 } 
	 
}

	