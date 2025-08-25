package mes.web.qm;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.io.InOutWhsAdmVo;
import mes.domain.io.PurchaseOrderAdmVo;
import mes.domain.qm.ItemInspectAdmVo;
import mes.domain.qm.QcObjectiveAdmVo;
import mes.service.qm.ItemInspectAdmService;
import mes.service.qm.QcObjectiveAdmService;
import mes.web.io.InOutWhsAdmController;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class QcObjectiveAdmController {

	private static final Logger logger = LoggerFactory.getLogger(QcObjectiveAdmController.class);

	@Inject
	private QcObjectiveAdmService qcObjectiveAdmService;
	
	
	// 수입검사 목표등록
	@RequestMapping(value = "qm/qcObjAdmCreate", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> qcObjAdmCreate(@RequestBody List<Map<String, Object>> faultyTypeList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		QcObjectiveAdmVo qcObjectiveAdmVo = new QcObjectiveAdmVo();
		 
		try {
			
			qcObjectiveAdmVo.setQcObjGubun(faultyTypeList.get(0).get("qcObjGubun").toString());
			qcObjectiveAdmVo.setQcObjYear(faultyTypeList.get(0).get("qcObjYear").toString());
			qcObjectiveAdmVo.setQcObjMon(faultyTypeList.get(0).get("qcObjMon").toString());
			qcObjectiveAdmVo.setRegId(Utils.getUserId());
			
			qcObjectiveAdmService.qcObjAdmDelete(qcObjectiveAdmVo);
			
			for(Map<String, Object> m : faultyTypeList) {
				
				qcObjectiveAdmVo.setQcObjDate(m.get("qcObjDate").toString());
				
				qcObjectiveAdmVo.setQcObjMon(m.get("qcObjMon").toString());
				qcObjectiveAdmVo.setQcObjValue(Float.parseFloat(m.get("qcObjValue").toString()));
				
				qcObjectiveAdmService.qcObjAdmCreate(qcObjectiveAdmVo);
				
				jsonData.put("result", "ok");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
}
