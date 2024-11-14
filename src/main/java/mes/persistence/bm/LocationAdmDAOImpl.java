package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.BaseInfoAdmVo;
import mes.domain.bm.LocationAdmVo;

@Repository
public class LocationAdmDAOImpl implements LocationAdmDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.locationAdmMapper";
	

	//창고정보관리 목록 조회
	@Override
	public List<LocationAdmVo> locationAdmList(LocationAdmVo locationAdmVo) throws Exception {
		return session.selectList(namespace+".locationAdmList",locationAdmVo);
	}
	
	// 창고정보관리 목록 조회
	public List<LocationAdmVo> locationAdmList2(LocationAdmVo locationAdmVo) throws Exception{
		return session.selectList(namespace+".locationAdmList2" ,locationAdmVo );
	}

	//창고정보관리 상세 조회
	@Override
	public List<LocationAdmVo> locationAdmRead(LocationAdmVo locationAdmVo) throws Exception {
		return session.selectList(namespace+".locationAdmRead", locationAdmVo);
	}

	//창고정보관리 등록
	@Override
	public void locationAdmCreate(LocationAdmVo locationAdmVo) throws Exception {
		session.insert(namespace+".locationAdmCreate", locationAdmVo);
	}

	//창고정보관리 수정
	@Override
	public void locationAdmUpdate(LocationAdmVo locationAdmVo) throws Exception {
		session.update(namespace+".locationAdmUpdate", locationAdmVo);
	}

	
	//바코드번호 시퀀스 조회
	public String locNoSeq(String date) throws Exception{
		return session.selectOne(namespace+".locNoSeq",date);
	}
	
	//삭제
	@Override
	public void locationAdmDelete(LocationAdmVo locationAdmVo) throws Exception {
		session.delete(namespace+".locationAdmDelete", locationAdmVo);
	}
}
