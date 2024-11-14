package mes.persistence.tm;

import java.util.List;

import mes.domain.tm.PartInventoryAdmVo;

public interface PartInventoryAdmDAO {

	//기초재고관리 목록조회
	public List<PartInventoryAdmVo> partInventoryAdmList(PartInventoryAdmVo partInventoryAdmVo) throws Exception;
	
	//재고위치관리 목록조회
	public List<PartInventoryAdmVo> partInventoryLocList(PartInventoryAdmVo partInventoryAdmVo) throws Exception;
}
