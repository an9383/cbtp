package mes.service.io;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.io.InOutWhsAdmVo;
import mes.persistence.io.InOutWhsAdmDAO;

@Service
public class InOutWhsAdmServiceImpl implements InOutWhsAdmService {


	@Inject
	private InOutWhsAdmDAO dao;
	
	//가입고등록
	
	//가입고등록,개별입고등록 상세조회
	public List<InOutWhsAdmVo> preInOutWhsAdmList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.preInOutWhsAdmList(inOutWhsAdmVo);
	}
	
	//발주수량대비 가입고수량 조회
	public List<InOutWhsAdmVo> unPreInOutQtyList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.unPreInOutQtyList(inOutWhsAdmVo);
	}

	
	//가입고등록 등록
	public void preInOutWhsAdmCreate(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		dao.preInOutWhsAdmCreate(inOutWhsAdmVo);
	}
	
	//가입고등록 수정
	public void preInOutWhsAdmUpdate(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		dao.preInOutWhsAdmUpdate(inOutWhsAdmVo);
	}
	
	//가입고등록 삭제
	public void preInOutWhsAdmDelete(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		dao.preInOutWhsAdmDelete(inOutWhsAdmVo);
	}

	//가입고 시퀀스 생성
	public String getInSeq(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.getInSeq(inOutWhsAdmVo);
	}

	//발주현황 삭제 확인
	public String inOutWhsDataCheck(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.inOutWhsDataCheck(inOutWhsAdmVo);
	}
	
	//입고전표번호 생성
	public String getInSlipNo(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.getInSlipNo(inOutWhsAdmVo);
	}
	
	//입고전표시퀀스 생성
	public String getInSlipSeq(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.getInSlipSeq(inOutWhsAdmVo);
	}
	
	//바코드 시퀀스 가져오기
	public String getBarcodeSeq(String date) throws Exception{
		return dao.getBarcodeSeq(date);
	}
	
	//자재상태 확인
	public String statusCdCheck(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.statusCdCheck(inOutWhsAdmVo);
	}
	
	
	//입고등록
	
	//입고등록 목록조회
	public List<InOutWhsAdmVo> inOutWhsAdmList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.inOutWhsAdmList(inOutWhsAdmVo);
	}
	
	//기간별입고현황(봉제) 목록 조회
	public List<InOutWhsAdmVo> inOutWhsSewingList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.inOutWhsSewingList(inOutWhsAdmVo);
	}
	
	//입고등록 상세조회
	public InOutWhsAdmVo inOutWhsAdmRead(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.inOutWhsAdmRead(inOutWhsAdmVo);
	}
	
	//입고등록 바코드 상세조회
	public InOutWhsAdmVo inOutWhsAdmBarcodeRead(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.inOutWhsAdmBarcodeRead(inOutWhsAdmVo);
	}
	
	//입고등록 등록(가입고테이블 수정)
	public void inOutWhsAdmCreate(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		dao.inOutWhsAdmCreate(inOutWhsAdmVo);
	}
	
	//창고바코드 스캔(창고,구역,위치 값  가져오기)
	public InOutWhsAdmVo getLocInfo(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.getLocInfo(inOutWhsAdmVo);
	}

	//창고목록 가져오기
	public List<InOutWhsAdmVo> getLocationCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.getLocationCd(inOutWhsAdmVo);
	}
	
	//구역목록 가져오기
	public List<InOutWhsAdmVo> getAreaCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.getAreaCd(inOutWhsAdmVo);
	}
	
	//위치목록 가져오기
	public List<InOutWhsAdmVo> getFloorCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.getFloorCd(inOutWhsAdmVo);
	}
	
	//승인여부 가져오기
	public String getApprovalCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.getApprovalCd(inOutWhsAdmVo);
	}
	
	//부품별 자재단가 가져오기
	public Integer getPartUnitCost(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.getPartUnitCost(inOutWhsAdmVo);
	}
	
	
	
	
	//입고현황
	
	//입고현황 목록조회
	public List<InOutWhsAdmVo> inOutWhsStatusList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.inOutWhsStatusList(inOutWhsAdmVo);
	}
	
	
	
	//발주대비 미입고현황
	
	//발주대비 미입고현황 목록조회
	public List<InOutWhsAdmVo> inOutWhsStatusList2(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.inOutWhsStatusList2(inOutWhsAdmVo);
	}
	
	//재고현황
	public List<InOutWhsAdmVo> partInventoryDtlList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.partInventoryDtlList(inOutWhsAdmVo);
	}
	
	//수주상세별 입고 모니터링 목록조회
	public List<InOutWhsAdmVo> inMonitoringList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.inMonitoringList(inOutWhsAdmVo);
	}
	
	
	//개별입고
	
	//개별입고 목록조회
	public List<InOutWhsAdmVo> individualAdmList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.individualAdmList(inOutWhsAdmVo);
	}

	//개별입고 가상발주번호 생성
	public String getPoNo(String today) throws Exception{
		return dao.getPoNo(today);
	}

	//라벨출력처리
	public void preInOutWhsAdmLabelPrint(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		dao.preInOutWhsAdmLabelPrint(inOutWhsAdmVo);
	}
	
	//PDA 품목검색
	public List<InOutWhsAdmVo> pdaItemList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return dao.pdaItemList(inOutWhsAdmVo);
	}
}
