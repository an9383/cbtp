package mes.persistence.mm;

import mes.domain.mm.CustSendDocVo;

public interface CustSendDocDAO {
	
	// 조회
	public CustSendDocVo read(CustSendDocVo custSendDocVo) throws Exception;
	
	// 수정
	public void edit(CustSendDocVo custSendDocVo) throws Exception;
}