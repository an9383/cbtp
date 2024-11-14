package mes.service.po;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import mes.domain.po.EquipPrcssFaultyAdmVo;
import mes.persistence.po.EquipPrcssFaultyAdmDAO;

@Service
public class EquipPrcssFaultyAdmServiceImpl implements EquipPrcssFaultyAdmService {

	@Inject
	private EquipPrcssFaultyAdmDAO dao;
	
	//불량 조회
	@Override
	public EquipPrcssFaultyAdmVo readPrcssFaulty(EquipPrcssFaultyAdmVo equipPrcssFaultyAdmVo) throws Exception {
		return dao.readPrcssFaulty(equipPrcssFaultyAdmVo);
	}
	
	//불량등록
	 @Override
	 public void createPrcssFaulty(EquipPrcssFaultyAdmVo equipPrcssFaultyAdmVo) throws Exception {
		 dao.createPrcssFaulty(equipPrcssFaultyAdmVo);
	 }	 
		
	//불량 수정
	@Override
	public void updatePrcssFaulty(EquipPrcssFaultyAdmVo equipPrcssFaultyAdmVo) throws Exception {
		dao.updatePrcssFaulty(equipPrcssFaultyAdmVo);
	}



}

	