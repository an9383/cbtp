package mes.persistence.qm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.qm.ItemCompleteAdmVo;
import mes.domain.qm.ItemInspectAdmVo;

@Repository
public class ItemCompleteAdmDAOImpl implements ItemCompleteAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.qm.itemCompleteAdmMapper";
	
	// 완제품관리 목록조회
	@Override
	public List<ItemCompleteAdmVo> listAll(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectList(namespace + ".listAll",itemCompleteAdmVo);
	}
	
	//완제품관리 생산 lot별 목록조회
	public List<ItemCompleteAdmVo> itemCompleteAdmList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectList(namespace+".itemCompleteAdmList" , itemCompleteAdmVo);
	}
	
	// 완제품관리 상세조회
	@Override
	public ItemCompleteAdmVo read(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectOne(namespace + ".read",itemCompleteAdmVo);
	}
	
	// 완제품관리 마스터 번호생성
	public String getDoNo(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectOne(namespace+".getDoNo" , itemCompleteAdmVo);
	}
	
	// 완제품관리 마스터 등록
	public void itemCompleteMasterCreate(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		session.insert(namespace+".itemCompleteMasterCreate" , itemCompleteAdmVo);
	}
	
	// 완제품관리 마스터 수정
	public void itemCompleteMasterUpdate(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		session.update(namespace+".itemCompleteMasterUpdate" , itemCompleteAdmVo);
	}
	
	// 완제품관리 등록
	@Override
	public void createComplete(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		session.insert(namespace + ".createComplete",itemCompleteAdmVo);
	}
	
	// 완제품관리 수정
	@Override
	public void updateComplete(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		session.update(namespace + ".updateComplete",itemCompleteAdmVo);
	}
	
	// 완제품관리 삭제
	public void deleteComplete(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		session.delete(namespace+".deleteComplete" ,itemCompleteAdmVo );
	}
	
	// 완제품관리 시퀀스 생성
	public String getDoSeq(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectOne(namespace+".getDoSeq" , itemCompleteAdmVo);
	}
	
	// 완제품관리 불량내역 생성
	@Override
	public void createFaulty(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		session.insert(namespace + ".createFaulty",itemCompleteAdmVo);
	}
	
	// 완제품관리 불량내역 수정
	@Override
	public void updateFaulty(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		session.update(namespace + ".updateFaulty",itemCompleteAdmVo);
	}

	// 완제품관리 불량내역 삭제
	public void deleteFaulty(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		session.delete(namespace+".deleteFaulty",itemCompleteAdmVo);
	}
	
	// 완제품관리 승인상태 수정
	@Override
	public void updateStatus(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		session.update(namespace + ".updateStatus",itemCompleteAdmVo);
	}
	
	// 완제품관리 제품입고 여부확인
	public Integer checkItemWhsYn(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectOne(namespace+".checkItemWhsYn" ,itemCompleteAdmVo );
	}
	
	
	// 완제품관리 성적서 삭제
	@Override
	public void completeFileDelete(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		session.update(namespace + ".completeFileDelete",itemCompleteAdmVo);
	}
	
	// 바코드 유무 확인
	public String checkBarcodeNo(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectOne(namespace+".checkBarcodeNo", itemCompleteAdmVo);
	}
	
	// 바코드 생성
	public void updateBarcodeNo(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		session.update(namespace+".updateBarcodeNo" ,itemCompleteAdmVo );
	}
	
	
	
	
	// 완제품검사 불량유형조회
	public List<ItemCompleteAdmVo> itemCompleteFaultyTypeList (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectList(namespace+".itemCompleteFaultyTypeList",itemCompleteAdmVo);
	}
	
	// 완제품검사 불량유형조회
	public List<ItemCompleteAdmVo> itemCompleteFaultyTypeRead (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectList(namespace+".itemCompleteFaultyTypeRead",itemCompleteAdmVo);
	}
	
	// 완제품검사 등록
	public void itemCompleteFaultyTypeCreate(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		session.insert(namespace+".itemCompleteFaultyTypeCreate",itemCompleteAdmVo);
	}
	
	// 완제품검사 삭제
	public void itemCompleteFaultyTypeDelete(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		session.delete(namespace+".itemCompleteFaultyTypeDelete",itemCompleteAdmVo);
	}
	
	
	// 완제품검사 총 수량조회
	public ItemCompleteAdmVo itemInspectQtyRead(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectOne(namespace+".itemInspectQtyRead" ,itemCompleteAdmVo );
	}
	
	
	
	
	//******************모니터링*********************
	// 완제품검사 품질경향 분석 목록조회(일별)
	@Override
	public List<ItemCompleteAdmVo> qualityTrendAnlyDayList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception {
		return session.selectList(namespace+".qualityTrendAnlyDayList" , itemCompleteAdmVo);
	}
		
	// 완제품검사 품질경향 분석 목록조회 
	public List<ItemCompleteAdmVo> qualityTrendAnlyList (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectList(namespace+".qualityTrendAnlyList",itemCompleteAdmVo);
	}
	
	// 완제품검사 품질경향 분석 목록조회 
	public List<ItemCompleteAdmVo> qualityTrendAnlyList11 (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectList(namespace+".qualityTrendAnlyList11",itemCompleteAdmVo);
	}
	
	// 완제품검사 원인별 불량누적현황 목록조회 
	public List<ItemCompleteAdmVo> faultyStatusList (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectList(namespace+".faultyStatusList",itemCompleteAdmVo);
	}
	
	
	// 불량유형 개수
	public Integer faultyTypeCount(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectOne(namespace+".faultyTypeCount" ,itemCompleteAdmVo );
	}
	
	// 누적 유형별 점유율 목록조회
	public List<ItemCompleteAdmVo> itemCompleteMonthList (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectList(namespace+".itemCompleteMonthList" , itemCompleteAdmVo);
	}
	
	// 기간별 완제품검사결과조회
	public List<ItemCompleteAdmVo> testResultCompleteList (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectList(namespace+".testResultCompleteList" , itemCompleteAdmVo);
	}
	
	//검사항목결과관리 연계번호 조회
	public List<ItemCompleteAdmVo> inspResultAdmList (ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectList(namespace + ".inspResultAdmList", itemCompleteAdmVo);
	}
	
}
