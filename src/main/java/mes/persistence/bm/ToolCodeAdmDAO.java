package mes.persistence.bm;

import java.util.List;
import mes.domain.bm.ToolCodeAdmVo;

public interface ToolCodeAdmDAO {
	
	//설비코드 전체조회
	public List<ToolCodeAdmVo> equipCodeAdmList(ToolCodeAdmVo Vo) throws Exception;
	
	//설비코드 특정 Read
	public ToolCodeAdmVo equipCodeAdmRead(ToolCodeAdmVo Vo) throws Exception;
	
	//설비재가동 이력 read
	public ToolCodeAdmVo equipRestartInfoRead(ToolCodeAdmVo Vo) throws Exception;
	
	//작업조건 특정 Read
	public ToolCodeAdmVo eqWorkStandAdmRead(ToolCodeAdmVo Vo) throws Exception;
	
	//교정내역 전체조회
	public List<ToolCodeAdmVo> equipCorrInfoList(ToolCodeAdmVo Vo) throws Exception;
	
	//기타 전체조회
	public List<ToolCodeAdmVo> equipEtcInfoList(ToolCodeAdmVo Vo) throws Exception;
	
	//부속품 목록 조회
	public List<ToolCodeAdmVo> equipPartAdmList(ToolCodeAdmVo Vo) throws Exception;
	
	//금형 SHOT 이력 목록 조회
	public List<ToolCodeAdmVo> equipShotList(ToolCodeAdmVo Vo) throws Exception;
	
	//금형 SHOT 이력 년 조회
	public List<ToolCodeAdmVo> moldYearList(ToolCodeAdmVo Vo) throws Exception;
	
	//금형 SHOT 이력 월 조회
	public List<ToolCodeAdmVo> moldMonthList(ToolCodeAdmVo Vo) throws Exception;
	
	//금형 SHOT 이력 일 조회
	public List<ToolCodeAdmVo> moldDayList(ToolCodeAdmVo Vo) throws Exception;
	
	//기준서 목록 조회
	public List<ToolCodeAdmVo> equipCheckAdmList(ToolCodeAdmVo Vo) throws Exception;
	
	//설비재가동 이력 목록 조회
	public List<ToolCodeAdmVo> equipRestartInfoList(ToolCodeAdmVo Vo) throws Exception;
	
	//일상점검 목록 조회
	public List<ToolCodeAdmVo> equipDailyCheckList(ToolCodeAdmVo Vo) throws Exception;
	
	//부대설비 Update Delete
	public void ancFacUpdateDelete(ToolCodeAdmVo Vo) throws Exception;
	
	//설비코드 중복 체크
	public int overlapEquipCd(ToolCodeAdmVo Vo) throws Exception;
	
	//작업조건 중복 체크
	public int eqWorkStandAdmCount(ToolCodeAdmVo Vo) throws Exception;

	//설비코드 Create
	public int equipCodeAdmCreate(ToolCodeAdmVo Vo) throws Exception;
	
	//작업조건 Create
	public void eqWorkStandAdmCreate(ToolCodeAdmVo Vo) throws Exception;
	
	//교정내역 Create
	public void equipCorrInfoCreate(ToolCodeAdmVo Vo) throws Exception;
	
	//기타 Create
	public void equipEtcInfoCreate(ToolCodeAdmVo Vo) throws Exception;
	
	//부속품 Create
	public void partAdmCreate(ToolCodeAdmVo Vo) throws Exception;
	
	//기준서 Create
	public void equipCheckAdmCreate(ToolCodeAdmVo Vo) throws Exception;
	
	//일상점검 Create
	public void equipDailyCheckCreate(ToolCodeAdmVo Vo) throws Exception;
	
	//설비코드 Update
	public int equipCodeAdmUpdate(ToolCodeAdmVo Vo) throws Exception;
	
	//교정내역 Delete
	public void equipCorrInfoDelete(ToolCodeAdmVo Vo) throws Exception;
	
	//작업조건 Update
	public void eqWorkStandAdmUpdate(ToolCodeAdmVo Vo) throws Exception;
	
