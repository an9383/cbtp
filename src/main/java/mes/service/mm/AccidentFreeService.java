package mes.service.mm;

import mes.domain.mm.AccidentFreeVo;

public interface AccidentFreeService {

	// 조회
	public AccidentFreeVo read(AccidentFreeVo accidentFreeVo) throws Exception;
	
	// 수정
	public void edit(AccidentFreeVo accidentFreeVo) throws Exception;
}
