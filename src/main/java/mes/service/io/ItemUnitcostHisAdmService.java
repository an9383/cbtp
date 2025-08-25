package mes.service.io;

import java.util.List;

import mes.domain.io.ItemUnitcostHisAdmVo;

public interface ItemUnitcostHisAdmService {

	//자재이력관리 목록조회
	public List<ItemUnitcostHisAdmVo> itemUnitcostHisAdmList(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception;
	
	//자재이력관리 상세조회
	public List<ItemUnitcostHisAdmVo> itemUnitcostHisAdmRead(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception;
	
	//자재이력관리 등록
	public void itemUnitcostHisAdmCreate(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception;
	
	//자재이력관리 수정
	public void itemUnitcostHisAdmUpdate(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception;
	
	//자재이력관리 수정
	public Integer getPartSeq(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception;
	
	//자재이력관리 수정
	public Integer getLastUnitCost(ItemUnitcostHisAdmVo itemUnitcostHisAdmVo) throws Exception;
	
}
