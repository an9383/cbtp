package mes.service.bs;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bs.CustCmplnAdmVo;
import mes.persistence.bs.CustCmplnAdmDAO;

@Service
public class CustCmplnAdmServiceImpl implements CustCmplnAdmService {

	@Inject
	private CustCmplnAdmDAO dao;

	@Override
	public List<CustCmplnAdmVo> custCmplnAdmList(CustCmplnAdmVo custCmplnAdmVo) throws Exception{
		return dao.custCmplnAdmList(custCmplnAdmVo);
	}
	
	//고개불만 상세조회
	@Override
	public CustCmplnAdmVo custCmplnAdmRead(CustCmplnAdmVo custCmplnAdmVo) throws Exception{
		return dao.custCmplnAdmRead(custCmplnAdmVo);
	}
	
	//고개불만 등록
	@Override
	public void custCmplnAdmCreate(CustCmplnAdmVo custCmplnAdmVo) throws Exception{
		dao.custCmplnAdmCreate(custCmplnAdmVo);		
	}

	//고개불만 수정
	@Override
	public void custCmplnAdmUpdate(CustCmplnAdmVo custCmplnAdmVo) throws Exception{
		dao.custCmplnAdmUpdate(custCmplnAdmVo);
	}
	
	//고객불만 파일명 가져오기
	public CustCmplnAdmVo getInspectFileNm(CustCmplnAdmVo custCmplnAdmVo) throws Exception{
		return dao.getInspectFileNm(custCmplnAdmVo);
	}
	
	//고객불만 파일 삭제
	@Override
	public void custCmplnAdmDelete(CustCmplnAdmVo custCmplnAdmVo) throws Exception{
		dao.custCmplnAdmDelete(custCmplnAdmVo);
	}
	
	//고객불만 재발방지 파일 삭제
	@Override
	public void custCmplnAdmDelete2(CustCmplnAdmVo custCmplnAdmVo) throws Exception{
		dao.custCmplnAdmDelete2(custCmplnAdmVo);
	}
	
	//고객불만 시퀀스 조회
	public String locNoSeq(String date) throws Exception{
		return dao.locNoSeq(date);
	}
	
}

	