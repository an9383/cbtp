package mes.service.qm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.qm.FaultyAttachDataVo;
import mes.persistence.qm.FaultyAttachDataDAO;

@Service
public class FaultyAttachDataServiceImpl implements FaultyAttachDataService {

	@Inject
	private FaultyAttachDataDAO dao;
	
	//부적합관리 관련자료 상세조회
	public List<FaultyAttachDataVo> faultyAttachDataRead(FaultyAttachDataVo faultyAttachDataVo)throws Exception{
		return dao.faultyAttachDataRead(faultyAttachDataVo);
	}
	
	//부적합관리 관련자료 등록
	public void faultyAttachDataCreate(FaultyAttachDataVo faultyAttachDataVo)throws Exception{
		dao.faultyAttachDataCreate(faultyAttachDataVo);
	}
	
	//부적합관리 관련자료 수정
	public void faultyAttachDataUpdate(FaultyAttachDataVo faultyAttachDataVo)throws Exception{
		dao.faultyAttachDataUpdate(faultyAttachDataVo);
	}
	
	//부적합관리 관련자료 삭제
	public void faultyAttachDataDelete(FaultyAttachDataVo faultyAttachDataVo)throws Exception{
		dao.faultyAttachDataDelete(faultyAttachDataVo);
	}
	
	//부적합관리 관련자료 시퀀스
	public String getAttachSeq(String date)throws Exception{
		return dao.getAttachSeq(date);
	}
	
	//부적합관리 관련자료 파일명
	public String getAttachFn(FaultyAttachDataVo faultyAttachDataVo)throws Exception{
		return dao.getAttachFn(faultyAttachDataVo);
	}
}
