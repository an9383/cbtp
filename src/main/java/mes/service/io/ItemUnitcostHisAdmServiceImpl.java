package mes.service.io;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.io.ItemUnitcostHisAdmVo;
import mes.persistence.io.ItemUnitcostHisAdmDAO;

@Service
public class ItemUnitcostHisAdmServiceImpl implements ItemUnitcostHisAdmService {


	@Inject
	private ItemUnitcostHisAdmDAO dao;
	
	//자재이력관리 목록조회
	public List<ItemUnitcostHisAdmVo> itemUnitcostHisAdmList(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception{
		return dao.itemUnitcostHisAdmList(itemUnitcostHisAdmVo);
	}
	
	//자재이력관리 상세조회
	public List<ItemUnitcostHisAdmVo> itemUnitcostHisAdmRead(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception{
		return dao.itemUnitcostHisAdmRead(itemUnitcostHisAdmVo);
	}
	
	//자재이력관리 등록
	public void itemUnitcostHisAdmCreate(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception{
		dao.itemUnitcostHisAdmCreate(itemUnitcostHisAdmVo);
	}
	
	//자재이력관리 수정
	public void itemUnitcostHisAdmUpdate(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception{
		dao.itemUnitcostHisAdmUpdate(itemUnitcostHisAdmVo);
	}
	
	//자재이력관리 수정
	public Integer getPartSeq(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception{
		return dao.getPartSeq(itemUnitcostHisAdmVo);
	}
	
	//자재이력관리 수정
	public Integer getLastUnitCost(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception{
		return dao.getLastUnitCost(itemUnitcostHisAdmVo);
	}
}
