package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.PrcssBomDtlVo;
import mes.domain.bm.PrcssCodeAdmVo;
import mes.persistence.bm.PrcssBomDtlDAO;

@Service
public class PrcssBomDtlServiceImpl implements PrcssBomDtlService {

	@Inject
	private PrcssBomDtlDAO dao;
	
	//BOM관리 목록 조회
	@Override
	public List<PrcssBomDtlVo> listAll() throws Exception{
		return dao.listAll();
	}
	
	//BOM관리 상세조회
	@Override
	public PrcssBomDtlVo read(PrcssBomDtlVo prcssBomDtlVo) throws Exception{
		return dao.read(prcssBomDtlVo);
	}
	
	//BOM관리 상세조회2
	@Override
	public List<PrcssBomDtlVo> BomDtlView(PrcssBomDtlVo prcssBomDtlVo) throws Exception{
		return dao.BomDtlView(prcssBomDtlVo);
	}
	
	//BOM관리 등록
	@Override
	public void create(PrcssBomDtlVo prcssBomDtlVo) throws Exception{
		dao.create(prcssBomDtlVo);		
	}
	
	//BOM관리 수정
	@Override
	public void update(PrcssBomDtlVo prcssBomDtlVo) throws Exception{
		dao.update(prcssBomDtlVo);
	}
	
	//BomCd 생성
	@Override
	public String selectBomCdCreate() throws Exception{
		return dao.selectBomCdCreate();
	}
	
	//BOM관리 삭제
	@Override
	public void delete(PrcssBomDtlVo prcssBomDtlVo) throws Exception{
		dao.delete(prcssBomDtlVo);
	}

}

	