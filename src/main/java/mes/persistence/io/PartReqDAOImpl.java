package mes.persistence.io;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.io.PartReqAdmVo;
import mes.domain.io.PartReqVo;

@Repository
public class PartReqDAOImpl implements PartReqDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.io.partReqMapper";
	
	//ADM
	//부품요청 조회
	@Override
	public List<PartReqVo> partReqAdmList(PartReqVo partReqVo) throws Exception{
		return session.selectList(namespace + ".partReqAdmList", partReqVo);
	}
	//부품요청ADM 등록
	@Override
	public void partReqAdmCreate(PartReqAdmVo partReqAdmVo) throws Exception{
		session.insert(namespace + ".partReqAdmCreate",partReqAdmVo);
	}
	//부품요청ADM 수정
	@Override
	public void partReqAdmUpdate(PartReqAdmVo partReqAdmVo) throws Exception{
		session.update(namespace + ".partReqAdmUpdate",partReqAdmVo);
	}
	//부품요청 삭제
	public void partReqAdmDelete(PartReqAdmVo partReqAdmVo) throws Exception{
		session.delete(namespace +".partReqAdmDelete",partReqAdmVo);
	}
	
	
	//DTL
	//부품요청 조회
	@Override
	public List<PartReqVo> partReqList(PartReqVo partReqVo) throws Exception{
		return session.selectList(namespace + ".partReqList", partReqVo);
	}
	//요청출고 DTL 목록조회
	@Override
	public List<PartReqVo> partReqDtlOutList(PartReqVo partReqVo) throws Exception{
		return session.selectList(namespace + ".partReqDtlOutList", partReqVo);
	}
	//부품요청 상세 조회
	@Override
	public PartReqVo partReqRead(PartReqVo partReqVo) throws Exception{
		return session.selectOne(namespace + ".selectOne", partReqVo);
	}
			
	//부품요청 등록
	@Override
	public void partReqCreate(PartReqVo partReqVo) throws Exception{
		session.insert(namespace + ".partReqCreate",partReqVo);
	}
	
	//부품요청 수정
	@Override
	public void partReqUpdate(PartReqVo partReqVo) throws Exception{
		session.update(namespace + ".partReqUpdate",partReqVo);
	}
	
	//부품요청 삭제
	public void partReqDelete(PartReqVo partReqVo) throws Exception{
		session.delete(namespace +".partReqDelete",partReqVo);
	}
	
	//부품요청번호 생성
	@Override
	public int partReqNo(String date) throws Exception{
		return session.selectOne(namespace + ".partReqNo", date);
	}
	
	//시퀀스 생성
	@Override
	public int partReqSeq(String date) throws Exception{
		return session.selectOne(namespace + ".partReqSeq", date);
	}

	
	//출고요청
	//바코드 목록  조회
	@Override
	public List<PartReqVo> partReqBarcodeList(PartReqVo partReqVo) throws Exception{
		return session.selectList(namespace + ".partReqBarcodeList", partReqVo);
	}
	//바코드 상세조회
	@Override
	public PartReqVo partReqBarcodeRead(PartReqVo partReqVo) throws Exception{
		return session.selectOne(namespace + ".partReqBarcodeRead", partReqVo);
	}

}
