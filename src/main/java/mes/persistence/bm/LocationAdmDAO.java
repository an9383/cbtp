package mes.persistence.bm;

import java.util.List;

import mes.domain.bm.LocationAdmVo;

public interface LocationAdmDAO {

	// 창고정보관리 목록 조회
	public List<LocationAdmVo> locationAdmList(LocationAdmVo locationAdmVo) throws Exception;

	// 창고정보관리 목록 조회
	public List<LocationAdmVo> locationAdmList2(LocationAdmVo locationAdmVo) throws Exception;
	
	// 창고정보관리 상세 조회
	public List<LocationAdmVo> locationAdmRead(LocationAdmVo locationAdmVo) throws Exception;

	// 창고정보관리 등록
	public void locationAdmCreate(LocationAdmVo locationAdmVo) throws Exception;

	// 창고정보관리 수정
	public void locationAdmUpdate(LocationAdmVo locationAdmVo) throws Exception;
	
	//바코드번호 시퀀스 조회
	public String locNoSeq(String date) throws Exception;
	
	// 삭제
	public void locationAdmDelete(LocationAdmVo locationAdmVo) throws Exception;
}
