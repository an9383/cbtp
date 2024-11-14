package mes.service.mt;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.mt.ControllSystemVo;
import mes.persistence.mt.ControllSystemDAO;

@Service
public class ControllSystemServiceImpl implements ControllSystemService {

	@Inject
	private ControllSystemDAO dao;
	
	// 전기량, 온습도 현황 리스트
	@Override
	public List<ControllSystemVo> controllSystemList(ControllSystemVo controllSystemVo) throws Exception {
		return dao.controllSystemList(controllSystemVo);
	}
	
	// 전기량, 온습도 현황 리스트
	@Override
	public void controllSystemCreate(ControllSystemVo controllSystemVo) throws Exception {
		dao.controllSystemCreate(controllSystemVo);
	}
	
	// 전기량, 온습도 현황 리스트
	@Override
	public List<ControllSystemVo> controllSystemBoardList(ControllSystemVo controllSystemVo) throws Exception {
		return dao.controllSystemBoardList(controllSystemVo);
	}
	
	// 레이저 온습도 현황 리스트
	@Override
	public ControllSystemVo controllSystemLaser(ControllSystemVo controllSystemVo) throws Exception {
		return dao.controllSystemLaser(controllSystemVo);
	}

	// 레이저 온습도 현황 리스트
	@Override
	public List<ControllSystemVo> controllSystemLaserList(ControllSystemVo controllSystemVo) throws Exception {
		return dao.controllSystemLaserList(controllSystemVo);
	}
	
	// 후가공 온습도 현황 리스트
	@Override
	public ControllSystemVo controllSystemFinish(ControllSystemVo controllSystemVo) throws Exception {
		return dao.controllSystemFinish(controllSystemVo);
	}

	// 후가공 온습도 현황 리스트
	@Override
	public List<ControllSystemVo> controllSystemFinishList(ControllSystemVo controllSystemVo) throws Exception {
		return dao.controllSystemFinishList(controllSystemVo);
	}
}
