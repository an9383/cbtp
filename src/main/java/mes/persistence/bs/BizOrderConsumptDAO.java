package mes.persistence.bs;

import java.util.List;

import mes.domain.bs.BizOrderAdmVo;
import mes.domain.bs.BizOrderConsumptVo;

public interface BizOrderConsumptDAO {

	//소요량분석 목록조회
	public List<BizOrderConsumptVo> bizOrderConsumptList (BizOrderConsumptVo bizOrderConsumptVo)throws Exception;
	
	//소요량분석 상세조회
	public List<BizOrderConsumptVo> bizOrderConsumptRead (BizOrderConsumptVo bizOrderConsumptVo)throws Exception;
	
	//소요량분석 등록
	public void bizOrderConsumptCreate (BizOrderConsumptVo bizOrderConsumptVo)throws Exception;
	
	//소요량분석 수정
	public void bizOrderConsumptUpdate (BizOrderConsumptVo bizOrderConsumptVo)throws Exception;
	
	//소요량분석 삭제
	public void bizOrderConsumptDelete (BizOrderConsumptVo bizOrderConsumptVo)throws Exception;
}
