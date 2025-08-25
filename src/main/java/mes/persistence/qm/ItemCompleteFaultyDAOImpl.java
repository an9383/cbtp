package mes.persistence.qm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.qm.ItemCompleteAdmVo;

@Repository
public class ItemCompleteFaultyDAOImpl implements ItemCompleteFaultyDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.qm.itemCompleteFaultyMapper";
	
	// 완제품관리(부적합) master list
	public List<ItemCompleteAdmVo> itemCompleteAdmMasterList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectList(namespace+".itemCompleteAdmMasterList" , itemCompleteAdmVo);
	}
	
	// 완제품관리(부적합) 목록조회
	public List<ItemCompleteAdmVo> itemCompleteAdmDetailList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectList(namespace+".itemCompleteAdmDetailList" , itemCompleteAdmVo);
	}
	
	// 완제품관리(부적합) 목록조회
	@Override
	public List<ItemCompleteAdmVo> listAll(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectList(namespace + ".listAll",itemCompleteAdmVo);
	}
	
	// 완제품관리(부적합) 상세조회
	@Override
	public ItemCompleteAdmVo read(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectOne(namespace + ".read",itemCompleteAdmVo);
	}
	
	// 완제품관리(부적합) 이미지리스트
	@Override
	public ItemCompleteAdmVo itemCompleteFaultyImageList(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		return session.selectOne(namespace + ".itemCompleteFaultyImageList",itemCompleteAdmVo);
	}
	
	// 완제품관리(부적합)생성
	@Override
	public void create(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		session.insert(namespace + ".create",itemCompleteAdmVo);
	}
	
	// 완제품관리(부적합) 수정
	@Override
	public void update(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		session.update(namespace + ".update",itemCompleteAdmVo);
	}
	
	// 완제품관리(부적합) 이미지 삭제
	@Override
	public void itemCompleteFaultyImageDelete(ItemCompleteAdmVo itemCompleteAdmVo) throws Exception{
		session.update(namespace + ".itemCompleteFaultyImageDelete",itemCompleteAdmVo);
	}

	
}
