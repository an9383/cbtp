package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.CorrDataListVo;
import mes.domain.bm.MeasureInstrmtAdmVo;
import mes.persistence.bm.MeasureInstrmtAdmDAO;

@Service
public class MeasureInstrmtAdmServiceInpl implements MeasureInstrmtAdmService {
	
	@Inject
	private MeasureInstrmtAdmDAO dao;
	
	
	//계측기 전체조회
	@Override
	public List<MeasureInstrmtAdmVo> measureInstrmtAdmList(MeasureInstrmtAdmVo Vo) throws Exception {
		return dao.measureInstrmtAdmList(Vo);
	}
	

	// 계측기 특정 Read
	@Override
	public MeasureInstrmtAdmVo measureInstrmtAdmRead(MeasureInstrmtAdmVo Vo) throws Exception {
		return dao.measureInstrmtAdmRead(Vo);
	}

	
	//계측기 Create
	@Override
	public void measureInstrmtAdmCreate(MeasureInstrmtAdmVo Vo) throws Exception {
		dao.measureInstrmtAdmCreate(Vo);
	}
	
	// 계측기 Update
	@Override
	public void measureInstrmtAdmUpdate(MeasureInstrmtAdmVo Vo) throws Exception {
		dao.measureInstrmtAdmUpdate(Vo);
	}
	
	// 계측기 Delete
	@Override
	public void measureInstrmtAdmDelete(MeasureInstrmtAdmVo Vo) throws Exception {
		dao.measureInstrmtAdmDelete(Vo);
	}
	
	//계측기 시퀀스조회
	@Override
	public String measureInstrmtSeq() throws Exception {
		return dao.measureInstrmtSeq();
	}


	@Override
	public MeasureInstrmtAdmVo measureInstrmtImgRead(MeasureInstrmtAdmVo measureInstrmtAdmVo) throws Exception{
		return dao.measureInstrmtImgRead(measureInstrmtAdmVo);
	}
	
	@Override
	public void measureInstrmtImageUpload(MeasureInstrmtAdmVo measureInstrmtAdmVo) throws Exception{
		dao.measureInstrmtImageUpload(measureInstrmtAdmVo);
	}
	
	//이미지 삭제
	public void measureInstrmtImageDelete(MeasureInstrmtAdmVo measureInstrmtAdmVo) throws Exception{
		dao.measureInstrmtImageDelete(measureInstrmtAdmVo);
	}

	//계측기 중복확인
	public Integer overlapMitCdNo(MeasureInstrmtAdmVo measureInstrmtAdmVo) throws Exception{
		return dao.overlapMitCdNo(measureInstrmtAdmVo);
	}
	
	//계측기 관리번호 중복확인
	public Integer overlapAdmNo(MeasureInstrmtAdmVo measureInstrmtAdmVo) throws Exception{
		return dao.overlapAdmNo(measureInstrmtAdmVo);
	}
	
	//교정사항이력 목록조회
	@Override
	public List<CorrDataListVo>attachCorreDataList(CorrDataListVo corrDataListVo) throws Exception {
		return dao.attachCorreDataList(corrDataListVo);
	}
	
	//교정사항이력 상세조회
	@Override
	public CorrDataListVo measureInstrmtCorreAdmRead(CorrDataListVo CorrDataListVo) throws Exception {
		return dao.measureInstrmtCorreAdmRead(CorrDataListVo);
	}
	
	//교정사항이력 시퀀스 자동생성
	public String getCorrSeq(CorrDataListVo corrDataListVo) throws Exception{
		return dao.getCorrSeq(corrDataListVo);
	}
	
	//교정사항이력 등록
	@Override
	public void attachCorreDataCreate(CorrDataListVo corrDataListVo) throws Exception {
		dao.attachCorreDataCreate(corrDataListVo);
	}
	
	//교정사항이력 수정
	public void attachCorreDataUpdate(CorrDataListVo corrDataListVo) throws Exception{
		dao.attachCorreDataUpdate(corrDataListVo);
	}	
	
	//교정사항이력 삭제
	@Override
	public void attachCorreDataDelete(CorrDataListVo corrDataListVo) throws Exception {
		dao.attachCorreDataDelete(corrDataListVo);
	}
	
	//관련 자료 파일경로 출력
	@Override
	public String eqCorreFilePath(CorrDataListVo corrDataListVo) throws Exception {
		return dao.eqCorreFilePath(corrDataListVo);
	}
	

}
