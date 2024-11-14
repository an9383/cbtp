package mes.persistence.mt;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.mt.FinishOperInfoVo;

@Repository
public class FinishOperInfoDAOImpl implements FinishOperInfoDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.mt.finishOperInfoMapper";
	
	//목록 조회
	public List<FinishOperInfoVo> list(FinishOperInfoVo finishOperInfoVo) throws Exception{
		return session.selectList(namespace+".list",finishOperInfoVo);
	}
	
	//상세 조회
	public FinishOperInfoVo read(FinishOperInfoVo finishOperInfoVo) throws Exception{
		return session.selectOne(namespace+".read",finishOperInfoVo);
	}
		
	//등록
	public void create(FinishOperInfoVo finishOperInfoVo) throws Exception{
		session.insert(namespace+".create",finishOperInfoVo);
	}
	
	//수정
	public void update(FinishOperInfoVo finishOperInfoVo) throws Exception{
		session.update(namespace+".update",finishOperInfoVo);
	}
	
	//삭제
	public void delete(FinishOperInfoVo finishOperInfoVo) throws Exception{
		session.delete(namespace+".delete",finishOperInfoVo);
	}
	
	//목록 조회
	public List<FinishOperInfoVo> finishOperInfoEquipList(FinishOperInfoVo finishOperInfoVo) throws Exception{
		return session.selectList(namespace+".finishOperInfoEquipList",finishOperInfoVo);
	}
	
	//목록 조회
	public List<FinishOperInfoVo> finishOperInfoList(FinishOperInfoVo finishOperInfoVo) throws Exception{
		return session.selectList(namespace+".finishOperInfoList",finishOperInfoVo);
	}
	
	//목록 조회
	public List<FinishOperInfoVo> finishOperInfoDtlList(FinishOperInfoVo finishOperInfoVo) throws Exception{
		return session.selectList(namespace+".finishOperInfoDtlList",finishOperInfoVo);
	}
	
	//후가공 템프테이블 조회 
	public FinishOperInfoVo finishTempInfoList(FinishOperInfoVo finishOperInfoVo) throws Exception{
		return session.selectOne(namespace+".finishTempInfoList" ,finishOperInfoVo );
	}
	
}
