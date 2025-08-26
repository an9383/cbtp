package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.ManHourAdmVo;
import mes.persistence.bm.ManHourAdmDAO;

@Service
public class ManHourAdmServiceImpl implements ManHourAdmService {
	
	@Inject
	private ManHourAdmDAO dao;
	
	//공수관리 전체조회
	@Override
	public List<ManHourAdmVo>manHourAdmList(ManHourAdmVo manHourAdmVo) throws Exception {
		return dao.manHourAdmList(manHourAdmVo);
	}
	
	//공수관리  상세조회
	@Override
	public ManHourAdmVo manHourAdmRead(ManHourAdmVo manHourAdmVo) throws Exception {
		return dao.manHourAdmRead(manHourAdmVo);
	}

	//공수관리 등록
	@Override
	public void manHourAdmCreate(ManHourAdmVo manHourAdmVo) throws Exception {
		dao.manHourAdmCreate(manHourAdmVo);
	}
		
	//공수관리 수정
	@Override
	public void manHourAdmUpdate(ManHourAdmVo manHourAdmVo) throws Exception {
		dao.manHourAdmUpdate(manHourAdmVo);
	}
	
	//관련자료 시퀀스
	@Override
	public String manHourAdmSeq(ManHourAdmVo manHourAdmVo) throws Exception {
		return dao.manHourAdmSeq(manHourAdmVo);
	}
	
	
	
}
