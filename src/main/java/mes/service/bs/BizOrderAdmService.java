package mes.service.bs;

import java.util.List;

import mes.domain.bs.BizOrderAdmVo;

public interface BizOrderAdmService {
	//수주조회 팝업모달
	public List<BizOrderAdmVo> bizOrderAllList(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//소요량 리스트 조회
	public List<BizOrderAdmVo> bizOrderAllList2(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//소요량 상세리스트 조회
	public List<BizOrderAdmVo> bizOrderAllList3(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//영업주문관리 목록조회(외부/내부)
	public List<BizOrderAdmVo> bizOrderAdmList(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//영업주문관리 상세조회(외부/내부)
	public BizOrderAdmVo bizOrderAdmRead(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//영업주문관리 상세조회(외부/내부)
	public BizOrderAdmVo bizOrderDtlRead(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//영업주문관리 상세조회(외부/내부)
	public List<BizOrderAdmVo> bizOrderDtlList(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//영업주문관리 등록
	public void bizOrderAdmCreate(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//영업주문관리 수정
	public void bizOrderAdmUpdate(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//영업주문상세 수주번호 가져오기
	public String getContNo(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//영업주문관리 수주번호 중복검사
	public Integer overlapContNo(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//영업주문관리 주문수량 가져오기
	public Integer getOrdCnt(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//영업주문관리 생산수량 합 가져오기
	public Integer getSumDtlOrdCnt(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//영업주문상세 등록
	public void bizOrderDtlCreate(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//영업주문상세 수정
	public void bizOrderDtlUpdate(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//영업주문상세 삭제
	public void bizOrderDtlDelete(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//영업주문상세 수주시퀀스 가져오기
	public String getContSeq() throws Exception;
	
	//영업주문상세 작지번호 시퀀스 가져오기
	public String getWorkOrdNoSeq(String date) throws Exception;
	
	//수주현황 목록조회(외부/내부)
	public List<BizOrderAdmVo> bizOrderAdmStatusList(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	
	
	
	//생산지시현황
	
	//생산지시현황 목록조회
	public List<BizOrderAdmVo> bizOrderEtcAdmList(BizOrderAdmVo bizOrderAdmVo) throws Exception;	
	
	//생산지시현황 목록조회
	public List<BizOrderAdmVo> bizOrderEtcAdmList2(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//생산지시현황 상세조회
	public List<BizOrderAdmVo> bizOrderEtcDtlList(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//생산지시현황 전달사항, 생산지연사유 목록조회
	public List<BizOrderAdmVo> bizOrderEtcDaSdList(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//생산지시현황 등록
	public void bizOrderEtcDtlCreate(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//생산지시현황 납기일 수정
	public void etcDateUpdate(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//생산지시현황 기타별 상세삭제
	public void bizOrderEtcDelete(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//생산지시현황 기타별 삭제
	public void bizOrderEtcDtlDelete(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//생산지시현황 기타삭제
	public void bizOrderEtcDtlAllDelete(BizOrderAdmVo bizOrderAdmVo) throws Exception;
	
	//ADM테이블 완료수량 수정
	public void shipCntUpdate(BizOrderAdmVo bizOrderAdmVo)throws Exception;
	
	//DTL테이블 완료수량 수정
	public void dtlShipCntUpdate(BizOrderAdmVo bizOrderAdmVo)throws Exception;
	
	//생산지시현황 etcSeq 가져오기
	public String getEtcSeq() throws Exception;
	
	//수주상세번호 시퀀스 가져오기
	public String getContDtlNoSeq(String date) throws Exception;
	
	
	
	//생산지시현황 생산투입상태 목록조회
	public List<BizOrderAdmVo> approveProcList(BizOrderAdmVo bizOrderAdmVo) throws Exception;
}
