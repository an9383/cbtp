package mes.persistence.io;

import java.util.List;

import mes.domain.io.BizOrderMrpVo;

public interface BizOrderMrpDAO {

	//소요량코드 조회
	public List<BizOrderMrpVo> listAll(BizOrderMrpVo bizOrderMrpVo) throws Exception;
	
	//소요량코드 상세 조회
	public BizOrderMrpVo read(BizOrderMrpVo bizOrderMrpVo) throws Exception;
			
	//소요량코드 등록
	public void create(BizOrderMrpVo bizOrderMrpVo) throws Exception;
	
	//소요량코드 수정
	public void update(BizOrderMrpVo bizOrderMrpVo) throws Exception;

	//소요량코드 삭제
	public void delete(BizOrderMrpVo bizOrderMrpVo) throws Exception;
	
	//소요량코드 시퀀스 생성
	public int seq(String date) throws Exception;
	
	//소요량코드 생성
	public int mrpSeq() throws Exception;
	
	//소요량코드 확정
	public void updateStatus(BizOrderMrpVo bizOrderMrpVo) throws Exception;
	
	//소요량코드 대비 발주존재여부 확인 
	public int getPurchaseExist(BizOrderMrpVo bizOrderMrpVo) throws Exception;

}
