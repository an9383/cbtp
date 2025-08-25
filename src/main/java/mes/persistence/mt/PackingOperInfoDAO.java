package mes.persistence.mt;

import java.util.List;

import mes.domain.mt.EquipDataVo;
import mes.domain.mt.PackingOperInfoVo;

public interface PackingOperInfoDAO {
	
	// 금일 가장 최신 데이터 조회
	public List<PackingOperInfoVo> packingOperInfoTodayData(PackingOperInfoVo packingOperInfoVo) throws Exception;
}