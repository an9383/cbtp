package mes.service.po;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.po.EquipDowntimeAdmVo;
import mes.persistence.po.EquipDowntimeAdmDAO;

@Service
public class EquipDowntimeAdmServiceImpl implements EquipDowntimeAdmService {

	@Inject
	private EquipDowntimeAdmDAO dao;
	 
	//비가동등록 목록조회
	@Override
	public List<EquipDowntimeAdmVo> listAll(EquipDowntimeAdmVo equipDowntimeAdmVo) throws Exception{
		return dao.listAll(equipDowntimeAdmVo);
	}
	
	//비가동등록 등록
	@Override
	public void create(EquipDowntimeAdmVo equipDowntimeAdmVo) throws Exception {
		dao.create(equipDowntimeAdmVo);
	}
	
	//비가동등록 삭제
	@Override
	public void delete(EquipDowntimeAdmVo equipDowntimeAdmVo) throws Exception {
		dao.delete(equipDowntimeAdmVo);
	}
	
}

	