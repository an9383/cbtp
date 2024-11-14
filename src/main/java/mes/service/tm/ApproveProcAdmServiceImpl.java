package mes.service.tm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.tm.ApproveProcAdmVo;
import mes.persistence.tm.ApproveProcAdmDAO;

@Service
public class ApproveProcAdmServiceImpl implements ApproveProcAdmService {
	
	@Inject
	private ApproveProcAdmDAO dao;
	
	//목록조회1
	public List<ApproveProcAdmVo> approveProcAdmList1(ApproveProcAdmVo approveProcAdmVo) throws Exception{
		return dao.approveProcAdmList1(approveProcAdmVo);
	}
	
	//목록조회1
	public List<ApproveProcAdmVo> approveProcAdmList2(ApproveProcAdmVo approveProcAdmVo) throws Exception{
		return dao.approveProcAdmList2(approveProcAdmVo);
	}
	
	//목록조회1
	public List<ApproveProcAdmVo> approveProcAdmList3(ApproveProcAdmVo approveProcAdmVo) throws Exception{
		return dao.approveProcAdmList3(approveProcAdmVo);
	}
	
	//목록조회1
	public List<ApproveProcAdmVo> approveProcAdmList4(ApproveProcAdmVo approveProcAdmVo) throws Exception{
		return dao.approveProcAdmList4(approveProcAdmVo);
	}
	
	//목록조회1
	public List<ApproveProcAdmVo> approveProcAdmList5(ApproveProcAdmVo approveProcAdmVo) throws Exception{
		return dao.approveProcAdmList5(approveProcAdmVo);
	}
	
	//승인처리 등록
	public int approveProcAdmCreate(ApproveProcAdmVo approveProcAdmVo) throws Exception{
		return dao.approveProcAdmCreate(approveProcAdmVo);
	}

	//승인처리 시퀀스 가져오기
	public String getApSeq(ApproveProcAdmVo approveProcAdmVo) throws Exception{
		return dao.getApSeq(approveProcAdmVo);
	}
	
}
