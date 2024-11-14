package mes.persistence.bs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bs.BizOrderAdmVo;

@Repository
public class BizOrderAdmDAOImpl implements BizOrderAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bs.bizOrderAdmMapper";
	
	//수주조회 팝업모달
	public List<BizOrderAdmVo> bizOrderAllList(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		return session.selectList(namespace +".bizOrderAllList", bizOrderAdmVo);
	}
	
	//소요량 리스트 조회
	public List<BizOrderAdmVo> bizOrderAllList2(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		return session.selectList(namespace +".bizOrderAllList2", bizOrderAdmVo);
	}
	
	//소요량 상세리스트 조회
	public List<BizOrderAdmVo> bizOrderAllList3(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		return session.selectList(namespace +".bizOrderAllList3", bizOrderAdmVo);
	}

	//영업주문관리 목록조회(외부/내부)
	public List<BizOrderAdmVo> bizOrderAdmList(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		return session.selectList(namespace + ".bizOrderAdmList", bizOrderAdmVo);
	}
	
	//영업주문관리 상세조회(외부/내부)
	public BizOrderAdmVo bizOrderAdmRead(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		return session.selectOne(namespace + ".bizOrderAdmRead", bizOrderAdmVo);
	}
	
	//영업주문관리 상세조회(외부/내부)
	public BizOrderAdmVo bizOrderDtlRead(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		return session.selectOne(namespace + ".bizOrderDtlRead", bizOrderAdmVo);
	}
	
	//영업주문관리 상세조회(외부/내부)
	public List<BizOrderAdmVo> bizOrderDtlList(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		return session.selectList(namespace + ".bizOrderDtlList", bizOrderAdmVo);
	}
	
	//영업주문관리 등록
	public void bizOrderAdmCreate(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		session.insert(namespace + ".bizOrderAdmCreate",bizOrderAdmVo);
	}
	
	//영업주문관리 수정
	public void bizOrderAdmUpdate(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		session.update(namespace+".bizOrderAdmUpdate", bizOrderAdmVo);
	}
	
	//영업주문상세 수주번호 가져오기
	public String getContNo(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		return session.selectOne(namespace+".getContNo" ,bizOrderAdmVo );
	}
	
	//영업주문관리 수주번호 중복검사
	public Integer overlapContNo(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		return session.selectOne(namespace +".overlapContNo",bizOrderAdmVo);
	}
	
	//영업주문관리 주문수량 가져오기
	public Integer getOrdCnt(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		return session.selectOne(namespace +".getOrdCnt",bizOrderAdmVo);
	}
	
	//영업주문관리 생산수량 합 가져오기
	public Integer getSumDtlOrdCnt(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		return session.selectOne(namespace +".getSumDtlOrdCnt",bizOrderAdmVo);
	}
	
	//영업주문상세 등록
	public void bizOrderDtlCreate(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		session.insert(namespace +".bizOrderDtlCreate", bizOrderAdmVo);
	}
	
	//영업주문상세 수정
	public void bizOrderDtlUpdate(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		session.update(namespace +".bizOrderDtlUpdate", bizOrderAdmVo);
	}
	
	//영업주문상세 삭제
	public void bizOrderDtlDelete(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		session.delete(namespace +".bizOrderDtlDelete", bizOrderAdmVo);
	}
	
	//영업주문상세 수주시퀀스 가져오기
	public String getContSeq() throws Exception{
		return session.selectOne(namespace + ".getContSeq");
	}
	
	//영업주문상세 작지번호 시퀀스 가져오기
	public String getWorkOrdNoSeq(String date) throws Exception{
		return session.selectOne(namespace +".getWorkOrdNoSeq", date);
	}
	
	//수주현황 목록조회(외부/내부)
	public List<BizOrderAdmVo> bizOrderAdmStatusList(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		return session.selectList(namespace +".bizOrderAdmStatusList", bizOrderAdmVo);
	}
	
	
	
	
	
	
	@Override
	public List<BizOrderAdmVo> bizOrderEtcAdmList(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		return session.selectList(namespace + ".bizOrderEtcAdmList", bizOrderAdmVo);
	}
	
	//생산지시현황 목록조회
	public List<BizOrderAdmVo> bizOrderEtcAdmList2(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		return session.selectList(namespace+".bizOrderEtcAdmList2" ,bizOrderAdmVo);
	}
	
	@Override
	public List<BizOrderAdmVo> bizOrderEtcDtlList(BizOrderAdmVo bizOrderAdmVo) throws Exception {
		return session.selectList(namespace+".bizOrderEtcDtlList", bizOrderAdmVo);
	}
	
	//생산지시현황 전달사항, 생산지연사유 목록조회
	public List<BizOrderAdmVo> bizOrderEtcDaSdList(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		return session.selectList(namespace+".bizOrderEtcDaSdList" ,bizOrderAdmVo );
	}
	
	//생산지시현황 등록
	public void bizOrderEtcDtlCreate(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		session.insert(namespace+".bizOrderEtcDtlCreate", bizOrderAdmVo);
	}
	
	//생산지시현황 납기일 수정
	public void etcDateUpdate(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		session.update(namespace+".etcDateUpdate" ,bizOrderAdmVo );
	}
	
	//생산지시현황 기타별 상세삭제
	public void bizOrderEtcDelete(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		session.delete(namespace+".bizOrderEtcDelete" ,bizOrderAdmVo );
	}
	
	//생산지시현황 삭제
	public void bizOrderEtcDtlDelete(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		session.delete(namespace+".bizOrderEtcDtlDelete",bizOrderAdmVo);
	}
	
	//생산지시현황 삭제
	public void bizOrderEtcDtlAllDelete(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		session.delete(namespace+".bizOrderEtcDtlAllDelete",bizOrderAdmVo);
	}
	
	//ADM테이블 완료수량 수정
	public void shipCntUpdate(BizOrderAdmVo bizOrderAdmVo)throws Exception{
		session.update(namespace+".shipCntUpdate",bizOrderAdmVo);
	}
	
	//DTL테이블 완료수량 수정
	public void dtlShipCntUpdate(BizOrderAdmVo bizOrderAdmVo)throws Exception{
		session.update(namespace+".dtlShipCntUpdate",bizOrderAdmVo);
	}
	
	//생산지시현황 etcSeq 가져오기
	public String getEtcSeq() throws Exception{
		return session.selectOne(namespace+".getEtcSeq");
	}
	
	//수주상세번호 시퀀스 가져오기
	@Override
	public String getContDtlNoSeq(String date) throws Exception{
		return session.selectOne(namespace+".getContDtlNoSeq",date);
	}
	

	
	
	//생산지시현황 생산투입상태 목록조회
	public List<BizOrderAdmVo> approveProcList(BizOrderAdmVo bizOrderAdmVo) throws Exception{
		return session.selectList(namespace+".approveProcList" ,bizOrderAdmVo );
	}
}
