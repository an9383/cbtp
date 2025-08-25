package mes.persistence.bs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bs.DeliveryOrderAdmVo;

@Repository
public class DeliveryOrderAdmDAOImple implements DeliveryOrderAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.bs.deliveryOrderAdmMapper";
	
	//출고요청등록 조회
	@Override
	public List<DeliveryOrderAdmVo> deliveryOrderAdmList(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return session.selectList(namespace+".deliveryOrderAdmList" ,deliveryOrderAdmVo);
	}
	
	//출고요청등록 조회
	public DeliveryOrderAdmVo deliveryOrderAdmRead(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return session.selectOne(namespace+".deliveryOrderAdmRead" , deliveryOrderAdmVo);
	}
	
	//출고요청등록 조회
	@Override
	public void deliveryOrderAdmIns(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		session.insert(namespace+".deliveryOrderAdmIns" , deliveryOrderAdmVo);
	}
	
	//출고요청등록 조회
	@Override
	public void deliveryOrderAdmUpd(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		session.update(namespace+".deliveryOrderAdmUpd" ,deliveryOrderAdmVo);
	}
	
	//출고요청등록 조회
	@Override
	public void deliveryOrderAdmDel(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		session.delete(namespace+".deliveryOrderAdmDel" , deliveryOrderAdmVo);
	}
	
	//출고요청등록 조회
	@Override
	public String getDoNo(DeliveryOrderAdmVo deliveryOrderAdmVo)throws Exception{
		return session.selectOne(namespace+".getDoNo" , deliveryOrderAdmVo);
	}
}
