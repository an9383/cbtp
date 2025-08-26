package mes.service.bm;

import java.util.List;

import mes.domain.bm.MoldAdmVo;

public interface MoldAdmService {

	//금형관리 목록조회
	public List<MoldAdmVo> listAll(MoldAdmVo moldAdmVo) throws Exception;

	//금형관리 상세조회
	public MoldAdmVo read(MoldAdmVo moldAdmVo) throws Exception;
	
	//금형관리 수정
	public void update(MoldAdmVo moldAdmVo) throws Exception;
	
	//금형관리 등록
	public void create(MoldAdmVo moldAdmVo) throws Exception;	
	
	//시퀀스 조회
	public String moldCdSeq() throws Exception;
	
	//이미지 경로 조회
	public MoldAdmVo moldImgRead(MoldAdmVo moldAdmVo) throws Exception;
	
	//이미지 등록
	public void moldImageUpload(MoldAdmVo moldAdmVo) throws Exception;	
			
}
