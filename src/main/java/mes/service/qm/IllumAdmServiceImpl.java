package mes.service.qm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.qm.IllumAdmVo;
import mes.persistence.qm.IllumAdmDAO;

@Service
public class IllumAdmServiceImpl implements IllumAdmService {

	@Inject
	private IllumAdmDAO dao;
	
	//조도측정 adm조회
	@Override
	public List<IllumAdmVo> illumAdmList(IllumAdmVo illumAdmVo) throws Exception {
		return dao.illumAdmList(illumAdmVo);
	}
	
	//조도측정 상세조회
//	@Override
//	public IllumAdmVo illumAdmRead(IllumAdmVo illumAdmVo) throws Exception {
//		return dao.illumAdmRead(illumAdmVo);
//	}
	
	//조도측정 상세조회(List)
	public List<IllumAdmVo> illumDtlList(IllumAdmVo illumAdmVo) throws Exception {
		return dao.illumDtlList(illumAdmVo);
	}
	
	//조도측정 Adm 등록
	@Override
	public void illumAdmCreate(IllumAdmVo illumAdmVo) throws Exception {
		 dao.illumAdmCreate(illumAdmVo);
	}
	
	//조도측정 Adm 수정
	@Override
	public void illumAdmUpdate(IllumAdmVo illumAdmVo) throws Exception {
		dao.illumAdmUpdate(illumAdmVo);
	}
	

	//조도측정 Dtl 등록
	@Override
	public void illumDtlCreate(IllumAdmVo illumAdmVo) throws Exception {
		 dao.illumDtlCreate(illumAdmVo);
	}
	
	//조도측정 Dtl 수정
	@Override
	public void illumDtlUpdate(IllumAdmVo illumAdmVo) throws Exception {
		dao.illumDtlUpdate(illumAdmVo);
	}
	
	//조도측정 삭제
	@Override
	public void illumDelete(IllumAdmVo illumAdmVo) throws Exception {
		dao.illumDelete(illumAdmVo);
	}
	
	
	//조도측정 조회(qmsc0080)
	@Override
	public List<IllumAdmVo> illumLookup(IllumAdmVo illumAdmVo) throws Exception {
		return dao.illumLookup(illumAdmVo);
	}
}
