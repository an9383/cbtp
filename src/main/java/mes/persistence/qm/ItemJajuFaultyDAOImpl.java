package mes.persistence.qm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.qm.ItemJajuFaultyVo;

@Repository
public class ItemJajuFaultyDAOImpl implements ItemJajuFaultyDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.qm.itemJajuFaultyMapper";
	

	//부적합관리 목록조회
	public List<ItemJajuFaultyVo> itemJajuFaultyList(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception{
		return session.selectList(namespace+".itemJajuFaultyList" , itemJajuFaultyVo);
	}
	
	//부적합관리 디테일 조회
	public List<ItemJajuFaultyVo> itemJajuFaultyDetailList(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception{
		return session.selectList(namespace+".itemJajuFaultyDetailList" ,itemJajuFaultyVo );
	}
	
	//부적합관리 상세조회
	public ItemJajuFaultyVo itemJajuFaultyRead(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception{
		return session.selectOne(namespace+".itemJajuFaultyRead" , itemJajuFaultyVo);
	}
	
	//부적합관리 등록
	public void itemJajuFaultyCreate(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception{
		session.insert(namespace+".itemJajuFaultyCreate" , itemJajuFaultyVo);
	}
	
	//부적합관리 수정
	public void itemJajuFaultyUpdate(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception{
		session.update(namespace+".itemJajuFaultyUpdate" , itemJajuFaultyVo);
	}
	
	//불량유형 목록가져오기
	public List<String> getFaultyTypeCd(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception{
		return session.selectList(namespace+".getFaultyTypeCd" , itemJajuFaultyVo);
	}
	
	//부적합처리 시퀀스생성
	public Integer getJajuFaultySeq(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception{
		return session.selectOne(namespace+".getJajuFaultySeq",itemJajuFaultyVo);
	}
}
