package mes.persistence.bm;

import java.util.List;

import mes.domain.bm.ItemMotorVo;
import mes.domain.bm.ItemPartAdmVo;
import mes.domain.bm.MeasureInstrmtAdmVo;

public interface ItemMotorDAO {
	
	// 품목정보관리(모터) 목록 조회
	public List<ItemMotorVo> itemMotorList(ItemMotorVo itemMotorVo) throws Exception;

	// 품목정보관리(모터) 상세 조회
	public ItemMotorVo itemMotorRead(ItemMotorVo itemMotorVo) throws Exception;

	// 품목정보관리(모터) 등록
	public void itemMotorCreate(ItemMotorVo itemMotorVo) throws Exception;

	// 품목정보관리(모터) 수정
	public void itemMotorUpdate(ItemMotorVo itemMotorVo) throws Exception;
	
	// 품목정보관리(모터) 중복확인
	public Integer overlapItemCd(ItemMotorVo itemMotorVo) throws Exception;
	
	//제품명 검색(조건 : 작지번호)
	public String getItemNm(ItemMotorVo itemMotorVo) throws Exception;
	
	// E - BOM
	
	// E-BOM 목록 조회
	public List<ItemMotorVo> itemMotorEBomList(ItemMotorVo itemMotorVo) throws Exception;
	
	// E-BOM 등록
	public void itemMotorEBomCreate(ItemMotorVo itemMotorVo) throws Exception;
	
	// E-BOM 전체 삭제
	public void itemMotorEBomDelete(ItemMotorVo itemMotorVo) throws Exception;
	
	//구매자재관리(발주관리) 부품정보 팝업모달
	public List<ItemMotorVo> itemPartAllList(ItemMotorVo itemMotorVo) throws Exception;
	
	
	// M - BOM
	
	// M-BOM 목록 조회
	public List<ItemMotorVo> itemMotorMBomList(ItemMotorVo itemMotorVo) throws Exception;
	
	// M-BOM 등록
	public void itemMotorMBomCreate(ItemMotorVo itemMotorVo) throws Exception;
	
	// M-BOM 수정
	public void itemMotorMBomUpdate(ItemMotorVo itemMotorVo) throws Exception;
	
	// M-BOM 전체 삭제
	public void itemMotorMBomDelete(ItemMotorVo itemMotorVo) throws Exception;
	
	
	// 모터 사진
	
	//모터 이미지 경로 조회
	public ItemMotorVo itemMotorImgRead(ItemMotorVo itemMotorVo) throws Exception;
	
	//이미지 등록
	public void itemMotorImgUpload(ItemMotorVo itemMotorVo) throws Exception;
	
	//불러오기 이미지 등록
	public void itemMotorImgCallUpload(ItemMotorVo itemMotorVo) throws Exception;
	
	//이미지 삭제
	public void itemMotorImgDelete(ItemMotorVo itemMotorVo) throws Exception;
	
	// BOM - MAT
	
	// BOM-MAT 목록 조회
	public List<ItemMotorVo> itemBomMapRead(ItemMotorVo itemMotorVo) throws Exception;
	
	// BOM-MAT 등록
	public void itemBomMapCreate(ItemMotorVo itemMotorVo) throws Exception;
	
	// BOM-MAT 수정
	public void itemBomMapUpdate(ItemMotorVo itemMotorVo) throws Exception;
	
	// BOM-MAT 삭제
	public void itemBomMapDelete(ItemMotorVo itemMotorVo) throws Exception;
	
	// BOM-MAT 부품 중복검사
	public Integer overlapPartCd(ItemMotorVo itemMotorVo) throws Exception;
	
	
	//작업표준서
	
	//작업표준서 목록조회
	public List<ItemMotorVo> itemWorkStandardList(ItemMotorVo itemMotorVo) throws Exception;
	
	//작업표준서 상세조회
	public ItemMotorVo itemWorkStandardRead(ItemMotorVo itemMotorVo) throws Exception;
	
	//작업표준서 미리보기
	public ItemMotorVo itemWorkStandardPreView(ItemMotorVo itemMotorVo) throws Exception;
		
	//작업표준서 등록 
	public void itemWorkStandardCreate(ItemMotorVo itemMotorVo) throws Exception;
	
	//불러오기 작업표준서 등록 
	public void itemWorkStandardCallCreate(ItemMotorVo itemMotorVo) throws Exception;
	
	//작업표준서 삭제
	public void itemWorkStandardDelete(ItemMotorVo itemMotorVo) throws Exception;
	
	//작업표준서 시퀀스 가져오기
	public String workStandardSeq(ItemMotorVo itemMotorVo) throws Exception;
		
		
	//자재출고 BOM조회
	public List<ItemMotorVo> itemMotorEBomOutList(ItemMotorVo itemMotorVo) throws Exception;
	
	
	//특주,사양서
	
	//특주,사양서 목록조회
	public List<ItemMotorVo> itemMotorFileList(ItemMotorVo itemMotorVo) throws Exception;
	
	//특주,사양서 상세조회
	public ItemMotorVo itemMotorFileRead(ItemMotorVo itemMotorVo) throws Exception;
	
	//특주,사양서 등록
	public void itemMotorFileCreate(ItemMotorVo itemMotorVo) throws Exception;
	
	//특주,사양서 수정
	public void itemMotorFileDelete(ItemMotorVo itemMotorVo) throws Exception;
	
	//특주,사양서 시퀀스
	public String itemMotorFileSeq(ItemMotorVo itemMotorVo) throws Exception;
	
	// 시퀀스
	
	//코드시퀀스 조회
	public String itemMotorSeq() throws Exception;
	
	//revision시퀀스 조회
	public String itemMotorRevSeq(ItemMotorVo itemMotorVo) throws Exception;
	
	
	//작업지시선택 - 자재투입내역
	// 자재투입내역 리스트 조회
	public List<ItemMotorVo> workOrderMatrlRead(ItemMotorVo itemMotorVo) throws Exception;
} 
