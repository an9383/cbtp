package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.bm.MoldAdmVo;

@Repository
public class MoldAdmDAOImpl implements MoldAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "mes.mappers.bm.moldAdmMapper";

	//금형관리 목록조회
	@Override
	public List<MoldAdmVo> listAll(MoldAdmVo moldAdmVo) throws Exception{
		return session.selectList(namespace + ".listAll",moldAdmVo);
	}

	//금형관리 상세조회
	@Override
	public MoldAdmVo read(MoldAdmVo moldAdmVo) throws Exception{
		return session.selectOne(namespace + ".read",moldAdmVo);
	}
	
	//금형관리 수정
	@Override
	public void update(MoldAdmVo moldAdmVo) throws Exception{
		session.update(namespace + ".update",moldAdmVo);
	}
	
	//금형관리 등록
	@Override
	public void create(MoldAdmVo moldAdmVo) throws Exception{
		session.insert(namespace + ".create",moldAdmVo);
	}
	
	//시퀀스 조회
	@Override
	public String moldCdSeq() throws Exception {
		return session.selectOne(namespace + ".moldCdSeq");
	}
	
	//이미지 경로 조회
	@Override
	public MoldAdmVo moldImgRead(MoldAdmVo moldAdmVo) throws Exception {
		return session.selectOne(namespace + ".moldImgRead", moldAdmVo);
	}
	
	//이미지 등록
	@Override
	public void moldImageUpload(MoldAdmVo moldAdmVo) throws Exception {
		session.update(namespace+".moldImageUpload", moldAdmVo);
	}
	
}
