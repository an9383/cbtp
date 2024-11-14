package mes.web.mm;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import mes.domain.bm.CommonCodeAdmVo;
import mes.domain.mm.ProdDailyAdmVo;
import mes.service.bm.CommonCodeAdmService;
import mes.service.mm.prodDailyAdmService;
import mes.web.ut.DateUtil;
import mes.web.ut.Utils;

@Controller
public class prodDailyAdmController {

	private static final Logger logger = LoggerFactory.getLogger(prodDailyAdmController.class);
	
	@Inject
	private prodDailyAdmService prodDailyAdmService;
	
	@Inject
	private CommonCodeAdmService commonCodeAdmService;
	
	
	
	
	// 생산일보관리
	@RequestMapping(value = "/mmsc0090", method = RequestMethod.GET)
	public String mmsc0090(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("081");
		commonCodeVo.setStartBaseCd("001");
		commonCodeVo.setEndBaseCd("020");
		List<CommonCodeAdmVo> list = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("prodNm",list);
		
		commonCodeVo.setBaseGroupCd("016"); 
		List<CommonCodeAdmVo> prodGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("prodGubun", prodGubunList);

		return "mm/mmsc0090";
	}
	
	
	// 생산일보관리(구분)
	@RequestMapping(value = "/mmsc0100", method = RequestMethod.GET)
	public String mmsc0100(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("016"); 
		List<CommonCodeAdmVo> prodGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("prodGubun", prodGubunList);

		return "mm/mmsc0100";
	}
		
	
	// 공수일별
	@RequestMapping(value = "/mmsc0140", method = RequestMethod.GET)
	public String mmsc0140(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("016"); 
		List<CommonCodeAdmVo> prodGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("prodGubun", prodGubunList);
		
		commonCodeVo.setBaseGroupCd("084"); // 공수구분
		List<CommonCodeAdmVo> mhGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("mhGubun", mhGubunList);

		return "mm/mmsc0140";
	}
	
	
	// 공수월별
	@RequestMapping(value = "/mmsc0150", method = RequestMethod.GET)
	public String mmsc0150(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("016");
		List<CommonCodeAdmVo> prodGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("prodGubun", prodGubunList);
		
		commonCodeVo.setBaseGroupCd("084"); // 공수구분
		List<CommonCodeAdmVo> mhGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("mhGubun", mhGubunList);

		return "mm/mmsc0150";
	}
	
	
	// 공정검사현황 모티러링
	@RequestMapping(value = "/mmsc0160", method = RequestMethod.GET)
	public String mmsc0160(Locale locale, Model model) throws Exception {
		model.addAttribute("serverDateFrom", DateUtil.getDay("yyyy-mm-dd", -6));
		model.addAttribute("serverDateTo", DateUtil.getToday("yyyy-mm-dd"));
		model.addAttribute("serverDate", DateUtil.getToday("yyyy-mm-dd"));
		
		CommonCodeAdmVo commonCodeVo = new CommonCodeAdmVo();
		commonCodeVo.setBaseGroupCd("016");
		List<CommonCodeAdmVo> prodGubunList = commonCodeAdmService.CommonCodeList(commonCodeVo);
		model.addAttribute("prodGubun", prodGubunList);

		return "mm/mmsc0160";
	}
	
	
	//생산일보관리 조회	
	@RequestMapping(value = "mm/listAll", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> listAll(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			logger.info("생산일보관리 조회:"+prodDailyAdmVo);
			List<ProdDailyAdmVo> list = prodDailyAdmService.listAll(prodDailyAdmVo);
				
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//생산일보관리 조회	
	@RequestMapping(value = "mm/statListAll", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> statListAll(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			logger.info("생산일보관리 조회:"+prodDailyAdmVo);
			List<ProdDailyAdmVo> list = prodDailyAdmService.statListAll(prodDailyAdmVo);
				
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//생산일보관리 상세조회	
	@RequestMapping(value = "mm/read", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> read(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("생산일보관리 조회:"+prodDailyAdmVo);
			
			List<ProdDailyAdmVo> list = prodDailyAdmService.read(prodDailyAdmVo);
				
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공수코드 합계
	@RequestMapping(value = "mm/getSumProdData", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getSumProdData(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("공수값 합계:"+prodDailyAdmVo);
			
			List<ProdDailyAdmVo> list = prodDailyAdmService.getSumProdData(prodDailyAdmVo);
				
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//생산일보관리 상세조회	
	@RequestMapping(value = "mm/create", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> create(@RequestBody List<Map<String, Object>> prodDailyAdmList) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		ProdDailyAdmVo prodDailyAdmVo = new ProdDailyAdmVo();
		try {
			logger.info("생산일보관리 등록:"+prodDailyAdmVo);
			
			prodDailyAdmVo.setProdGubun(prodDailyAdmList.get(0).get("prodGubun").toString());
			prodDailyAdmVo.setProdDate(prodDailyAdmList.get(0).get("prodDate").toString());
			prodDailyAdmVo.setUserNumber(prodDailyAdmList.get(0).get("userNumber").toString());
			prodDailyAdmVo.setRegId(Utils.getUserId());
			
			prodDailyAdmVo.setMhInitial(prodDailyAdmList.get(0).get("mhInitial").toString());
			prodDailyAdmService.delete(prodDailyAdmVo);
			
			
			for(Map<String, Object> m :prodDailyAdmList) {
				
				if(m.get("prodData").toString()!=null && !m.get("prodData").toString().equals("0")) {
					prodDailyAdmVo.setProdCd(m.get("prodCd").toString());
					prodDailyAdmVo.setProdData(m.get("prodData").toString());
					
					prodDailyAdmService.create(prodDailyAdmVo);
				}
			}
				
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	//----------------------------------------------------
	//공수월별 목록조회
	@RequestMapping(value = "mm/monthList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> monthList(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("공수월별 목록조회:"+prodDailyAdmVo);
			
			List<ProdDailyAdmVo> list = prodDailyAdmService.monthList(prodDailyAdmVo);
				
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공수월별 합계
	@RequestMapping(value = "mm/getSumProdData2", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getSumProdData2(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("공수값 합계2:"+prodDailyAdmVo);
			
			List<ProdDailyAdmVo> list = prodDailyAdmService.getSumProdData2(prodDailyAdmVo);
				
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//공수일별 목록조회
	@RequestMapping(value = "mm/dateList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> dateList(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("공수일별 목록조회:"+prodDailyAdmVo);
			
			List<ProdDailyAdmVo> list = prodDailyAdmService.dateList(prodDailyAdmVo);
				
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공수일별 합계
	@RequestMapping(value = "mm/getSumProdData3", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> getSumProdData3(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("공수값 합계3:"+prodDailyAdmVo);
			
			List<ProdDailyAdmVo> list = prodDailyAdmService.getSumProdData3(prodDailyAdmVo);
				
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//공수일별 합계
	@RequestMapping(value = "mm/headerList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> headerList(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("공수값 합계3:"+prodDailyAdmVo);
			
			List<ProdDailyAdmVo> list = prodDailyAdmService.headerList(prodDailyAdmVo);
				
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	
	//-------------------------------------------------
	//생산일보관리(구분)
	//인원현황 탭
	//유실공수 TOP(3)목록조회
	@RequestMapping(value = "mm/manHourTop3List", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> manHourTop3List(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ProdDailyAdmVo> list = prodDailyAdmService.manHourTop3List(prodDailyAdmVo);
				
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//생산가동율 목록조회
	@RequestMapping(value = "mm/prodUtilList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prodUtilList(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			ProdDailyAdmVo vo = prodDailyAdmService.prodUtilList(prodDailyAdmVo);
			if(vo==null) {
				vo = new ProdDailyAdmVo();
			}
				
			jsonData.put("data", vo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//인원현황 목록조회
	@RequestMapping(value = "mm/personStatList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> personStatList(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			ProdDailyAdmVo vo = prodDailyAdmService.personStatList(prodDailyAdmVo);
				
			jsonData.put("data", vo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//공수현황 탭
	//생산 공정현황 목록조회
	@RequestMapping(value = "mm/planAchvRateList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> planAchvRateList(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {

			float workOrdQty=0;		//생산목표 수량
			float sumQty=0;	//생산실적 수량
			String achvRate="";		//계획달성율
			
			workOrdQty = Integer.parseInt(prodDailyAdmService.getWorkOrdQty(prodDailyAdmVo).toString());
			
			List<ProdDailyAdmVo> list = prodDailyAdmService.prodResultStatList(prodDailyAdmVo);
			
			if(list!=null && list.size()!=0) {
				for(int i=0; i<list.size(); i++) {
					sumQty += Integer.parseInt(list.get(i).getWorkOrdQty());
				}
				
				achvRate = String.format("%.2f", (sumQty/workOrdQty)*100);
				logger.info("sumQty : ==================>"+sumQty);
				logger.info("workOrdQty : ==================>"+workOrdQty);
				logger.info("achvRate : ==================>"+(sumQty/workOrdQty)*100);
			}
			
			jsonData.put("result", "ok");
			jsonData.put("sumQty", sumQty);
			jsonData.put("workOrdQty", workOrdQty);
			jsonData.put("achvRate", achvRate);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//생산 실적현황 목록조회
	@RequestMapping(value = "mm/prodResultStatList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prodResultStatList(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ProdDailyAdmVo> list = prodDailyAdmService.prodResultStatList(prodDailyAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	//생산 공정현황 목록조회
	@RequestMapping(value = "mm/prodProcStatList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prodProcStatList(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ProdDailyAdmVo> list = prodDailyAdmService.prodProcStatList(prodDailyAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	//-------------------------------------------------
	//생산일보관리(전체)
	//인원현황 탭
	//인원현황 목록조회
	@RequestMapping(value = "mm/personStatListAll", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> personStatListAll(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			ProdDailyAdmVo vo = prodDailyAdmService.personStatListAll(prodDailyAdmVo);
			
			jsonData.put("data", vo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	//생산가동율 목록조회
	@RequestMapping(value = "mm/prodUtilListAll", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prodUtilListAll(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			
			prodDailyAdmVo.setProdGubun("001");
			ProdDailyAdmVo vo = prodDailyAdmService.prodUtilList(prodDailyAdmVo);
			
			prodDailyAdmVo.setProdGubun("002");
			ProdDailyAdmVo vo2 = prodDailyAdmService.prodUtilList(prodDailyAdmVo);
			
			
			prodDailyAdmVo.setProdGubun("001");
			prodDailyAdmVo.setPreYear(DateUtil.getToday("yyyymmdd").substring(0,3)+1);
			ProdDailyAdmVo vo3 = prodDailyAdmService.prodUtilList(prodDailyAdmVo);
			  
			  
			prodDailyAdmVo.setProdGubun("002");
			prodDailyAdmVo.setPreYear(DateUtil.getToday("yyyymmdd").substring(0,3)+1);
			ProdDailyAdmVo vo4 = prodDailyAdmService.prodUtilList(prodDailyAdmVo);
				 
			if(vo==null) {
				vo = new ProdDailyAdmVo();
			}
			if(vo2==null) {
				vo2 = new ProdDailyAdmVo();
			}
			if(vo3==null) {
				vo3 = new ProdDailyAdmVo();
			}
			if(vo4==null) {
				vo4 = new ProdDailyAdmVo();
			}
			
			
			jsonData.put("data", vo);
			jsonData.put("data2", vo2);
			jsonData.put("data3", vo3);
			jsonData.put("data4", vo4);
			 
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//공수생산성 탭
	//생산량/불량율 조회
	@RequestMapping(value = "mm/prodFaultyRateList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prodFaultyRateList(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {

			float sumQty1=0;			//생산실적 수량
			float sumQty2=0;			//생산실적 수량
			
			//******소형***** 
			prodDailyAdmVo.setProdGubun("001");
			
			//1.일일생산량
			List<ProdDailyAdmVo> list = prodDailyAdmService.prodResultStatList(prodDailyAdmVo);
			
			if(list!=null && list.size()!=0) {
				for(int i=0; i<list.size(); i++) {
					sumQty1 += Integer.parseInt(list.get(i).getWorkOrdQty());
				}
			}
			//2.일일 공정작업수
			int dayProcWorkQty = prodDailyAdmService.getDayProcWorkQty(prodDailyAdmVo);
			
			//3.불량수량
			int dayFaultyQty = prodDailyAdmService.getDayFaultyQty(prodDailyAdmVo);
			
			
			
			logger.info("sumQty1:"+sumQty1);
			logger.info("dayProcWorkQty1:"+dayProcWorkQty);
			logger.info("dayProcWorkQty1:"+dayFaultyQty);
			//******중형*****
			prodDailyAdmVo.setProdGubun("002");
			
			//1.일일생산량
			List<ProdDailyAdmVo> list2 = prodDailyAdmService.prodResultStatList(prodDailyAdmVo);
			
			if(list2!=null && list2.size()!=0) {
				for(int i=0; i<list2.size(); i++) {
					sumQty2 += Integer.parseInt(list2.get(i).getWorkOrdQty());
				}
			}
			//2.일일 공정작업수
			int dayProcWorkQty2 = prodDailyAdmService.getDayProcWorkQty(prodDailyAdmVo);
			//3.불량수량
			int dayFaultyQty2 = prodDailyAdmService.getDayFaultyQty(prodDailyAdmVo);
			
			
			logger.info("sumQty2:"+sumQty2);
			logger.info("dayProcWorkQty2:"+dayProcWorkQty2);
			logger.info("dayProcWorkQty2:"+dayFaultyQty2);
			
			prodDailyAdmVo.setProdGubun("001");
			prodDailyAdmVo.setProdDate(DateUtil.getToday("yyyymmdd").substring(0,6));
			int monCumProdQty = prodDailyAdmService.getMonCumProdQty(prodDailyAdmVo);
			
			
			prodDailyAdmVo.setProdGubun("002");
			prodDailyAdmVo.setProdDate(DateUtil.getToday("yyyymmdd").substring(0,6));
			int monCumProdQty2 = prodDailyAdmService.getMonCumProdQty(prodDailyAdmVo);
			
			
			//불량율(PPM)
			int faultyRate=0;
			int faultyRate2=0;
			if(dayProcWorkQty>0) {
				faultyRate = (dayFaultyQty/dayProcWorkQty)*1000000;
			}
			
			if(dayProcWorkQty2>0) {
				faultyRate2 = (dayFaultyQty2/dayProcWorkQty2)*1000000;
			}
			
			
			jsonData.put("result", "ok");
			jsonData.put("sumQty1", sumQty1);					//소형 일일생산량
			jsonData.put("sumQty2", sumQty2);					//중형 일일생산량
			jsonData.put("monCumProdQty", monCumProdQty);		//소형 월 누적생산량
			jsonData.put("monCumProdQty2", monCumProdQty2);		//중형 월 누적생산량
			jsonData.put("dayProcWorkQty", dayProcWorkQty);		//소형 일일공정작업수
			jsonData.put("dayProcWorkQty2", dayProcWorkQty2);	//중형 일일공정작업수
			jsonData.put("dayFaultyQty", dayFaultyQty);			//소형 불량수량
			jsonData.put("dayFaultyQty2", dayFaultyQty2);		//중형 불량수량
			jsonData.put("faultyRate", faultyRate);				//소형 불량율(PPM)
			jsonData.put("faultyRate2", faultyRate2);			//중형 불량율(PPM)
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	//주요 업무 및 이슈 조회
	@RequestMapping(value = "mm/mainIssueAdmList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> mainIssueAdmList(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			logger.info("주요업무 및 이슈 컨트롤러");
			ProdDailyAdmVo vo = prodDailyAdmService.mainIssueAdmList(prodDailyAdmVo);
			if(vo==null) {
				vo = new ProdDailyAdmVo();
			}
			
			jsonData.put("data", vo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//ServoMotor 조회
	@RequestMapping(value = "mm/mainIssueAdmServoMotor", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> mainIssueAdmServoMotor(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			ProdDailyAdmVo vo = prodDailyAdmService.mainIssueAdmServoMotor(prodDailyAdmVo);
				
			jsonData.put("data", vo);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//주요 업무 및 이슈 등록
	@RequestMapping(value = "mm/mainIssueAdmCreate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> mainIssueAdmCreate(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			prodDailyAdmVo.setRegId(Utils.getUserId());
			prodDailyAdmService.mainIssueAdmCreate(prodDailyAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	//주요 업무 및 이슈 조회
	@RequestMapping(value = "mm/mainIssueAdmUpdate", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> mainIssueAdmUpdate(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			prodDailyAdmVo.setUpdId(Utils.getUserId());
			prodDailyAdmService.mainIssueAdmUpdate(prodDailyAdmVo);
			
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//*******************모니터링***************
	//생산성지표
	@RequestMapping(value = "mm/prodIndicaList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> prodIndicaList(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ProdDailyAdmVo> list = prodDailyAdmService.prodIndicaList(prodDailyAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	//공정불량 그래프 조회
	@RequestMapping(value = "mm/procFaultyRateList", method = RequestMethod.GET)
	public @ResponseBody Map<String, Object> procFaultyRateList(ProdDailyAdmVo prodDailyAdmVo) throws Exception {
		Map<String, Object> jsonData = new HashMap<String, Object>();
		try {
			List<ProdDailyAdmVo> list = prodDailyAdmService.procFaultyRateList(prodDailyAdmVo);
			
			jsonData.put("data", list);
			jsonData.put("result", "ok");
		} catch (Exception e) {
			e.printStackTrace();
			jsonData.put("result", "error");
			jsonData.put("message", Utils.getErrorMessage());
		}
		return jsonData;
	}
	
	
	
	
	
}
