package mes.service.po;

import mes.domain.po.EquipPrcssFaultyAdmVo;

public interface EquipPrcssFaultyAdmService {

	//불량 조회
	public EquipPrcssFaultyAdmVo readPrcssFaulty(EquipPrcssFaultyAdmVo equipPrcssFaultyAdmVo) throws Exception;	
	
	//불량 등록
	public void createPrcssFaulty(EquipPrcssFaultyAdmVo equipPrcssFaultyAdmVo) throws Exception;
	
	//불량 수정
	public void updatePrcssFaulty(EquipPrcssFaultyAdmVo equipPrcssFaultyAdmVo) throws Exception;	
	
	
	
}
