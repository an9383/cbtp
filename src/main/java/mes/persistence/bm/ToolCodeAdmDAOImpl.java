package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.ToolCodeAdmVo;

@Repository
public class ToolCodeAdmDAOImpl implements ToolCodeAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.toolCodeAdmMapper";
	
	//설비코드 전체조회
	@Override
	public List<ToolCodeAdmVo> equipCodeAdmList(ToolCodeAdmVo Vo) throws Exception{
		return session.selectList(namespace+".equipCodeAdmList",Vo);
	}

	//설비코드 특정 Read
	@Override
	public ToolCodeAdmVo equipCodeAdmRead(ToolCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace+".equipCodeAdmRead", Vo);
	}
	
	//설비재가동 이력 read
	@Override
	public ToolCodeAdmVo equipRestartInfoRead(ToolCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace + ".equipRestartInfoRead", Vo);
	}
	
	//작업조건 특정 Read
	@Override
	public ToolCodeAdmVo eqWorkStandAdmRead(ToolCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace+".eqWorkStandAdmRead", Vo);
	}
	
	//교정내역 전체조회
	@Override
	public List<ToolCodeAdmVo> equipCorrInfoList(ToolCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace+".equipCorrInfoList", Vo);
	}
	
	//기타 전체조회
	@Override
	public List<ToolCodeAdmVo> equipEtcInfoList(ToolCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace+".equipEtcInfoList", Vo);
	}
	
	//부속품 목록 조회
	@Override
	public List<ToolCodeAdmVo> equipPartAdmList(ToolCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace + ".equipPartAdmList", Vo);
	}
	
	//금형 SHOT 이력 목록 조회
	@Override
	public List<ToolCodeAdmVo> equipShotList(ToolCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace + ".equipShotList", Vo);
	}
	
	//금형 SHOT 이력 년 조회
	@Override
	public List<ToolCodeAdmVo> moldYearList(ToolCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace + ".moldYearList", Vo);
	}
	
	//금형 SHOT 이력 월 조회
	@Override
	public List<ToolCodeAdmVo> moldMonthList(ToolCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace + ".moldMonthList", Vo);
	}
	
	//금형 SHOT 이력 일 조회
	@Override
	public List<ToolCodeAdmVo> moldDayList(ToolCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace + ".moldDayList", Vo);
	}
	
	//기준서 목록 조회
	@Override
	public List<ToolCodeAdmVo> equipCheckAdmList(ToolCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace + ".equipCheckAdmList", Vo);
	}
	
	//설비재가동 이력 목록 조회
	@Override
	public List<ToolCodeAdmVo> equipRestartInfoList(ToolCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace + ".equipRestartInfoList", Vo);
	}
	
	//일상점검 목록 조회
	@Override
	public List<ToolCodeAdmVo> equipDailyCheckList(ToolCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace + ".equipDailyCheckList", Vo);
	}
	
	//부대설비 Update Delete
	@Override
	public void ancFacUpdateDelete(ToolCodeAdmVo Vo) throws Exception{
		session.update(namespace + ".ancFacUpdateDelete", Vo);
	}
	
	//설비코드 중복 체크
	@Override
	public int overlapEquipCd(ToolCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace+".overlapEquipCd", Vo);
	}
	
	//작업조건 중복 체크
	@Override
	public int eqWorkStandAdmCount(ToolCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace+".eqWorkStandAdmCount", Vo);
	}
	
	//작업조건 Create
	@Override
	public void eqWorkStandAdmCreate(ToolCodeAdmVo Vo) throws Exception{
		session.insert(namespace + ".eqWorkStandAdmCreate", Vo);
	}
	
	//설비코드 Create
	@Override
	public int equipCodeAdmCreate(ToolCodeAdmVo Vo) throws Exception{
		return session.insert(namespace+".equipCodeAdmCreate", Vo);
	}
	
	//교정내역 Create
	@Override
	public void equipCorrInfoCreate(ToolCodeAdmVo Vo) throws Exception{
		session.insert(namespace +".equipCorrInfoCreate",Vo);
	}
	
	//기타 Create
	@Override
	public void equipEtcInfoCreate(ToolCodeAdmVo Vo) throws Exception{
		session.insert(namespace +".equipEtcInfoCreate",Vo);
	}
	
	//부속품 Create
	@Override
	public void partAdmCreate(ToolCodeAdmVo Vo) throws Exception{
		session.insert(namespace +".partAdmCreate", Vo);
	}
	
	//기준서 Create
	@Override
	public void equipCheckAdmCreate(ToolCodeAdmVo Vo) throws Exception{
		session.insert(namespace + ".equipCheckAdmCreate", Vo);
	}
	
	//일상점검 Create
	@Override
	public void equipDailyCheckCreate(ToolCodeAdmVo Vo) throws Exception{
		session.insert(namespace + ".equipDailyCheckCreate", Vo);
	}
	
	//설비코드 Update
	@Override
	public int equipCodeAdmUpdate(ToolCodeAdmVo Vo) throws Exception{
		return session.update(namespace+".equipCodeAdmUpdate", Vo);
	}
	
	//교정내역 Delete
	@Override
	public void equipCorrInfoDelete(ToolCodeAdmVo Vo) throws Exception{
		session.delete(namespace +".equipCorrInfoDelete",Vo);
	}
	
	//작업조건 Update
	@Override
	public void eqWorkStandAdmUpdate(ToolCodeAdmVo Vo) throws Exception{
		session.update(namespace + ".eqWorkStandAdmUpdate", Vo);
	}
	
	//교정내역 상세 Delete
	@Override
	public void equipCorrInfoDelete2(ToolCodeAdmVo Vo) throws Exception{
		session.delete(namespace+".equipCorrInfoDelete2" ,Vo);
	}
	
	//작업조건 Delete
	@Override
	public void eqWorkStandAdmDelete(ToolCodeAdmVo Vo) throws Exception{
		session.delete(namespace + ".eqWorkStandAdmDelete", Vo);
	}
	
	//기타 Delete
	@Override
	public void equipEtcInfoDelete(ToolCodeAdmVo Vo) throws Exception{
		session.delete(namespace +".equipEtcInfoDelete",Vo);
	}
	
	//부속품 Delete
	@Override
	public void partAdmDelete(ToolCodeAdmVo Vo) throws Exception{
		session.delete(namespace + ".partAdmDelete", Vo);
	}
	
	//기준서 Delete
	@Override
	public void equipCheckAdmDelete(ToolCodeAdmVo Vo) throws Exception{
		session.delete(namespace + ".equipCheckAdmDelete", Vo);
	}
	
	//일상점검 Delete
	@Override
	public void equipDailyCheckDelete(ToolCodeAdmVo Vo) throws Exception{
		session.delete(namespace + ".equipDailyCheckDelete", Vo);
	}

	// 시퀀스 조회
	@Override
	public String equipCodeSeq() throws Exception {
		return session.selectOne(namespace + ".equipCodeSeq");
	}
	
	// 기타 시퀀스 조회
	@Override
	public Integer etcSeq(ToolCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace + ".etcSeq", Vo);
	}
	
	//부속품 시퀀스 조회
	@Override
	public Integer partSeq(ToolCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace + ".partSeq", Vo);
	}
	
	//기준서 시퀀스 조회
	@Override
	public Integer checkSeq(ToolCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace + ".checkSeq", Vo);
	}
	
	//일상점검 시퀀스 조회
	@Override
	public Integer getCheckSeq(ToolCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace + ".getCheckSeq", Vo);
	}
	
	//교정내역 중복검사
	@Override
	public int overlapCorrRegDate(ToolCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace +".overlapCorrRegDate",Vo);
	}
	
	//이니셜 중복검사 
	@Override
	public int overlapEquipInitial(ToolCodeAdmVo Vo) throws Exception{
		return session.selectOne(namespace+".overlapEquipInitial" , Vo);
	}
	
	// 이미지 경로 조회
	@Override
	public ToolCodeAdmVo equipImgRead(ToolCodeAdmVo Vo) throws Exception {
		return session.selectOne(namespace + ".equipImgRead", Vo);
	}
	
	//이미지 등록
	@Override
	public void equipImageUpload(ToolCodeAdmVo Vo) throws Exception {
		session.update(namespace+".equipImageUpload", Vo);
	}
	
	//이미지 삭제
	@Override
	public void equipImageDelete(ToolCodeAdmVo Vo) throws Exception{
		session.delete(namespace + ".equipImageDelete" ,Vo);
	}
	
	// 모니터링 - 설비가동/비가동현황 ------------------------------------------------------
	
	//설비구분별 설비목록 조회
	@Override
	public List<ToolCodeAdmVo> equipGubunToList(ToolCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace+".equipGubunToList", Vo);
	}
	
	//설비구분별 설비가동/비가동현황
	@Override
	public List<ToolCodeAdmVo> equipStateList(ToolCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace+".equipStateList", Vo);
	}
	
	//이미지 내용 수정
	@Override
	public void equipImgUpdate(ToolCodeAdmVo Vo) throws Exception{
		session.update(namespace+".equipImgUpdate", Vo);
	}
	
	//삭제
	@Override
	public void equipDataDelete(ToolCodeAdmVo Vo) throws Exception{
		session.delete(namespace + ".equipDataDelete" ,Vo);
	}
	
	//엑셀 Create
	@Override
	public void equipCodeExcelCreate(ToolCodeAdmVo Vo) throws Exception{
		session.insert(namespace +".equipCodeExcelCreate",Vo);
	}
	
	//금형수명관리
	@Override
	public List<ToolCodeAdmVo> readMoldMonthListAll(ToolCodeAdmVo Vo) throws Exception{
		return session.selectList(namespace +".readMoldMonthListAll",Vo);
	}
	
	//설비관리번호 중복체크
	@Override
	public int equipNoCheck(ToolCodeAdmVo Vo) throws Exception {
		return session.selectOne(namespace +".equipNoCheck",Vo);
	}
	
	//설비제원 리스트 조회
	@Override
	public List<ToolCodeAdmVo> equipDataList(ToolCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace +".equipDataList",Vo);
	}
	
	//설비제원 데이터 생성
	@Override
	public void equipDataDtlCreate(ToolCodeAdmVo Vo) throws Exception {
		session.insert(namespace +".equipDataDtlCreate",Vo);
	}
	
	//설비제원 데이터 삭제
	@Override
	public void equipDataDtlDelete(ToolCodeAdmVo Vo) throws Exception {
		session.delete(namespace +".equipDataDtlDelete",Vo);
	}
	
	//철형품목정보관리 조회
	@Override
	public List<ToolCodeAdmVo> ironItemList(ToolCodeAdmVo Vo) throws Exception{
		return session.selectList(namespace+".ironItemList" , 	Vo);
	}
	
	//철형품목정보관리 Create
	@Override
	public void ironItemCreate(ToolCodeAdmVo Vo) throws Exception{
		session.insert(namespace+".ironItemCreate" , 	Vo);
	}
		
	//철형품목정보관리 데이터 삭제
	@Override
	public void ironItemDelete(ToolCodeAdmVo Vo) throws Exception{
		session.delete(namespace+".ironItemDelete" , 	Vo);
	}
	
	//철형품목정보관리 데이터 전체삭제
	@Override
	public void ironItemDeleteAll(ToolCodeAdmVo Vo) throws Exception{
		session.delete(namespace+".ironItemDeleteAll" , 	Vo);
	}
	
	
}