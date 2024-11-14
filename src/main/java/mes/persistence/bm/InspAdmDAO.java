package mes.persistence.bm;

import java.util.List;

import mes.domain.bm.AttachDataVo;
import mes.domain.bm.BarcodeAdmVo;
import mes.domain.bm.InspAdmVo;
import mes.domain.bm.MeasureInstrmtAdmVo;

public interface InspAdmDAO {
	
	//검사항목관리 조회
	public List<InspAdmVo> inspAdmList(InspAdmVo inspAdmVo) throws Exception;
	
	//검사항목관리 조회
	public InspAdmVo inspAdmRead(InspAdmVo inspAdmVo) throws Exception;
	
	//검사항목관리 등록
	public void inspAdmCreate(InspAdmVo inspAdmVo) throws Exception;
	
	//검사항목관리 수정
	public void inspAdmUpdate(InspAdmVo inspAdmVo) throws Exception;
	
	//검사항목관리 삭제
	public void inspAdmDelete(InspAdmVo inspAdmVo) throws Exception;
	
	//seq 조회
	public String inspAdmSeq(InspAdmVo inspAdmVo) throws Exception;
	
	
	
	//검사항목상세 조회
	public List<InspAdmVo> inspDtlList(InspAdmVo inspAdmVo) throws Exception;
	
	//검사항목상세 등록
	public void inspDtlCreate(InspAdmVo inspAdmVo) throws Exception;
	
	//검사항목상세 삭제
	public void inspDtlDelete(InspAdmVo inspAdmVo) throws Exception;
	
	//검사항목상세 시퀀스 생성
	public String getInspSeq(InspAdmVo inspAdmVo) throws Exception;
	
	
	
	//검사항목 결과조회
	//검사항목결과조회
	public List<InspAdmVo> inspResultAdmList(InspAdmVo inspAdmVo) throws Exception;
	
	//검사항목결과상세조회
	public int inspResultAdmRead(InspAdmVo inspAdmVo) throws Exception;
	
	//캐비티 데이터 상세조회
	public InspAdmVo inspCavityAdmRead(InspAdmVo inspAdmVo) throws Exception;
	
	//검사항목결과등록
	public void inspResultAdmCreate(InspAdmVo inspAdmVo) throws Exception;
	
	//캐비티 등록
	public void inspCavityAdmCreate(InspAdmVo inspAdmVo) throws Exception;
	
	//검사항목결과수정
	public void inspResultAdmUpdate(InspAdmVo inspAdmVo) throws Exception;
	
	//캐비티 수정
	public void inspCavityAdmUpdate(InspAdmVo inspAdmVo) throws Exception;
	
	//검사항목 판정결과 조회
	public String getInspResult(InspAdmVo inspAdmVo) throws Exception;
	
}
