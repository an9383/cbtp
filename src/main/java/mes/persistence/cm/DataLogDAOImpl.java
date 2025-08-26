package mes.persistence.cm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.cm.DataLogVo;

@Repository
public class DataLogDAOImpl implements DataLogDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.cm.dataLogMapper";
	
	//월별 입력 건수
	public List<DataLogVo> count(DataLogVo dataLogVo) throws Exception{
		return session.selectList(namespace+".count",dataLogVo);
	}
	
	//테이블 Size(KB)
	public DataLogVo size(DataLogVo dataLogVo) throws Exception{
		return session.selectOne(namespace+".size",dataLogVo);
	}
	
	//idx
	public DataLogVo idx(DataLogVo dataLogVo) throws Exception{
		return session.selectOne(namespace+".idx",dataLogVo);
	}
	
	//create
	public void create(DataLogVo dataLogVo) throws Exception{
		session.insert(namespace+".create",dataLogVo);
	}
	
	//read
	public DataLogVo read(DataLogVo dataLogVo) throws Exception{
		return session.selectOne(namespace+".read",dataLogVo);
	}
	
	//delete
	public void delete(DataLogVo dataLogVo) throws Exception{
		session.delete(namespace+".delete",dataLogVo);
	}

	//all
	public List<DataLogVo> all(DataLogVo dataLogVo) throws Exception{
		return session.selectList(namespace+"all",dataLogVo);
	}

}
