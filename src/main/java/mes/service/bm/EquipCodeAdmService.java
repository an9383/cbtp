package mes.service.bm;

import java.util.List;
import mes.domain.bm.EquipCodeAdmVo;

public interface EquipCodeAdmService {
	
	//설비코드 전체조회
	public List<EquipCodeAdmVo>equipCodeAdmList(EquipCodeAdmVo Vo) throws Exception;

	//설비코드 특정 Read
	public EquipCodeAdmVo equipCodeAdmRead(EquipCodeAdmVo Vo) throws Exception;
	
	//설비재가동 이력 read
	public EquipCodeAdmVo equipRestartInfoRead(EquipCodeAdmVo Vo) throws Exception;
	
	//작업조건 특정 Read
	public EquipCodeAdmVo eqWorkStandAdmRead(EquipCodeAdmVo Vo) throws Exception;
	
	//교정내역 전체조회
	public List<EquipCodeAdmVo> equipCorrInfoList(EquipCodeAdmVo Vo) throws Exception;
	
	//기타 전체조회
	public List<EquipCodeAdmVo> equipEtcInfoList(EquipCodeAdmVo Vo) throws Exception;
	
	//부속품 목록 조회
	public List<EquipCodeAdmVo> equipPartAdmList(EquipCodeAdmVo Vo) throws Exception;
	
	//금형 SHOT 이력 목록 조회
	public List<EquipCodeAdmVo> equipShotList(EquipCodeAdmVo Vo) throws Exception;
	
	//금형 SHOT 이력 년 조회
	public List<EquipCodeAdmVo> moldYearList(EquipCodeAdmVo Vo) throws Exception;
	
	//금형 SHOT 이력 월 조회
	public List<EquipCodeAdmVo> moldMonthList(EquipCodeAdmVo Vo) throws Exception;
	
	//금형 SHOT 이력 일 조회
	public List<EquipCodeAdmVo> moldDayList(EquipCodeAdmVo Vo) throws Exception;
	
	//기준서 목록 조회
	public List<EquipCodeAdmVo> equipCheckAdmList(EquipCodeAdmVo Vo) throws Exception;
	
	//설비재가동 이력 목록 조회
	public List<EquipCodeAdmVo> equipRestartInfoList(EquipCodeAdmVo Vo) throws Exception;
	
	//일상점검 목록 조회
	public List<EquipCodeAdmVo> equipDailyCheckList(EquipCodeAdmVo Vo) throws Exception;
	
	//부대설비 Update Delete
	public void ancFacUpdateDelete(EquipCodeAdmVo Vo) throws Exception;
	
	//설비코드 중복 체크
	public int overlapEquipCd(EquipCodeAdmVo Vo) throws Exception;
	
	//작업조건 중복 체크
	public int eqWorkStandAdmCount(EquipCodeAdmVo Vo) throws Exception;
	
	//설비코드 Create
	public int equipCodeAdmCreate(EquipCodeAdmVo Vo) throws Exception;
	
	//작업조건 Create
	public void eqWorkStandAdmCreate(EquipCodeAdmVo Vo) throws Exception;
	
	//교정내역 Create
	public void equipCorrInfoCreate(EquipCodeAdmVo Vo) throws Exception;
	
	//기타 Create
	public void equipEtcInfoCreate(EquipCodeAdmVo Vo) throws Exception;
	
	//부속품 Create
	public void partAdmCreate(EquipCodeAdmVo Vo) throws Exception;
	
	//기준서 Create
	public void equipCheckAdmCreate(EquipCodeAdmVo Vo) throws Exception;
	
	//일상점검 Create
	public void equipDailyCheckCreate(EquipCodeAdmVo Vo) throws Exception;
	
	//설비코드 Update
	public int equipCodeAdmUpdate(EquipCodeAdmVo Vo) throws Exception;
	
	//교정내역 Delete
	public void equipCorrInfoDelete(EquipCodeAdmVo Vo) throws Exception;
	
	//작업조건 Update
	public void eqWorkStandAdmUpdate(EquipCodeAdmVo Vo) throws Exception;
	
	//교정내역 상세 Delete
	public void equipCorrInfoDelete2(EquipCodeAdmVo Vo) throws Exception;
	
