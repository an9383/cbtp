package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.AttachDataVo;
import mes.domain.bm.MeasureInstrmtAdmVo;

@Repository
public class AttachDataDAOImpl implements AttachDataDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.attachDataMapper";
	
	//관련 정보 전체조회
	public List<AttachDataVo>attachDataAllList(AttachDataVo attachDataVo) throws Exception {
		return session.selectList(namespace+".attachDataAllList", attachDataVo);
	}
	
	//관련 정보 조회
	public List<AttachDataVo>attachDataList(AttachDataVo attachDataVo) throws Exception {
		return session.selectList(namespace+".attachDataList", attachDataVo);
	}

	//관련 정보 Create
	public void attachDataCreate(AttachDataVo attachDataVo) throws Exception {
		session.insert(namespace+".attachDataCreate", attachDataVo);
	}
			
	//관련 정보  Read
	public AttachDataVo attachDataRead(AttachDataVo attachDataVo) throws Exception {
		return session.selectOne(namespace+".attachDataRead", attachDataVo);
	}
		
	//관련 정보 Update
	public void attachDataUpdate(AttachDataVo attachDataVo) throws Exception {
		session.update(namespace+".attachDataUpdate", attachDataVo);
	}
	
	//개발관리_승인 Update
	public void attachApproveUpdate(AttachDataVo attachDataVo) throws Exception {
		session.update(namespace+".attachApproveUpdate", attachDataVo);
	}
	
	//관련 정보 Delete
	public void attachDataDelete(AttachDataVo attachDataVo) throws Exception {
		session.delete(namespace+".attachDataDelete", attachDataVo);
	}
	
	//관련자료 시퀀스
	public int attachDataSeq(AttachDataVo attachDataVo) throws Exception {
		return session.selectOne(namespace + ".attachDataSeq",attachDataVo);
	}
	
	//관련자료 cd
	public String attachDataCd(AttachDataVo attachDataVo) throws Exception {
		return session.selectOne(namespace + ".attachDataCd", attachDataVo);
	}
	
	//관련자료 파일 경로 출력
	public String eqFilePath(AttachDataVo attachDataVo) throws Exception {
		return session.selectOne(namespace + ".eqFilePath", attachDataVo);
	}
	
	//관련자료 파일 경로 자세히 출력
	public String dtrFilePath(AttachDataVo attachDataVo) throws Exception {
		return session.selectOne(namespace + ".dtrFilePath", attachDataVo);
	}
	
	//참고자료 파일삭제
	public void attachFileDelete(AttachDataVo attachDataVo) throws Exception{
		session.update(namespace + ".attachFileDelete",attachDataVo);
	}
	
	//관련자료 파일 이름 가져오기
	@Override
	public String getAttachFileNm(AttachDataVo attachDataVo) throws Exception {
		return session.selectOne(namespace + ".getAttachFileNm", attachDataVo);
	}
}
