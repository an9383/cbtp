package mes.persistence.qm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.qm.ItemMoisMeasureAdmVo;

@Repository
public class ItemMoisMeasureAdmDAOImpl implements ItemMoisMeasureAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.qm.itemMoisMeasureAdmMapper";
	
	//수분측정 목록조회
	@Override
	public List<ItemMoisMeasureAdmVo> itemMoisMeasureList(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception{
		return session.selectList(namespace+".itemMoisMeasureList" ,itemMoisMeasureAdmVo );
	}
	
	//수분측정 상세목록조회
	public List<ItemMoisMeasureAdmVo> itemMoisMeasureDtlList(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception{
		return session.selectList(namespace+".itemMoisMeasureDtlList" , itemMoisMeasureAdmVo);
	}


	//수분측정 상세조회
	@Override
	public ItemMoisMeasureAdmVo itemMoisMeasureRead(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception{
		return session.selectOne(namespace+".itemMoisMeasureRead" , itemMoisMeasureAdmVo);
	}

	//수분측정 등록
	@Override
	public void itemMoisMeasureCreate(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception{
		session.insert(namespace+".itemMoisMeasureCreate" , itemMoisMeasureAdmVo);
	}

	//수분측정 수정
	@Override
	public void itemMoisMeasureUpdate(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception{
		session.update(namespace+".itemMoisMeasureUpdate" , itemMoisMeasureAdmVo);
	}

	//수분측정 삭제
	@Override
	public void itemMoisMeasureDelete(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception{
		session.delete(namespace+".itemMoisMeasureDelete" , itemMoisMeasureAdmVo);
	}
	
	
	//수분측정 시퀀스 생성
	public int getMoisSeq(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception{
		return session.selectOne(namespace+".getMoisSeq",itemMoisMeasureAdmVo);
	}

}
