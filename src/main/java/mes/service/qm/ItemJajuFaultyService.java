package mes.service.qm;

import java.util.List;

import mes.domain.qm.ItemJajuFaultyVo;

public interface ItemJajuFaultyService {

	//부적합관리 목록조회
	public List<ItemJajuFaultyVo> itemJajuFaultyList(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception;
	
	//부적합관리 디테일 조회
	public List<ItemJajuFaultyVo> itemJajuFaultyDetailList(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception;
	
	//부적합관리 상세조회
	public ItemJajuFaultyVo itemJajuFaultyRead(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception;
	
	//부적합관리 등록
	public void itemJajuFaultyCreate(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception;
	
	//부적합관리 수정
	public void itemJajuFaultyUpdate(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception;
	
	//불량유형 목록가져오기
	public List<String> getFaultyTypeCd(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception;

	//부적합처리 시퀀스생성
	public Integer getJajuFaultySeq(ItemJajuFaultyVo itemJajuFaultyVo) throws Exception;
	
}