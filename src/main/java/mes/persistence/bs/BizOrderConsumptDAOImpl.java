package mes.persistence.bs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bs.BizOrderAdmVo;
import mes.domain.bs.BizOrderConsumptVo;

@Repository
public class BizOrderConsumptDAOImpl implements BizOrderConsumptDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bs.bizOrderConsumptMapper";

	
	//소요량분석 목록조회
	public List<BizOrderConsumptVo> bizOrderConsumptList (BizOrderConsumptVo bizOrderConsumptVo)throws Exception{
		return session.selectList(namespace+".bizOrderConsumptList" ,bizOrderConsumptVo );
	}
	
	//소요량분석 상세조회
	public List<BizOrderConsumptVo> bizOrderConsumptRead (BizOrderConsumptVo bizOrderConsumptVo)throws Exception{
		return session.selectList(namespace+".bizOrderConsumptRead" , bizOrderConsumptVo);
	}
	
	//소요량분석 등록
	public void bizOrderConsumptCreate (BizOrderConsumptVo bizOrderConsumptVo)throws Exception{
		session.insert(namespace+".bizOrderConsumptCreate" ,bizOrderConsumptVo );
	}
	
	//소요량분석 수정
	public void bizOrderConsumptUpdate (BizOrderConsumptVo bizOrderConsumptVo)throws Exception{
		session.update(namespace+".bizOrderConsumptUpdate" ,bizOrderConsumptVo );
	}
	
	//소요량분석 삭제
	public void bizOrderConsumptDelete (BizOrderConsumptVo bizOrderConsumptVo)throws Exception{
		session.delete(namespace+".bizOrderConsumptDelete" ,bizOrderConsumptVo );
	}

}
