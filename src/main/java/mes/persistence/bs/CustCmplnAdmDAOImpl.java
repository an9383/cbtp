package mes.persistence.bs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bs.CustCmplnAdmVo;


@Repository
public class CustCmplnAdmDAOImpl implements CustCmplnAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bs.custCmplnAdmMapper";
		
	//고객불만 목록조회
	@Override
	public List<CustCmplnAdmVo> custCmplnAdmList(CustCmplnAdmVo custCmplnAdmVo) throws Exception{
		return session.selectList(namespace+".custCmplnAdmList", custCmplnAdmVo);
	}
	
	//고객불만 상세조회
	@Override
	public CustCmplnAdmVo custCmplnAdmRead(CustCmplnAdmVo custCmplnAdmVo) throws Exception{
		return session.selectOne(namespace+".custCmplnAdmRead",custCmplnAdmVo);
	}
	
	//고객불만 등록
	@Override
	public void custCmplnAdmCreate(CustCmplnAdmVo custCmplnAdmVo) throws Exception{
		session.insert(namespace + ".custCmplnAdmCreate", custCmplnAdmVo);
	}

	//고객불만 수정
	@Override
	public void custCmplnAdmUpdate(CustCmplnAdmVo custCmplnAdmVo) throws Exception{
		session.update(namespace + ".custCmplnAdmUpdate", custCmplnAdmVo);
	}

	//고객불만 파일명  가져오기
	public CustCmplnAdmVo getInspectFileNm(CustCmplnAdmVo custCmplnAdmVo) throws Exception{
		return session.selectOne(namespace+".getInspectFileNm",custCmplnAdmVo);
	}
	
	//고객불만 파일 삭제
	@Override
	public void custCmplnAdmDelete(CustCmplnAdmVo custCmplnAdmVo) throws Exception{
		session.update(namespace + ".custCmplnAdmDelete",custCmplnAdmVo);
	}
	
	//고객불만 재발방지 파일 삭제
	@Override
	public void custCmplnAdmDelete2(CustCmplnAdmVo custCmplnAdmVo) throws Exception{
		session.update(namespace + ".custCmplnAdmDelete2",custCmplnAdmVo);
	}
	
	//고객불만 시퀀스 조회
	public String locNoSeq(String date) throws Exception{
		return session.selectOne(namespace+".locNoSeq",date);
	}

}