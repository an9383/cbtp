package mes.persistence.em;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import mes.domain.em.EquipCondCommonAdmVo;
import mes.domain.em.ManufacturerVo;


@Repository
public class ManufacturerDAOImpl implements ManufacturerDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.em.manufacturerMapper";
	
	//제조조건관리 설비 클릭시 계획 목록 조회
	@Override
	public List<ManufacturerVo> listAll(ManufacturerVo vo) throws Exception{
		return session.selectList(namespace+".listAll", vo);
	}

	//해당설비 계획 목록 조회
	@Override
	public List<ManufacturerVo> listRead(EquipCondCommonAdmVo vo) throws Exception {
		return session.selectList(namespace+".listRead", vo);
	}
	
	//제품코드 조회 팝업의 목록에서 특정 제품 클릭 시 제품코드에 대한 재질,규격,두께등을 가져옴
	@Override
	public ManufacturerVo read(ManufacturerVo vo) throws Exception {
		return session.selectOne(namespace+".read", vo);
	}
	
	//설비조건공통관리 생성
	@Override
	public void equipCondCommonAdmcreate(EquipCondCommonAdmVo vo) throws Exception {
		session.insert(namespace+".equipCondCommonAdmcreate", vo);
	}
	
	//
	/*
	 * @Override public void update(ManufacturerVo vo) throws Exception {
	 * session.update(namespace+".update", vo); }
	 */
	//설비코드 시퀀스
	@Override
	public String selectEquipCondSeq() throws Exception {
		return session.selectOne(namespace+".selectEquipCondSeq");
	}	
	
}