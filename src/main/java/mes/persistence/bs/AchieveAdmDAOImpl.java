package mes.persistence.bs;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.bs.AchieveAdmVo;

@Repository
public class AchieveAdmDAOImpl implements AchieveAdmDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace="mes.mappers.bs.achieveAdmMapper";
	
	//실적표 리스트 출력
	@Override
	public List<AchieveAdmVo> AchieveAdmList(AchieveAdmVo achieveAdmVo) throws Exception {
		return session.selectList(namespace + ".AchieveAdmList",achieveAdmVo);
	}
	
	 //실적표 등록
	 @Override 
	 public int AchieveAdmCreate(AchieveAdmVo achieveAdmVo) throws Exception{ 
		 return session.insert(namespace + ".AchieveAdmCreate",achieveAdmVo);
	}
	 
	 //실적표 수정
	 @Override 
	 public int AchieveAdmUpdate(AchieveAdmVo achieveAdmVo) throws Exception {
		 return session.update(namespace + ".AchieveAdmUpdate",achieveAdmVo); 
	}
	 
    //실적표 삭제
    @Override 
    public int AchieveAdmDelete(AchieveAdmVo achieveAdmVo) throws Exception {
    	return session.delete(namespace + ".AchieveAdmDelete",achieveAdmVo);
    }
    
	//성취도관리 상세조회
    @Override
	public List<AchieveAdmVo> AchieveAdmRead(AchieveAdmVo Vo) throws Exception{
    	return session.selectList(namespace + ".AchieveAdmRead",Vo);
	}
}
