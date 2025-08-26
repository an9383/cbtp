package mes.persistence.bs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bs.DeliveryProcDtlVo;

@Repository
public class DeliveryProcDtlDAOImpl implements DeliveryProcDtlDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bs.deliveryProcDtlMapper";
	
	//출고처리 조회
	public List<DeliveryProcDtlVo> deliveryProcDtlList(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		return session.selectList(namespace+".deliveryProcDtlList" , deliveryProcDtlVo);
	}
	
	//출고처리 등록
	public void deliveryProcDtlIns(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		session.insert(namespace+".deliveryProcDtlIns" , deliveryProcDtlVo);
	}
	
	//출고처리 수정
	public void deliveryProcDtlUpd(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		session.update(namespace+".deliveryProcDtlUpd" , deliveryProcDtlVo);
	}
	
	//출고처리 삭제
	public void deliveryProcDtlDel(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		session.delete(namespace+".deliveryProcDtlDel" , deliveryProcDtlVo);
	}
	
	//출고번호 생성
	public String getDpNo(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		return session.selectOne(namespace+".getDpNo" , deliveryProcDtlVo);
	}
	
	//바코드별 제품출고 모니터링 조회
	public List<DeliveryProcDtlVo> itemWhsAdmMonitoringList(DeliveryProcDtlVo deliveryProcDtlVo) throws Exception{
		return session.selectList(namespace+".itemWhsAdmMonitoringList" , deliveryProcDtlVo);
	}
}
