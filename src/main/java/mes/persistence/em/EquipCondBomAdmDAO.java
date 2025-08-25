package mes.persistence.em;

import java.util.List;
import mes.domain.em.EquipCondBomAdmVo;

public interface EquipCondBomAdmDAO {

	//온도 등록
	public void tempaturCreate(EquipCondBomAdmVo vo) throws Exception;
	
	//시간 등록
	public void timeCreate(EquipCondBomAdmVo vo) throws Exception;
		
	//압력 등록
	public void pressureCreate(EquipCondBomAdmVo vo) throws Exception;
		
	//치수 등록
	public void sizeCreate(EquipCondBomAdmVo vo) throws Exception;
	
	
	
	
	//특정 온도 읽기
	public EquipCondBomAdmVo tempaturRead(EquipCondBomAdmVo vo) throws Exception;

	//특정 시간 읽기
	public EquipCondBomAdmVo timeRead(EquipCondBomAdmVo vo) throws Exception;

	//특정 압력 읽기
	public EquipCondBomAdmVo pressureRead(EquipCondBomAdmVo vo) throws Exception;
	
	//특정 치수 읽기
	public EquipCondBomAdmVo sizeRead(EquipCondBomAdmVo vo) throws Exception;
	
	
	
	
	//온도 수정
	public void tempaturUpdate(EquipCondBomAdmVo vo) throws Exception;
	
	//시간 수정
	public void timeUpdate(EquipCondBomAdmVo vo) throws Exception;
		
	//압력 수정
	public void pressureUpdate(EquipCondBomAdmVo vo) throws Exception;
		
	//치수 수정
	public void sizeUpdate(EquipCondBomAdmVo vo) throws Exception;
	
	
	
	
	
	
	
	
	
	
	
	
	//
	
	//public List<ManufacturerVo> listAll(ManufacturerVo vo) throws Exception;
	
	//
	//public ManufacturerVo read(ManufacturerVo vo) throws Exception;
	
	//
	//public void update(ManufacturerVo vo) throws Exception;
	
	//
	//public String selectDealCorpSeqCd() throws Exception;	
}
