package mes.service.qm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.qm.ItemMoisMeasureAdmVo;
import mes.persistence.qm.ItemMoisMeasureAdmDAO;

@Service
public class ItemMoisMeasureAdmServiceImpl implements ItemMoisMeasureAdmService {

	@Inject
	private ItemMoisMeasureAdmDAO dao;
	
	//수분측정 목록조회
	@Override
	public List<ItemMoisMeasureAdmVo> itemMoisMeasureList(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception{
		return dao.itemMoisMeasureList(itemMoisMeasureAdmVo);
	}

	//수분측정 상세목록조회
	public List<ItemMoisMeasureAdmVo> itemMoisMeasureDtlList(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception{
		return dao.itemMoisMeasureDtlList(itemMoisMeasureAdmVo);
	}

	//수분측정 상세조회
	@Override
	public ItemMoisMeasureAdmVo itemMoisMeasureRead(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception{
		return dao.itemMoisMeasureRead(itemMoisMeasureAdmVo);
	}

	//수분측정 등록
	@Override
	public void itemMoisMeasureCreate(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception{
		dao.itemMoisMeasureCreate(itemMoisMeasureAdmVo);
	}

	//수분측정 수정
	@Override
	public void itemMoisMeasureUpdate(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception{
		dao.itemMoisMeasureUpdate(itemMoisMeasureAdmVo);
	}

	//수분측정 삭제
	@Override
	public void itemMoisMeasureDelete(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception{
		dao.itemMoisMeasureDelete(itemMoisMeasureAdmVo);
	}
	
	//수분측정 시퀀스 생성
	public int getMoisSeq(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception{
		return dao.getMoisSeq(itemMoisMeasureAdmVo);
	}

	
}
