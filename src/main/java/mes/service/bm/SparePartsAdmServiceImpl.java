package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.SparePartsAdmVo;
import mes.persistence.bm.SparePartsAdmDAO;

@Service
public class SparePartsAdmServiceImpl implements SparePartsAdmService {
	
	@Inject
	private SparePartsAdmDAO dao;
	
	//예비품 전체조회
	public List<SparePartsAdmVo>sparePartsAdmList() throws Exception{
		return dao.sparePartsAdmList();
	}

	//예비품 특정 Read
	public SparePartsAdmVo sparePartsAdmRead(SparePartsAdmVo sparePartsAdmVo) throws Exception{
		return dao.sparePartsAdmRead(sparePartsAdmVo);
	}
	
	//예비품 Create
	public void sparePartsAdmCreate(SparePartsAdmVo sparePartsAdmVo) throws Exception{
		dao.sparePartsAdmCreate(sparePartsAdmVo);
	}
	
	//예비품 Update
	public void sparePartsAdmUpdate(SparePartsAdmVo sparePartsAdmVo) throws Exception{
		dao.sparePartsAdmUpdate(sparePartsAdmVo);
	}
	
	//예비품 시퀀스
	public String getSpCd() throws Exception{
		return dao.getSpCd();
	}
	
	//예비품 이미지 경로 조회
	public SparePartsAdmVo sparePartsImgRead(SparePartsAdmVo sparePartsAdmVo) throws Exception{
		return dao.sparePartsImgRead(sparePartsAdmVo);
	}
	
	//이미지 등록
	public void sparePartsImageUpload(SparePartsAdmVo sparePartsAdmVo) throws Exception{
		dao.sparePartsImageUpload(sparePartsAdmVo);
	}
	
	//이미지 삭제
	public void sparePartsImageDelete(SparePartsAdmVo sparePartsAdmVo) throws Exception{
		dao.sparePartsImageDelete(sparePartsAdmVo);
	}
}
