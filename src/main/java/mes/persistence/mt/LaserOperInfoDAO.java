package mes.persistence.mt;

import java.util.List;

import mes.domain.mt.LaserOperInfoVo;

public interface LaserOperInfoDAO {
	
	// 제조조건 모니터링 리스트
	public List<LaserOperInfoVo> laserOperInfoList(LaserOperInfoVo laserOperInfoVo) throws Exception;
	
	// 제조조건 모니터링 상세 리스트
	public List<LaserOperInfoVo> laserOperInfoDtlList(LaserOperInfoVo laserOperInfoVo) throws Exception;
	
	// 제조조건 모니터링 단계 구하기
	public int laserOperInfoStageCount(LaserOperInfoVo laserOperInfoVo) throws Exception;
}