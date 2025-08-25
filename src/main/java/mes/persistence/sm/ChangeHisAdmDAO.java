package mes.persistence.sm;

import java.util.List;

import mes.domain.sm.ChangeHisAdmVo;

public interface ChangeHisAdmDAO {
	
	//List
	public List<ChangeHisAdmVo> changeHisAdmList(ChangeHisAdmVo changeHisAdmVo) throws Exception;

	//Read - 마스터
	public ChangeHisAdmVo changeHisAdmRead(ChangeHisAdmVo changeHisAdmVo) throws Exception;

	//Read - 서브
	public ChangeHisAdmVo changeHisAdmSubRead(ChangeHisAdmVo changeHisAdmVo) throws Exception;
	
	//Create - 마스터
	public String changeHisAdmCreate(ChangeHisAdmVo changeHisAdmVo) throws Exception;

	//Create - 서브
	public void changeHisAdmSubCreate(ChangeHisAdmVo changeHisAdmVo) throws Exception;
	
	//Update - 마스터
	public void changeHisAdmUpdate(ChangeHisAdmVo changeHisAdmVo) throws Exception;

	//Update - 서브
	public void changeHisAdmSubUpdate(ChangeHisAdmVo changeHisAdmVo) throws Exception;
	
	//Delete - 마스터
	public void changeHisAdmDelete(ChangeHisAdmVo changeHisAdmVo) throws Exception;

	//Delete - 서브
	public void changeHisAdmSubDelete(ChangeHisAdmVo changeHisAdmVo) throws Exception;
	
}
