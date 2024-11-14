package mes.service.io;

import java.util.List;

import mes.domain.io.SpareInOutWhsAdmVo;

public interface SpareInOutWhsAdmService {
	
	//스페어관리 조회
	public List<SpareInOutWhsAdmVo> spareItemInfoList(SpareInOutWhsAdmVo vo)throws Exception;
	
	//스페어관리 조회
	public List<SpareInOutWhsAdmVo> spareInOutWhsList(SpareInOutWhsAdmVo vo)throws Exception;

	//스페어관리 등록
	public void spareInOutWhsCreate(SpareInOutWhsAdmVo vo)throws Exception;

	//스페어관리 수정
	public void spareInOutWhsUpdate(SpareInOutWhsAdmVo vo)throws Exception;

	//스페어관리 삭제
	public void spareInOutWhsDelete(SpareInOutWhsAdmVo vo)throws Exception;

	//스페어관리 전표번호
	public String getSpaIoNo(SpareInOutWhsAdmVo vo)throws Exception;

	//스페어관리 전표시퀀스
	public int getSpaIoSeq(SpareInOutWhsAdmVo vo)throws Exception;
	
	//스페어 현재고 가져오기
	public SpareInOutWhsAdmVo getTmQtyRead(SpareInOutWhsAdmVo vo)throws Exception;
	
}
