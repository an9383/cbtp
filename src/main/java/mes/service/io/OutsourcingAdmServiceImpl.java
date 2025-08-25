package mes.service.io;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import mes.domain.io.OutsourcingAdmVo;
import mes.persistence.io.OutsourcingAdmDAO;

@Service
public class OutsourcingAdmServiceImpl implements OutsourcingAdmService {

	@Inject
	private OutsourcingAdmDAO dao;
	
	//외주발주등록 목록조회
	@Override
	public List<OutsourcingAdmVo> outsourcingAdmList(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return dao.outsourcingAdmList(outsourcingAdmVo);
	}
	
	//외주발주등록 상세조회
	@Override
	public OutsourcingAdmVo outsourcingAdmRead(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return dao.outsourcingAdmRead(outsourcingAdmVo);
	}
	
	//외주발주등록 등록
	@Override
	public void outsourcingAdmCreate(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		dao.outsourcingAdmCreate(outsourcingAdmVo);
	}
	
	//외주발주등록 수정
	@Override
	public void outsourcingAdmUpdate(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		dao.outsourcingAdmUpdate(outsourcingAdmVo);
	}
	
	//외주발주등록 삭제
	@Override
	public void outsourcingAdmDelete(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		dao.outsourcingAdmDelete(outsourcingAdmVo);
	}
	
	//외주발주번호 생성
	public String getOutsrcNo(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return dao.getOutsrcNo(outsourcingAdmVo);
	}
	
	//외주발주미입고현황 목록조회
	public List<OutsourcingAdmVo> outsourcingStatusList(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return dao.outsourcingStatusList(outsourcingAdmVo);
	}
	
	//외주발주 마감상태 수정
	public void updateOutsrcStatus(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		dao.updateOutsrcStatus(outsourcingAdmVo);
	}
	
	//외주출고 상세조회
	public List<OutsourcingAdmVo> outsourcingDtlRead(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return dao.outsourcingDtlRead(outsourcingAdmVo);
	}
	
	//외주입고 상세조회
	public List<OutsourcingAdmVo> insourcingDtlRead(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return dao.insourcingDtlRead(outsourcingAdmVo);
	}
	
	//외주출고 등록
	public void outsourcingDtlCreate(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		dao.outsourcingDtlCreate(outsourcingAdmVo);
	}
	
	//외주입고 등록
	public void insourcingDtlCreate(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		dao.insourcingDtlCreate(outsourcingAdmVo);
	}

	//외주출고 수정
	public void outsourcingDtlUpdate(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		dao.outsourcingDtlUpdate(outsourcingAdmVo);
	}
	
	//외주입고 수정
	public void insourcingDtlUpdate(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		dao.insourcingDtlUpdate(outsourcingAdmVo);
	}
	
	//외주출고 삭제
	public void outsourcingDtlDelete(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		dao.outsourcingDtlDelete(outsourcingAdmVo);
	}
	
	//외주입고 삭제
	public void insourcingDtlDelete(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		dao.insourcingDtlDelete(outsourcingAdmVo);
	}
	
	//외주출고/입고 수량값 수정
	public void updateOutInQty(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		dao.updateOutInQty(outsourcingAdmVo);
	}
	
	//외주출고 시퀀스 생성
	public int getOutsrcSeq(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return dao.getOutsrcSeq(outsourcingAdmVo);
	}
	
	//외주입고 시퀀스 생성
	public int getInsrcSeq(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return dao.getInsrcSeq(outsourcingAdmVo);
	}
	
	//외주입고 성적서업로드
	public void uploadFile(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		dao.uploadFile(outsourcingAdmVo);
	}
	
	//외주입고 성적서 파일명 가져오기
	public String getReportFn(OutsourcingAdmVo outsourcingAdmVo) throws Exception{
		return dao.getReportFn(outsourcingAdmVo);
	}
}
