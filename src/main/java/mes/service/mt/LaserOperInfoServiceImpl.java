package mes.service.mt;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.mt.LaserOperInfoVo;
import mes.persistence.mt.LaserOperInfoDAO;

@Service
public class LaserOperInfoServiceImpl implements LaserOperInfoService {

	@Inject
	private LaserOperInfoDAO dao;
	
	// 제조조건 모니터링 리스트
	@Override
	public List<LaserOperInfoVo> laserOperInfoList(LaserOperInfoVo laserOperInfoVo) throws Exception {
		return dao.laserOperInfoList(laserOperInfoVo);
	}
	
	// 제조조건 모니터링 상세 리스트
	@Override
	public List<LaserOperInfoVo> laserOperInfoDtlList(LaserOperInfoVo laserOperInfoVo) throws Exception {
		return dao.laserOperInfoDtlList(laserOperInfoVo);
	}
	
	// 제조조건 모니터링 단계 구하기
	@Override
	public int laserOperInfoStageCount(LaserOperInfoVo laserOperInfoVo) throws Exception{
		return dao.laserOperInfoStageCount(laserOperInfoVo);
	}
}
