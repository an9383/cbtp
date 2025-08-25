package mes.service.bm;

import java.util.List;

import mes.domain.bm.AttachDataVo;

public interface AttachDataService {
	
	//관련 정보 전체조회
	public List<AttachDataVo>attachDataAllList(AttachDataVo attachDataVo) throws Exception;
	
	//관련 정보 조회
	public List<AttachDataVo>attachDataList(AttachDataVo attachDataVo) throws Exception;

	//관련 정보 Create
	public void attachDataCreate(AttachDataVo attachDataVo) throws Exception;
			
	//관련 정보  Read
	public AttachDataVo attachDataRead(AttachDataVo attachDataVo) throws Exception;
		
	//관련 정보 Update
	public void attachDataUpdate(AttachDataVo attachDataVo) throws Exception;
	
	//개발관리 승인 Update
	public void attachApproveUpdate(AttachDataVo attachDataVo) throws Exception;
	
	//관련 정보 Delete
	public void attachDataDelete(AttachDataVo attachDataVo) throws Exception;
	
	//관련자료 시퀀스
	public int attachDataSeq(AttachDataVo attachDataVo) throws Exception;
	
	//관련자료 cd
	public String attachDataCd(AttachDataVo attachDataVo) throws Exception;
	
	//관련 자료 파일 경로 출력
	public String eqFilePath(AttachDataVo attachDataVo) throws Exception;
	
	//관련 자료 파일 경로 자세히 출력
	public String dtrFilePath(AttachDataVo attachDataVo) throws Exception;
	
	//참고자료 파일삭제
	public void attachFileDelete(AttachDataVo attachDataVo) throws Exception;
	
	//관련자료 파일 이름 가져오기
	public String getAttachFileNm(AttachDataVo attachDataVo) throws Exception;
	
}
