package mes.persistence.bm;

import java.util.List;

import mes.domain.bm.PrcssBomDtlVo;
import mes.domain.bm.PrcssCodeAdmVo;

public interface PrcssBomDtlDAO {

	//BOM관리 목록조회
	public List<PrcssBomDtlVo> listAll() throws Exception;
	
	//BOM관리 상세조회
	public PrcssBomDtlVo read(PrcssBomDtlVo prcssBomDtlVo) throws Exception;
	
	//BOM관리 상세조회2
	public List<PrcssBomDtlVo> BomDtlView(PrcssBomDtlVo prcssBomDtlVo) throws Exception;
	
	//BOM관리 등록
	public void create(PrcssBomDtlVo prcssBomDtlVo) throws Exception;
	
	//BOM관리 수정
	public void update(PrcssBomDtlVo prcssBomDtlVo) throws Exception;
	
	//BomCd 생성
	public String selectBomCdCreate() throws Exception;
	
	//BOM관리 삭제
	public void delete(PrcssBomDtlVo prcssBomDtlVo) throws Exception;
	

}
