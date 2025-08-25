package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.CommonCodeAdmVo;
import mes.persistence.bm.CommonCodeAdmDao;

@Service
public class CommonCodeAdmSeviceImple implements CommonCodeAdmService {

	@Inject
	private CommonCodeAdmDao dao;

	// 시스템공통코드 전체조회
	@Override
	public List<CommonCodeAdmVo> CommonCodeList(CommonCodeAdmVo Vo) throws Exception {

		return dao.CommonCodeList(Vo);
	}

	// 시스템공통코드 특정 Read
	@Override
	public CommonCodeAdmVo CommonCodeRead(CommonCodeAdmVo Vo) throws Exception {
		return dao.CommonCodeRead(Vo);
	}

	// 시스템공통그룹 Create
	@Override
	public void CommonCodeCreate(CommonCodeAdmVo Vo) throws Exception {
		dao.CommonCodeCreate(Vo);
	}

	// 시스템공통코드 Update
	@Override
	public void CommonCodeUpdate(CommonCodeAdmVo Vo) throws Exception {
		dao.CommonCodeUpdate(Vo);
	}

	// 시스템공통코드 SEQ(baseCd)
	@Override
	public CommonCodeAdmVo CommonCodeSeq(CommonCodeAdmVo Vo) throws Exception {
		return dao.CommonCodeSeq(Vo);
	}

	// 시스템공통그룹 목록조회
	@Override
	public List<CommonCodeAdmVo> CommonGroupList(CommonCodeAdmVo commonCodeVo) throws Exception {
		return dao.CommonGroupList(commonCodeVo);
	}

	// 시스템공통그룹 특정 Read
	@Override
	public CommonCodeAdmVo CommonGroupRead(CommonCodeAdmVo Vo) throws Exception {
		return dao.CommonGroupRead(Vo);
	}

	// 시스템공통그룹 Create
	@Override
	public void CommonGroupCreate(CommonCodeAdmVo Vo) throws Exception {
		dao.CommonGroupCreate(Vo);
	}

	// 시스템공통그룹 Update
	@Override
	public void CommonGroupUpdate(CommonCodeAdmVo Vo) throws Exception {
		dao.CommonGroupUpdate(Vo);
	}
	
	// 시스템공통그룹 SEQ(baseGroupCd)
	@Override
	public CommonCodeAdmVo CommonGroupSeq() throws Exception {
		return dao.CommonGroupSeq();
	}

	// 시스템공통코드 항목명 중복확인
	@Override
	public int CommonCodeNmCheck(CommonCodeAdmVo Vo) throws Exception {
		return dao.CommonCodeNmCheck(Vo);
	}
	
	@Override
	public int CommonCodeCdCheck(CommonCodeAdmVo Vo) throws Exception {
		return dao.CommonCodeCdCheck(Vo);
	}
	
	@Override
	public int CommonGroupNmCheck(CommonCodeAdmVo Vo) throws Exception {
		return dao.CommonGroupNmCheck(Vo);
	}
	
	// delete
	@Override
	public void commonGroupDelete(CommonCodeAdmVo Vo) throws Exception {
		dao.commonGroupDelete(Vo);
	}

}
