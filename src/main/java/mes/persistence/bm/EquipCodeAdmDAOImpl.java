package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.EquipCodeAdmVo;

@Repository
public class EquipCodeAdmDAOImpl implements EquipCodeAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.equipCodeAdmMapper";
	
	//설비코드 전체조회
	@Override
	public List<EquipCodeAdmVo> equipCodeAdmList(EquipCodeAdmVo Vo) throws Exception{
		return session.selectList(namespace+".equipCodeAdmList",Vo);
	}

	//설비코드 특정 Read
	@Override
	public EquipCodeAdmVo equipCodeAdmRead(EquipCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace+".equipCodeAdmRead", Vo);
	}
	
	//설비재가동 이력 read
	@Override
	public EquipCodeAdmVo equipRestartInfoRead(EquipCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace + ".equipRestartInfoRead", Vo);
	}
	
	//작업조건 특정 Read
	@Override
	public EquipCodeAdmVo eqWorkStandAdmRead(EquipCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace+".eqWorkStandAdmRead", Vo);
	}
	
	//교정내역 전체조회
	@Override
	public List<EquipCodeAdmVo> equipCorrInfoList(EquipCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace+".equipCorrInfoList", Vo);
	}
	
	//기타 전체조회
	@Override
	public List<EquipCodeAdmVo> equipEtcInfoList(EquipCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace+".equipEtcInfoList", Vo);
	}
	
	//부속품 목록 조회
	@Override
	public List<EquipCodeAdmVo> equipPartAdmList(EquipCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace + ".equipPartAdmList", Vo);
	}
	
	//금형 SHOT 이력 목록 조회
	@Override
	public List<EquipCodeAdmVo> equipShotList(EquipCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace + ".equipShotList", Vo);
	}
	
	//금형 SHOT 이력 년 조회
	@Override
	public List<EquipCodeAdmVo> moldYearList(EquipCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace + ".moldYearList", Vo);
	}
	
	//금형 SHOT 이력 월 조회
	@Override
	public List<EquipCodeAdmVo> moldMonthList(EquipCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace + ".moldMonthList", Vo);
	}
	
	//금형 SHOT 이력 일 조회
	@Override
	public List<EquipCodeAdmVo> moldDayList(EquipCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace + ".moldDayList", Vo);
	}
	
	//기준서 목록 조회
	@Override
	public List<EquipCodeAdmVo> equipCheckAdmList(EquipCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace + ".equipCheckAdmList", Vo);
	}
	
	//설비재가동 이력 목록 조회
	@Override
	public List<EquipCodeAdmVo> equipRestartInfoList(EquipCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace + ".equipRestartInfoList", Vo);
	}
	
	//일상점검 목록 조회
	@Override
	public List<EquipCodeAdmVo> equipDailyCheckList(EquipCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace + ".equipDailyCheckList", Vo);
	}
	
	//부대설비 Update Delete
	@Override
	public void ancFacUpdateDelete(EquipCodeAdmVo Vo) throws Exception{
		session.update(namespace + ".ancFacUpdateDelete", Vo);
	}
	
	//설비코드 중복 체크
	@Override
	public int overlapEquipCd(EquipCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace+".overlapEquipCd", Vo);
	}
	
	//작업조건 중복 체크
	@Override
	public int eqWorkStandAdmCount(EquipCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace+".eqWorkStandAdmCount", Vo);
	}
	
	//작업조건 Create
	@Override
	public void eqWorkStandAdmCreate(EquipCodeAdmVo Vo) throws Exception{
		session.insert(namespace + ".eqWorkStandAdmCreate", Vo);
	}
	
	//설비코드 Create
	@Override
	public int equipCodeAdmCreate(EquipCodeAdmVo Vo) throws Exception{
		return session.insert(namespace+".equipCodeAdmCreate", Vo);
	}
	
	//교정내역 Create
	@Override
	public void equipCorrInfoCreate(EquipCodeAdmVo Vo) throws Exception{
		session.insert(namespace +".equipCorrInfoCreate",Vo);
	}
	
	//기타 Create
	@Override
	public void equipEtcInfoCreate(EquipCodeAdmVo Vo) throws Exception{
		session.insert(namespace +".equipEtcInfoCreate",Vo);
	}
	
	//부속품 Create
	@Override
	public void partAdmCreate(EquipCodeAdmVo Vo) throws Exception{
		session.insert(namespace +".partAdmCreate", Vo);
	}
	
	//기준서 Create
	@Override
	public void equipCheckAdmCreate(EquipCodeAdmVo Vo) throws Exception{
		session.insert(namespace + ".equipCheckAdmCreate", Vo);
	}
	
	//일상점검 Create
	@Override
	public void equipDailyCheckCreate(EquipCodeAdmVo Vo) throws Exception{
		session.insert(namespace + ".equipDailyCheckCreate", Vo);
	}
	
	//설비코드 Update
	@Override
	public int equipCodeAdmUpdate(EquipCodeAdmVo Vo) throws Exception{
		return session.update(namespace+".equipCodeAdmUpdate", Vo);
	}
	
	//교정내역 Delete
	@Override
	public void equipCorrInfoDelete(EquipCodeAdmVo Vo) throws Exception{
		session.delete(namespace +".equipCorrInfoDelete",Vo);
	}
	
	//작업조건 Update
	@Override
	public void eqWorkStandAdmUpdate(EquipCodeAdmVo Vo) throws Exception{
		session.update(namespace + ".eqWorkStandAdmUpdate", Vo);
	}
	
	//교정내역 상세 Delete
	@Override
	public void equipCorrInfoDelete2(EquipCodeAdmVo Vo) throws Exception{
		session.delete(namespace+".equipCorrInfoDelete2" ,Vo);
	}
	
	//작업조건 Delete
	@Override
	public void eqWorkStandAdmDelete(EquipCodeAdmVo Vo) throws Exception{
		session.delete(namespace + ".eqWorkStandAdmDelete", Vo);
	}
	
	//기타 Delete
	@Override
	public void equipEtcInfoDelete(EquipCodeAdmVo Vo) throws Exception{
		session.delete(namespace +".equipEtcInfoDelete",Vo);
	}
	
	//부속품 Delete
	@Override
	public void partAdmDelete(EquipCodeAdmVo Vo) throws Exception{
		session.delete(namespace + ".partAdmDelete", Vo);
	}
	
	//기준서 Delete
	@Override
	public void equipCheckAdmDelete(EquipCodeAdmVo Vo) throws Exception{
		session.delete(namespace + ".equipCheckAdmDelete", Vo);
	}
	
	//일상점검 Delete
	@Override
	public void equipDailyCheckDelete(EquipCodeAdmVo Vo) throws Exception{
		session.delete(namespace + ".equipDailyCheckDelete", Vo);
	}

	// 시퀀스 조회
	@Override
	public String equipCodeSeq() throws Exception {
		return session.selectOne(namespace + ".equipCodeSeq");
	}
	
	// 기타 시퀀스 조회
	@Override
	public Integer etcSeq(EquipCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace + ".etcSeq", Vo);
	}
	
	//부속품 시퀀스 조회
	@Override
	public Integer partSeq(EquipCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace + ".partSeq", Vo);
	}
	
	//기준서 시퀀스 조회
	@Override
	public Integer checkSeq(EquipCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace + ".checkSeq", Vo);
	}
	
	//일상점검 시퀀스 조회
	@Override
	public Integer getCheckSeq(EquipCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace + ".getCheckSeq", Vo);
	}
	
	//교정내역 중복검사
	@Override
	public int overlapCorrRegDate(EquipCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace +".overlapCorrRegDate",Vo);
	}
	
	//이니셜 중복검사 
	@Override
	public int overlapEquipInitial(EquipCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace+".overlapEquipInitial" , Vo);
	}
	
	// 이미지 경로 조회
	@Override
	public EquipCodeAdmVo equipImgRead(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		return session.selectOne(namespace + ".equipImgRead", equipCodeAdmVo);
	}
	
	//이미지 등록
	@Override
	public void equipImageUpload(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		session.update(namespace+".equipImageUpload", equipCodeAdmVo);
	}
	
	//이미지 삭제
	@Override
	public void equipImageDelete(EquipCodeAdmVo equipCodeAdmVo) throws Exception{
		session.delete(namespace + ".equipImageDelete" ,equipCodeAdmVo);
	}
	
	// 모니터링 - 설비가동/비가동현황 ------------------------------------------------------
	
	//설비구분별 설비목록 조회
	@Override
	public List<EquipCodeAdmVo> equipGubunToList(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		return session.selectList(namespace+".equipGubunToList", equipCodeAdmVo);
	}
	
	//설비구분별 설비가동/비가동현황
	@Override
	public List<EquipCodeAdmVo> equipStateList(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		return session.selectList(namespace+".equipStateList", equipCodeAdmVo);
	}
	
	//이미지 내용 수정
	@Override
	public void equipImgUpdate(EquipCodeAdmVo equipCodeAdmVo) throws Exception{
		session.update(namespace+".equipImgUpdate", equipCodeAdmVo);
	}
	
	//삭제
	@Override
	public void equipDataDelete(EquipCodeAdmVo equipCodeAdmVo) throws Exception{
		session.delete(namespace + ".equipDataDelete" ,equipCodeAdmVo);
	}
	
	//엑셀 Create
	@Override
	public void equipCodeExcelCreate(EquipCodeAdmVo Vo) throws Exception{
		session.insert(namespace +".equipCodeExcelCreate",Vo);
	}
	
	//금형수명관리
	@Override
	public List<EquipCodeAdmVo> readMoldMonthListAll(EquipCodeAdmVo Vo) throws Exception{
		return session.selectList(namespace +".readMoldMonthListAll",Vo);
	}
	
	//설비관리번호 중복체크
	@Override
	public int equipNoCheck(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		return session.selectOne(namespace +".equipNoCheck",equipCodeAdmVo);
	}
	
	//설비제원 리스트 조회
	@Override
	public List<EquipCodeAdmVo> equipDataList(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		return session.selectList(namespace +".equipDataList",equipCodeAdmVo);
	}
	
	//설비제원 데이터 생성
	@Override
	public void equipDataDtlCreate(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		session.insert(namespace +".equipDataDtlCreate",equipCodeAdmVo);
	}
	
	//설비제원 데이터 삭제
	@Override
	public void equipDataDtlDelete(EquipCodeAdmVo equipCodeAdmVo) throws Exception {
		session.delete(namespace +".equipDataDtlDelete",equipCodeAdmVo);
	}
	
	//철형품목정보관리 조회
	@Override
	public List<EquipCodeAdmVo> ironItemList(EquipCodeAdmVo equipCodeAdmVo) throws Exception{
		return session.selectList(namespace+".ironItemList" , 	equipCodeAdmVo);
	}
	
	//철형품목정보관리 Create
	@Override
	public void ironItemCreate(EquipCodeAdmVo equipCodeAdmVo) throws Exception{
		session.insert(namespace+".ironItemCreate" , 	equipCodeAdmVo);
	}
		
	//철형품목정보관리 데이터 삭제
	@Override
	public void ironItemDelete(EquipCodeAdmVo equipCodeAdmVo) throws Exception{
		session.delete(namespace+".ironItemDelete" , 	equipCodeAdmVo);
	}
	
	//철형품목정보관리 데이터 전체삭제
	@Override
	public void ironItemDeleteAll(EquipCodeAdmVo equipCodeAdmVo) throws Exception{
		session.delete(namespace+".ironItemDeleteAll" , 	equipCodeAdmVo);
	}
	
	
}