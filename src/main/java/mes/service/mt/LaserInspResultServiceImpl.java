package mes.service.mt;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.mt.LaserInspResultVo;
import mes.persistence.mt.LaserInspResultDAO;

@Service
public class LaserInspResultServiceImpl implements LaserInspResultService {

	@Inject
	private LaserInspResultDAO dao;
	
	// 레이저 측정검사 작지별 목록조회
	@Override
	public List<LaserInspResultVo> laserInspResultList(LaserInspResultVo laserInspResultVo) throws Exception {
		return dao.laserInspResultList(laserInspResultVo);
	}
}
