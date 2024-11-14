package mes.service.mt;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.mt.EquipDataVo;
import mes.domain.mt.PackingOperInfoVo;
import mes.persistence.mt.PackingOperInfoDAO;

@Service
public class PackingOperInfoServiceImpl implements PackingOperInfoService {

	@Inject
	private PackingOperInfoDAO dao;
	
	// 금일 가장 최신 데이터 조회
	@Override
	public List<PackingOperInfoVo> packingOperInfoTodayData(PackingOperInfoVo packingOperInfoVo) throws Exception {
		return dao.packingOperInfoTodayData(packingOperInfoVo);
	}
}
