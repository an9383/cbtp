package mes.service.po;

import java.util.List;

import mes.domain.po.GoodsProductInfoAdmVo;
import mes.domain.po.WorkOrderVo;

public interface GoodsPackService {
	
	 //작업지시서 계획 목록조회
	 public List<WorkOrderVo> workOrderPackDataList(WorkOrderVo workOrderVo) throws Exception;
	
	 //생산실적 작지 오더별 양품정보  수정
	 public void updateWorkOrdAppearCnt(WorkOrderVo workOrderVo)  throws Exception;	
	 
	 //제품포장 목록조회(해외1,해외2,국내)
	 public List<GoodsProductInfoAdmVo> goodsPackList(GoodsProductInfoAdmVo goodsProductInfoAdmVo) throws Exception;	

	 //생산실적라벨발행 등록
	 public void createGoodsLabelPublish(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception;
	
	 //생산실적라벨발행 상세  등록
	 public void createGoodsLabelPublishDtl(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception;	
	
	 //생산실적라벨발행 수정
	 public void updateGoodsLabelPublish(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception;		
	
	 //생산실적라벨발행 상세 수정
	 public void updateGoodsLabelPublishDtl(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception;	
	
	 //생산실적라벨발행 미포장 목록조회(해외1,해외2,국내)
	 public GoodsProductInfoAdmVo goodsPackTmpInfo(GoodsProductInfoAdmVo goodsProductInfoAdmVo) throws Exception;	

	 //생산실적라벨발행 미포장 정보 포장정보로 등록(해외1,해외2,국내)
	 public void createGoodsPackTmpToDtl(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception;	
	 
	 //생산실적라벨발행 미포장 정보 등록
	 public void createGoodsLabelTmp(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception;
	 
	 //생산실적라벨발행 미포장 정보 삭제
	 public void deleteGoodsLabelTmp(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception;
	 
	 //생산실적라벨발행 시퀀스 조회
	 public int selectGoodsPackSeqCd(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception;	
	 
	 //생산실적 작지 라벨발행 상태 수정
	 public void updateWorkOrdPublish(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception;	
	 
	 //생산실적라벨발행 포장 Temp 복원정보 삭제
	 public void deleteGoodsUnlabelTmp(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception;
	 
	 //생산실적라벨발행 포장 복원정보 삭제(포장단위)
	 public void deleteGoodsUnlabelPackUnitInfo(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception;
	 
	 //생산실적라벨발행 포장 상세 복원정보 삭제(포장단위)
	 public void deleteGoodsUnlabelPackUnitDtl(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception;
	 
	 //생산실적라벨발행 포장상세정보 미포장정보로 이동 등록(해외1,해외2,국내)
	 public void createGoodsPackDtlToTmp(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception;
	 
	 //생산실적라벨발행 포장 복원정보 삭제(포장단위보다 작은 경우)
	 public void deleteGoodsUnlabelNoPackUnitInfo(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception;
	 
	 //생산실적라벨발행 포장 상세 복원정보 삭제(포장단위보다 작은 경우)
	 public void deleteGoodsUnlabelNoPackUnitDtl(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception;
	 
	 //생산실적라벨발행 복원후 마지막 작지번호 조회
	 public String selectGoodsPackLastWorkOrdNo(GoodsProductInfoAdmVo goodsProductInfoAdmVo)  throws Exception;		 
}
