package mes.service.mt;

import java.util.List;

import mes.domain.mt.ControllSystemVo;
import mes.domain.mt.LaserInspResultVo;
import mes.domain.mt.LaserOperInfoVo;

public interface LaserInspResultService {

	// 레이저 측정검사 작지별 목록조회
	public List<LaserInspResultVo> laserInspResultList(LaserInspResultVo laserInspResultVo) throws Exception;
}
