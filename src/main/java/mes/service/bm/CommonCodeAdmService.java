package mes.service.bm;

import java.util.List;
import mes.domain.bm.CommonCodeAdmVo;

public interface CommonCodeAdmService {

	// 시스템공통코드 전체조회
	public List<CommonCodeAdmVo> CommonCodeList(CommonCodeAdmVo Vo) throws Exception;

	// 시스템공통코드 특정 Read
	public CommonCodeAdmVo CommonCodeRead(CommonCodeAdmVo Vo) throws Exception;

	// 시스템공통코드 Create
	public void CommonCodeCreate(CommonCodeAdmVo Vo) throws Exception;

	// 시스템공통코드 Update
	public void CommonCodeUpdate(CommonCodeAdmVo Vo) throws Exception;

	// 시스템공통코드 SEQ(baseCd)
	public CommonCodeAdmVo CommonCodeSeq(CommonCodeAdmVo Vo) throws Exception;

	// 시스템공통그룹 전체조회
	public List<CommonCodeAdmVo> CommonGroupList(CommonCodeAdmVo commonCodeVo) throws Exception;

	// 시스템공통그룹 특정 Read
	public CommonCodeAdmVo CommonGroupRead(CommonCodeAdmVo Vo) throws Exception;

	// 시스템공통그룹 Create
	public void CommonGroupCreate(CommonCodeAdmVo Vo) throws Exception;

	// 시스템공통그룹 Update
	public void CommonGroupUpdate(CommonCodeAdmVo Vo) throws Exception;

	// 시스템공통그룹 SEQ(baseGroupCd)
	public CommonCodeAdmVo CommonGroupSeq() throws Exception;

	// 시스템공통코드 항목명 중복확인
	public int CommonCodeNmCheck(CommonCodeAdmVo Vo) throws Exception;
	
	// 시스템공통코드  중복확인
	public int CommonCodeCdCheck(CommonCodeAdmVo Vo) throws Exception;
	
	// 시스템공통그룹 공통코드명 중복확인
	public int CommonGroupNmCheck(CommonCodeAdmVo Vo) throws Exception;
	
	// delete
	public void commonGroupDelete(CommonCodeAdmVo Vo) throws Exception;


}
