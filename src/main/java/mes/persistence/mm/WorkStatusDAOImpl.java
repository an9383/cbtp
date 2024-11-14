package mes.persistence.mm;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.mm.WorkStatusVo;

@Repository
public class WorkStatusDAOImpl implements WorkStatusDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.mm.workStatusMapper";
	
	// 조회
	@Override
	public WorkStatusVo read(WorkStatusVo workStatusVo) throws Exception {
		return session.selectOne(namespace+".read", workStatusVo);
	}
	
	// 등록
	@Override
	public void add(WorkStatusVo workStatusVo) throws Exception {
		session.insert(namespace+".add", workStatusVo);
	}
	
	// 수정
	@Override
	public void edit(WorkStatusVo workStatusVo) throws Exception {
		session.update(namespace+".edit", workStatusVo);
	}
}