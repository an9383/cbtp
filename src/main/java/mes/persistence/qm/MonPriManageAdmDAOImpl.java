package mes.persistence.qm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.qm.MonPriManageAdmVo;

@Repository
public class MonPriManageAdmDAOImpl implements MonPriManageAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.qm.monPriManageAdmMapper";
	
	//월 주요 중점 관리 사항 목록조회
	public List<MonPriManageAdmVo> monPriManageAdmList(MonPriManageAdmVo monPriManageAdmVo) throws Exception{
		return session.selectList(namespace+".monPriManageAdmList",monPriManageAdmVo);
	}
	
	//월 주요 중점 관리 사항 등록
	public int monPriManageAdmCreate(MonPriManageAdmVo monPriManageAdmVo) throws Exception{
		return session.insert(namespace+".monPriManageAdmCreate" , monPriManageAdmVo);
	}
	
	//월 주요 중점관리 번호 가져오기
	public String getMonPriNo(String date) throws Exception{
		return session.selectOne(namespace+".getMonPriNo" ,date );
	}
	
	//월 주요 중점 관리 사항 삭제
	public int monPriManageAdmDelete(MonPriManageAdmVo monPriManageAdmVo) throws Exception{
		return session.delete(namespace+".monPriManageAdmDelete" ,monPriManageAdmVo );
	}
}
