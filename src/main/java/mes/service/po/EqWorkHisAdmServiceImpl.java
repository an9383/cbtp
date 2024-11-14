package mes.service.po;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.po.EqWorkHisAdmVo;
import mes.persistence.po.EqWorkHisAdmDAO;

@Service
public class EqWorkHisAdmServiceImpl implements EqWorkHisAdmService {
	
	@Inject
	private EqWorkHisAdmDAO dao;
	
	//작업조건 목록조회
	@Override
	public EqWorkHisAdmVo listAll(EqWorkHisAdmVo eqWorkHisAdmVo) throws Exception{
		return dao.listAll(eqWorkHisAdmVo);
	}

	//작업조건 등록유무
	@Override
	public int listCount(EqWorkHisAdmVo eqWorkHisAdmVo) throws Exception{
		return dao.listCount(eqWorkHisAdmVo);
	}
	
	//작업조건 등록
	@Override
	public void create(EqWorkHisAdmVo eqWorkHisAdmVo) throws Exception{
		dao.create(eqWorkHisAdmVo);
	}

	//작업조건 수정
	@Override
	public void update(EqWorkHisAdmVo eqWorkHisAdmVo) throws Exception{
		dao.update(eqWorkHisAdmVo);
	}
	

}
