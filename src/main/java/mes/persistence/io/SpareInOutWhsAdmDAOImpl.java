package mes.persistence.io;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.io.SpareInOutWhsAdmVo;

@Repository
public class SpareInOutWhsAdmDAOImpl implements SpareInOutWhsAdmDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.io.spareInOutWhsAdmMapper";
	
	//스페어관리 조회
	public List<SpareInOutWhsAdmVo> spareItemInfoList(SpareInOutWhsAdmVo vo)throws Exception{
		return session.selectList(namespace+".spareItemInfoList" , vo);
	}
	
	//스페어관리 조회
	public List<SpareInOutWhsAdmVo> spareInOutWhsList(SpareInOutWhsAdmVo vo)throws Exception{
		return session.selectList(namespace+".spareInOutWhsList" , vo);
	}

	//스페어관리 등록
	public void spareInOutWhsCreate(SpareInOutWhsAdmVo vo)throws Exception{
		session.insert(namespace+".spareInOutWhsCreate" , vo);
	}

	//스페어관리 수정
	public void spareInOutWhsUpdate(SpareInOutWhsAdmVo vo)throws Exception{
		session.update(namespace+".spareInOutWhsUpdate" , vo);
	}

	//스페어관리 삭제
	public void spareInOutWhsDelete(SpareInOutWhsAdmVo vo)throws Exception{
		session.delete(namespace+".spareInOutWhsDelete" , vo);
	}

	//스페어관리 전표번호
	public String getSpaIoNo(SpareInOutWhsAdmVo vo)throws Exception{
		return session.selectOne(namespace+".getSpaIoNo" , vo);
	}

	//스페어관리 전표시퀀스
	public int getSpaIoSeq(SpareInOutWhsAdmVo vo)throws Exception{
		return session.selectOne(namespace+".getSpaIoSeq" , vo);
	}
	
	//스페어 현재고 가져오기
	public SpareInOutWhsAdmVo getTmQtyRead(SpareInOutWhsAdmVo vo)throws Exception{
		return session.selectOne(namespace+".getTmQtyRead" , vo);
	}
}
