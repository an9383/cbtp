package mes.persistence.mt;

import java.util.List;

import mes.domain.mt.LaserInspResultVo;

public interface LaserInspResultDAO {
	
	// 레이저 측정검사 작지별 목록조회
	public List<LaserInspResultVo> laserInspResultList(LaserInspResultVo laserInspResultVo) throws Exception;
}