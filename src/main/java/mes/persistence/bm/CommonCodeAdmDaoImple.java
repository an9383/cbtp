package mes.persistence.bm;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.MatrlCodeAdmVo;
import mes.domain.bm.CommonCodeAdmVo;

@Repository
public class CommonCodeAdmDaoImple implements CommonCodeAdmDao {

	@Inject
	private SqlSession session;

	private static String namespace="mes.mappers.bm.commonCodeMapper";

	// 시스템공통코드 전체조회
	@Override
	public List<CommonCodeAdmVo> CommonCodeList(CommonCodeAdmVo Vo) throws Exception {
		return session.selectList(namespace +".CommonCodeList", Vo);
	}

	// 시스템공통코드 특정 Read
	@Override
	public CommonCodeAdmVo CommonCodeRead(CommonCodeAdmVo Vo) throws Exception {
		return session.selectOne(namespace +".CommonCodeRead", Vo);
	}

	// 시스템공통코드 Create
	@Override
	public void CommonCodeCreate(CommonCodeAdmVo Vo) throws Exception {
		session.insert(namespace + ".CommonCodeCreate", Vo);
	}

	// 시스템공통코드 Update
	@Override
	public void CommonCodeUpdate(CommonCodeAdmVo Vo) throws Exception {
		session.update(namespace + ".CommonCodeUpdate", Vo);

	}

	// 시스템공통코드 SEQ(baseGroupCd)
	@Override
	public CommonCodeAdmVo CommonCodeSeq(CommonCodeAdmVo Vo) throws Exception {
		return session.selectOne(namespace + ".CommonCodeSeq", Vo);
	}

	// 시스템공통그룹 전체조회
	@Override
	public List<CommonCodeAdmVo> CommonGroupList(CommonCodeAdmVo commonCodeVo) throws Exception {
		return session.selectList(namespace + ".CommonGroupList", commonCodeVo);
	}

	// 시스템공통그룹 특정 Read
	@Override
	public CommonCodeAdmVo CommonGroupRead(CommonCodeAdmVo Vo) throws Exception {
		return session.selectOne(namespace + ".CommonGroupRead", Vo);
	}

	// 시스템공통그룹 Create
	@Override
	public void CommonGroupCreate(CommonCodeAdmVo Vo) throws Exception {
		session.insert(namespace + ".CommonGroupCreate", Vo);	
	}

	// 시스템공통그룹 Update
	@Override
	public void CommonGroupUpdate(CommonCodeAdmVo Vo) throws Exception {
		session.update(namespace + ".CommonGroupUpdate", Vo);
	}

	// 시스템공통그룹 SEQ(baseGroupCd)
	@Override
	public CommonCodeAdmVo CommonGroupSeq() throws Exception {
		return session.selectOne(namespace + ".CommonGroupSeq");
	}

	// 시스템공통코드 항목명 중복 확인
	@Override
	public int CommonCodeNmCheck(CommonCodeAdmVo Vo) throws Exception {
		return session.selectOne(namespace + ".CommonCodeNmCheck", Vo);
	}
	
	@Override
	public int CommonCodeCdCheck(CommonCodeAdmVo Vo) throws Exception {
		return session.selectOne(namespace + ".CommonCodeCdCheck",Vo);
	}

	@Override
	public int CommonGroupNmCheck(CommonCodeAdmVo Vo) throws Exception {
		return session.selectOne(namespace + ".CommonGroupNmCheck", Vo);
	}
	
	// delete
	@Override
	public void commonGroupDelete(CommonCodeAdmVo Vo) throws Exception {
		session.update(namespace + ".commonGroupDelete", Vo);
	}

}