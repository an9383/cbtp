package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.BarcodeAdmVo;
import mes.domain.bm.InspAdmVo;
import mes.persistence.bm.BarcodeAdmDAO;
import mes.persistence.bm.InspAdmDAO;

@Service
public class InspAdmServiceImpl implements InspAdmService {
	
	@Inject
	private InspAdmDAO dao;
	
	//검사항목관리 조회
	@Override
	public List<InspAdmVo> inspAdmList(InspAdmVo inspAdmVo) throws Exception {
		return dao.inspAdmList(inspAdmVo);
	}
	
	//검사항목관리 상세 조회
	@Override
	public InspAdmVo inspAdmRead(InspAdmVo inspAdmVo) throws Exception {
		return dao.inspAdmRead(inspAdmVo);
	}
	
	//검사항목관리 등록
	@Override
	public void inspAdmCreate(InspAdmVo inspAdmVo) throws Exception {
		dao.inspAdmCreate(inspAdmVo);
	}
	
	//검사항목관리 수정
	@Override
	public void inspAdmUpdate(InspAdmVo inspAdmVo) throws Exception {
		dao.inspAdmUpdate(inspAdmVo);
	}
	
	//검사항목관리 삭제
	@Override
	public void inspAdmDelete(InspAdmVo inspAdmVo) throws Exception {
		dao.inspAdmDelete(inspAdmVo);
	}
	
	//seq 조회
	@Override
	public String inspAdmSeq(InspAdmVo inspAdmVo) throws Exception {
		return dao.inspAdmSeq(inspAdmVo);
	}
	
	
	//검사항목상세 조회
	public List<InspAdmVo> inspDtlList(InspAdmVo inspAdmVo) throws Exception{
		return dao.inspDtlList(inspAdmVo);
	}
	
	//검사항목상세 등록
	public void inspDtlCreate(InspAdmVo inspAdmVo) throws Exception{
		dao.inspDtlCreate(inspAdmVo);
	}
	
	//검사항목상세 삭제
	public void inspDtlDelete(InspAdmVo inspAdmVo) throws Exception{
		dao.inspDtlDelete(inspAdmVo);
	}
	
	//검사항목상세 시퀀스 생성
	public String getInspSeq(InspAdmVo inspAdmVo) throws Exception{
		return dao.getInspSeq(inspAdmVo);
	}
	
	
	//검사항목 결과조회
	//검사항목결과조회
	public List<InspAdmVo> inspResultAdmList(InspAdmVo inspAdmVo) throws Exception{
		return dao.inspResultAdmList(inspAdmVo);
	}
	
	//검사항목결과상세조회
	public int inspResultAdmRead(InspAdmVo inspAdmVo) throws Exception{
		return dao.inspResultAdmRead(inspAdmVo);
	}
	
	//캐비티 데이터 확인
	public InspAdmVo inspCavityAdmRead(InspAdmVo inspAdmVo) throws Exception{
		return dao.inspCavityAdmRead(inspAdmVo);
	}
	
	//검사항목결과등록
	public void inspResultAdmCreate(InspAdmVo inspAdmVo) throws Exception{
		dao.inspResultAdmCreate(inspAdmVo);
	}
	
	//캐비티 등록
	public void inspCavityAdmCreate(InspAdmVo inspAdmVo) throws Exception{
		dao.inspCavityAdmCreate(inspAdmVo);
	}
	
	//검사항목결과수정
	public void inspResultAdmUpdate(InspAdmVo inspAdmVo) throws Exception{
		dao.inspResultAdmUpdate(inspAdmVo);
	}
	
	//캐비티 수정
	public void inspCavityAdmUpdate(InspAdmVo inspAdmVo) throws Exception{
		dao.inspCavityAdmUpdate(inspAdmVo);
	}
	
	//검사항목 판정결과 조회
	public String getInspResult(InspAdmVo inspAdmVo) throws Exception{
		return dao.getInspResult(inspAdmVo);
	}
	
}
