package mes.service.bm;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.bm.ToolCodeAdmVo;
import mes.persistence.bm.EquipCodeAdmDAO;
import mes.persistence.bm.ToolCodeAdmDAO;

@Service
public class ToolCodeAdmServiceImpl implements ToolCodeAdmService {

	@Inject
	private ToolCodeAdmDAO dao;
	
	//설비코드 전체조회
	@Override
	public List<ToolCodeAdmVo> equipCodeAdmList(ToolCodeAdmVo Vo) throws Exception {
		return dao.equipCodeAdmList(Vo);
	}

	//설비코드 특정 Read
	@Override
	public ToolCodeAdmVo equipCodeAdmRead(ToolCodeAdmVo Vo) throws Exception {
		return dao.equipCodeAdmRead(Vo);
	}
	
	//설비재가동 이력 read
	@Override
	public ToolCodeAdmVo equipRestartInfoRead(ToolCodeAdmVo Vo) throws Exception {
		return dao.equipRestartInfoRead(Vo);
	}
	
	//작업조건 특정 Read
	@Override
	public ToolCodeAdmVo eqWorkStandAdmRead(ToolCodeAdmVo Vo) throws Exception {
		return dao.eqWorkStandAdmRead(Vo);
	}
	
	//교정내역 전체조회
	@Override
	public List<ToolCodeAdmVo> equipCorrInfoList(ToolCodeAdmVo Vo) throws Exception {
		return dao.equipCorrInfoList(Vo);
	}
	
	//기타 전체조회
	@Override
	public List<ToolCodeAdmVo> equipEtcInfoList(ToolCodeAdmVo Vo) throws Exception {
		return dao.equipEtcInfoList(Vo);
	}
	
	//부속품 목록 조회
	@Override
	public List<ToolCodeAdmVo> equipPartAdmList(ToolCodeAdmVo Vo) throws Exception {
		return dao.equipPartAdmList(Vo);
	}
	
	//금형 SHOT 이력 목록 조회
	@Override
	public List<ToolCodeAdmVo> equipShotList(ToolCodeAdmVo Vo) throws Exception {
		return dao.equipShotList(Vo);
	}
	
	//금형 SHOT 이력 년 조회
	@Override
	public List<ToolCodeAdmVo> moldYearList(ToolCodeAdmVo Vo) throws Exception {
		return dao.moldYearList(Vo);
	}
	
	//금형 SHOT 이력 월 조회
	@Override
	public List<ToolCodeAdmVo> moldMonthList(ToolCodeAdmVo Vo) throws Exception {
		return dao.moldMonthList(Vo);
	}
	
	//금형 SHOT 이력 일 조회
	@Override
	public List<ToolCodeAdmVo> moldDayList(ToolCodeAdmVo Vo) throws Exception {
		return dao.moldDayList(Vo);
	}
	
	//기준서 목록 조회
	@Override
	public List<ToolCodeAdmVo> equipCheckAdmList(ToolCodeAdmVo Vo) throws Exception {
		return dao.equipCheckAdmList(Vo);
	}
	
	//설비재가동 이력 목록 조회
	@Override
	public List<ToolCodeAdmVo> equipRestartInfoList(ToolCodeAdmVo Vo) throws Exception {
		return dao.equipRestartInfoList(Vo);
	}
	
	//일상점검 목록 조회
	@Override
	public List<ToolCodeAdmVo> equipDailyCheckList(ToolCodeAdmVo Vo) throws Exception {
		return dao.equipDailyCheckList(Vo);
	}
	
	//부대설비 Update Delete
	@Override
	public void ancFacUpdateDelete(ToolCodeAdmVo Vo) throws Exception{
		dao.ancFacUpdateDelete(Vo);
	}
	
	//설비코드 중복 체크
	@Override
	public int overlapEquipCd(ToolCodeAdmVo Vo) throws Exception{
		return dao.overlapEquipCd(Vo);
	}
	
