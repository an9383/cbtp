package mes.service.po;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.po.WorkOrderMatrlVo;
import mes.domain.po.WorkOrderPrcssVo;
import mes.domain.po.WorkOrderVo;
import mes.persistence.po.WorkOrderPrcssDAO;

@Service
public class WorkOrderPrcssServiceImpl implements WorkOrderPrcssService {

	@Inject
	private WorkOrderPrcssDAO dao;
	 
	//작업지시 조회(사출)
	@Override
	public List<WorkOrderPrcssVo> workOrderPrcssList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.workOrderPrcssList(workOrderPrcssVo);
	}
	
	//작업지시 조회(봉제)
	@Override
	public List<WorkOrderPrcssVo> workOrderPrcssListByBongjea(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.workOrderPrcssListByBongjea(workOrderPrcssVo);
	}
	
	//작업지시 초/중/종물 공정검사 유무
	public WorkOrderPrcssVo workOrdInspectYnList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.workOrdInspectYnList(workOrderPrcssVo);
	}
	
	//작업지시 생산실적 초/중/종물 실적등록 조회
	public int workOrdInspectDone(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.workOrdInspectDone(workOrderPrcssVo);
	}
	
	//작업지시 등록
	@Override
	public void create(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		dao.create(workOrderPrcssVo);
	}
	
	//작업지시 수정
	@Override
	public void update(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		dao.update(workOrderPrcssVo);
	}
	
	//작업지시 삭제
	@Override
	public void workOrderPrcssDelete(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		dao.workOrderPrcssDelete(workOrderPrcssVo);
	}
	
	//작지 시퀀스 가져오기
	@Override
	public int getWorkOrdSeq(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.getWorkOrdSeq(workOrderPrcssVo);
	}
	
	//작지 시퀀스 가져오기
	@Override
	public String getOrdlotNo(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.getOrdlotNo(workOrderPrcssVo);
	}
	
	//작업지시 공정별 작지목록 조회
	@Override
	public List<WorkOrderPrcssVo> workOrdPrcssListDtl(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.workOrdPrcssListDtl(workOrderPrcssVo);
	}
	
	//작업지시 공정별 작지목록 상세조회
	@Override
	public WorkOrderPrcssVo workOrdPrcssReadDtl(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.workOrdPrcssReadDtl(workOrderPrcssVo);
	}
	
	//작업지시 공정 순서 및 앞뒤 공정 정보 읽기
	@Override
	public WorkOrderPrcssVo getPrcssInfo(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.getPrcssInfo(workOrderPrcssVo);
	}
	
	//작업지시 이전공정 출고수량 읽기
	@Override
	public int getOutQty(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.getOutQty(workOrderPrcssVo);
	}
	
	//작업지시 불량수량 수정
	@Override
	public void updateQty(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		dao.updateQty(workOrderPrcssVo);
	}
	
	//작업지시 불량수량 삭제
	public void workOrdPrcssFaultyQtyDelete(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		dao.workOrdPrcssFaultyQtyDelete(workOrderPrcssVo);
	}
	
	//작업지시 (이전공정 출고수량) - (현재공정 투입수량의 합)
	@Override
	public int getOutToTargetSum(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.getOutToTargetSum(workOrderPrcssVo);
	}
	
	//작업지시 다음공정 투입수량 업데이트
	@Override
	public void updateNextTargetQty(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		dao.updateNextTargetQty(workOrderPrcssVo);
	}
	
	//작업지시 (이전공정 출고수량) - (현재공정 대기중이 아닌 작지의 투입수량의 합)
	@Override
	public int getOutToTargetSumNotPD(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.getOutToTargetSumNotPD(workOrderPrcssVo);
	}
	
	//작업지시에 존재하는 번호인지 확인
	@Override
	public int checkWorkOrdNoExsit(WorkOrderVo workOrderVo)throws Exception{
		return dao.checkWorkOrdNoExsit(workOrderVo);
	}
	
	//모니터링 - 공정별실적현황
	@Override
	public List<WorkOrderPrcssVo> workOrdStatusList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.workOrdStatusList(workOrderPrcssVo );
	}
	
	//모니터링 - 공정별실적현황(소공정)
	@Override
	public List<WorkOrderPrcssVo> workOrdStatusDtlList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.workOrdStatusDtlList(workOrderPrcssVo );
	}
	
	//생산실적 수집 -------------------------------------------------------------------------------------------------
	
	//생산수량 변경
	@Override
	public void workOrderPrcssQtyUpdate(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		dao.workOrderPrcssQtyUpdate(workOrderPrcssVo);
	}
	
	//생산세팅값 수정
	@Override
	public void equipDeviceMultiUpdate(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		dao.equipDeviceMultiUpdate(workOrderPrcssVo);
	}
	
	//설비관리 -------------------------------------------------------------------------------------------------
	
	//설비관리 - 설비별 작지현황(일자조건)
	@Override
	public List<WorkOrderPrcssVo> equipToWorkOrdList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.equipToWorkOrdList(workOrderPrcssVo);
	}
	
	
	//생산 일보 -------------------------------------------------------------------------------------------------
	
	//작업지시공정 전체 조회
	@Override
	public List<WorkOrderPrcssVo> workOrderPrcssAllList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		return dao.workOrderPrcssAllList(workOrderPrcssVo);
	}

	//작지별 소공정 모니터링 조회
	@Override
	public List<WorkOrderPrcssVo> workOrdPrcssMonitoringList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.workOrdPrcssMonitoringList(workOrderPrcssVo);
	}
	
	//생산시간 계산
	@Override
	public String getWorkTime(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.getWorkTime(workOrderPrcssVo);
	}
	
	//일자별 생산수량
	public int workOrdPrcssDayQty(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.workOrdPrcssDayQty(workOrderPrcssVo);
	}
	
	
	
	//LOT현황 -------------------------------------------------------------------------------------------------
	
	//1.생산LOT추적
	public List<WorkOrderPrcssVo> lotTrackList1(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.lotTrackList1(workOrderPrcssVo);
	}
	
	//2.자재LOT추적
	public List<WorkOrderMatrlVo> lotTrackList2(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.lotTrackList2(workOrderPrcssVo);
	}
	
	//3.불량LOT추적
	public List<WorkOrderPrcssVo> lotTrackList3(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.lotTrackList3(workOrderPrcssVo);
	}
		
	//4.작업지시번호
	public List<WorkOrderPrcssVo> lotTrackList4(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.lotTrackList4(workOrderPrcssVo);
	}
	
	//5.출하정보
	public List<WorkOrderPrcssVo> lotTrackList5(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.lotTrackList5(workOrderPrcssVo);
	}
	
	// 자재LOT 재고현황
	public List<WorkOrderMatrlVo> lotTrackStockPaymentList2(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		return dao.lotTrackStockPaymentList2(workOrderPrcssVo);
	}
	
	// 생산LOT 재고현황
	public List<WorkOrderMatrlVo> lotTrackStockPaymentList1(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		return dao.lotTrackStockPaymentList1(workOrderPrcssVo);
	}
	
	//LOT 확인 -------------------------------------------------------------------------------------------------
	
	//LOT 존재 확인
	@Override
	public int workOrderPrcssExist(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		return dao.workOrderPrcssExist(workOrderPrcssVo);
	}
	
	//LOT 데이터 조회
	@Override
	public WorkOrderPrcssVo workOrderPrcssRead(WorkOrderPrcssVo workOrderPrcssVo) throws Exception {
		return dao.workOrderPrcssRead(workOrderPrcssVo);
	}
	
	//제조리드타임 -------------------------------------------------------------------------------------------------
	public List<WorkOrderPrcssVo> leadTimeList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.leadTimeList(workOrderPrcssVo);
	}
	
	public WorkOrderPrcssVo leadTimeSubTotalList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.leadTimeSubTotalList(workOrderPrcssVo);
	}
	
	//생산 공정 불량율 현황 -------------------------------------------------------------------------------------------------
	public List<WorkOrderPrcssVo> workPrcssFaultyRateList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.workPrcssFaultyRateList(workOrderPrcssVo);
	}
	
	//생산실적(봉제)*********************************************************
	//소공정 조회
	public List<WorkOrderPrcssVo> workOrderPrcssCdList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.workOrderPrcssCdList(workOrderPrcssVo);
	}

	//작업지시 불량수량 수정(봉제)
	public void updateQtybong(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		dao.updateQtybong(workOrderPrcssVo);
	}
	
	//제조리드타임(봉제) -------------------------------------------------------------------------------------------------
	public List<WorkOrderPrcssVo> leadTimeSewingList(WorkOrderPrcssVo workOrderPrcssVo) throws Exception{
		return dao.leadTimeSewingList(workOrderPrcssVo);
	}
	
}

	