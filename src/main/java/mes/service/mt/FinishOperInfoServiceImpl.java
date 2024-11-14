package mes.service.mt;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.mt.FinishOperInfoVo;
import mes.persistence.mt.FinishOperInfoDAO;

@Service
public class FinishOperInfoServiceImpl implements FinishOperInfoService {

	@Inject
	private FinishOperInfoDAO dao;
	
	//목록 조회
	public List<FinishOperInfoVo> list(FinishOperInfoVo finishOperInfoVo) throws Exception{
		return dao.list(finishOperInfoVo);
	}
	
	//상세 조회
	public FinishOperInfoVo read(FinishOperInfoVo finishOperInfoVo) throws Exception{
		return dao.read(finishOperInfoVo);
	}
		
	//등록
	public void create(FinishOperInfoVo finishOperInfoVo) throws Exception{
		dao.create(finishOperInfoVo);
	}
	
	//수정
	public void update(FinishOperInfoVo finishOperInfoVo) throws Exception{
		dao.update(finishOperInfoVo);
	}
	
	//삭제
	public void delete(FinishOperInfoVo finishOperInfoVo) throws Exception{
		dao.delete(finishOperInfoVo);
	}
	
	//목록 조회
	public List<FinishOperInfoVo> finishOperInfoEquipList(FinishOperInfoVo finishOperInfoVo) throws Exception{
		return dao.finishOperInfoEquipList(finishOperInfoVo);
	}
	
	//목록 조회
	public List<FinishOperInfoVo> finishOperInfoList(FinishOperInfoVo finishOperInfoVo) throws Exception{
		return dao.finishOperInfoList(finishOperInfoVo);
	}
	
	//목록 조회
	public List<FinishOperInfoVo> finishOperInfoDtlList(FinishOperInfoVo finishOperInfoVo) throws Exception{
		return dao.finishOperInfoDtlList(finishOperInfoVo);
	}
	
	//후가공 템프테이블 조회 
	public FinishOperInfoVo finishTempInfoList(FinishOperInfoVo finishOperInfoVo) throws Exception{
		return dao.finishTempInfoList(finishOperInfoVo);
	}
}
