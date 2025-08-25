package mes.service.sm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.sm.ChangeHisAdmVo;
import mes.persistence.sm.ChangeHisAdmDAO;

@Service
public class ChangeHisAdmServiceImpl implements ChangeHisAdmService {

	@Inject
	private ChangeHisAdmDAO dao;
	
	//List
	@Override
	public List<ChangeHisAdmVo> changeHisAdmList(ChangeHisAdmVo changeHisAdmVo) throws Exception {
	    return dao.changeHisAdmList(changeHisAdmVo);
	}

	//Read - 마스터
	@Override
	public ChangeHisAdmVo changeHisAdmRead(ChangeHisAdmVo changeHisAdmVo) throws Exception {
	    return dao.changeHisAdmRead(changeHisAdmVo);
	}

	//Read - 서브
	@Override
	public ChangeHisAdmVo changeHisAdmSubRead(ChangeHisAdmVo changeHisAdmVo) throws Exception {
		return dao.changeHisAdmSubRead(changeHisAdmVo);
	}
	
	//Create - 마스터
	@Override
	public String changeHisAdmCreate(ChangeHisAdmVo changeHisAdmVo) throws Exception {
		return dao.changeHisAdmCreate(changeHisAdmVo);
	}

	//Create - 서브
	@Override
	public void changeHisAdmSubCreate(ChangeHisAdmVo changeHisAdmVo) throws Exception {
		dao.changeHisAdmSubCreate(changeHisAdmVo);
	}
	
	//Update - 마스터
	@Override
	public void changeHisAdmUpdate(ChangeHisAdmVo changeHisAdmVo) throws Exception {
	    dao.changeHisAdmUpdate(changeHisAdmVo);
	}

	//Update - 서브
	@Override
	public void changeHisAdmSubUpdate(ChangeHisAdmVo changeHisAdmVo) throws Exception {
		dao.changeHisAdmSubUpdate(changeHisAdmVo);
	}
	
	//Delete - 마스터
	@Override
	public void changeHisAdmDelete(ChangeHisAdmVo changeHisAdmVo) throws Exception {
	    dao.changeHisAdmDelete(changeHisAdmVo);
	}

	//Delete - 서브
	@Override
	public void changeHisAdmSubDelete(ChangeHisAdmVo changeHisAdmVo) throws Exception {
		dao.changeHisAdmSubDelete(changeHisAdmVo);
	}
	
}
