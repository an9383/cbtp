package mes.persistence.bm;

import java.util.List;

import mes.domain.bm.JajuInspectVo;

public interface JajuInspectDAO {
	
	//자주검사 리스트 조회
	public List<JajuInspectVo> jajuInspectList() throws Exception;
	
	//자주검사 상세 조회
	public JajuInspectVo jajuInspectRead(JajuInspectVo jajuInspectVo) throws Exception;
	
	//자주검사 관리항목 리스트 조회
	public List<JajuInspectVo> jajuInspectDtlRead(JajuInspectVo jajuInspectVo) throws Exception;
	
	//자주검사 등록
	public void jajuInspectCreate(JajuInspectVo jajuInspectVo) throws Exception;
	
	//자주검사 수정
	public void jajuInspectUpdate(JajuInspectVo jajuInspectVo) throws Exception;

	//자주검사 코드 값 가져오기
	public String getWorkCd() throws Exception;
	
	//자주검사 등록 시 등록된 소공정인지 확인
	public int checkPrcssCdCreate(JajuInspectVo jajuInspectVo) throws Exception;
	
	//자주검사 수정 시 등록된 소공정인지 확인
	public int checkPrcssCdUpdate(JajuInspectVo jajuInspectVo) throws Exception;
	
}
