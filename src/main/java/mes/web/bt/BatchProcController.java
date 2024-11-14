package mes.web.bt;

import java.util.Date;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import mes.domain.bt.BatchProcVo;
import mes.service.bt.BatchProcService;
import mes.web.cm.Constants;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

public class BatchProcController {

	@Inject
	private BatchProcService batchProcService;	
	
	private static final Logger logger = LoggerFactory.getLogger(BatchProcController.class);

	//영업관리 메인
	//@RequestMapping(value = "/bssc0010", method = RequestMethod.GET)
	//@Scheduled(cron="0 */1 * * * ?")
	public String batchTmData() throws Exception {
		
		logger.info("batchScheduler batchTmData ==================> " + DateUtil.getDay("yyyy-mm-dd hh:mm:ss:ms", 0));
		Date date = new Date();

		BatchProcVo batchProcVo = new BatchProcVo();
		batchProcVo.setBatchId(Constants.BATCH_ID_01);
		batchProcVo.setBatchNm(Constants.BATCH_ID_01_NM);
		batchProcVo.setBatchGubun(Constants.BATCH_ID_01_NM);
		batchProcVo.setBatchStartTime(DateUtil.getDay("yyyy-mm-dd hh:mm:ss:ms", 0));
		batchProcVo.setSuccessYn(Constants.BATCH_FAIL);
		batchProcVo.setTmMon(DateUtil.getToday("yyyymmdd").substring(0,6));
		
		logger.info("batchScheduler batchTmMon ==============> " + batchProcVo.getTmMon());
		
		try {
			batchProcService.batchTmData(batchProcVo);
			batchProcVo.setSuccessYn(Constants.BATCH_SUCCESS);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			batchProcVo.setBatchEndTime(DateUtil.getDay("yyyy-mm-dd hh:mm:ss:ms", 0));
			batchProcService.batchProcLog(batchProcVo);
		}

		return "bs/bssc0010";
	}
}