	//작업조건 중복 체크
	@Override
	public int eqWorkStandAdmCount(ToolCodeAdmVo Vo) throws Exception{
		return dao.eqWorkStandAdmCount(Vo);
	}
	
	//설비코드 Create
	@Override
	public int equipCodeAdmCreate(ToolCodeAdmVo Vo) throws Exception {
		return dao.equipCodeAdmCreate(Vo);
	}
	
	//작업조건 Create
	@Override
	public void eqWorkStandAdmCreate(ToolCodeAdmVo Vo) throws Exception{
		dao.eqWorkStandAdmCreate(Vo);
	}
	
	//교정내역 Create
	@Override
	public void equipCorrInfoCreate(ToolCodeAdmVo Vo) throws Exception{
		dao.equipCorrInfoCreate(Vo);
	}
	
	//기타 Create
	@Override
	public void equipEtcInfoCreate(ToolCodeAdmVo Vo) throws Exception{
		dao.equipEtcInfoCreate(Vo);
	}
	
	//부속품 Create
	@Override
	public void partAdmCreate(ToolCodeAdmVo Vo) throws Exception{
		dao.partAdmCreate(Vo);
	}
	
	//기준서 Create
	@Override
	public void equipCheckAdmCreate(ToolCodeAdmVo Vo) throws Exception{
		dao.equipCheckAdmCreate(Vo);
	}
	
	//일상점검 Create
	@Override
	public void equipDailyCheckCreate(ToolCodeAdmVo Vo) throws Exception{
		dao.equipDailyCheckCreate(Vo);
	}
	
	//설비코드 Update
	@Override
	public int equipCodeAdmUpdate(ToolCodeAdmVo Vo) throws Exception {
		return dao.equipCodeAdmUpdate(Vo);
	}
	
	//교정내역 Delete
	@Override
	public void equipCorrInfoDelete(ToolCodeAdmVo Vo) throws Exception{
		dao.equipCorrInfoDelete(Vo);
	}
	
	//작업조건 Update
	@Override
	public void eqWorkStandAdmUpdate(ToolCodeAdmVo Vo) throws Exception{
		dao.eqWorkStandAdmUpdate(Vo);
	}
	
	//교정내역 상세 Delete
	@Override
	public void equipCorrInfoDelete2(ToolCodeAdmVo Vo) throws Exception{
		dao.equipCorrInfoDelete2(Vo);
	}
	
	//작업조건 Delete
	@Override
	public void eqWorkStandAdmDelete(ToolCodeAdmVo Vo) throws Exception{
		dao.eqWorkStandAdmDelete(Vo);
	}
	
	//기타 Delete
	@Override
	public void equipEtcInfoDelete(ToolCodeAdmVo Vo) throws Exception{
		dao.equipEtcInfoDelete(Vo);
	}
	
	//부속품 Delete
	@Override
	public void partAdmDelete(ToolCodeAdmVo Vo) throws Exception{
		dao.partAdmDelete(Vo);
	}
	
	//기준서 Delete
	@Override
	public void equipCheckAdmDelete(ToolCodeAdmVo Vo) throws Exception{
		dao.equipCheckAdmDelete(Vo);
	}
	
	//일상점검 Delete
	@Override
	public void equipDailyCheckDelete(ToolCodeAdmVo Vo) throws Exception{
		dao.equipDailyCheckDelete(Vo);
	}
	
	// 시퀀스 조회
	@Override
	public String equipCodeSeq() throws Exception {
		return dao.equipCodeSeq();
	}
	
	// 기타 시퀀스 조회
	@Override
	public Integer etcSeq(ToolCodeAdmVo Vo) throws Exception{
		return dao.etcSeq(Vo);
	}
	
	//부속품 시퀀스 조회
	@Override
	public Integer partSeq(ToolCodeAdmVo Vo) throws Exception{
		return dao.partSeq(Vo);
	}
	
	//기준서 시퀀스 조회
	@Override
	public Integer checkSeq(ToolCodeAdmVo Vo) throws Exception{
		return dao.checkSeq(Vo);
	}
	
