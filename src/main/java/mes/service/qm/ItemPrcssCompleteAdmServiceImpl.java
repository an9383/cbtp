package mes.service.qm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.qm.ItemPrcssCompleteAdmVo;
import mes.persistence.qm.ItemPrcssCompleteAdmDAO;

@Service
public class ItemPrcssCompleteAdmServiceImpl implements ItemPrcssCompleteAdmService {

	@Inject
	private ItemPrcssCompleteAdmDAO dao;
	
	// 공정검사 목록조회
	@Override
	public List<ItemPrcssCompleteAdmVo> listAll(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		return dao.listAll(itemPrcssCompleteAdmVo);
	}
	
	// 공정검사 목록조회(봉제)
	public List<ItemPrcssCompleteAdmVo> listAllByBongjae(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		return dao.listAllByBongjae(itemPrcssCompleteAdmVo);
	}
	
	// 공정검사 상세조회
	@Override
	public ItemPrcssCompleteAdmVo read(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		return dao.read(itemPrcssCompleteAdmVo);
	}
	
	// 공정검사 생성
	@Override
	public void create(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		dao.create(itemPrcssCompleteAdmVo);
	}
	
	// 공정검사 수정
	@Override
	public void update(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		dao.update(itemPrcssCompleteAdmVo);
	}
	
	// 공정검사 삭제
	@Override
	public void delete(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		dao.delete(itemPrcssCompleteAdmVo);
	}
	
	// 공정검사 원재료 목록조회
	@Override
	public List<ItemPrcssCompleteAdmVo> matrlList(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		return dao.matrlList(itemPrcssCompleteAdmVo);
	}
	
	// 자주검사 목록조회
	@Override
	public List<ItemPrcssCompleteAdmVo> jajuList(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		return dao.jajuList(itemPrcssCompleteAdmVo);
	}
	
	// 기간별 검사결과 조회(자주검사/공정검사) 목록조회
	@Override
	public List<ItemPrcssCompleteAdmVo> testResultList(ItemPrcssCompleteAdmVo itemPrcssCompleteAdmVo) throws Exception{
		return dao.testResultList(itemPrcssCompleteAdmVo);
	}
}