	//작업조건 Delete
	public void eqWorkStandAdmDelete(EquipCodeAdmVo Vo) throws Exception;
	
	//기타 Delete
	public void equipEtcInfoDelete(EquipCodeAdmVo Vo) throws Exception;
	
	//부속품 Delete
	public void partAdmDelete(EquipCodeAdmVo Vo) throws Exception;
	
	//기준서 Delete
	public void equipCheckAdmDelete(EquipCodeAdmVo Vo) throws Exception;
	
	//일상점검 Delete
	public void equipDailyCheckDelete(EquipCodeAdmVo Vo) throws Exception;
	
	//설비코드 시퀀스
	public String equipCodeSeq() throws Exception;
	
	// 기타 시퀀스 조회
	public Integer etcSeq(EquipCodeAdmVo Vo) throws Exception;
	
	//부속품 시퀀스 조회
	public Integer partSeq(EquipCodeAdmVo Vo) throws Exception;
	
	//기준서 시퀀스 조회
	public Integer checkSeq(EquipCodeAdmVo Vo) throws Exception;
	
	//일상점검 시퀀스 조회
	public Integer getCheckSeq(EquipCodeAdmVo Vo) throws Exception;
	
	//교정내역 중복검사
	public int overlapCorrRegDate(EquipCodeAdmVo Vo) throws Exception;
	
	//이니셜 중복검사 
	public int overlapEquipInitial(EquipCodeAdmVo Vo) throws Exception;
	
	//설비코드 이미지 경로 조회
	public EquipCodeAdmVo equipImgRead(EquipCodeAdmVo equipCodeAdmVo) throws Exception;
	
	//이미지 등록
	public void equipImageUpload(EquipCodeAdmVo equipCodeAdmVo) throws Exception;

	//이미지 삭제
	public void equipImageDelete(EquipCodeAdmVo equipCodeAdmVo) throws Exception;
	
	// 모니터링 - 설비가동/비가동현황 ------------------------------------------------------
	
	//설비구분별 설비목록 조회
	public List<EquipCodeAdmVo> equipGubunToList(EquipCodeAdmVo equipCodeAdmVo) throws Exception;
	
	//설비구분별 설비가동/비가동현황
	public List<EquipCodeAdmVo> equipStateList(EquipCodeAdmVo equipCodeAdmVo) throws Exception;
	
	//이미지 내용 수정
	public void equipImgUpdate(EquipCodeAdmVo equipCodeAdmVo) throws Exception;
	
	//삭제
	public void equipDataDelete(EquipCodeAdmVo equipCodeAdmVo) throws Exception;
	
	//엑셀 Create
	public void equipCodeExcelCreate(EquipCodeAdmVo Vo) throws Exception;
	
	//금형수명관리
	public List<EquipCodeAdmVo> readMoldMonthListAll(EquipCodeAdmVo Vo) throws Exception;
	
	//설비관리번호 중복체크
	public int equipNoCheck(EquipCodeAdmVo equipCodeAdmVo) throws Exception;
	
	//설비제원 리스트 조회
	public List<EquipCodeAdmVo> equipDataList(EquipCodeAdmVo equipCodeAdmVo) throws Exception;
	
	//설비제원 데이터 생성
	public void equipDataDtlCreate(EquipCodeAdmVo equipCodeAdmVo) throws Exception;
	
	//설비제원 데이터 삭제
	public void equipDataDtlDelete(EquipCodeAdmVo equipCodeAdmVo) throws Exception;
	
	//철형품목정보관리 조회
	public List<EquipCodeAdmVo> ironItemList(EquipCodeAdmVo equipCodeAdmVo) throws Exception;
	
	//철형품목정보관리 Create
	public void ironItemCreate(EquipCodeAdmVo equipCodeAdmVo) throws Exception;
		
	//철형품목정보관리 데이터 삭제
	public void ironItemDelete(EquipCodeAdmVo equipCodeAdmVo) throws Exception;
	
	//철형품목정보관리 데이터 전체삭제
	public void ironItemDeleteAll(EquipCodeAdmVo equipCodeAdmVo) throws Exception;
		
}
