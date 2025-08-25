package mes.persistence.io;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.io.InOutWhsAdmVo;

@Repository
public class InOutWhsAdmDAOImpl implements InOutWhsAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.io.inOutWhsAdmMapper";
	
	//가입고등록
	
	//가입고등록,개별입고등록 상세조회
	public List<InOutWhsAdmVo> preInOutWhsAdmList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".preInOutWhsAdmList" , inOutWhsAdmVo); 
	}
	
	
	//발주수량대비 가입고수량 조회
	public List<InOutWhsAdmVo> unPreInOutQtyList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".unPreInOutQtyList" , inOutWhsAdmVo);
	}
	
	//가입고등록 등록
	public void preInOutWhsAdmCreate(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		session.insert(namespace +".preInOutWhsAdmCreate" , inOutWhsAdmVo);
	}
	
	//가입고등록 수정
	public void preInOutWhsAdmUpdate(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		session.update(namespace +".preInOutWhsAdmUpdate", inOutWhsAdmVo);
	}


	//가입고등록 삭제
	public void preInOutWhsAdmDelete(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		session.delete(namespace+".preInOutWhsAdmDelete" ,inOutWhsAdmVo );
	}
	
	//가입고 시퀀스 생성
	public String getInSeq(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace +".getInSeq" , inOutWhsAdmVo);
	}
	
	//발주현황 삭제 확인
	public String inOutWhsDataCheck(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace + ".inOutWhsDataCheck", inOutWhsAdmVo);
	}
	
	
	//입고전표번호 생성
	public String getInSlipNo(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace+".getInSlipNo" ,inOutWhsAdmVo );
	}
	
	//입고전표시퀀스 생성
	public String getInSlipSeq(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace+".getInSlipSeq" ,inOutWhsAdmVo );
	}
	
	
	//바코드 시퀀스 가져오기
	public String getBarcodeSeq(String date) throws Exception{
		return session.selectOne(namespace+".getBarcodeSeq" , date);
	}
	
	//자재상태 확인
	public String statusCdCheck(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace +".statusCdCheck" , inOutWhsAdmVo);
	}
	
	
	//입고등록
	
	//입고등록 목록조회
	public List<InOutWhsAdmVo> inOutWhsAdmList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".inOutWhsAdmList" , inOutWhsAdmVo); 
	}
	
	//기간별입고현황(봉제) 목록 조회
	public List<InOutWhsAdmVo> inOutWhsSewingList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		String inOutWhsGubun = inOutWhsAdmVo.getInOutWhsGubun();
		if (inOutWhsGubun.equals("barc")) {//바코드별 조회
			return session.selectList(namespace + ".inOutWhsBarcList" , inOutWhsAdmVo); 
		} else if (inOutWhsGubun.equals("date")) {//일자별 조회
			return session.selectList(namespace + ".inOutWhsDateList" , inOutWhsAdmVo); 
		} else if (inOutWhsGubun.equals("item")) {//품목별 조회
			return session.selectList(namespace + ".inOutWhsItemList" , inOutWhsAdmVo); 
		} else {//예상치 못한 오류
			return session.selectList(namespace + ".inOutWhsBarcList" , inOutWhsAdmVo); 
		}
	}
	
	//입고등록 상세조회
	public InOutWhsAdmVo inOutWhsAdmRead(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace +".inOutWhsAdmRead" , inOutWhsAdmVo);
	}
	
	//입고등록 바코드 상세조회
	public InOutWhsAdmVo inOutWhsAdmBarcodeRead(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace +".inOutWhsAdmBarcodeRead" , inOutWhsAdmVo);
	}
	
	
	//입고등록 등록(가입고테이블 수정)
	public void inOutWhsAdmCreate(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		session.update(namespace +".inOutWhsAdmCreate" , inOutWhsAdmVo);
	}
	
	//창고바코드 스캔(창고,구역,위치 값  가져오기)
	public InOutWhsAdmVo getLocInfo(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace +".getLocInfo" ,inOutWhsAdmVo );
	}

	//창고목록 가져오기
	public List<InOutWhsAdmVo> getLocationCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".getLocationCd", inOutWhsAdmVo);
	}
	
	//구역목록 가져오기
	public List<InOutWhsAdmVo> getAreaCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".getAreaCd", inOutWhsAdmVo);
	}
	
	//위치목록 가져오기
	public List<InOutWhsAdmVo> getFloorCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".getFloorCd" , inOutWhsAdmVo);
	}
	
	//승인여부 가져오기
	public String getApprovalCd(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace +".getApprovalCd" , inOutWhsAdmVo);
	}
	
	//부품별 자재단가 가져오기
	public Integer getPartUnitCost(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectOne(namespace+".getPartUnitCost" ,inOutWhsAdmVo );
	}
	

	
	//입고현황
	
	//입고현황 목록조회
	public List<InOutWhsAdmVo> inOutWhsStatusList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".inOutWhsStatusList" , inOutWhsAdmVo);
	}
	
	
	
	//발주대비 미입고현황
	
	//발주대비 미입고현황 목록조회
	public List<InOutWhsAdmVo> inOutWhsStatusList2(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace +".inOutWhsStatusList2", inOutWhsAdmVo);
	}

	
	//재고현황
	public List<InOutWhsAdmVo> partInventoryDtlList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".partInventoryDtlList" , inOutWhsAdmVo);
	}

	
	//수주상세별 입고 모니터링 목록조회
	public List<InOutWhsAdmVo> inMonitoringList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".inMonitoringList" ,inOutWhsAdmVo );
	}
	
	//개별입고
	
	//개별입고 목록조회
	public List<InOutWhsAdmVo> individualAdmList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".individualAdmList" , inOutWhsAdmVo);
	}

	//개별입고 가상발주번호 생성
	public String getPoNo(String today) throws Exception{
		return session.selectOne(namespace+".getPoNo" ,today );
	}

	//라벨출력처리
	public void preInOutWhsAdmLabelPrint(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		session.update(namespace +".preInOutWhsAdmLabelPrint", inOutWhsAdmVo);
	}
	
	//PDA 품목검색
	public List<InOutWhsAdmVo> pdaItemList(InOutWhsAdmVo inOutWhsAdmVo) throws Exception{
		return session.selectList(namespace+".pdaItemList", inOutWhsAdmVo);
	}

}
