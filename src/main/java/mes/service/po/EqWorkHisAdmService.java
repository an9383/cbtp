package mes.service.po;

import java.util.List;

import mes.domain.po.EqWorkHisAdmVo;

public interface EqWorkHisAdmService {

	//작업조건 목록조회
	public EqWorkHisAdmVo listAll(EqWorkHisAdmVo eqWorkHisAdmVo) throws Exception;

	//작업조건 등록유무
	public int listCount(EqWorkHisAdmVo eqWorkHisAdmVo) throws Exception;
	
	//작업조건 등록
	public void create(EqWorkHisAdmVo eqWorkHisAdmVo) throws Exception;

	//작업조건 수정
	public void update(EqWorkHisAdmVo eqWorkHisAdmVo) throws Exception;
}
