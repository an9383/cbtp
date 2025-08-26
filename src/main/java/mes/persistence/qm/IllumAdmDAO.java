package mes.persistence.qm;

import java.util.List;

import mes.domain.qm.IllumAdmVo;

public interface IllumAdmDAO {
	
	//조도측정 adm조회
	public List<IllumAdmVo> illumAdmList(IllumAdmVo illumAdmVo) throws Exception;
	
//	//조도측정 상세조회
//	public IllumAdmVo illumAdmRead(IllumAdmVo illumAdmVo) throws Exception;
	
	//조도측정 상세조회(List)
	public List<IllumAdmVo> illumDtlList(IllumAdmVo illumAdmVo) throws Exception;
	
	//조도측정 Adm 등록
	public void illumAdmCreate(IllumAdmVo illumAdmVo) throws Exception;
	
	//조도측정 Adm 수정
	public void illumAdmUpdate(IllumAdmVo illumAdmVo) throws Exception;
		

	//조도측정 Dtl 등록
	public void illumDtlCreate(IllumAdmVo illumAdmVo) throws Exception;
	
	//조도측정 Dtl 수정
	public void illumDtlUpdate(IllumAdmVo illumAdmVo) throws Exception;

	//조도측정 삭제
	public void illumDelete(IllumAdmVo illumAdmVo) throws Exception;
	
	
	//조도측정 조회(qmsc0080)
	public List<IllumAdmVo> illumLookup(IllumAdmVo illumAdmVo) throws Exception;
	
}
