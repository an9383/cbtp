package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.LocationAdmVo;
import mes.persistence.bm.LocationAdmDAO;

@Service
public class LocationAdmServiceImpl implements LocationAdmService {

	@Inject
	private LocationAdmDAO dao;
	
	// 청고정보 목록 조회
	@Override
	public List<LocationAdmVo> locationAdmList(LocationAdmVo locationAdmVo) throws Exception {
		return dao.locationAdmList(locationAdmVo);
	}
	
	// 창고정보관리 목록 조회
	public List<LocationAdmVo> locationAdmList2(LocationAdmVo locationAdmVo) throws Exception{
		return dao.locationAdmList2(locationAdmVo);
	}

	// 청고정보 상세 조회
	@Override
	public List<LocationAdmVo> locationAdmRead(LocationAdmVo locationAdmVo) throws Exception {
		return dao.locationAdmRead(locationAdmVo);
	}

	// 청고정보 등록
	@Override
	public void locationAdmCreate(LocationAdmVo locationAdmVo) throws Exception {
		dao.locationAdmCreate(locationAdmVo);
	}

	// 청고정보 수정
	@Override
	public void locationAdmUpdate(LocationAdmVo locationAdmVo) throws Exception {
		dao.locationAdmUpdate(locationAdmVo);
	}


	//바코드번호 시퀀스 조회
	public String locNoSeq(String date) throws Exception{
		return dao.locNoSeq(date);
	}
	
	// 삭제
	@Override
	public void locationAdmDelete(LocationAdmVo locationAdmVo) throws Exception {
		dao.locationAdmDelete(locationAdmVo);
	}
	
}
