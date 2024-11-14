package mes.service.cm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.cm.DataLogVo;
import mes.persistence.cm.DataLogDAO;

@Service
public class DataLogServiceImpl implements DataLogService {
	
	@Inject
	private DataLogDAO dao;

	//월별 입력 건수
	public List<DataLogVo> count(DataLogVo dataLogVo) throws Exception{
		return dao.count(dataLogVo);
	}
	
	//테이블 Size(KB)
	public DataLogVo size(DataLogVo dataLogVo) throws Exception{
		return dao.size(dataLogVo);
	}
	
	//idx
	public DataLogVo idx(DataLogVo dataLogVo) throws Exception{
		return dao.idx(dataLogVo);
	}
	
	//create
	public void create(DataLogVo dataLogVo) throws Exception{
		dao.create(dataLogVo);
	}
	
	//read
	public DataLogVo read(DataLogVo dataLogVo) throws Exception{
		return dao.read(dataLogVo);
	}
	
	//delete
	public void delete(DataLogVo dataLogVo) throws Exception{
		dao.delete(dataLogVo);
	}

	//all
	public List<DataLogVo> all(DataLogVo dataLogVo) throws Exception{
		return dao.all(dataLogVo);
	}
	
}
