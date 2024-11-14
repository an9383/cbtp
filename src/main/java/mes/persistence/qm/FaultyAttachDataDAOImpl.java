package mes.persistence.qm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.qm.FaultyAttachDataVo;

@Repository
public class FaultyAttachDataDAOImpl implements FaultyAttachDataDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.qm.faultyAttachDataMapper";
	
	//부적합관리 관련자료 상세조회
	public List<FaultyAttachDataVo> faultyAttachDataRead(FaultyAttachDataVo faultyAttachDataVo)throws Exception{
		return session.selectList(namespace+".faultyAttachDataRead" , faultyAttachDataVo);
	}
	
	//부적합관리 관련자료 등록
	public void faultyAttachDataCreate(FaultyAttachDataVo faultyAttachDataVo)throws Exception{
		session.insert(namespace+".faultyAttachDataCreate" , faultyAttachDataVo);
	}
	
	//부적합관리 관련자료 수정
	public void faultyAttachDataUpdate(FaultyAttachDataVo faultyAttachDataVo)throws Exception{
		session.update(namespace+".faultyAttachDataUpdate" , faultyAttachDataVo);
	}
	
	//부적합관리 관련자료 삭제
	public void faultyAttachDataDelete(FaultyAttachDataVo faultyAttachDataVo)throws Exception{
		session.delete(namespace+".faultyAttachDataDelete" , faultyAttachDataVo);
	}
	
	//부적합관리 관련자료 시퀀스
	public String getAttachSeq(String date)throws Exception{
		return session.selectOne(namespace+".getAttachSeq" , date);
	}
	
	//부적합관리 관련자료 파일명
	public String getAttachFn(FaultyAttachDataVo faultyAttachDataVo)throws Exception{
		return session.selectOne(namespace+".getAttachFn",faultyAttachDataVo);
	}
}
