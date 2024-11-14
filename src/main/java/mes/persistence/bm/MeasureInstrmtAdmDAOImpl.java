package mes.persistence.bm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bm.CorrDataListVo;
import mes.domain.bm.AttachDataVo;
import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.bm.MeasureInstrmtAdmVo;

@Repository
public class MeasureInstrmtAdmDAOImpl implements MeasureInstrmtAdmDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bm.measureInstrmtAdmMapper";
	
	@Override
	public List<MeasureInstrmtAdmVo> measureInstrmtAdmList(MeasureInstrmtAdmVo Vo) throws Exception {
		return  session.selectList(namespace + ".measureInstrmtAdmList", Vo);
	}
	
	@Override
	public MeasureInstrmtAdmVo measureInstrmtAdmRead(MeasureInstrmtAdmVo Vo) throws Exception{
		return session.selectOne(namespace+".measureInstrmtAdmRead", Vo);
	}
	
	@Override
	public void measureInstrmtAdmCreate(MeasureInstrmtAdmVo Vo) throws Exception {
		session.insert(namespace+".measureInstrmtAdmCreate", Vo);
	}
	
	@Override
	public void measureInstrmtAdmUpdate(MeasureInstrmtAdmVo Vo) throws Exception{
		session.update(namespace+".measureInstrmtAdmUpdate", Vo);
	}
	
	@Override
	public void measureInstrmtAdmDelete(MeasureInstrmtAdmVo Vo) throws Exception {
		session.delete(namespace+".measureInstrmtAdmDelete" ,Vo );
		
	}
	
	@Override
	public String measureInstrmtSeq() throws Exception {
		return session.selectOne(namespace+".measureInstrmtSeq");
	}
	

	@Override
	public MeasureInstrmtAdmVo measureInstrmtImgRead(MeasureInstrmtAdmVo measureInstrmtAdmVo) throws Exception{
		return session.selectOne(namespace+".measureInstrmtImgRead", measureInstrmtAdmVo);
	}
	
	@Override
	public void measureInstrmtImageUpload(MeasureInstrmtAdmVo measureInstrmtAdmVo) throws Exception{
		session.update(namespace+".measureInstrmtImageUpload", measureInstrmtAdmVo);
	}
	
	//이미지 삭제
	public void measureInstrmtImageDelete(MeasureInstrmtAdmVo measureInstrmtAdmVo) throws Exception{
		session.delete(namespace + ".measureInstrmtImageDelete" ,measureInstrmtAdmVo);
	}
	
	//계측기 중복확인
	public Integer overlapMitCdNo(MeasureInstrmtAdmVo measureInstrmtAdmVo) throws Exception{
		return session.selectOne(namespace+".overlapMitCdNo" , measureInstrmtAdmVo);
	}
	
	//계측기 관리번호 중복확인
	public Integer overlapAdmNo(MeasureInstrmtAdmVo measureInstrmtAdmVo) throws Exception{
		return session.selectOne(namespace+".overlapAdmNo",measureInstrmtAdmVo);
	}
	
	//교정사항이력 목록조회
	public List<CorrDataListVo>attachCorreDataList(CorrDataListVo corrDataListVo) throws Exception {
		return session.selectList(namespace+".attachCorreDataList", corrDataListVo);
	}
	
	//교정사항이력 상세조회
	@Override
	public CorrDataListVo measureInstrmtCorreAdmRead(CorrDataListVo corrDataListVo) throws Exception{
		return session.selectOne(namespace+".measureInstrmtCorreAdmRead", corrDataListVo);
	}
	
	//교정사항이력 시퀀스 자동생성
	public String getCorrSeq(CorrDataListVo corrDataListVo) throws Exception{
		return session.selectOne(namespace+".getCorrSeq" ,corrDataListVo );
	}
	
	//교정사항이력 등록 
	public void attachCorreDataCreate(CorrDataListVo corrDataListVo) throws Exception {
		session.insert(namespace+".attachCorreDataCreate", corrDataListVo);
	}
	
	//교정사항이력 수정
	@Override
	public void attachCorreDataUpdate(CorrDataListVo corrDataListVo) throws Exception {
		session.update(namespace+".attachCorreDataUpdate" , corrDataListVo);
	}
	
	//교정사항이력 삭제 
	@Override
	public void attachCorreDataDelete(CorrDataListVo corrDataListVo) throws Exception {
		session.delete(namespace+".attachCorreDataDelete" , corrDataListVo);
	}
	
	//관련자료 파일 경로 출력
	public String eqCorreFilePath(CorrDataListVo corrDataListVo) throws Exception {
		return session.selectOne(namespace + ".eqCorreFilePath", corrDataListVo);
	}
	

	

}