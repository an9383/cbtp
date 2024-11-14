package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.AttachDataVo;
import mes.domain.bm.BarcodeAdmVo;
import mes.domain.bm.InspAdmVo;
import mes.domain.bm.MeasureInstrmtAdmVo;

@Repository
public class InspAdmDAOImpl implements InspAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.inspAdmMapper";
	
	//검사항목관리 조회
	public List<InspAdmVo> inspAdmList(InspAdmVo inspAdmVo) throws Exception {
		return session.selectList(namespace + ".inspAdmList", inspAdmVo);
	}
	
	//검사항목관리 등록
	public void inspAdmCreate(InspAdmVo inspAdmVo) throws Exception {
		session.insert(namespace + ".inspAdmCreate", inspAdmVo);
	}
	
	//검사항목관리 상세 조회
	public InspAdmVo inspAdmRead(InspAdmVo inspAdmVo) throws Exception {
		return session.selectOne(namespace + ".inspAdmRead", inspAdmVo);
	}
	
	//검사항목관리 수정
	public void inspAdmUpdate(InspAdmVo inspAdmVo) throws Exception {
		session.update(namespace + ".inspAdmUpdate", inspAdmVo);
	}
	
	//검사항목관리 삭제
	public void inspAdmDelete(InspAdmVo inspAdmVo) throws Exception {
		session.delete(namespace + ".inspAdmDelete", inspAdmVo);
	}
	
	//seq 조회
	public String inspAdmSeq(InspAdmVo inspAdmVo) throws Exception {
		return session.selectOne(namespace + ".inspAdmSeq", inspAdmVo);
	}
	
	//검사항목상세 조회
	public List<InspAdmVo> inspDtlList(InspAdmVo inspAdmVo) throws Exception{
		return session.selectList(namespace+".inspDtlList",inspAdmVo);
	}
	
	//검사항목상세 등록
	public void inspDtlCreate(InspAdmVo inspAdmVo) throws Exception{
		session.insert(namespace+".inspDtlCreate",inspAdmVo);
	}
	
	//검사항목상세 삭제
	public void inspDtlDelete(InspAdmVo inspAdmVo) throws Exception{
		session.delete(namespace+".inspDtlDelete",inspAdmVo);
	}
	
	//검사항목상세 시퀀스 생성
	public String getInspSeq(InspAdmVo inspAdmVo) throws Exception{
		return session.selectOne(namespace+".getInspSeq",inspAdmVo);
	}
	
	
	//검사항목 결과조회
	//검사항목결과조회
	public List<InspAdmVo> inspResultAdmList(InspAdmVo inspAdmVo) throws Exception{
		return session.selectList(namespace+".inspResultAdmList" , inspAdmVo);
	}
		
	//검사항목결과상세조회
	public int inspResultAdmRead(InspAdmVo inspAdmVo) throws Exception{
		return session.selectOne(namespace+".inspResultAdmRead" , inspAdmVo);
	}

	//캐비티 데이터 확인
	public InspAdmVo inspCavityAdmRead(InspAdmVo inspAdmVo) throws Exception{
		return session.selectOne(namespace + ".inspCavityAdmRead", inspAdmVo);
	}
	
	//검사항목결과등록
	public void inspResultAdmCreate(InspAdmVo inspAdmVo) throws Exception{
		session.insert(namespace+".inspResultAdmCreate" , inspAdmVo);
	}
	
	//캐비티 등록
	public void inspCavityAdmCreate(InspAdmVo inspAdmVo) throws Exception{
		session.insert(namespace + ".inspCavityAdmCreate", inspAdmVo);
	}
	
	//검사항목결과수정
	public void inspResultAdmUpdate(InspAdmVo inspAdmVo) throws Exception{
		session.update(namespace+".inspResultAdmUpdate" , inspAdmVo);
	}

	//캐비티 수정
	public void inspCavityAdmUpdate(InspAdmVo inspAdmVo) throws Exception{
		session.update(namespace + ".inspCavityAdmUpdate", inspAdmVo);
	}
	
	//검사항목 판정결과 조회
	public String getInspResult(InspAdmVo inspAdmVo) throws Exception{
		return session.selectOne(namespace+".getInspResult" , inspAdmVo);
	}
		
}
