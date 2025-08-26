package mes.service.mt;

import java.util.List;

import mes.domain.mt.EquipDataVo;
import mes.domain.mt.PackingOperInfoVo;

public interface PackingOperInfoService {

	// 금일 가장 최신 데이터 조회
	public List<PackingOperInfoVo> packingOperInfoTodayData(PackingOperInfoVo packingOperInfoVo) throws Exception;
}
