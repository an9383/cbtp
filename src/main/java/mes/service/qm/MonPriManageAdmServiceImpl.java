package mes.service.qm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import mes.domain.qm.MonPriManageAdmVo;
import mes.persistence.qm.MonPriManageAdmDAO;

@Service
public class MonPriManageAdmServiceImpl implements MonPriManageAdmService {

	@Inject
	private MonPriManageAdmDAO dao;
	
	//월 주요 중점 관리 사항 목록조회
	public List<MonPriManageAdmVo> monPriManageAdmList(MonPriManageAdmVo monPriManageAdmVo) throws Exception{
		return dao.monPriManageAdmList(monPriManageAdmVo);
	}
	
	//월 주요 중점 관리 사항 등록
	public int monPriManageAdmCreate(MonPriManageAdmVo monPriManageAdmVo) throws Exception{
		return dao.monPriManageAdmCreate(monPriManageAdmVo);
	}
	
	//월 주요 중점관리 번호 가져오기
	public String getMonPriNo(String date) throws Exception{
		return dao.getMonPriNo(date);
	}
	
	//월 주요 중점 관리 사항 삭제
	public int monPriManageAdmDelete(MonPriManageAdmVo monPriManageAdmVo) throws Exception{
		return dao.monPriManageAdmDelete(monPriManageAdmVo);
	}
}
