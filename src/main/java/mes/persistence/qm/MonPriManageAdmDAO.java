package mes.persistence.qm;

import java.util.List;

import mes.domain.qm.MonPriManageAdmVo;

public interface MonPriManageAdmDAO {

	//월 주요 중점 관리 사항 목록조회
	public List<MonPriManageAdmVo> monPriManageAdmList(MonPriManageAdmVo monPriManageAdmVo) throws Exception;
	
	//월 주요 중점 관리 사항 등록
	public int monPriManageAdmCreate(MonPriManageAdmVo monPriManageAdmVo) throws Exception;
	
	//월 주요 중점관리 번호 가져오기
	public String getMonPriNo(String date) throws Exception;
	
	//월 주요 중점 관리 사항 삭제
	public int monPriManageAdmDelete(MonPriManageAdmVo monPriManageAdmVo) throws Exception;
}
