package mes.service.mm;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.mm.AccidentFreeVo;
import mes.persistence.mm.AccidentFreeDAO;

@Service
public class AccidentFreeServiceImpl implements AccidentFreeService {

	@Inject
	private AccidentFreeDAO dao;
	
	// 조회
	@Override
	public AccidentFreeVo read(AccidentFreeVo accidentFreeVo) throws Exception {
		return dao.read(accidentFreeVo);
	}
	
	// 수정
	@Override
	public void edit(AccidentFreeVo accidentFreeVo) throws Exception {
		dao.edit(accidentFreeVo);
	}
}
