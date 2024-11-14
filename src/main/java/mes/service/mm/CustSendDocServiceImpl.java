package mes.service.mm;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.mm.CustSendDocVo;
import mes.persistence.mm.CustSendDocDAO;

@Service
public class CustSendDocServiceImpl implements CustSendDocService {

	@Inject
	private CustSendDocDAO dao;
	
	// 조회
	@Override
	public CustSendDocVo read(CustSendDocVo custSendDocVo) throws Exception {
		return dao.read(custSendDocVo);
	}
	
	// 수정
	@Override
	public void edit(CustSendDocVo custSendDocVo) throws Exception {
		dao.edit(custSendDocVo);
	}
}
