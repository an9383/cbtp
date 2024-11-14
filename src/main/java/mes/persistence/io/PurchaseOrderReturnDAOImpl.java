package mes.persistence.io;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.io.PurchaseOrderReturnVo;

@Repository
public class PurchaseOrderReturnDAOImpl implements PurchaseOrderReturnDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.io.purchaseOrderReturnMapper";
	
	//반품번호 생성
	public String getRetnNo(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return session.selectOne(namespace+".getRetnNo" ,purchaseOrderReturnVo);
	}
	//반품 목록조회
	public List<PurchaseOrderReturnVo> purchaseOrderReturnList(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		return session.selectList(namespace+".purchaseOrderReturnList" , purchaseOrderReturnVo);
	}

	//반품 등록
	public void purchaseOrderReturnCreate(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		session.insert(namespace+".purchaseOrderReturnCreate" , purchaseOrderReturnVo);
	}

	//반품 수정
	public void purchaseOrderReturnUpdate(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		session.update(namespace+".purchaseOrderReturnUpdate" , purchaseOrderReturnVo);
	}

	//반품 삭제
	public void purchaseOrderReturnDelete(PurchaseOrderReturnVo purchaseOrderReturnVo) throws Exception{
		session.delete(namespace+".purchaseOrderReturnDelete" , purchaseOrderReturnVo);
	}
}
