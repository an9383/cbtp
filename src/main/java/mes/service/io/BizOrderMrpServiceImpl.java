package mes.service.io;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.io.BizOrderMrpVo;
import mes.persistence.io.BizOrderMrpDAO;

@Service
public class BizOrderMrpServiceImpl implements BizOrderMrpService {

	@Inject
	private BizOrderMrpDAO dao;
	
	//소요량코드 조회
	@Override
	public List<BizOrderMrpVo> listAll(BizOrderMrpVo bizOrderMrpVo) throws Exception{
		return dao.listAll(bizOrderMrpVo);
	}
	//소요량코드 상세 조회
	@Override
	public BizOrderMrpVo read(BizOrderMrpVo bizOrderMrpVo) throws Exception{
		return dao.read(bizOrderMrpVo);
	}
			
	//소요량코드 등록
	@Override
	public void create(BizOrderMrpVo bizOrderMrpVo) throws Exception{
		dao.create(bizOrderMrpVo);
	}
	
	//소요량코드 수정
	@Override
	public void update(BizOrderMrpVo bizOrderMrpVo) throws Exception{
		dao.update(bizOrderMrpVo);
	}
	
	//소요량코드 삭제
	public void delete(BizOrderMrpVo bizOrderMrpVo) throws Exception{
		dao.delete(bizOrderMrpVo);
	}
	
	//소요량코드 시퀀스 생성
	@Override
	public int seq(String date) throws Exception{
		return dao.seq(date);
	}
	
	//소요량코드 생성
	@Override
	public int mrpSeq() throws Exception{
		return dao.mrpSeq();
	}	
	
	//소요량코드 확정
	@Override
	public void updateStatus(BizOrderMrpVo bizOrderMrpVo) throws Exception{
		dao.updateStatus(bizOrderMrpVo);
	}
	
	//소요량코드 대비 발주존재여부 확인 
	public int getPurchaseExist(BizOrderMrpVo bizOrderMrpVo) throws Exception{
		return dao.getPurchaseExist(bizOrderMrpVo);
	}


}
