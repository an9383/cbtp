package mes.service.sm;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.sm.IpAccessControlAdmVo;
import mes.persistence.sm.IpAccessControlAdmDAO;

@Service
public class IpAccessControlAdmServiceImpl implements IpAccessControlAdmService {
	
	@Inject
	private IpAccessControlAdmDAO dao;
	
	//IP접근제어관리 조회
	public List<IpAccessControlAdmVo> list(IpAccessControlAdmVo ipAccessControlAdmVo) throws Exception{
		return dao.list(ipAccessControlAdmVo);
	}
	
	//IP접근제어관리 상세조회
	public IpAccessControlAdmVo read(IpAccessControlAdmVo ipAccessControlAdmVo) throws Exception{
		return dao.read(ipAccessControlAdmVo);
	}
	
	//IP접근제어관리 등록
	public void create(IpAccessControlAdmVo ipAccessControlAdmVo) throws Exception{
		dao.create(ipAccessControlAdmVo);
	}
	
	//IP접근제어관리 수정
	public void update(IpAccessControlAdmVo ipAccessControlAdmVo) throws Exception{
		dao.update(ipAccessControlAdmVo);
	}
	
	//IP접근제어관리 IP관리번호 가져오기
	public String getIpNo(IpAccessControlAdmVo ipAccessControlAdmVo) throws Exception{
		return dao.getIpNo(ipAccessControlAdmVo);
	}
	
	//IP접근제어관리 IP존재여부
	public int existIpAddr(String ipAddr) throws Exception{
		return dao.existIpAddr(ipAddr);
	}

}