	//일상점검 시퀀스 조회
	@Override
	public Integer getCheckSeq(ToolCodeAdmVo Vo) throws Exception{
		return dao.getCheckSeq(Vo);
	}
	
	//교정내역 중복검사
	@Override
	public int overlapCorrRegDate(ToolCodeAdmVo Vo) throws Exception{
		return dao.overlapCorrRegDate(Vo);
	}
	
	//이니셜 중복검사 
	@Override
	public int overlapEquipInitial(ToolCodeAdmVo Vo) throws Exception{
		return dao.overlapEquipInitial(Vo);
	}
	
	//이미지 경로 조회
	@Override
	public ToolCodeAdmVo equipImgRead(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		return dao.equipImgRead(toolCodeAdmVo);
	}
	
	//이미지 등록
	@Override
	public void equipImageUpload(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		dao.equipImageUpload(toolCodeAdmVo);
	}
	
	//이미지 삭제
	@Override
	public void equipImageDelete(ToolCodeAdmVo toolCodeAdmVo) throws Exception{
		dao.equipImageDelete(toolCodeAdmVo);
	}
	
	// 모니터링 - 설비가동/비가동현황 ------------------------------------------------------
	
	//설비구분별 설비목록 조회
	@Override
	public List<ToolCodeAdmVo> equipGubunToList(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		return dao.equipGubunToList(toolCodeAdmVo);
	}
	
	//설비구분별 설비가동/비가동현황
	@Override
	public List<ToolCodeAdmVo> equipStateList(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		return dao.equipStateList(toolCodeAdmVo);
	}
	
	//이미지 내용 수정
	@Override
	public void equipImgUpdate(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		dao.equipImgUpdate(toolCodeAdmVo);
	}	
	
	//삭제
	@Override
	public void equipDataDelete(ToolCodeAdmVo toolCodeAdmVo) throws Exception{
		dao.equipDataDelete(toolCodeAdmVo);
	}
	
	//엑셀 Create
	@Override
	public void equipCodeExcelCreate(ToolCodeAdmVo Vo) throws Exception{
		dao.equipCodeExcelCreate(Vo);
	}
	
	//금형수명관리
	@Override
	public List<ToolCodeAdmVo> readMoldMonthListAll(ToolCodeAdmVo Vo) throws Exception{
		return dao.readMoldMonthListAll(Vo);
	}
	
	//설비관리번호 중복체크
	@Override
	public int equipNoCheck(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		return dao.equipNoCheck(toolCodeAdmVo);
	}
	
	
	//설비제원 리스트 조회
	@Override
	public List<ToolCodeAdmVo> equipDataList(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		return dao.equipDataList(toolCodeAdmVo);
	}
	
	//설비제원 데이터 생성
	@Override
	public void equipDataDtlCreate(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		dao.equipDataDtlCreate(toolCodeAdmVo);
	}
	
	//설비제원 데이터 삭제
	@Override
	public void equipDataDtlDelete(ToolCodeAdmVo toolCodeAdmVo) throws Exception {
		dao.equipDataDtlDelete(toolCodeAdmVo);
	}
	
	//철형품목정보관리 조회
	@Override
	public List<ToolCodeAdmVo> ironItemList(ToolCodeAdmVo toolCodeAdmVo) throws Exception{
		return dao.ironItemList(toolCodeAdmVo);
	}
	
	//철형품목정보관리 Create
	@Override
	public void ironItemCreate(ToolCodeAdmVo toolCodeAdmVo) throws Exception{
		dao.ironItemCreate(toolCodeAdmVo);
	}

	//철형품목정보관리 데이터 삭제
	@Override
	public void ironItemDelete(ToolCodeAdmVo toolCodeAdmVo) throws Exception{
		dao.ironItemDelete(toolCodeAdmVo);
	}
	
	//철형품목정보관리 데이터 전체삭제
	@Override
	public void ironItemDeleteAll(ToolCodeAdmVo toolCodeAdmVo) throws Exception{
		dao.ironItemDeleteAll(toolCodeAdmVo);
	}

		
}
