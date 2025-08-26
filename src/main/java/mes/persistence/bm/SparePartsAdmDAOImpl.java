package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.SparePartsAdmVo;

@Repository
public class SparePartsAdmDAOImpl implements SparePartsAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.sparePartsAdmMapper";
	
	//예비품 전체조회
	public List<SparePartsAdmVo>sparePartsAdmList() throws Exception{
		return session.selectList(namespace+".sparePartsAdmList");
	}

	//예비품 특정 Read
	public SparePartsAdmVo sparePartsAdmRead(SparePartsAdmVo sparePartsAdmVo) throws Exception{
		return session.selectOne(namespace+".sparePartsAdmRead", sparePartsAdmVo);
	}
	
	//예비품 Create
	public void sparePartsAdmCreate(SparePartsAdmVo sparePartsAdmVo) throws Exception{
		session.insert(namespace+".sparePartsAdmCreate", sparePartsAdmVo);
	}
	
	//예비품 Update
	public void sparePartsAdmUpdate(SparePartsAdmVo sparePartsAdmVo) throws Exception{
		session.update(namespace+".sparePartsAdmUpdate", sparePartsAdmVo);
	}
	
	//예비품 시퀀스
	public String getSpCd() throws Exception{
		return session.selectOne(namespace + ".getSpCd");
	}
	
	//예비품 이미지 경로 조회
	public SparePartsAdmVo sparePartsImgRead(SparePartsAdmVo sparePartsAdmVo) throws Exception{
		return session.selectOne(namespace + ".sparePartsImgRead", sparePartsAdmVo);
	}
	
	//이미지 등록
	public void sparePartsImageUpload(SparePartsAdmVo sparePartsAdmVo) throws Exception{
		session.update(namespace+".sparePartsImageUpload", sparePartsAdmVo);
	}
	
	//이미지 삭제
	public void sparePartsImageDelete(SparePartsAdmVo sparePartsAdmVo) throws Exception{
		session.delete(namespace + ".sparePartsImageDelete" , sparePartsAdmVo);
	}
}
