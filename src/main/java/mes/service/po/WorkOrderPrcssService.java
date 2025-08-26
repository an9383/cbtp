package mes.service.po;

import java.util.List;

import mes.domain.po.WorkOrderMatrlVo;
import mes.domain.po.WorkOrderPrcssVo;
import mes.domain.po.WorkOrderVo;

public interface WorkOrderPrcssService {
	
	//작업지시 조회(사출)
	public List<WorkOrderPrcssVo> workOrderPrcssList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시 조회(봉제)
	public List<WorkOrderPrcssVo> workOrderPrcssListByBongjea(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시 초/중/종물 공정검사 유무
	public WorkOrderPrcssVo workOrdInspectYnList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시 생산실적 초/중/종물 실적등록 조회
	public int workOrdInspectDone(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시 등록
	public void create(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시 수정
	public void update(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시 삭제
	public void workOrderPrcssDelete(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작지 시퀀스 가져오기
	public int getWorkOrdSeq(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작지 시퀀스 가져오기
	public String getOrdlotNo(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시 공정별 작지목록 조회
	public List<WorkOrderPrcssVo> workOrdPrcssListDtl(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시 공정별 작지목록 상세조회
	public WorkOrderPrcssVo workOrdPrcssReadDtl(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시 공정 순서 및 앞뒤 공정 정보 읽기
	public WorkOrderPrcssVo getPrcssInfo(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시 이전공정 출고수량 읽기
	public int getOutQty(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시 불량수량 수정
	public void updateQty(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시 불량수량 삭제
	public void workOrdPrcssFaultyQtyDelete(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시 (이전공정 출고수량) - (현재공정 투입수량의 합)
	public int getOutToTargetSum(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시 다음공정 투입수량 업데이트
	public void updateNextTargetQty(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시 (이전공정 출고수량) - (현재공정 대기중이 아닌 작지의 투입수량의 합)
	public int getOutToTargetSumNotPD(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시에 존재하는 번호인지 확인
	public int checkWorkOrdNoExsit(WorkOrderVo workOrderVo)throws Exception;
	
	//모니터링 - 공정별실적현황
	public List<WorkOrderPrcssVo> workOrdStatusList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//모니터링 - 공정별실적현황(소공정)
	public List<WorkOrderPrcssVo> workOrdStatusDtlList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//생산실적 수집 -------------------------------------------------------------------------------------------------
	
	//생산수량 변경
	public void workOrderPrcssQtyUpdate(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//생산세팅값 수정
	public void equipDeviceMultiUpdate(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//설비관리 -------------------------------------------------------------------------------------------------
	
	//설비관리 - 설비별 작지현황(일자조건)
	public List<WorkOrderPrcssVo> equipToWorkOrdList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//생산 일보 -------------------------------------------------------------------------------------------------
	
	//작업지시공정 전체 조회
	public List<WorkOrderPrcssVo> workOrderPrcssAllList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	
	//작지별 소공정 모니터링 조회
	public List<WorkOrderPrcssVo> workOrdPrcssMonitoringList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//생산시간 계산
	public String getWorkTime(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//일자별 생산수량
	public int workOrdPrcssDayQty(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	
	//LOT현황 -------------------------------------------------------------------------------------------------
	
	//1.생산LOT추적
	public List<WorkOrderPrcssVo> lotTrackList1(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//2.자재LOT추적
	public List<WorkOrderMatrlVo> lotTrackList2(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//3.불량LOT추적
	public List<WorkOrderPrcssVo> lotTrackList3(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
		
	//4.작업지시번호
	public List<WorkOrderPrcssVo> lotTrackList4(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//5.출하정보
	public List<WorkOrderPrcssVo> lotTrackList5(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	// 자재LOT 재고현황
	public List<WorkOrderMatrlVo> lotTrackStockPaymentList2(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	// 생산LOT 재고현황
	public List<WorkOrderMatrlVo> lotTrackStockPaymentList1(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//LOT 확인 -------------------------------------------------------------------------------------------------
	
	//LOT 존재 확인
	public int workOrderPrcssExist(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//LOT 데이터 조회
	public WorkOrderPrcssVo workOrderPrcssRead(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//제조리드타임 -------------------------------------------------------------------------------------------------
	public List<WorkOrderPrcssVo> leadTimeList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	public WorkOrderPrcssVo leadTimeSubTotalList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//생산 공정 불량율 현황 -------------------------------------------------------------------------------------------------
	public List<WorkOrderPrcssVo> workPrcssFaultyRateList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;

	//생산실적(봉제)*********************************************************
	//소공정 조회
	public List<WorkOrderPrcssVo> workOrderPrcssCdList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
	//작업지시 불량수량 수정(봉제)
	public void updateQtybong(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;

	//제조리드타임(봉제) -------------------------------------------------------------------------------------------------
	public List<WorkOrderPrcssVo> leadTimeSewingList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception;
	
}