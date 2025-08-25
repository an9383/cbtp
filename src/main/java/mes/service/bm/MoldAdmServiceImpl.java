package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.MoldAdmVo;
import mes.persistence.bm.MoldAdmDAO;


@Service
public class MoldAdmServiceImpl implements MoldAdmService {
	@Inject
	private MoldAdmDAO dao;

	//금형관리 목록조회
	@Override
	public List<MoldAdmVo> listAll(MoldAdmVo moldAdmVo) throws Exception{
		return dao.listAll(moldAdmVo);
	}

	//금형관리 상세조회
	@Override
	public MoldAdmVo read(MoldAdmVo moldAdmVo) throws Exception{
		return dao.read(moldAdmVo);
	}
	
	//금형관리 수정
	@Override
	public void update(MoldAdmVo moldAdmVo) throws Exception{
		dao.update(moldAdmVo);
	}
	
	//금형관리 등록
	@Override
	public void create(MoldAdmVo moldAdmVo) throws Exception{
		dao.create(moldAdmVo);
	}
	
	//시퀀스 조회
	@Override
	public String moldCdSeq() throws Exception{
		return dao.moldCdSeq();
	}
	
	//이미지 경로 조회
	@Override
	public MoldAdmVo moldImgRead(MoldAdmVo moldAdmVo) throws Exception{
		return dao.moldImgRead(moldAdmVo);
	}
	
	//이미지 등록
	@Override
	public void moldImageUpload(MoldAdmVo moldAdmVo) throws Exception{
		dao.moldImageUpload(moldAdmVo);
	}
}
