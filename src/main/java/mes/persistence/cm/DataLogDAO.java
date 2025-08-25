package mes.persistence.cm;

import java.util.List;

import mes.domain.cm.DataLogVo;

public interface DataLogDAO {

	//월별 입력 건수
	public List<DataLogVo> count(DataLogVo dataLogVo) throws Exception;
	
	//테이블 Size(KB)
	public DataLogVo size(DataLogVo dataLogVo) throws Exception;
	
	//idx
	public DataLogVo idx(DataLogVo dataLogVo) throws Exception;
	
	//create
	public void create(DataLogVo dataLogVo) throws Exception;
	
	//read
	public DataLogVo read(DataLogVo dataLogVo) throws Exception;
	
	//delete
	public void delete(DataLogVo dataLogVo) throws Exception;

	//all
	public List<DataLogVo> all(DataLogVo dataLogVo) throws Exception;
	
}
