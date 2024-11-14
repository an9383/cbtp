package mes.service.bm;

import java.util.List;

import mes.domain.bm.SparePartsAdmVo;

public interface SparePartsAdmService {
	
	//예비품 전체조회
	public List<SparePartsAdmVo>sparePartsAdmList() throws Exception;

	//예비품 특정 Read
	public SparePartsAdmVo sparePartsAdmRead(SparePartsAdmVo sparePartsAdmVo) throws Exception;
	
	//예비품 Create
	public void sparePartsAdmCreate(SparePartsAdmVo sparePartsAdmVo) throws Exception;
	
	//예비품 Update
	public void sparePartsAdmUpdate(SparePartsAdmVo sparePartsAdmVo) throws Exception;
	
	//예비품 시퀀스
	public String getSpCd() throws Exception;
	
	//예비품 이미지 경로 조회
	public SparePartsAdmVo sparePartsImgRead(SparePartsAdmVo sparePartsAdmVo) throws Exception;
	
	//이미지 등록
	public void sparePartsImageUpload(SparePartsAdmVo sparePartsAdmVo) throws Exception;

	//이미지 삭제
	public void sparePartsImageDelete(SparePartsAdmVo sparePartsAdmVo) throws Exception;
	
}
