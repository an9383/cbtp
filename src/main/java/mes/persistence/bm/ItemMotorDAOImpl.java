package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.ItemMotorVo;
import mes.domain.bm.ItemPartAdmVo;

@Repository
public class ItemMotorDAOImpl implements ItemMotorDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.itemMotorMapper";
	// 품목정보관리(모터) 목록 조회
	@Override
	public List<ItemMotorVo> itemMotorList(ItemMotorVo itemMotorVo) throws Exception {
		return session.selectList(namespace+".itemMotorList" ,itemMotorVo );
	}

	// 품목정보관리(모터) 상세 조회
	@Override
	public ItemMotorVo itemMotorRead(ItemMotorVo itemMotorVo) throws Exception {
		return session.selectOne(namespace+".itemMotorRead", itemMotorVo);
	}

	// 품목정보관리(모터) 등록
	@Override
	public void itemMotorCreate(ItemMotorVo itemMotorVo) throws Exception {
		session.insert(namespace+".itemMotorCreate", itemMotorVo);
	}

	// 품목정보관리(모터) 수정
	@Override
	public void itemMotorUpdate(ItemMotorVo itemMotorVo) throws Exception {
		session.update(namespace+".itemMotorUpdate", itemMotorVo);
	}
	
	// 품목정보관리(모터) 중복확인
	@Override
	public Integer overlapItemCd(ItemMotorVo itemMotorVo) throws Exception {
		return session.selectOne(namespace+".overlapItemCd" ,itemMotorVo );
		
	}
	
	//제품명 검색(조건 : 작지번호)
	public String getItemNm(ItemMotorVo itemMotorVo) throws Exception{
		return session.selectOne(namespace+".getItemNm" , itemMotorVo);
	}

	
	//E - BOM
	
	// E-BOM 목록 조회
	public List<ItemMotorVo> itemMotorEBomList(ItemMotorVo itemMotorVo) throws Exception {
		return session.selectList(namespace+".itemMotorEBomList", itemMotorVo);
	}
	
	// E-BOM 등록
	public void itemMotorEBomCreate(ItemMotorVo itemMotorVo) throws Exception {
		session.insert(namespace+".itemMotorEBomCreate", itemMotorVo);
	}
	
	// E-BOM 전체 삭제
	public void itemMotorEBomDelete(ItemMotorVo itemMotorVo) throws Exception {
		session.delete(namespace+".itemMotorEBomDelete", itemMotorVo);
	}
	
	//구매자재관리(발주관리) 부품정보 팝업모달
	public List<ItemMotorVo> itemPartAllList(ItemMotorVo itemMotorVo) throws Exception{
		return session.selectList(namespace+".itemPartAllList",itemMotorVo);
	}
	
	
	//M - BOM
	
	// M-BOM 목록 조회
	@Override
	public List<ItemMotorVo> itemMotorMBomList(ItemMotorVo itemMotorVo) throws Exception {
		return session.selectList(namespace+".itemMotorMBomList", itemMotorVo);
	}
	
	// M-BOM 등록
	@Override
	public void itemMotorMBomCreate(ItemMotorVo itemMotorVo) throws Exception {
		session.insert(namespace+".itemMotorMBomCreate", itemMotorVo);
	}
	
	// M-BOM 수정
	public void itemMotorMBomUpdate(ItemMotorVo itemMotorVo) throws Exception{
		session.update(namespace +".itemMotorMBomUpdate",itemMotorVo);
	}
	
	// M-BOM 전체 삭제
	public void itemMotorMBomDelete(ItemMotorVo itemMotorVo) throws Exception {
		session.delete(namespace+".itemMotorMBomDelete", itemMotorVo);
	}
	
	// BOM-MAT 부품 중복검사
	public Integer overlapPartCd(ItemMotorVo itemMotorVo) throws Exception{
		return session.selectOne(namespace +".overlapPartCd" , itemMotorVo);
	}
	
	//모터 사진
	
	//이미지 경로 조회
	@Override
	public ItemMotorVo itemMotorImgRead(ItemMotorVo itemMotorVo) throws Exception {
		return session.selectOne(namespace+".itemMotorImgRead", itemMotorVo);
	}
	
	//이미지 등록
	@Override
	public void itemMotorImgUpload(ItemMotorVo itemMotorVo) throws Exception {
		session.update(namespace+".itemMotorImgUpload", itemMotorVo);
	}
	
	//불러오기 이미지 등록
	@Override
	public void itemMotorImgCallUpload(ItemMotorVo itemMotorVo) throws Exception {
		session.update(namespace+".itemMotorImgCallUpload", itemMotorVo);
	}

	//이미지 삭제
	public void itemMotorImgDelete(ItemMotorVo itemMotorVo) throws Exception{
		session.delete(namespace + ".itemMotorImgDelete",itemMotorVo);
	}
	
	
	// BOM - MAT
	
	// BOM-MAT 목록 조회
	public List<ItemMotorVo> itemBomMapRead(ItemMotorVo itemMotorVo) throws Exception{
		return session.selectList(namespace+".itemBomMapRead",itemMotorVo);
	}
	
	// BOM-MAT 등록
	public void itemBomMapCreate(ItemMotorVo itemMotorVo) throws Exception{
		session.insert(namespace +".itemBomMapCreate", itemMotorVo);
	}
	
	// BOM-MAT 수정
	public void itemBomMapUpdate(ItemMotorVo itemMotorVo) throws Exception{
		session.update(namespace+".itemBomMapUpdate" , itemMotorVo);
	}
	
	// BOM-MAT 삭제
	public void itemBomMapDelete(ItemMotorVo itemMotorVo) throws Exception{
		session.delete(namespace +".itemBomMapDelete",itemMotorVo);
	}
	
	//작업표준서
	
	//작업표준서 목록조회
	public List<ItemMotorVo> itemWorkStandardList(ItemMotorVo itemMotorVo) throws Exception{
		return session.selectList(namespace+".itemWorkStandardList" , itemMotorVo);
	}
	
	//작업표준서 상세조회
	public ItemMotorVo itemWorkStandardRead(ItemMotorVo itemMotorVo) throws Exception{
		return session.selectOne(namespace+".itemWorkStandardRead" , itemMotorVo);
	}
	
	//작업표준서 미리보기
	public ItemMotorVo itemWorkStandardPreView(ItemMotorVo itemMotorVo) throws Exception{
		return session.selectOne(namespace+".itemWorkStandardPreView" , itemMotorVo);
	}
	
	//작업표준서 등록 
	public void itemWorkStandardCreate(ItemMotorVo itemMotorVo) throws Exception{
		session.insert(namespace+".itemWorkStandardCreate" , itemMotorVo);
	}
	
	//불러오기 작업표준서 등록 
	public void itemWorkStandardCallCreate(ItemMotorVo itemMotorVo) throws Exception{
		session.insert(namespace+".itemWorkStandardCallCreate" , itemMotorVo);
	}
	
	//작업표준서 삭제
	public void itemWorkStandardDelete(ItemMotorVo itemMotorVo) throws Exception{
		session.delete(namespace+".itemWorkStandardDelete" , itemMotorVo);
	}
	
	//작업표준서 시퀀스 가져오기
	public String workStandardSeq(ItemMotorVo itemMotorVo) throws Exception{
		return session.selectOne(namespace+".workStandardSeq" , itemMotorVo);
	}
	
	
	
	//특주,사양서
	
	//특주,사양서 목록조회
	public List<ItemMotorVo> itemMotorFileList(ItemMotorVo itemMotorVo) throws Exception{
		return session.selectList(namespace+".itemMotorFileList" ,itemMotorVo);
	}
	
	//특주,사양서 상세조회
	public ItemMotorVo itemMotorFileRead(ItemMotorVo itemMotorVo) throws Exception{
		return session.selectOne(namespace+".itemMotorFileRead",itemMotorVo);
	}
	//특주,사양서 등록
	public void itemMotorFileCreate(ItemMotorVo itemMotorVo) throws Exception{
		session.insert(namespace+".itemMotorFileCreate" ,itemMotorVo );
	}
	
	//특주,사양서 수정
	public void itemMotorFileDelete(ItemMotorVo itemMotorVo) throws Exception{
		session.delete(namespace+".itemMotorFileDelete" ,itemMotorVo );
	}
	
	//특주,사양서 시퀀스
	public String itemMotorFileSeq(ItemMotorVo itemMotorVo) throws Exception{
		return session.selectOne(namespace+".itemMotorFileSeq" ,itemMotorVo );
	}
	
	// 시퀀스
	
	//코드시퀀스 조회
	@Override
	public String itemMotorSeq() throws Exception {
		return session.selectOne(namespace+".itemMotorSeq");
	}
	
	//revision시퀀스 조회
	@Override
	public String itemMotorRevSeq(ItemMotorVo itemMotorVo) throws Exception {
		return session.selectOne(namespace+".itemMotorRevSeq", itemMotorVo);
	}

	
	//작업지시선택 - 자재투입내역
	// 자재투입내역 리스트 조회
	@Override
	public List<ItemMotorVo> workOrderMatrlRead(ItemMotorVo itemMotorVo) throws Exception {
		return session.selectList(namespace+".workOrderMatrlRead", itemMotorVo);
	}
	
	//자재출고 BOM조회
	public List<ItemMotorVo> itemMotorEBomOutList(ItemMotorVo itemMotorVo) throws Exception{
		return session.selectList(namespace+".itemMotorEBomOutList" ,itemMotorVo );
	}
} 
