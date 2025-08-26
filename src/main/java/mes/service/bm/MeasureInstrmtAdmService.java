package mes.service.bm;

import java.util.List;

import mes.domain.bm.CorrDataListVo;
import mes.domain.bm.MeasureInstrmtAdmVo;

public interface MeasureInstrmtAdmService {
	
	//계측기 전체 조회
	public List<MeasureInstrmtAdmVo> measureInstrmtAdmList(MeasureInstrmtAdmVo Vo) throws Exception;
	
	// 계측기 특정 Read
	public MeasureInstrmtAdmVo measureInstrmtAdmRead(MeasureInstrmtAdmVo Vo) throws Exception;

	//계측기 Create
	public void measureInstrmtAdmCreate(MeasureInstrmtAdmVo Vo) throws Exception;
	
	// 계측기 Update
	public void measureInstrmtAdmUpdate(MeasureInstrmtAdmVo Vo) throws Exception;
	
	// 계측기 Delete
	public void measureInstrmtAdmDelete(MeasureInstrmtAdmVo Vo) throws Exception;

	//계측기 시퀀스 조회
	public String measureInstrmtSeq() throws Exception;
	
	// 설비코드 이미지 경로 조회
	public MeasureInstrmtAdmVo measureInstrmtImgRead(MeasureInstrmtAdmVo measureInstrmtAdmVo) throws Exception;

	// 이미지 등록
	public void measureInstrmtImageUpload(MeasureInstrmtAdmVo measureInstrmtAdmVo) throws Exception;
	
	//이미지 삭제
	public void measureInstrmtImageDelete(MeasureInstrmtAdmVo measureInstrmtAdmVo) throws Exception;
	
	//계측기 중복확인
	public Integer overlapMitCdNo(MeasureInstrmtAdmVo measureInstrmtAdmVo) throws Exception;
	
	//계측기 관리번호 중복확인
	public Integer overlapAdmNo(MeasureInstrmtAdmVo measureInstrmtAdmVo) throws Exception;
	
	//교정사항이력 목록조회
	public List<CorrDataListVo>attachCorreDataList(CorrDataListVo corrDataListVo) throws Exception;
	
	//교정사항이력 상세조회
	public CorrDataListVo measureInstrmtCorreAdmRead(CorrDataListVo corrDataListVo) throws Exception;

	//교정사항이력 시퀀스 자동생성
	public String getCorrSeq(CorrDataListVo corrDataListVo) throws Exception;
	
	//교정사항이력 등록
	public void attachCorreDataCreate(CorrDataListVo corrDataListVo) throws Exception;
		
	//교정사항이력 수정
	public void attachCorreDataUpdate(CorrDataListVo corrDataListVo) throws Exception;
	
	//교정사항이력 삭제
	public void attachCorreDataDelete(CorrDataListVo corrDataListVo) throws Exception;
		
	//관련 자료 파일 경로 출력
	public String eqCorreFilePath(CorrDataListVo corrDataListVo) throws Exception;
	
	
}
