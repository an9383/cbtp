package mes.persistence.mm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.mm.OperationNoticeVo;

@Repository
public class OperationNoticeDAOImpl implements OperationNoticeDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.mm.operationNoticeMapper";
	
	// 목록조회
	@Override
	public List<OperationNoticeVo> list(OperationNoticeVo operationNoticeVo) throws Exception {
		return session.selectList(namespace+".list", operationNoticeVo);
	}
	
	// 상세조회
	@Override
	public OperationNoticeVo read(OperationNoticeVo operationNoticeVo) throws Exception {
		return session.selectOne(namespace+".read", operationNoticeVo);
	}
	
	// 등록
	@Override
	public String add(OperationNoticeVo operationNoticeVo) throws Exception {
		session.insert(namespace + ".add", operationNoticeVo);
		String idx = operationNoticeVo.getIdx();
    	return idx;
	}
	
	// 수정
	@Override
	public void edit(OperationNoticeVo operationNoticeVo) throws Exception {
		session.update(namespace+".edit", operationNoticeVo);
	}
	
	// 삭제
	@Override
	public void remove(OperationNoticeVo operationNoticeVo) throws Exception {
		session.delete(namespace+".remove", operationNoticeVo);
	}
}