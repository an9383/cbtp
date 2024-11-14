package mes.service.qm;

import java.util.List;

import mes.domain.qm.ItemMoisMeasureAdmVo;

public interface ItemMoisMeasureAdmService {

	//수분측정 목록조회
	public List<ItemMoisMeasureAdmVo> itemMoisMeasureList(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception;

	//수분측정 상세목록조회
	public List<ItemMoisMeasureAdmVo> itemMoisMeasureDtlList(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception;

	
	//수분측정 상세조회
	public ItemMoisMeasureAdmVo itemMoisMeasureRead(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception;

	//수분측정 등록
	public void itemMoisMeasureCreate(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception;

	//수분측정 수정
	public void itemMoisMeasureUpdate(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception;

	//수분측정 삭제
	public void itemMoisMeasureDelete(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception;
	
	//수분측정 시퀀스 생성
	public int getMoisSeq(ItemMoisMeasureAdmVo itemMoisMeasureAdmVo) throws Exception;

}
