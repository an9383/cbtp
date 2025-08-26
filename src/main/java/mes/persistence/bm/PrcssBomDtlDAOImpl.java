package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.PrcssBomDtlVo;
import mes.domain.bm.PrcssCodeAdmVo;


@Repository
public class PrcssBomDtlDAOImpl implements PrcssBomDtlDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.prcssBomDtlMapper";
		
	//BOM관리 목록조회
	@Override
	public List<PrcssBomDtlVo> listAll() throws Exception{
		return session.selectList(namespace+".listAll");
	}
	
	//BOM관리 상세조회
	@Override
	public PrcssBomDtlVo read(PrcssBomDtlVo prcssBomDtlVo) throws Exception{
		return session.selectOne(namespace+".read",prcssBomDtlVo);
	}
	//BOM관리 상세조회2
	@Override
	public List<PrcssBomDtlVo> BomDtlView(PrcssBomDtlVo prcssBomDtlVo) throws Exception{
		return session.selectList(namespace+".BomDtlView",prcssBomDtlVo);
	}
	
	//BOM관리 등록
	@Override
	public void create(PrcssBomDtlVo prcssBomDtlVo) throws Exception{
		session.insert(namespace + ".create", prcssBomDtlVo);
	}
	
	//BOM관리 수정
	@Override
	public void update(PrcssBomDtlVo prcssBomDtlVo) throws Exception{
		session.update(namespace + ".update", prcssBomDtlVo);
	}

	//BomCd 생성
	@Override
	public String selectBomCdCreate() throws Exception{
		return session.selectOne(namespace+".selectBomCdCreate");
	}
	
	//BOM관리 삭제
	@Override
	public void delete(PrcssBomDtlVo prcssBomDtlVo) throws Exception{
		session.delete(namespace + ".delete", prcssBomDtlVo);
	}
	
}