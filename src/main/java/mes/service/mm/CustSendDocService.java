package mes.service.mm;

import mes.domain.mm.CustSendDocVo;

public interface CustSendDocService {

	// 조회
	public CustSendDocVo read(CustSendDocVo custSendDocVo) throws Exception;
	
	// 수정
	public void edit(CustSendDocVo custSendDocVo) throws Exception;
}
