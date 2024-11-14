package mes.persistence.sm;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.sm.IpAccessControlAdmVo;

@Repository
public class IpAccessControlAdmDAOImpl implements IpAccessControlAdmDAO{
	
	@Inject
	private SqlSession session;
	
	private String namespace = "mes.mappers.sm.ipAccessControlAdmMapper";

	//IP접근제어관리 조회
	public List<IpAccessControlAdmVo> list(IpAccessControlAdmVo ipAccessControlAdmVo) throws Exception{
		
		return session.selectList(namespace+".list" , ipAccessControlAdmVo);
	}
	
	//IP접근제어관리 상세조회
	public IpAccessControlAdmVo read(IpAccessControlAdmVo ipAccessControlAdmVo) throws Exception{
		return session.selectOne(namespace+".read" , ipAccessControlAdmVo);
	}
	
	//IP접근제어관리 등록
	public void create(IpAccessControlAdmVo ipAccessControlAdmVo) throws Exception{
		session.insert(namespace+".create", ipAccessControlAdmVo);
	}
	
	//IP접근제어관리 수정
	public void update(IpAccessControlAdmVo ipAccessControlAdmVo) throws Exception{
		session.update(namespace+".update" , ipAccessControlAdmVo);
	}
	
	//IP접근제어관리 IP관리번호 가져오기
	public String getIpNo(IpAccessControlAdmVo ipAccessControlAdmVo) throws Exception{
		return session.selectOne(namespace+".getIpNo" , ipAccessControlAdmVo);
	}
	
	//IP접근제어관리 IP존재여부
	public int existIpAddr(String ipAddr) throws Exception{
		return session.selectOne(namespace+".existIpAddr" , ipAddr);
	}
}
