package mes.service.wm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.wm.ItemWhsAdmVo;
import mes.persistence.wm.ItemWhsAdmDAO;

@Service
public class ItemWhsAdmServiceImpl implements ItemWhsAdmService {

	@Inject
	private ItemWhsAdmDAO dao;
	
	//제품입고 목록조회
	public List<ItemWhsAdmVo> itemWhsAdmList(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return dao.itemWhsAdmList(itemWhsAdmVo);
	}
	
	//제품입고 상세조회
	public ItemWhsAdmVo itemWhsAdmRead(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return dao.itemWhsAdmRead(itemWhsAdmVo);
	}
	
	//제품입고 등록
	public void itemWhsAdmCreate(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		dao.itemWhsAdmCreate(itemWhsAdmVo);
	}
	
	//제품입고 수정
	public void itemWhsAdmUpdate(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		dao.itemWhsAdmUpdate(itemWhsAdmVo);
	}
	
	//제품입고 삭제
	public void itemOutWhsDelete(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		dao.itemOutWhsDelete(itemWhsAdmVo);
	}
	
	//제품출고 수정
	public void itemOutWhsAdmUpdate(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		dao.itemOutWhsAdmUpdate(itemWhsAdmVo);
	}
	
	//제품출고 초기화
	public void itemOutWhsResetUpdate(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		dao.itemOutWhsResetUpdate(itemWhsAdmVo);
	}
	
	
	//제품입고 창고목록 가져오기
	public List<ItemWhsAdmVo> getInLoc(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return dao.getInLoc(itemWhsAdmVo);
	}
	
	//제품입고 구역목록 가져오기
	public List<ItemWhsAdmVo> getInArea(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return dao.getInArea(itemWhsAdmVo);
	}
	
	//제품입고 구역목록 가져오기
	public List<ItemWhsAdmVo> getInFloor(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return dao.getInFloor(itemWhsAdmVo);
	}
	
	//제품바코드 유무확인
	public int itemBarcodeNoCheck(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return dao.itemBarcodeNoCheck(itemWhsAdmVo);
	}
	
	//제품입고 유무확인
	public int existItemWhsAdm(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return dao.existItemWhsAdm(itemWhsAdmVo);
	}
	
	//수주상세등록 잔여수량, 완료수량 수정
	public void bizOrdDtlUpdate(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		dao.bizOrdDtlUpdate(itemWhsAdmVo);
	}
	
	//제품입고 창고정보
	public ItemWhsAdmVo getLocInfo(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return dao.getLocInfo(itemWhsAdmVo);
	}
	
	
	
	//출하현황 목록조회 
	public List<ItemWhsAdmVo> itemWhsOutList(ItemWhsAdmVo itemWhsAdmVo) throws Exception{
		return dao.itemWhsOutList(itemWhsAdmVo);
	}
}
