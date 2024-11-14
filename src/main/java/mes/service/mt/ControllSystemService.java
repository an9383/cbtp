package mes.service.mt;

import java.util.List;

import mes.domain.mt.ControllSystemVo;

public interface ControllSystemService {

	// 전기량, 온습도 현황 리스트
	public List<ControllSystemVo> controllSystemList(ControllSystemVo controllSystemVo) throws Exception;
	
	// 전기량, 온습도 현황 리스트
	public void controllSystemCreate(ControllSystemVo controllSystemVo) throws Exception;
	
	// 전기량, 온습도 현황 리스트
	public List<ControllSystemVo> controllSystemBoardList(ControllSystemVo controllSystemVo) throws Exception;
	
	// 레이저 온습도 현황 리스트
	public ControllSystemVo controllSystemLaser(ControllSystemVo controllSystemVo) throws Exception;

	// 레이저 온습도 현황 리스트
	public List<ControllSystemVo> controllSystemLaserList(ControllSystemVo controllSystemVo) throws Exception;
	
	// 후가공 온습도 현황 리스트
	public ControllSystemVo controllSystemFinish(ControllSystemVo controllSystemVo) throws Exception;
	
	// 후가공 온습도 현황 리스트
	public List<ControllSystemVo> controllSystemFinishList(ControllSystemVo controllSystemVo) throws Exception;
}
