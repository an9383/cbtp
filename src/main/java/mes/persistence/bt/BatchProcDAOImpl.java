package mes.persistence.bt;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bt.BatchProcVo;

@Repository
public class BatchProcDAOImpl implements BatchProcDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="mes.mappers.bt.batchProcMapper";
	
	//일별 부품 재고정보 생성
	@Override
	public void batchTmData(BatchProcVo batchProcVo) throws Exception {
		session.update(namespace+".batchTmData", batchProcVo);
	}

	//배치 수행 결과 생성
	@Override
	public void batchProcLog(BatchProcVo batchProcVo) throws Exception {
		session.insert(namespace+".batchProcLog", batchProcVo);
	}
	

}
