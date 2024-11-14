package mes.persistence.po;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import mes.domain.po.WorkOrderVo;

@Repository
public class WorkOrderDAOImpl implements WorkOrderDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "mes.mappers.po.workOrderMapper";
	
	//작업지시 목록조회
	@Override
	public List<WorkOrderVo> listAll(WorkOrderVo workOrderVo) throws Exception{
		return session.selectList(namespace+".listAll",workOrderVo);
	}

	//작업지시 등록
	@Override
	public void create(WorkOrderVo workOrderVo) throws Exception {
		session.insert(namespace+".create", workOrderVo);
	}
	

	//작업지시 수정
	@Override
	public void update(WorkOrderVo workOrderVo) throws Exception{
		session.update(namespace+".update",workOrderVo);
	}
	
	//작업지시 수정
	@Override
	public void prcssDelFaultyUpdate(WorkOrderVo workOrderVo) throws Exception{
		session.update(namespace+".prcssDelFaultyUpdate" , workOrderVo);
	}
	
	//작업지시 수정
	@Override
	public void workOrdOutputUpdate(WorkOrderVo workOrderVo) throws Exception{
		session.update(namespace+".workOrdOutputUpdate" ,workOrderVo );
	}
	
	//작업지시 수정
	@Override
	public void workOrdOutputDelete(WorkOrderVo workOrderVo) throws Exception{
		session.update(namespace+".workOrdOutputDelete" , workOrderVo);
	}
	
	//작업지시 기간조회 
	@Override
	public List<WorkOrderVo> workOrdListAll(WorkOrderVo workOrderVo) throws Exception{
		return session.selectList(namespace+".workOrdListAll",workOrderVo);
	}
	
	//생산지시현황(사출) 기간조회
	@Override
	public List<WorkOrderVo> workOrdListAllBybomList(WorkOrderVo workOrderVo) throws Exception{
		return session.selectList(namespace + ".workOrdListAllBybomList", workOrderVo);
	}
	
	//생산지시현황(봉제) 기간조회
	@Override
	public List<WorkOrderVo> workOrdListSewingList(WorkOrderVo workOrderVo) throws Exception{
		return session.selectList(namespace + ".workOrdListSewingList", workOrderVo);
	}
	
	//작업지시 모달조회
	@Override
	public List<WorkOrderVo> workOrdList(WorkOrderVo workOrderVo) throws Exception{
		return session.selectList(namespace+".workOrdList",workOrderVo);
	}
	
	//작업지시 삭제
	@Override
	public void delete(WorkOrderVo workOrderVo) throws Exception {
		session.delete(namespace+".delete", workOrderVo);
	}
	
	//작지 번호 가져오기
	@Override
	public String getWorkOrdNoSeq(String date) throws Exception{
		return session.selectOne(namespace+".getWorkOrdNoSeq", date);
	}
	
	//중공정 목록조회
	@Override
	public List<WorkOrderVo> readMiddlePrcss(WorkOrderVo workOrderVo) throws Exception{
		return session.selectList(namespace+".readMiddlePrcss",workOrderVo);
	}
	
	//소공정 목록조회
	@Override
	public List<WorkOrderVo> readMinorPrcss(WorkOrderVo workOrderVo) throws Exception{
		return session.selectList(namespace+".readMinorPrcss",workOrderVo);
	}
	
	//작업지시선택 자재투입내역 조회
	@Override
	public List<WorkOrderVo> matrlList(WorkOrderVo workOrderVo) throws Exception{		
		return session.selectList(namespace+".matrlList",workOrderVo);
	}
	
	//긴급여부 수정
	@Override
	public void updateDlvDate(WorkOrderVo workOrderVo) throws Exception{
		session.update(namespace+".updateDlvDate",workOrderVo);
	}
	
	//긴급여부 수정
	@Override
	public void updateEmerYn(WorkOrderVo workOrderVo) throws Exception{
		 session.update(namespace+".updateEmerYn",workOrderVo);
	}
	
	//작업지시일 수정
	@Override
	public void updateWorkOrdDate(WorkOrderVo workOrderVo) throws Exception{
		 session.update(namespace+".updateWorkOrdDate",workOrderVo);
	}
	
	//작업지시 조회
	@Override
	public WorkOrderVo workOrdRead(WorkOrderVo workOrderVo) throws Exception{
		return session.selectOne(namespace+".workOrdRead",workOrderVo);
	}
	
	//작업지시 존재하는 번호인지 확인
	@Override
	public int chekWorkOrdExsit(WorkOrderVo workOrderVo) throws Exception{
		return session.selectOne(namespace+".chekWorkOrdExsit",workOrderVo);
	}
	
	//작업지시 삭제
	@Override
	public void deleteWorkOrdNo(WorkOrderVo workOrderVo) throws Exception{
		session.delete(namespace+".deleteWorkOrdNo", workOrderVo);
		
	}
	
	//모니터링 수주진행현황
	@Override
	public List<WorkOrderVo> monitoringBizOrd(WorkOrderVo workOrderVo) throws Exception{
		return session.selectList(namespace+".monitoringBizOrd" , workOrderVo);
	}
	
	//완전 종료된 작지번호 조회
	public Integer completeWorkOrdNoCnt(WorkOrderVo workOrderVo) throws Exception{
		return session.selectOne(namespace+".completeWorkOrdNoCnt" ,workOrderVo );
	}
	
	//완전 종료된 작지번호에 바코드 생성
	public void updateBarcodeNo(WorkOrderVo workOrderVo) throws Exception{
		session.update(namespace+".updateBarcodeNo" ,workOrderVo );
	}
	
	//완료된 작지번호 조회(바코드스캔)
	public WorkOrderVo completeWorkOrderList(WorkOrderVo workOrderVo) throws Exception{
		return session.selectOne(namespace+".completeWorkOrderList" ,workOrderVo );
	}
	
	//완료된 작지번호 조회(바코드스캔)
	public WorkOrderVo checkItemComplete(WorkOrderVo workOrderVo) throws Exception{
		return session.selectOne(namespace+".checkItemComplete" , workOrderVo);
	}
	
	//작지종료시간 가져오기
	@Override
	public String getWorkEndTime(WorkOrderVo workOrderVo) throws Exception{
		return session.selectOne(namespace+".getWorkEndTime", workOrderVo);
	}
	
	//작업지시 주/부작업자 조회
	public List<WorkOrderVo> selectWorkChargrList(WorkOrderVo workOrderVo) throws Exception{
		return session.selectList(namespace+".selectWorkChargrList" , workOrderVo);
	}
	
	//작업지시 공정관리 조회
	public List<WorkOrderVo> workOrderProgressList(WorkOrderVo workOrderVo) throws Exception{
		return session.selectList(namespace+".workOrderProgressList" ,workOrderVo );
	}
	
	//작업지시 공정관리 등록
	public int workOrderProgressIns(WorkOrderVo workOrderVo) throws Exception{
		return session.insert(namespace+".workOrderProgressIns" , workOrderVo);
	}
	
	//작업지시 공정관리 수정
	public int workOrderProgressUpd(WorkOrderVo workOrderVo) throws Exception{
		return session.update(namespace+".workOrderProgressUpd" ,workOrderVo );
	}
}
