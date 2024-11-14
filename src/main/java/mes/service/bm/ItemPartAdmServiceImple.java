package mes.service.bm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.persistence.bm.ItemPartAdmDAO;

@Service
public class ItemPartAdmServiceImple implements ItemPartAdmService {

	@Inject
	private ItemPartAdmDAO dao;
	
	//품목정보관리(부품) 목록조회
	@Override
	public List<ItemPartAdmVo> itemPartAdmList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.itemPartAdmList(itemPartAdmVo);
	}
	
	//색상 목록조회
	@Override
	public List<ItemPartAdmVo> itemColorList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.itemColorList(itemPartAdmVo);
	}
	
	//품목정보관리(부품) 상세조회
	@Override
	public ItemPartAdmVo itemPartDtlList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.itemPartDtlList(itemPartAdmVo);
	}

	//품목정보관리(부품)	등록
	@Override
	public int itemPartAdmCreate(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.itemPartAdmCreate(itemPartAdmVo);
	}
	
	//단가이력	등록
	@Override
	public void itemCostListCreate(ItemPartAdmVo itemPartAdmVo) throws Exception {
		dao.itemCostListCreate(itemPartAdmVo);
	}
	
	//단가이력 삭제
	@Override
	public void itemPartCostDataDelete(ItemPartAdmVo itemPartAdmVo) throws Exception {
		dao.itemPartCostDataDelete(itemPartAdmVo);
	}
	
	//출고단가적용일 기준 출고단가 값 가져오기
	public String getExportCost(ItemPartAdmVo itemPartAdmVo) throws Exception{
		return dao.getExportCost(itemPartAdmVo);
	}
	
	//품목정보관리(부품)	수정
	@Override
	public int itemPartAdmUpdate(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.itemPartAdmUpdate(itemPartAdmVo);
	}
	
	//변경사유	수정
	@Override
	public void itemReasonCreate(ItemPartAdmVo itemPartAdmVo) throws Exception {
		dao.itemReasonCreate(itemPartAdmVo);
	}

	//partCd값 가져오기
	/*
	 * @Override public String getPartCd() throws Exception { return
	 * dao.getPartCd(); }
	 */
	
	//partCd값 중복확인
	@Override
	public Integer overlapPartCd(ItemPartAdmVo itemPartAdmVo) throws Exception{
		return dao.overlapPartCd(itemPartAdmVo);
	}
	
	//partRev값 가져오기
	@Override
	public ItemPartAdmVo getPartRev(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.getPartRev(itemPartAdmVo);
	}

	//자재단가 수정
	@Override
	public void updateUnitCost(ItemPartAdmVo itemPartAdmVo) throws Exception{
		dao.updateUnitCost(itemPartAdmVo);
	}
	
	
	
	
	//수입검사기준서
	
	//부품수입검사기준서 조회
	@Override
	public List<ItemPartAdmVo> itemPartInspectList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.itemPartInspectList(itemPartAdmVo);
	}
	
	//부품수입검사기준서 상세조회
	@Override
	public ItemPartAdmVo itemPartInspectRead(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.itemPartInspectRead(itemPartAdmVo);
	}
	
	//부품수입검사기준서	등록
	@Override
	public int itemPartInspectCreate(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.itemPartInspectCreate(itemPartAdmVo);
	}
	
	//부품수입검사기준서 삭제
	@Override
	public int itemPartInspectDelete(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.itemPartInspectDelete(itemPartAdmVo);
	}
	
		
	//partSeq값 가져오기
	@Override
	public int getInspectPartSeq(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.getInspectPartSeq(itemPartAdmVo);
	}
	
	//파일명 가져오기
	@Override
	public String getFileNm(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.getFileNm(itemPartAdmVo);
	}
	
	//등록자 가져오기
	@Override
	public String getUserNm(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.getUserNm(itemPartAdmVo);
	}
	
	
	//관련자료
	
	//부품수입검사기준서 조회
	@Override
	public List<ItemPartAdmVo> itemPartAttachDataList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.itemPartAttachDataList(itemPartAdmVo);
	}
	
	//부품수입검사기준서	등록
	@Override
	public int itemPartAttachDataCreate(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.itemPartAttachDataCreate(itemPartAdmVo);
	}
	
	//관련자료 삭제
	@Override
	public void itemPartAttachDataDelete(ItemPartAdmVo itemPartAdmVo) throws Exception {
		dao.itemPartAttachDataDelete(itemPartAdmVo);
	}
	
	//partSeq값 가져오기
	@Override
	public String getAttachPartSeq(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.getAttachPartSeq(itemPartAdmVo);
	}
	
	//단가이력 Seq값 가져오기
	@Override
	public String getItemCostSeq(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.getItemCostSeq(itemPartAdmVo);
	}
	
	//파일명 가져오기
	@Override
	public String getAttachFileNm(ItemPartAdmVo itemPartAdmVo)throws Exception{
		return dao.getAttachFileNm(itemPartAdmVo);
	}
	
	//제품내역 조회
	@Override
	public List<ItemPartAdmVo> itemInformationList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return dao.itemInformationList(itemPartAdmVo);
	}
	
	//Seq값 가져오기
	@Override
	public String getItemCdSeq() throws Exception {
		return dao.getItemCdSeq();
	}
	
	//삭제
	@Override
	public void itemInfoAdmDelete(ItemPartAdmVo itemPartAdmVo) throws Exception{
		dao.itemInfoAdmDelete(itemPartAdmVo);
	}
	
	//개발관리
	//BOM 조회
	@Override
	public List<ItemPartAdmVo> itemMotorEbomList(ItemPartAdmVo itemPartAdmVo) throws Exception{
		return dao.itemMotorEbomList(itemPartAdmVo);
	}
	
	//BOM 중복 조회
	@Override
	public List<ItemPartAdmVo> ebomOverlapList(ItemPartAdmVo itemPartAdmVo) throws Exception{
		return dao.ebomOverlapList(itemPartAdmVo);
	}
	
	
	//BOM 상세조회
	@Override
	public ItemPartAdmVo itemMotorEbomRead(ItemPartAdmVo itemPartAdmVo) throws Exception{
		return dao.itemMotorEbomRead(itemPartAdmVo);
	}
	
	//BOM 등록
	@Override
	public void itemMotorEbomCreate(ItemPartAdmVo itemPartAdmVo) throws Exception{
		dao.itemMotorEbomCreate(itemPartAdmVo);
	}
	
	//BOM 수정
	@Override
	public void itemMotorEbomUpdate(ItemPartAdmVo itemPartAdmVo) throws Exception{
		dao.itemMotorEbomUpdate(itemPartAdmVo);
	}
	
	//BOM 삭제
	@Override
	public void itemMotorEbomDelete(ItemPartAdmVo itemPartAdmVo) throws Exception{
		dao.itemMotorEbomDelete(itemPartAdmVo);
	}
	
	//이미지 등록
	@Override
	public void itemInfoImageUpload(ItemPartAdmVo itemPartAdmVo) throws Exception {
		dao.itemInfoImageUpload(itemPartAdmVo);
	}
	
	//이미지 삭제
	@Override
	public void itemInfoImageDelete(ItemPartAdmVo itemPartAdmVo) throws Exception{
		dao.itemInfoImageDelete(itemPartAdmVo);
	}
	
	//이미지 경로 조회
	@Override
	public ItemPartAdmVo itemInfoImageRead(ItemPartAdmVo itemPartAdmVo) throws Exception{
		return dao.itemInfoImageRead(itemPartAdmVo);
	}
	
	//원단위관리
	//기준정보
	public List<ItemPartAdmVo> basicInfoList(ItemPartAdmVo itemPartAdmVo) throws Exception{
		return dao.basicInfoList(itemPartAdmVo);
	}
	
	//원단위 정보
	public List<ItemPartAdmVo> wonUnitList(ItemPartAdmVo itemPartAdmVo) throws Exception{
		return dao.wonUnitList(itemPartAdmVo);
	}
	
}
