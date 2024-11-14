package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.JajuInspectVo;
import mes.persistence.bm.JajuInspectDAO;

@Service
public class JajuInspectServiceImpl implements JajuInspectService {

	@Inject
	private JajuInspectDAO dao;
	
	//자주검사 리스트 조회
	@Override
	public List<JajuInspectVo> jajuInspectList() throws Exception {
		return dao.jajuInspectList();
	}
	
	//자주검사 상세 조회
	@Override
	public JajuInspectVo jajuInspectRead(JajuInspectVo jajuInspectVo) throws Exception {
		return dao.jajuInspectRead(jajuInspectVo);
	}
	
	//자주검사 관리항목 리스트 조회
	@Override
	public List<JajuInspectVo> jajuInspectDtlRead(JajuInspectVo jajuInspectVo) throws Exception {
		return dao.jajuInspectDtlRead(jajuInspectVo);
	}
	
	//자주검사 등록
	@Override
	public void jajuInspectCreate(JajuInspectVo jajuInspectVo) throws Exception {
		dao.jajuInspectCreate(jajuInspectVo);
	}
	
	//자주검사 수정
	@Override
	public void jajuInspectUpdate(JajuInspectVo jajuInspectVo) throws Exception {
		dao.jajuInspectUpdate(jajuInspectVo);
	}
	
	//자주검사 코드 값 가져오기
	@Override
	public String getWorkCd() throws Exception {
		return dao.getWorkCd();
	}
	
	//자주검사 등록 시 등록된 소공정인지 확인
	@Override
	public int checkPrcssCdCreate(JajuInspectVo jajuInspectVo) throws Exception {
		return dao.checkPrcssCdCreate(jajuInspectVo);
	}
	
	//자주검사 수정 시 등록된 소공정인지 확인
	@Override
	public int checkPrcssCdUpdate(JajuInspectVo jajuInspectVo) throws Exception {
		return dao.checkPrcssCdUpdate(jajuInspectVo);
	}
	
}