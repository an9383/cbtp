package mes.persistence.bm;

import java.util.List;

import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.bm.ItemPartAdmVo;

public interface ItemPartAdmDAO {
	
	//품목정보관리(부품) 목록조회
	public List<ItemPartAdmVo> itemPartAdmList(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//색상 목록조회
	public List<ItemPartAdmVo> itemColorList(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//품목정보관리(부품) 상세조회
	public ItemPartAdmVo itemPartDtlList(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//품목정보관리(부품)	등록
	public int itemPartAdmCreate(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//단가이력	등록
	public void itemCostListCreate(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//단가이력 삭제
	public void itemPartCostDataDelete(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//출고단가적용일 기준 출고단가 값 가져오기
	public String getExportCost(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//품목정보관리(부품)	수정
	public int itemPartAdmUpdate(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//변경사유	수정
	public void itemReasonCreate(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//partCd값 가져오기
	//public String getPartCd() throws Exception;
	
	//partCd값 중복확인
	public Integer overlapPartCd(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//partRev값 가져오기
	public ItemPartAdmVo getPartRev(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//자재단가 수정
	public void updateUnitCost(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	
	//수입검사기준서
	
	//부품수입검사기준서 조회
	public List<ItemPartAdmVo> itemPartInspectList(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//부품수입검사기준서 상세조회
	public ItemPartAdmVo itemPartInspectRead(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//부품수입검사기준서	등록
	public int itemPartInspectCreate(ItemPartAdmVo itemPartAdmVo) throws Exception;
		
	//부품수입검사기준서 삭제
	public int itemPartInspectDelete(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//partSeq값 가져오기
	public int getInspectPartSeq(ItemPartAdmVo itemPartAdmVo)throws Exception;
	
	//파일명 가져오기
	public String getFileNm(ItemPartAdmVo itemPartAdmVo)throws Exception;
	
	//등록자 가져오기
	public String getUserNm(ItemPartAdmVo itemPartAdmVo)throws Exception;
	
	
	
	
	//관련자료
	
	//부품수입검사기준서 조회
	public List<ItemPartAdmVo> itemPartAttachDataList(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//부품수입검사기준서	등록
	public int itemPartAttachDataCreate(ItemPartAdmVo itemPartAdmVo) throws Exception;
		
	//관련자료 삭제
	public void itemPartAttachDataDelete(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//partSeq값 가져오기
	public String getAttachPartSeq(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//단가이력 Seq값 가져오기
	public String getItemCostSeq(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//파일명 가져오기
	public String getAttachFileNm(ItemPartAdmVo itemPartAdmVo) throws Exception;
	

	//제품내역 조회
	public List<ItemPartAdmVo> itemInformationList(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//Seq값 가져오기
	public String getItemCdSeq() throws Exception;
	
	//삭제
	public void itemInfoAdmDelete(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	
	//개발관리
	//BOM 조회
	public List<ItemPartAdmVo> itemMotorEbomList(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//BOM 중복 조회
	public List<ItemPartAdmVo> ebomOverlapList(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//BOM 상세조회
	public ItemPartAdmVo itemMotorEbomRead(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//BOM 등록
	public void itemMotorEbomCreate(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//BOM 수정
	public void itemMotorEbomUpdate(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//BOM 삭제
	public void itemMotorEbomDelete(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//이미지 등록
	public void itemInfoImageUpload(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//이미지 삭제
	public void itemInfoImageDelete(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//이미지 경로 조회
	public ItemPartAdmVo itemInfoImageRead(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//원단위관리
	//기준정보
	public List<ItemPartAdmVo> basicInfoList(ItemPartAdmVo itemPartAdmVo) throws Exception;
	
	//원단위 정보
	public List<ItemPartAdmVo> wonUnitList(ItemPartAdmVo itemPartAdmVo) throws Exception;
}
