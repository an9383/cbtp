package mes.service.em;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import mes.domain.em.EquipCondBomAdmVo;
import mes.persistence.em.EquipCondBomAdmDAO;

@Service
public class EquipCondBomAdmServiceImpl implements EquipCondBomAdmService {

	@Inject
	private EquipCondBomAdmDAO dao;
	
	//온도 등록
	@Override
	public void tempaturCreate(EquipCondBomAdmVo vo) throws Exception {
		dao.tempaturCreate(vo);
	}
	
	//시간 등록
	@Override
	public void timeCreate(EquipCondBomAdmVo vo) throws Exception {
		dao.timeCreate(vo);
	}
	
	//압력 등록
	@Override
	public void pressureCreate(EquipCondBomAdmVo vo) throws Exception {
		dao.pressureCreate(vo);
	}
	
	//치수 등록
	@Override
	public void sizeCreate(EquipCondBomAdmVo vo) throws Exception {
		dao.sizeCreate(vo);
	}
	
	
	
	
	//특정 온도 읽기
	@Override
	public EquipCondBomAdmVo tempaturRead(EquipCondBomAdmVo vo) throws Exception {
		return dao.tempaturRead(vo);
	}
	
	//특정 시간 읽기
	@Override
	public EquipCondBomAdmVo timeRead(EquipCondBomAdmVo vo) throws Exception {
		return dao.timeRead(vo);
	}
	
	//특정 압력 읽기
	@Override
	public EquipCondBomAdmVo pressureRead(EquipCondBomAdmVo vo) throws Exception {
		return dao.pressureRead(vo);
	}
	
	//특정 수치 읽기
	@Override
	public EquipCondBomAdmVo sizeRead(EquipCondBomAdmVo vo) throws Exception {
		return dao.sizeRead(vo);
	}
	
	
	
	
	//온도 수정
	@Override
	public void tempaturUpdate(EquipCondBomAdmVo vo) throws Exception {
		dao.tempaturUpdate(vo);
	}
	
	//시간 수정
	@Override
	public void timeUpdate(EquipCondBomAdmVo vo) throws Exception {
		dao.timeUpdate(vo);
	}
	
	//압력 수정
	@Override
	public void pressureUpdate(EquipCondBomAdmVo vo) throws Exception {
		dao.pressureUpdate(vo);
	}
	
	//치수 수정
	@Override
	public void sizeUpdate(EquipCondBomAdmVo vo) throws Exception {
		dao.sizeCreate(vo);
	}
	
	
	/*
	 * //
	 * 
	 * @Overrided public List<ManufacturerVo> listAll(ManufacturerVo vo) throws
	 * Exception { return dao.listAll(vo); }
	 * 
	 * //
	 * 
	 * @Override public ManufacturerVo read(ManufacturerVo vo) throws Exception {
	 * return dao.read(vo); }
	 * 
	 * //
	 * 
	 * @Override public void update(ManufacturerVo vo) throws Exception {
	 * dao.update(vo); }
	 */
	
	//
	//@Override
	//public String selectDealCorpSeqCd() throws Exception {
	//	return dao.selectDealCorpSeqCd();
	//}
}

	