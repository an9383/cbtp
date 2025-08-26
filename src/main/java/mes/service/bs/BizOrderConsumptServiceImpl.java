package mes.service.bs;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bs.BizOrderAdmVo;
import mes.domain.bs.BizOrderConsumptVo;
import mes.persistence.bs.BizOrderConsumptDAO;

@Service
public class BizOrderConsumptServiceImpl implements BizOrderConsumptService {

	@Inject
	private BizOrderConsumptDAO dao;
	
	//소요량분석 목록조회
	public List<BizOrderConsumptVo> bizOrderConsumptList (BizOrderConsumptVo bizOrderConsumptVo)throws Exception{
		return dao.bizOrderConsumptList(bizOrderConsumptVo);
	}
	
	//소요량분석 상세조회
	public List<BizOrderConsumptVo> bizOrderConsumptRead (BizOrderConsumptVo bizOrderConsumptVo)throws Exception{
		return dao.bizOrderConsumptRead(bizOrderConsumptVo);
	}
	
	//소요량분석 등록
	public void bizOrderConsumptCreate (BizOrderConsumptVo bizOrderConsumptVo)throws Exception{
		dao.bizOrderConsumptCreate(bizOrderConsumptVo);
	}
	
	//소요량분석 수정
	public void bizOrderConsumptUpdate (BizOrderConsumptVo bizOrderConsumptVo)throws Exception{
		dao.bizOrderConsumptUpdate(bizOrderConsumptVo);
	}
	
	//소요량분석 삭제
	public void bizOrderConsumptDelete (BizOrderConsumptVo bizOrderConsumptVo)throws Exception{
		dao.bizOrderConsumptDelete(bizOrderConsumptVo);
	}
	
}
