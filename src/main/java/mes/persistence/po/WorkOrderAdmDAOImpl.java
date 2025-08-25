package mes.persistence.po;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.po.WorkOrderAdmVo;

@Repository
public class WorkOrderAdmDAOImpl implements WorkOrderAdmDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "mes.mappers.po.workOrderAdmMapper";
	
	//생산실적(후가공) 정보
	public List<WorkOrderAdmVo> workOrderFinishListByWorkOrdNo(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return session.selectList(namespace+".workOrderFinishListByWorkOrdNo" , workOrderAdmVo);
	}

	//생산실적(레이저) 정보 
	@Override
	public List<WorkOrderAdmVo> workOrderRaserListByWorkOrdNo(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return session.selectList(namespace+".workOrderRaserListByWorkOrdNo" , workOrderAdmVo);
	}
	
	//생산실적(레이저) 누적 정보 
	@Override
	public WorkOrderAdmVo workOrderRaserAccList(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return session.selectOne(namespace+".workOrderRaserAccList", workOrderAdmVo);
	}
	
	//생산시작인 작업지시번호 조회
	@Override
	public String workStartGetWorkOrdNo(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return session.selectOne(namespace+".workStartGetWorkOrdNo", workOrderAdmVo);
	}
	
	//작업지시번호 존재여부
	@Override
	public int workOrdNoExist(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return session.selectOne(namespace+".workOrdNoExist" , workOrderAdmVo);
	}
	
	//생산실적(레이저) 작업지시번호 채번
	@Override
	public String workOrderAdmGetWorkOrdNo(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		return session.selectOne(namespace+".workOrderAdmGetWorkOrdNo", workOrderAdmVo);
	}
	
	//생산실적(레이저) 작업지시등록
	@Override
	public void workOrderAdmIns(List<WorkOrderAdmVo> workOrderAdmVo) throws Exception {
		session.insert(namespace+".workOrderAdmIns", workOrderAdmVo);
	}
	
	//생산실적(레이저) 작업지시수정
	@Override
	public void workOrderAdmUpd(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		session.update(namespace+".workOrderAdmUpd" , workOrderAdmVo);
	}
	
	//생산실적 수량 수정
	public void workOrderAdmQtyUpd(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		session.update(namespace+".workOrderAdmQtyUpd" , workOrderAdmVo);
	}
	
	//생산실적(레이저) 작업지시삭제
	@Override
	public void workOrderAdmDel(WorkOrderAdmVo workOrderAdmVo) throws Exception {
		session.delete(namespace+".workOrderAdmDel", workOrderAdmVo);
	}
	
	//생산지시현황 (수주지시별)
	@Override
	public List<WorkOrderAdmVo> contNoAdmList(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return session.selectList(namespace+".contNoAdmList" , workOrderAdmVo);
	}
		
	//생산지시현황 (작업지시별)
	@Override
	public List<WorkOrderAdmVo> workOrderAdmList(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return session.selectList(namespace+".workOrderAdmList" , workOrderAdmVo);
	}
	
	//작업지시 이전작업지시 조회 
	@Override
	public List<WorkOrderAdmVo> preWorkOrdNoList(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return session.selectList(namespace+".preWorkOrdNoList" , workOrderAdmVo);
	}
	
	
	//박스라벨
	//박스라벨 목록조회
	@Override
	public List<WorkOrderAdmVo> boxLabelAdmList(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return session.selectList(namespace+".boxLabelAdmList" ,workOrderAdmVo );
	}
	
	//박스라벨 상세조회
	@Override
	public WorkOrderAdmVo boxLabelAdmRead(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return session.selectOne(namespace+".boxLabelAdmRead" ,workOrderAdmVo );
	}
	
	//박스라벨 BOX_IDX 생성
	public String getBoxIdx(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return session.selectOne(namespace+".getBoxIdx" ,workOrderAdmVo);
	}
	
	//박스라벨 BOX_LABEL_NO 생성
	public String getBoxLabelNo(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return session.selectOne(namespace+".getBoxLabelNo" ,workOrderAdmVo);
	}
	
	//박스라벨 등록
	@Override
	public void boxLabelAdmIns(List<WorkOrderAdmVo> workOrderAdmVo) throws Exception{
		session.insert(namespace+".boxLabelAdmIns" , workOrderAdmVo);
	}
	
	//박스라벨 수정
	@Override
	public void boxLabelAdmUpd(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		session.update(namespace+".boxLabelAdmUpd" , workOrderAdmVo);
	}
	
	//박스라벨 삭제
	@Override
	public void boxLabelAdmDel(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		session.delete(namespace+".boxLabelAdmDel" , workOrderAdmVo);
	}
	
	//총 양/불/실적 수량 조회 
	public WorkOrderAdmVo getTotalWorkQty(WorkOrderAdmVo workOrderAdmVo) throws Exception{
		return session.selectOne(namespace+".getTotalWorkQty" ,workOrderAdmVo);
	}
}
