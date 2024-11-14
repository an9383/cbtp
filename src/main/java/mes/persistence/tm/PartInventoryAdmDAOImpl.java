package mes.persistence.tm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.tm.PartInventoryAdmVo;

@Repository
public class PartInventoryAdmDAOImpl implements PartInventoryAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.tm.partInventoryAdmMapper";
	
	//기초재고관리 목록조회
	public List<PartInventoryAdmVo> partInventoryAdmList(PartInventoryAdmVo partInventoryAdmVo) throws Exception{
		return session.selectList(namespace+".partInventoryAdmList" , partInventoryAdmVo);
	}
	
	//재고위치관리 목록조회
	public List<PartInventoryAdmVo> partInventoryLocList(PartInventoryAdmVo partInventoryAdmVo) throws Exception{
		return session.selectList(namespace+".partInventoryLocList" ,partInventoryAdmVo );
	}
}
