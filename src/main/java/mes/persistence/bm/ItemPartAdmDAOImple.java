package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.bm.ItemPartAdmVo;

@Repository
public class ItemPartAdmDAOImple implements ItemPartAdmDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.itemPartAdmMapper";
	
	//품목정보관리(부품) 목록조회
	@Override
	public List<ItemPartAdmVo> itemPartAdmList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return session.selectList(namespace +".itemPartAdmList", itemPartAdmVo);
	}
	
	//색상 목록조회
	@Override
	public List<ItemPartAdmVo> itemColorList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return session.selectList(namespace +".itemColorList", itemPartAdmVo);
	}
	
	//품목정보관리(부품) 상세조회
	@Override
	public ItemPartAdmVo itemPartDtlList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return session.selectOne(namespace + ".itemPartDtlList" , itemPartAdmVo);
	}
	
	//품목정보관리(부품)	등록
	@Override
	public int itemPartAdmCreate(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return session.insert(namespace + ".itemPartAdmCreate", itemPartAdmVo);
	}
	
	//단가이력	등록
	@Override
	public void itemCostListCreate(ItemPartAdmVo itemPartAdmVo) throws Exception {
		session.insert(namespace + ".itemCostListCreate", itemPartAdmVo);
	}
	
	//단가이력 삭제
	  //단가이력	삭제
    @Override
    public void itemPartCostDataDelete(ItemPartAdmVo itemPartAdmVo) throws Exception {
    	session.delete(namespace + ".itemPartCostDataDelete" , itemPartAdmVo);
    }
	
	//출고단가적용일 기준 출고단가 값 가져오기
	public String getExportCost(ItemPartAdmVo itemPartAdmVo) throws Exception{
		return session.selectOne(namespace+".getExportCost" , itemPartAdmVo);
	}

	//품목정보관리(부품)	수정
	@Override
	public int itemPartAdmUpdate(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return session.update(namespace +".itemPartAdmUpdate", itemPartAdmVo);
	}
	
	//변경사유	수정
	@Override
	public void itemReasonCreate(ItemPartAdmVo itemPartAdmVo) throws Exception {
		session.update(namespace +".itemReasonCreate", itemPartAdmVo);
	}

	//partCd값 가져오기
	/*
	 * @Override public String getPartCd() throws Exception { return
	 * session.selectOne(namespace + ".getPartCd"); }
	 */
	
	//partCd값 중복확인
	@Override
	public Integer overlapPartCd(ItemPartAdmVo itemPartAdmVo) throws Exception{
		return session.selectOne(namespace +".overlapPartCd", itemPartAdmVo);
	}
	
	//partRev값 가져오기
	@Override
	public ItemPartAdmVo getPartRev(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return session.selectOne(namespace + ".getPartRev" , itemPartAdmVo);
	}
	
	//자재단가 수정
	@Override
	public void updateUnitCost(ItemPartAdmVo itemPartAdmVo) throws Exception{
		session.update(namespace+".updateUnitCost" ,itemPartAdmVo );
	}
	
	
	//수입검사기준서
	
	//부품수입검사기준서 조회
	@Override
	public List<ItemPartAdmVo> itemPartInspectList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return session.selectList(namespace + ".itemPartInspectList" ,itemPartAdmVo);
	}
	
	//부품수입검사기준서 상세조회
	@Override
	public ItemPartAdmVo itemPartInspectRead(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return session.selectOne(namespace + ".itemPartInspectRead" , itemPartAdmVo);
	}
	
	//부품수입검사기준서	등록
	@Override
	public int itemPartInspectCreate(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return session.insert(namespace + ".itemPartInspectCreate", itemPartAdmVo);
	}
	
	//부품수입검사기준서 삭제
	@Override
	public int itemPartInspectDelete(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return session.delete(namespace + ".itemPartInspectDelete" , itemPartAdmVo);
	}
	
	//partSeq값 가져오기
	@Override
	public int getInspectPartSeq(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return session.selectOne(namespace + ".getInspectPartSeq" ,itemPartAdmVo);
	}
	
	//파일명 가져오기
	@Override
	public String getFileNm(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return session.selectOne(namespace + ".getFileNm", itemPartAdmVo);
	}
	
	//등록자 가져오기
	@Override
	public String getUserNm(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return session.selectOne(namespace + ".getUserNm", itemPartAdmVo);
	}
		
	
	
	//관련자료
	
	//관련자료	조회
	@Override
	public List<ItemPartAdmVo> itemPartAttachDataList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return session.selectList(namespace +".itemPartAttachDataList",itemPartAdmVo);
	}
	
	//관련자료	등록
    @Override
    public int itemPartAttachDataCreate(ItemPartAdmVo itemPartAdmVo) throws Exception {
    	return session.insert(namespace + ".itemPartAttachDataCreate", itemPartAdmVo);
    }
    
    //관련자료	삭제
    @Override
    public void itemPartAttachDataDelete(ItemPartAdmVo itemPartAdmVo) throws Exception {
    	session.delete(namespace + ".itemPartAttachDataDelete" , itemPartAdmVo);
    }
    
    @Override
    public String getAttachPartSeq(ItemPartAdmVo itemPartAdmVo) throws Exception {
    	return session.selectOne(namespace + ".getAttachPartSeq" ,itemPartAdmVo);
    }
    
    @Override
    public String getItemCostSeq(ItemPartAdmVo itemPartAdmVo) throws Exception {
    	return session.selectOne(namespace + ".getItemCostSeq" ,itemPartAdmVo);
    }
    
	//파일명 가져오기
    @Override
	public String getAttachFileNm(ItemPartAdmVo itemPartAdmVo)throws Exception{
		return session.selectOne(namespace+".getAttachFileNm" ,itemPartAdmVo );
	}
	
	
	//제품내역	조회
	@Override
	public List<ItemPartAdmVo> itemInformationList(ItemPartAdmVo itemPartAdmVo) throws Exception {
		return session.selectList(namespace +".itemInformationList",itemPartAdmVo);
	}
	
	//seq값 가져오기
    @Override
    public String getItemCdSeq() throws Exception {
    	return session.selectOne(namespace + ".getItemCdSeq");
    }
    
	//삭제
	@Override
	public void itemInfoAdmDelete(ItemPartAdmVo itemPartAdmVo) throws Exception {
		session.insert(namespace + ".itemInfoAdmDelete", itemPartAdmVo);
	}
	
	//개발관리
	//BOM 조회
	@Override
	public List<ItemPartAdmVo> itemMotorEbomList(ItemPartAdmVo itemPartAdmVo) throws Exception{
		return session.selectList(namespace+".itemMotorEbomList" , itemPartAdmVo);
	}
	
	//BOM 중복 조회
	public List<ItemPartAdmVo> ebomOverlapList(ItemPartAdmVo itemPartAdmVo) throws Exception{
		return session.selectList(namespace+".ebomOverlapList" ,itemPartAdmVo );
	}
	
	//BOM 상세조회
	@Override
	public ItemPartAdmVo itemMotorEbomRead(ItemPartAdmVo itemPartAdmVo) throws Exception{
		return session.selectOne(namespace+".itemMotorEbomRead" , itemPartAdmVo);
	}
	
	//BOM 등록
	@Override
	public void itemMotorEbomCreate(ItemPartAdmVo itemPartAdmVo) throws Exception{
		session.insert(namespace+".itemMotorEbomCreate" ,itemPartAdmVo );
	}
	
	//BOM 수정
	@Override
	public void itemMotorEbomUpdate(ItemPartAdmVo itemPartAdmVo) throws Exception{
		session.update(namespace+".itemMotorEbomUpdate" ,itemPartAdmVo );
	}
	
	//BOM 삭제
	@Override
	public void itemMotorEbomDelete(ItemPartAdmVo itemPartAdmVo) throws Exception{
		session.delete(namespace+".itemMotorEbomDelete",itemPartAdmVo);
	}
	
	//이미지 등록
	@Override
	public void itemInfoImageUpload(ItemPartAdmVo itemPartAdmVo) throws Exception {
		session.update(namespace+".itemInfoImageUpload", itemPartAdmVo);
	}
	
	//이미지 삭제
	@Override
	public void itemInfoImageDelete(ItemPartAdmVo itemPartAdmVo) throws Exception{
		session.delete(namespace+".itemInfoImageDelete",itemPartAdmVo);
	}
	
	//이미지 경로 조회
	@Override
	public ItemPartAdmVo itemInfoImageRead(ItemPartAdmVo itemPartAdmVo) throws Exception{
		return session.selectOne(namespace+".itemInfoImageRead" , itemPartAdmVo);
	}	
	
	//원단위관리
	//기준정보
	public List<ItemPartAdmVo> basicInfoList(ItemPartAdmVo itemPartAdmVo) throws Exception{
		return session.selectList(namespace+".basicInfoList" ,itemPartAdmVo );
	}
	
	//원단위 정보
	public List<ItemPartAdmVo> wonUnitList(ItemPartAdmVo itemPartAdmVo) throws Exception{
		return session.selectList(namespace+".wonUnitList" ,itemPartAdmVo );
	}
}
