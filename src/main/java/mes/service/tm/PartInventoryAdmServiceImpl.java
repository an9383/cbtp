package mes.service.tm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.tm.PartInventoryAdmVo;
import mes.persistence.tm.PartInventoryAdmDAO;

@Service
public class PartInventoryAdmServiceImpl implements PartInventoryAdmService {
	
	@Inject
	private PartInventoryAdmDAO dao;

	//기초재고관리 목록조회
	@Override
	public List<PartInventoryAdmVo> partInventoryAdmList(PartInventoryAdmVo partInventoryAdmVo) throws Exception{
		return dao.partInventoryAdmList(partInventoryAdmVo);
	}
	
	//재고위치관리 목록조회
	public List<PartInventoryAdmVo> partInventoryLocList(PartInventoryAdmVo partInventoryAdmVo) throws Exception{
		return dao.partInventoryLocList(partInventoryAdmVo);
	}
}
