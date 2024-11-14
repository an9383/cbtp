package mes.service.io;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.io.PartReqAdmVo;
import mes.domain.io.PartReqVo;
import mes.persistence.io.PartReqDAO;

@Service
public class PartReqServiceImpl implements PartReqService {

	@Inject
	private PartReqDAO dao;
	
	//ADM
	//부품요청 조회
	@Override
	public List<PartReqVo> partReqAdmList(PartReqVo partReqVo) throws Exception{
		return dao.partReqAdmList(partReqVo);
	}
	//부품요청ADM 등록
	@Override
	public void partReqAdmCreate(PartReqAdmVo partReqAdmVo) throws Exception{
		dao.partReqAdmCreate(partReqAdmVo);
	}
	//부품요청ADM 수정
	@Override
	public void partReqAdmUpdate(PartReqAdmVo partReqAdmVo) throws Exception{
		dao.partReqAdmUpdate(partReqAdmVo);
	}
	//부품요청 삭제
	public void partReqAdmDelete(PartReqAdmVo partReqAdmVo) throws Exception{
		dao.partReqAdmDelete(partReqAdmVo);
	}
	
	
	//DTL
	//부품요청 조회
	@Override
	public List<PartReqVo> partReqList(PartReqVo partReqVo) throws Exception{
		return dao.partReqList(partReqVo);
	}
	//요청출고 DTL 목록조회
	@Override
	public List<PartReqVo> partReqDtlOutList(PartReqVo partReqVo) throws Exception{
		return dao.partReqDtlOutList(partReqVo);
	}
	//부품요청 상세 조회
	@Override
	public PartReqVo partReqRead(PartReqVo partReqVo) throws Exception{
		return dao.partReqRead(partReqVo);
	}
			
	//부품요청 등록
	@Override
	public void partReqCreate(PartReqVo partReqVo) throws Exception{
		dao.partReqCreate(partReqVo);
	}
	
	//부품요청 수정
	@Override
	public void partReqUpdate(PartReqVo partReqVo) throws Exception{
		dao.partReqUpdate(partReqVo);
	}
	
	//부품요청 삭제
	public void partReqDelete(PartReqVo partReqVo) throws Exception{
		dao.partReqDelete(partReqVo);
	}
	
	//부품요청번호 생성
	@Override
	public int partReqNo(String date) throws Exception{
		return dao.partReqNo(date);
	}
	
	//시퀀스 생성
	@Override
	public int partReqSeq(String date) throws Exception{
		return dao.partReqSeq(date);
	}
	
	
	//출고요청
	//바코드 목록  조회
	@Override
	public List<PartReqVo> partReqBarcodeList(PartReqVo partReqVo) throws Exception{
		return dao.partReqBarcodeList(partReqVo);
	}
	//바코드 상세조회
	@Override
	public PartReqVo partReqBarcodeRead(PartReqVo partReqVo) throws Exception{
		return dao.partReqBarcodeRead(partReqVo);
	}

}
