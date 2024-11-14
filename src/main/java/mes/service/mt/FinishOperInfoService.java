package mes.service.mt;

import java.util.List;

import mes.domain.mt.FinishOperInfoVo;

public interface FinishOperInfoService {

	//목록 조회
	public List<FinishOperInfoVo> list(FinishOperInfoVo finishOperInfoVo) throws Exception;
	
	//상세 조회
	public FinishOperInfoVo read(FinishOperInfoVo finishOperInfoVo) throws Exception;
		
	//등록
	public void create(FinishOperInfoVo finishOperInfoVo) throws Exception;
	
	//수정
	public void update(FinishOperInfoVo finishOperInfoVo) throws Exception;
	
	//삭제
	public void delete(FinishOperInfoVo finishOperInfoVo) throws Exception;

	//목록 조회
	public List<FinishOperInfoVo> finishOperInfoEquipList(FinishOperInfoVo finishOperInfoVo) throws Exception;

	//목록 조회
	public List<FinishOperInfoVo> finishOperInfoList(FinishOperInfoVo finishOperInfoVo) throws Exception;

	//목록 조회
	public List<FinishOperInfoVo> finishOperInfoDtlList(FinishOperInfoVo finishOperInfoVo) throws Exception;
	
	//후가공 템프테이블 조회 
	public FinishOperInfoVo finishTempInfoList(FinishOperInfoVo finishOperInfoVo) throws Exception;
	
}