	//교정내역 상세 Delete
	public void equipCorrInfoDelete2(ToolCodeAdmVo Vo) throws Exception;
	
	//작업조건 Delete
	public void eqWorkStandAdmDelete(ToolCodeAdmVo Vo) throws Exception;
	
	//기타 Delete
	public void equipEtcInfoDelete(ToolCodeAdmVo Vo) throws Exception;
	
	//부속품 Delete
	public void partAdmDelete(ToolCodeAdmVo Vo) throws Exception;
	
	//기준서 Delete
	public void equipCheckAdmDelete(ToolCodeAdmVo Vo) throws Exception;
	
	//일상점검 Delete
	public void equipDailyCheckDelete(ToolCodeAdmVo Vo) throws Exception;
	
	// 시퀀스 조회
	public String equipCodeSeq() throws Exception;
	
	// 기타 시퀀스 조회
	public Integer etcSeq(ToolCodeAdmVo Vo) throws Exception;
	
	//부속품 시퀀스 조회
	public Integer partSeq(ToolCodeAdmVo Vo) throws Exception;
	
	//기준서 시퀀스 조회
	public Integer checkSeq(ToolCodeAdmVo Vo) throws Exception;
	
	//일상점검 시퀀스 조회
	public Integer getCheckSeq(ToolCodeAdmVo Vo) throws Exception;
	
	//교정내역 중복검사
	public int overlapCorrRegDate(ToolCodeAdmVo Vo) throws Exception;
	
	//이니셜 중복검사 
	public int overlapEquipInitial(ToolCodeAdmVo Vo) throws Exception;
	
	//이미지 경로 조회
	public ToolCodeAdmVo equipImgRead(ToolCodeAdmVo Vo) throws Exception;
	
	//이미지 등록
	public void equipImageUpload(ToolCodeAdmVo Vo) throws Exception;
	
	//이미지 삭제
	public void equipImageDelete(ToolCodeAdmVo Vo) throws Exception;
	
	// 모니터링 - 설비가동/비가동현황 ------------------------------------------------------
	
	//설비구분별 설비목록 조회
	public List<ToolCodeAdmVo> equipGubunToList(ToolCodeAdmVo Vo) throws Exception;
	
	//설비구분별 설비가동/비가동현황
	public List<ToolCodeAdmVo> equipStateList(ToolCodeAdmVo Vo) throws Exception;
	
	//이미지 내용 수정
	public void equipImgUpdate(ToolCodeAdmVo Vo) throws Exception;
	
	//삭제
	public void equipDataDelete(ToolCodeAdmVo Vo) throws Exception;
	
	//엑셀 Create
	public void equipCodeExcelCreate(ToolCodeAdmVo Vo) throws Exception;
	
	//금형수명관리
	public List<ToolCodeAdmVo> readMoldMonthListAll(ToolCodeAdmVo Vo) throws Exception;
	
	//설비관리번호 중복체크
	public int equipNoCheck(ToolCodeAdmVo Vo) throws Exception;
	
	//설비제원 리스트 조회
	public List<ToolCodeAdmVo> equipDataList(ToolCodeAdmVo Vo) throws Exception;
	
	//설비제원 데이터 생성
	public void equipDataDtlCreate(ToolCodeAdmVo Vo) throws Exception;
	
	//설비제원 데이터 삭제
	public void equipDataDtlDelete(ToolCodeAdmVo Vo) throws Exception;
	
	
	//철형품목정보관리 조회
	public List<ToolCodeAdmVo> ironItemList(ToolCodeAdmVo Vo) throws Exception;
	
	//철형품목정보관리 Create
	public void ironItemCreate(ToolCodeAdmVo Vo) throws Exception;
		
	//철형품목정보관리 데이터 삭제
	public void ironItemDelete(ToolCodeAdmVo Vo) throws Exception;
	
	//철형품목정보관리 데이터 전체삭제
	public void ironItemDeleteAll(ToolCodeAdmVo Vo) throws Exception;
	
	
		
}