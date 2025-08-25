package mes.persistence.io;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.io.OutsourcingAdmVo;

@Repository
public class OutsourcingAdmDAOImpl implements OutsourcingAdmDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.io.outsourcingAdmMapper";

	//외주발주등록 목록조회
	@Override
	public List<OutsourcingAdmVo> outsourcingAdmList(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return session.selectList(namespace +".outsourcingAdmList",outsourcingAdmVo);
	}
	
	//외주발주등록 상세조회
	@Override
	public OutsourcingAdmVo outsourcingAdmRead(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return session.selectOne(namespace+".outsourcingAdmRead",outsourcingAdmVo );
	}
	
	//외주발주등록 등록
	@Override
	public void outsourcingAdmCreate(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		session.insert(namespace+".outsourcingAdmCreate",outsourcingAdmVo );
	}
	
	//외주발주등록 수정
	@Override
	public void outsourcingAdmUpdate(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		session.update(namespace+".outsourcingAdmUpdate",outsourcingAdmVo );
	}
	
	//외주발주등록 삭제
	@Override
	public void outsourcingAdmDelete(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		session.delete(namespace+".outsourcingAdmDelete",outsourcingAdmVo );
	}
	
	//외주발주번호 생성
	public String getOutsrcNo(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return session.selectOne(namespace+".getOutsrcNo",outsourcingAdmVo);
	}
	
	
	//외주발주미입고현황 목록조회
	public List<OutsourcingAdmVo> outsourcingStatusList(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return session.selectList(namespace+".outsourcingStatusList" , outsourcingAdmVo);
	}
	
	//외주발주 마감상태 수정
	public void updateOutsrcStatus(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		session.update(namespace+".updateOutsrcStatus" , outsourcingAdmVo);
	}
	
	//외주출고 상세조회
	public List<OutsourcingAdmVo> outsourcingDtlRead(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return session.selectList(namespace+".outsourcingDtlRead" ,outsourcingAdmVo );
	}
	
	//외주입고 상세조회
	public List<OutsourcingAdmVo> insourcingDtlRead(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return session.selectList(namespace+".insourcingDtlRead" ,outsourcingAdmVo );
	}
	
	//외주출고 등록
	public void outsourcingDtlCreate(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		session.insert(namespace+".outsourcingDtlCreate",outsourcingAdmVo );
	}
	
	//외주입고 등록
	public void insourcingDtlCreate(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		session.insert(namespace+".insourcingDtlCreate",outsourcingAdmVo );
	}
	
	//외주출고 수정
	public void outsourcingDtlUpdate(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		session.update(namespace+".outsourcingDtlUpdate" , outsourcingAdmVo	);
	}
	
	//외주입고 수정
	public void insourcingDtlUpdate(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		session.update(namespace+".insourcingDtlUpdate" , outsourcingAdmVo	);
	}
	
	//외주출고 삭제
	public void outsourcingDtlDelete(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		session.delete(namespace+".outsourcingDtlDelete" , outsourcingAdmVo);
	}
	
	//외주입고 삭제
	public void insourcingDtlDelete(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		session.delete(namespace+".insourcingDtlDelete" , outsourcingAdmVo);
	}

	//외주출고/입고 수량값 수정
	public void updateOutInQty(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		session.update(namespace+".updateOutInQty", outsourcingAdmVo);
	}
	
	
	//외주출고 시퀀스 생성
	public int getOutsrcSeq(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return session.selectOne(namespace+".getOutsrcSeq",outsourcingAdmVo);
	}
	
	//외주입고 시퀀스 생성
	public int getInsrcSeq(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return session.selectOne(namespace+".getInsrcSeq",outsourcingAdmVo);
	}
	
	//외주입고 성적서업로드
	public void uploadFile(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		session.update(namespace+".uploadFile" ,outsourcingAdmVo );
	}
	
	//외주입고 성적서 파일명 가져오기
	public String getReportFn(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return session.selectOne(namespace+".getReportFn" ,outsourcingAdmVo );
	}
}
