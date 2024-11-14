package mes.service.bs;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bs.ObjectiveAdmVo;
import mes.persistence.bs.ObjectiveAdmDAO;

@Service
public class ObjectiveAdmServiceImpl implements ObjectiveAdmService {
	
	@Inject
	private ObjectiveAdmDAO dao;
	
	//목표관리 목록 조회
	@Override
	public List<ObjectiveAdmVo> listAll(ObjectiveAdmVo objectiveAdmVo) throws Exception{
		return dao.listAll(objectiveAdmVo);
	}
	
	//목표관리 모달 조회
	@Override
	public List<ObjectiveAdmVo> read(ObjectiveAdmVo objectiveAdmVo) throws Exception{
		return dao.read(objectiveAdmVo);
	}
	
	//목표관리 생성
	@Override
	public void create(ObjectiveAdmVo objectiveAdmVo) throws Exception{
		dao.create(objectiveAdmVo);
	}
	
	//목표관리 삭제
	@Override
	public void delete(ObjectiveAdmVo objectiveAdmVo) throws Exception{
		dao.delete(objectiveAdmVo);
	}

}
