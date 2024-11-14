package mes.web.cm;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;

import mes.domain.bm.DealCorpAdmVo;
import mes.domain.bm.EquipCodeAdmVo;
import mes.domain.bm.ItemMotorVo;
import mes.domain.bm.LocationAdmVo;
import mes.domain.bm.MeasureInstrmtAdmVo;
import mes.domain.bm.PrcssBomAdmVo;
import mes.domain.bs.DaySalesPlanAdmVo;
import mes.domain.bs.MonSalesPlanAdmVo;
import mes.domain.wm.DayProdPlanAdmVo;
import mes.domain.wm.MonProdPlanAdmVo;

public class CustomerExcelReader {

	// 창고정보관리 엑셀 업로드
	public List<LocationAdmVo> locationFileload(String filename, Logger logger) throws IOException {
		logger.info("filename = " + filename);
		int pos = filename.lastIndexOf(".");
		String ext = filename.substring(pos + 1);
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		XSSFWorkbook workbook2 = null;
		List<LocationAdmVo> list = new ArrayList<LocationAdmVo>();
		try {
			if (ext.equals("xls")) {
				fis = new FileInputStream(filename);
				workbook = new HSSFWorkbook(fis);

				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				HSSFSheet sheet = workbook.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 1; rowindex < rows; rowindex++) {
					// 행을 읽는다
					HSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						// 셀의 수
						LocationAdmVo[] vo = new LocationAdmVo[rows];
						vo[rowindex - 1] = new LocationAdmVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex <= 18; columnindex++) {
							// 셀값을 읽는다
							HSSFCell cell = row.getCell(columnindex);
							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:

									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {
								case 0:
									vo[rowindex - 1].setLocCd(value);
									break;
								case 1:
									vo[rowindex - 1].setAreaCd(value);
									break;
								case 2:
									vo[rowindex - 1].setFloorNm(value);
									break;
								case 3:
									vo[rowindex - 1].setUseYn(value);
									break;
								case 4:
									vo[rowindex - 1].setLocDesc(value);
									break;
								}
							}
						}

						if (!"".equals(vo[rowindex - 1].getLocCd())) {
							list.add(vo[rowindex - 1]);
						}
					}
				}

				logger.info("list size = " + list.size());

				return list;
			} else {
				logger.info(filename);

				fis = new FileInputStream(filename);
				workbook2 = new XSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				XSSFSheet sheet = workbook2.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 1; rowindex < rows; rowindex++) {
					// 행을 읽는다
					XSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						/*
						 * // 셀데이터 확인 로직 추가 21-02-25 //셀 데이터 확인 boolean checkCell = false; //셀 데이터 전체가
						 * 공백일경우 체크 for(columnindex=0;columnindex<=14;columnindex++){ XSSFCell
						 * cell=row.getCell(columnindex); //셀 데이터 전체가 공백일경우 체크
						 * System.out.println(rowindex); switch (cell.getCellType()){ //공백일경우 다음셀 확인
						 * case BLANK: break; //공백이 아닐경우 체크로직 중단 default: checkCell=true; break; } //공백이
						 * 아닌셀이 발견될경우 체크로직 중단 if(checkCell) { break; } } //전체 공백인경우 메인 row 루프 중단
						 * if(!checkCell) { break; } // 셀데이터 확인 로직 추가 21-02-25
						 */
						// 셀의 수
						LocationAdmVo[] vo = new LocationAdmVo[rows];
						vo[rowindex - 1] = new LocationAdmVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex <= 20; columnindex++) {
							// 셀값을 읽는다
							XSSFCell cell = row.getCell(columnindex);

							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								logger.info("" + cell.getCellType());

								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:
									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}
								switch (columnindex) {
								case 0:
									vo[rowindex - 1].setLocCd(value);
									break;
								case 1:
									vo[rowindex - 1].setAreaCd(value);
									break;
								case 2:
									vo[rowindex - 1].setFloorNm(value);
									break;
								case 3:
									vo[rowindex - 1].setUseYn(value);
									break;
								case 4:
									vo[rowindex - 1].setLocDesc(value);
									break;
								}
							}
						}

						if (!"".equals(vo[rowindex - 1].getLocCd())) {
							list.add(vo[rowindex - 1]);
						}
					}
				}

				logger.info("list size = " + list.size());

			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if (workbook != null) {
					workbook.close();
				}
				if (workbook2 != null) {
					workbook2.close();
				}
				if (fis != null) {
					fis.close();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		logger.info("엑셀 list" + list);
		return list;
	}

	// 거래처정보관리 엑셀 업로드
	public List<DealCorpAdmVo> dealCorpFileload(String filename, Logger logger) throws IOException {
		logger.info("filename = " + filename);
		int pos = filename.lastIndexOf(".");
		String ext = filename.substring(pos + 1);
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		XSSFWorkbook workbook2 = null;
		List<DealCorpAdmVo> list = new ArrayList<DealCorpAdmVo>();
		try {
			if (ext.equals("xls")) {
				fis = new FileInputStream(filename);
				workbook = new HSSFWorkbook(fis);

				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				HSSFSheet sheet = workbook.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 1; rowindex < rows; rowindex++) {
					// 행을 읽는다
					HSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						// 셀의 수
						DealCorpAdmVo[] vo = new DealCorpAdmVo[rows];
						vo[rowindex - 1] = new DealCorpAdmVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex <= 18; columnindex++) {
							// 셀값을 읽는다
							HSSFCell cell = row.getCell(columnindex);
							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:

									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {
								case 0:
									vo[rowindex - 1].setDealCorpCd(value);
									break;
								case 1:
									vo[rowindex - 1].setDealCorpNm(value);
									break;
								case 2:
									vo[rowindex - 1].setInitial(value);
									break;
								case 3:
									vo[rowindex - 1].setPresidentNm(value);
									break;
								case 4:
									vo[rowindex - 1].setCountry(value);
									break;
								case 5:
									vo[rowindex - 1].setCorpNo(value);
									break;
								case 6:
									vo[rowindex - 1].setRegistNo(value);
									break;
								case 7:
									vo[rowindex - 1].setBizCond(value);
									break;
								case 8:
									vo[rowindex - 1].setBizType(value);
									break;
								case 9:
									vo[rowindex - 1].setAddrNo(value);
									break;
								case 10:
									vo[rowindex - 1].setAddrBase(value);
									break;
								case 11:
									vo[rowindex - 1].setAddrDtl(value);
									break;
								case 12:
									vo[rowindex - 1].setTelNo(value);
									break;
								case 13:
									vo[rowindex - 1].setFaxNo(value);
									break;
								case 14:
									vo[rowindex - 1].setEmailAddr(value);
									break;
								case 15:
									vo[rowindex - 1].setTax(value);
									break;
								case 16:
									vo[rowindex - 1].setOfficeCharger(value);
									break;
								case 17:
									vo[rowindex - 1].setBizCharger(value);
									break;
								case 18:
									try {
										vo[rowindex - 1].setDealGubun(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setDealGubun("");
									}
									break;
								case 19:
									vo[rowindex - 1].setUseYn(value);
									break;
								case 20:
									vo[rowindex - 1].setDealCorpDesc(value);
									break;

								}
							}

						}

						if (!"".equals(vo[rowindex - 1].getDealCorpCd())
								|| !"".equals(vo[rowindex - 1].getDealCorpNm())) {
							list.add(vo[rowindex - 1]);
						}

					}

				}

				logger.info("list size = " + list.size());

				return list;
			} else {
				logger.info(filename);

				fis = new FileInputStream(filename);
				workbook2 = new XSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				XSSFSheet sheet = workbook2.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 1; rowindex < rows; rowindex++) {
					// 행을 읽는다
					XSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						/*
						 * // 셀데이터 확인 로직 추가 21-02-25 //셀 데이터 확인 boolean checkCell = false; //셀 데이터 전체가
						 * 공백일경우 체크 for(columnindex=0;columnindex<=14;columnindex++){ XSSFCell
						 * cell=row.getCell(columnindex); //셀 데이터 전체가 공백일경우 체크
						 * System.out.println(rowindex); switch (cell.getCellType()){ //공백일경우 다음셀 확인
						 * case BLANK: break; //공백이 아닐경우 체크로직 중단 default: checkCell=true; break; } //공백이
						 * 아닌셀이 발견될경우 체크로직 중단 if(checkCell) { break; } } //전체 공백인경우 메인 row 루프 중단
						 * if(!checkCell) { break; } // 셀데이터 확인 로직 추가 21-02-25
						 */
						// 셀의 수
						DealCorpAdmVo[] vo = new DealCorpAdmVo[rows];
						vo[rowindex - 1] = new DealCorpAdmVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex <= 20; columnindex++) {
							// 셀값을 읽는다
							XSSFCell cell = row.getCell(columnindex);

							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								logger.info("" + cell.getCellType());

								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:
									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}
								switch (columnindex) {
								case 0:
									vo[rowindex - 1].setDealCorpCd(value);
									break;
								case 1:
									vo[rowindex - 1].setDealCorpNm(value);
									break;
								case 2:
									vo[rowindex - 1].setInitial(value);
									break;
								case 3:
									vo[rowindex - 1].setPresidentNm(value);
									break;
								case 4:
									vo[rowindex - 1].setCountry(value);
									break;
								case 5:
									vo[rowindex - 1].setCorpNo(value);
									break;
								case 6:
									vo[rowindex - 1].setRegistNo(value);
									break;
								case 7:
									vo[rowindex - 1].setBizCond(value);
									break;
								case 8:
									vo[rowindex - 1].setBizType(value);
									break;
								case 9:
									vo[rowindex - 1].setAddrNo(value);
									break;
								case 10:
									vo[rowindex - 1].setAddrBase(value);
									break;
								case 11:
									vo[rowindex - 1].setAddrDtl(value);
									break;
								case 12:
									vo[rowindex - 1].setTelNo(value);
									break;
								case 13:
									vo[rowindex - 1].setFaxNo(value);
									break;
								case 14:
									vo[rowindex - 1].setEmailAddr(value);
									break;
								case 15:
									vo[rowindex - 1].setTax(value);
									break;
								case 16:
									vo[rowindex - 1].setOfficeCharger(value);
									break;
								case 17:
									vo[rowindex - 1].setBizCharger(value);
									break;
								case 18:
									try {
										vo[rowindex - 1].setDealGubun(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setDealGubun("");
									}
									break;
								case 19:
									vo[rowindex - 1].setUseYn(value);
									break;
								case 20:
									vo[rowindex - 1].setDealCorpDesc(value);
									break;

								}
							}

						}

						if (!"".equals(vo[rowindex - 1].getDealCorpCd())
								|| !"".equals(vo[rowindex - 1].getDealCorpNm())) {
							list.add(vo[rowindex - 1]);
						}

					}

				}

				logger.info("list size = " + list.size());

			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if (workbook != null) {
					workbook.close();
				}
				if (workbook2 != null) {
					workbook2.close();
				}
				if (fis != null) {
					fis.close();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		logger.info("엑셀 list" + list);
		return list;
	}

	// 계측기관리 엑셀 업로드
	public List<MeasureInstrmtAdmVo> measureFileload(String filename, Logger logger) throws IOException {
		logger.info("filename = " + filename);
		int pos = filename.lastIndexOf(".");
		String ext = filename.substring(pos + 1);
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		XSSFWorkbook workbook2 = null;
		List<MeasureInstrmtAdmVo> list = new ArrayList<MeasureInstrmtAdmVo>();
		try {
			if (ext.equals("xls")) {
				fis = new FileInputStream(filename);
				workbook = new HSSFWorkbook(fis);

				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				HSSFSheet sheet = workbook.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 1; rowindex < rows; rowindex++) {
					// 행을 읽는다
					HSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						// 셀의 수
						MeasureInstrmtAdmVo[] vo = new MeasureInstrmtAdmVo[rows];
						vo[rowindex - 1] = new MeasureInstrmtAdmVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex <= 14; columnindex++) {
							// 셀값을 읽는다
							HSSFCell cell = row.getCell(columnindex);
							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:

									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = cell.getStringCellValue() + "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {
								case 0:
									try {
										vo[rowindex - 1].setAdmNo(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setAdmNo("");
									}
									break;
								case 1:
									try {
										vo[rowindex - 1].setMitNo(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMitNo("");
									}
									break;
								case 2:
									try {
										vo[rowindex - 1].setMitNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMitNm("");
									}
									break;
								case 3:
									try {
										vo[rowindex - 1].setMitLoc(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMitLoc("");
									}
									break;
								case 4:
									try {
										vo[rowindex - 1].setAdmDept(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setAdmDept("");
									}
									break;
								case 5:
									try {
										vo[rowindex - 1].setMainChargr(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMainChargr("");
									}
									break;
								case 6:
									try {
										vo[rowindex - 1].setCorrCycle(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setCorrCycle("");
									}
									break;
								case 7:
									try {
										vo[rowindex - 1].setCorrCount(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setCorrCount("");
									}
									break;
								case 8:
									try {
										vo[rowindex - 1].setMitForm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMitForm("");
									}
									break;
								case 9:
									try {
										vo[rowindex - 1].setMitKind(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMitKind("");
									}
									break;
								case 10:
									try {
										vo[rowindex - 1].setModelNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setModelNm("");
									}
									break;
								case 11:
									try {
										vo[rowindex - 1].setMfcCorpNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMfcCorpNm("");
									}
									break;
								case 12:
									try {
										vo[rowindex - 1].setAcqDate(value.replaceAll("-", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setAcqDate("");
									}
									break;
								case 13:
									try {
										vo[rowindex - 1].setAcqCost(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setAcqCost("0");
									}
									break;
								case 14:
									try {
										vo[rowindex - 1].setMitDesc(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMitDesc("");
									}
									break;
								}
							}
						}
						if (!"".equals(vo[rowindex - 1].getAdmNo()) || !"".equals(vo[rowindex - 1].getMitNm())) {
							list.add(vo[rowindex - 1]);
						}
					}
				}

				logger.info("list size = " + list.size());

				return list;
			} else {
				logger.info(filename);

				fis = new FileInputStream(filename);
				workbook2 = new XSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				XSSFSheet sheet = workbook2.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 1; rowindex < rows; rowindex++) {
					// 행을 읽는다
					XSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						/*
						 * // 셀데이터 확인 로직 추가 21-02-25 //셀 데이터 확인 boolean checkCell = false; //셀 데이터 전체가
						 * 공백일경우 체크 for(columnindex=0;columnindex<=14;columnindex++){ XSSFCell
						 * cell=row.getCell(columnindex); //셀 데이터 전체가 공백일경우 체크
						 * System.out.println(rowindex); switch (cell.getCellType()){ //공백일경우 다음셀 확인
						 * case BLANK: break; //공백이 아닐경우 체크로직 중단 default: checkCell=true; break; } //공백이
						 * 아닌셀이 발견될경우 체크로직 중단 if(checkCell) { break; } } //전체 공백인경우 메인 row 루프 중단
						 * if(!checkCell) { break; } // 셀데이터 확인 로직 추가 21-02-25
						 */
						// 셀의 수
						MeasureInstrmtAdmVo[] vo = new MeasureInstrmtAdmVo[rows];
						vo[rowindex - 1] = new MeasureInstrmtAdmVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex <= 14; columnindex++) {
							// 셀값을 읽는다
							XSSFCell cell = row.getCell(columnindex);

							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								logger.info("" + cell.getCellType());

								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:
									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = cell.getStringCellValue() + "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}
								switch (columnindex) {
								case 0:
									try {
										vo[rowindex - 1].setAdmNo(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setAdmNo("");
									}
									break;
								case 1:
									try {
										vo[rowindex - 1].setMitNo(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMitNo("");
									}
									break;
								case 2:
									try {
										vo[rowindex - 1].setMitNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMitNm("");
									}
									break;
								case 3:
									try {
										vo[rowindex - 1].setMitLoc(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMitLoc("");
									}
									break;
								case 4:
									try {
										vo[rowindex - 1].setAdmDept(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setAdmDept("");
									}
									break;
								case 5:
									try {
										vo[rowindex - 1].setMainChargr(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMainChargr("");
									}
									break;
								case 6:
									try {
										vo[rowindex - 1].setCorrCycle(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setCorrCycle("");
									}
									break;
								case 7:
									try {
										vo[rowindex - 1].setCorrCount(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setCorrCount("");
									}
									break;
								case 8:
									try {
										vo[rowindex - 1].setMitForm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMitForm("");
									}
									break;
								case 9:
									try {
										vo[rowindex - 1].setMitKind(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMitKind("");
									}
									break;
								case 10:
									try {
										vo[rowindex - 1].setModelNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setModelNm("");
									}
									break;
								case 11:
									try {
										vo[rowindex - 1].setMfcCorpNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMfcCorpNm("");
									}
									break;
								case 12:
									try {
										vo[rowindex - 1].setAcqDate(value.replaceAll("-", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setAcqDate("");
									}
									break;
								case 13:
									try {
										vo[rowindex - 1].setAcqCost(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setAcqCost("0");
									}
									break;
								case 14:
									try {
										vo[rowindex - 1].setMitDesc(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMitDesc("");
									}
									break;
								}
							}
						}
						if (!"".equals(vo[rowindex - 1].getAdmNo()) || !"".equals(vo[rowindex - 1].getMitNm())) {
							list.add(vo[rowindex - 1]);
						}
					}
				}
				logger.info("list size = " + list.size());
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if (workbook != null) {
					workbook.close();
				}
				if (workbook2 != null) {
					workbook2.close();
				}
				if (fis != null) {
					fis.close();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		logger.info("엑셀 list" + list);
		return list;
	}

	// 설비정보관리 엑셀 업로드
	public List<EquipCodeAdmVo> equipFileload(String filename, Logger logger) throws IOException {
		logger.info("filename = " + filename);
		int pos = filename.lastIndexOf(".");
		String ext = filename.substring(pos + 1);
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		XSSFWorkbook workbook2 = null;
		List<EquipCodeAdmVo> list = new ArrayList<EquipCodeAdmVo>();
		try {
			if (ext.equals("xls")) {
				fis = new FileInputStream(filename);
				workbook = new HSSFWorkbook(fis);

				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				HSSFSheet sheet = workbook.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 1; rowindex < rows; rowindex++) {
					// 행을 읽는다
					HSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						// 셀의 수
						EquipCodeAdmVo[] vo = new EquipCodeAdmVo[rows];
						vo[rowindex - 1] = new EquipCodeAdmVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex <= 17; columnindex++) {
							// 셀값을 읽는다
							HSSFCell cell = row.getCell(columnindex);
							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:

									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = cell.getBooleanCellValue() + "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {
								case 0:
									vo[rowindex - 1].setAssetCd(value);
									break;
								case 1:
									vo[rowindex - 1].setAssetGubun(value);
									break;
								case 2:
									try {
										vo[rowindex - 1].setBuyAmt(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setBuyAmt("");
									}
									break;
								case 3:
									vo[rowindex - 1].setEquipNo(value);
									break;
								case 4:
									vo[rowindex - 1].setEquipNm(value);
									break;
								case 5:
									vo[rowindex - 1].setPrcNm(value);
									break;
								case 6:
									vo[rowindex - 1].setEquipType(value);
									break;
								case 7:
									try {
										vo[rowindex - 1].setMfcDate(value.replaceAll("-", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMfcDate(value);
									}
									break;
								case 8:
									vo[rowindex - 1].setMfcCorpCd(value);
									break;
								case 9:
									vo[rowindex - 1].setEquipCond(value.replaceAll("-", ""));
									break;
								case 10:
									try {
										vo[rowindex - 1].setUpperAmt(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setUpperAmt("");
									}
									break;
								case 11:
									try {
										vo[rowindex - 1].setLowerAmt(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setLowerAmt("");
									}
									break;
								case 12:
									vo[rowindex - 1].setAncEquipNm(value);
									break;
								case 13:

									try {
										vo[rowindex - 1].setAncDate(value.replaceAll("-", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setAncDate(value);
									}
									break;
								case 14:
									vo[rowindex - 1].setAncCorpCd(value);
									break;
								case 15:
									vo[rowindex - 1].setExpNm(value);
									break;
								case 16:
									vo[rowindex - 1].setAncEquipType(value);
									break;
								case 17:
									vo[rowindex - 1].setBuyCorpNm(value);
									break;
								}
							}
						}
						list.add(vo[rowindex - 1]);
					}
				}

				logger.info("list size = " + list.size());

				return list;
			} else {
				logger.info(filename);

				fis = new FileInputStream(filename);
				workbook2 = new XSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				XSSFSheet sheet = workbook2.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 1; rowindex < rows; rowindex++) {
					// 행을 읽는다
					XSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						/*
						 * // 셀데이터 확인 로직 추가 21-02-25 //셀 데이터 확인 boolean checkCell = false; //셀 데이터 전체가
						 * 공백일경우 체크 for(columnindex=0;columnindex<=14;columnindex++){ XSSFCell
						 * cell=row.getCell(columnindex); //셀 데이터 전체가 공백일경우 체크
						 * System.out.println(rowindex); switch (cell.getCellType()){ //공백일경우 다음셀 확인
						 * case BLANK: break; //공백이 아닐경우 체크로직 중단 default: checkCell=true; break; } //공백이
						 * 아닌셀이 발견될경우 체크로직 중단 if(checkCell) { break; } } //전체 공백인경우 메인 row 루프 중단
						 * if(!checkCell) { break; } // 셀데이터 확인 로직 추가 21-02-25
						 */
						// 셀의 수
						EquipCodeAdmVo[] vo = new EquipCodeAdmVo[rows];
						vo[rowindex - 1] = new EquipCodeAdmVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex <= 17; columnindex++) {
							// 셀값을 읽는다
							XSSFCell cell = row.getCell(columnindex);

							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								logger.info("" + cell.getCellType());

								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:
									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = cell.getBooleanCellValue() + "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}
								switch (columnindex) {
								case 0:
									vo[rowindex - 1].setAssetCd(value);
									break;
								case 1:
									vo[rowindex - 1].setAssetGubun(value);
									break;
								case 2:
									try {
										vo[rowindex - 1].setBuyAmt(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setBuyAmt("");
									}
									break;
								case 3:
									vo[rowindex - 1].setEquipNo(value);
									break;
								case 4:
									vo[rowindex - 1].setEquipNm(value);
									break;
								case 5:
									vo[rowindex - 1].setPrcNm(value);
									break;
								case 6:
									vo[rowindex - 1].setEquipType(value);
									break;
								case 7:
									try {
										vo[rowindex - 1].setMfcDate(value.replaceAll("-", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMfcDate(value);
									}
									break;
								case 8:
									vo[rowindex - 1].setMfcCorpCd(value);
									break;
								case 9:
									vo[rowindex - 1].setEquipCond(value.replaceAll("-", ""));
									break;
								case 10:
									try {
										vo[rowindex - 1].setUpperAmt(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setUpperAmt("");
									}
									break;
								case 11:
									try {
										vo[rowindex - 1].setLowerAmt(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setLowerAmt("");
									}
									break;
								case 12:
									vo[rowindex - 1].setAncEquipNm(value);
									break;
								case 13:
									try {
										vo[rowindex - 1].setAncDate(value.replaceAll("-", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setAncDate(value);
									}
									break;
								case 14:
									vo[rowindex - 1].setAncCorpCd(value);
									break;
								case 15:
									vo[rowindex - 1].setExpNm(value);
									break;
								case 16:
									vo[rowindex - 1].setAncEquipType(value);
									break;
								case 17:
									vo[rowindex - 1].setBuyCorpNm(value);
									break;
								}
							}
						}
						list.add(vo[rowindex - 1]);
					}
				}

				logger.info("list size = " + list.size());

			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if (workbook != null) {
					workbook.close();
				}
				if (workbook2 != null) {
					workbook2.close();
				}
				if (fis != null) {
					fis.close();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		logger.info("엑셀 list" + list);
		return list;
	}

	// 모터정보 엑셀 업로드
	public List<ItemMotorVo> itemMotorFileload(String filename, Logger logger) throws IOException {
		logger.info("filename = " + filename);
		int pos = filename.lastIndexOf(".");
		String ext = filename.substring(pos + 1);
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		XSSFWorkbook workbook2 = null;
		List<ItemMotorVo> list = new ArrayList<ItemMotorVo>();
		try {
			if (ext.equals("xls")) {
				fis = new FileInputStream(filename);
				workbook = new HSSFWorkbook(fis);

				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				HSSFSheet sheet = workbook.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 1; rowindex < rows; rowindex++) {
					// 행을 읽는다
					HSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						// 셀의 수
						ItemMotorVo[] vo = new ItemMotorVo[rows];
						vo[rowindex - 1] = new ItemMotorVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex < 18; columnindex++) {
							// 셀값을 읽는다
							HSSFCell cell = row.getCell(columnindex);
							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:

									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {
								case 0:
									vo[rowindex - 1].setItemCd(value);
									break;
								case 1:
									vo[rowindex - 1].setItemNm(value);
									break;
								case 2:
									vo[rowindex - 1].setItemRev(value);
									break;
								case 3:
									vo[rowindex - 1].setItemGubun(value);
									break;
								case 4:
									vo[rowindex - 1].setItemSeries(value);
									break;
								case 5:
									vo[rowindex - 1].setFrameSize(value);
									break;
								case 6:
									vo[rowindex - 1].setItemCapa(value);
									break;
								case 7:
									vo[rowindex - 1].setItemEncdr(value);
									break;
								case 8:
									vo[rowindex - 1].setItemType(value);
									break;
								case 9:
									vo[rowindex - 1].setIpClass(value);
									break;
								case 10:
									try {
										vo[rowindex - 1].setSerialNo(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setSerialNo(value);
									}
									break;
								case 11:
									vo[rowindex - 1].setItemVoltage(value);
									break;
								case 12:
									vo[rowindex - 1].setItemOutput(value);
									break;
								case 13:
									vo[rowindex - 1].setItemSize(value);
									break;
								case 14:
									vo[rowindex - 1].setItemGubun2(value);
									break;
								case 15:

									try {
										vo[rowindex - 1].setUnitCost(Integer.parseInt(value.replaceAll(",", "")));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setUnitCost(Integer.parseInt(value));
									}

									break;
								case 16:
									vo[rowindex - 1].setUseYn(value);
									break;
								case 17:
									vo[rowindex - 1].setItemDesc(value);
									break;
								}
							}
						}

						if (!"".equals(vo[rowindex - 1].getItemCd()) && !"".equals(vo[rowindex - 1].getItemRev())) {
							list.add(vo[rowindex - 1]);
						}

					}

				}

				logger.info("list size = " + list.size());

				return list;
			} else {
				logger.info(filename);

				fis = new FileInputStream(filename);
				workbook2 = new XSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				XSSFSheet sheet = workbook2.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 1; rowindex < rows; rowindex++) {
					// 행을 읽는다
					XSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						/*
						 * // 셀데이터 확인 로직 추가 21-02-25 //셀 데이터 확인 boolean checkCell = false; //셀 데이터 전체가
						 * 공백일경우 체크 for(columnindex=0;columnindex<=14;columnindex++){ XSSFCell
						 * cell=row.getCell(columnindex); //셀 데이터 전체가 공백일경우 체크
						 * System.out.println(rowindex); switch (cell.getCellType()){ //공백일경우 다음셀 확인
						 * case BLANK: break; //공백이 아닐경우 체크로직 중단 default: checkCell=true; break; } //공백이
						 * 아닌셀이 발견될경우 체크로직 중단 if(checkCell) { break; } } //전체 공백인경우 메인 row 루프 중단
						 * if(!checkCell) { break; } // 셀데이터 확인 로직 추가 21-02-25
						 */
						// 셀의 수
						ItemMotorVo[] vo = new ItemMotorVo[rows];
						vo[rowindex - 1] = new ItemMotorVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex < 18; columnindex++) {
							// 셀값을 읽는다
							XSSFCell cell = row.getCell(columnindex);

							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								logger.info("" + cell.getCellType());

								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:
									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}
								switch (columnindex) {
								case 0:
									vo[rowindex - 1].setItemCd(value);
									break;
								case 1:
									vo[rowindex - 1].setItemNm(value);
									break;
								case 2:
									vo[rowindex - 1].setItemRev(value);
									break;
								case 3:
									vo[rowindex - 1].setItemGubun(value);
									break;
								case 4:
									vo[rowindex - 1].setItemSeries(value);
									break;
								case 5:
									vo[rowindex - 1].setFrameSize(value);
									break;
								case 6:
									vo[rowindex - 1].setItemCapa(value);
									break;
								case 7:
									vo[rowindex - 1].setItemEncdr(value);
									break;
								case 8:
									vo[rowindex - 1].setItemType(value);
									break;
								case 9:
									vo[rowindex - 1].setIpClass(value);
									break;
								case 10:
									try {
										vo[rowindex - 1].setSerialNo(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setSerialNo(value);
									}
									break;
								case 11:
									vo[rowindex - 1].setItemVoltage(value);
									break;
								case 12:
									vo[rowindex - 1].setItemOutput(value);
									break;
								case 13:
									vo[rowindex - 1].setItemSize(value);
									break;
								case 14:
									vo[rowindex - 1].setItemGubun2(value);
									break;
								case 15:
									try {
										vo[rowindex - 1].setUnitCost(Integer.parseInt(value.replaceAll(",", "")));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setUnitCost(Integer.parseInt(value));
									}
									break;
								case 16:
									vo[rowindex - 1].setUseYn(value);
									break;
								case 17:
									vo[rowindex - 1].setItemDesc(value);
									break;
								}
							}
						}
						if (!"".equals(vo[rowindex - 1].getItemCd()) && !"".equals(vo[rowindex - 1].getItemRev())) {
							list.add(vo[rowindex - 1]);
						}

					}

				}

				logger.info("list size = " + list.size());

			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if (workbook != null) {
					workbook.close();
				}
				if (workbook2 != null) {
					workbook2.close();
				}
				if (fis != null) {
					fis.close();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		logger.info("엑셀 list" + list);
		return list;
	}

	// BOM-MAT 엑셀 업로드
	public List<ItemMotorVo> bomMatchFileload(String filename, Logger logger) throws IOException {
		logger.info("filename = " + filename);
		int pos = filename.lastIndexOf(".");
		String ext = filename.substring(pos + 1);
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		XSSFWorkbook workbook2 = null;
		List<ItemMotorVo> list = new ArrayList<ItemMotorVo>();
		try {
			if (ext.equals("xls")) {
				fis = new FileInputStream(filename);
				workbook = new HSSFWorkbook(fis);

				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				HSSFSheet sheet = workbook.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 1; rowindex < rows; rowindex++) {
					// 행을 읽는다
					HSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						// 셀의 수
						ItemMotorVo[] vo = new ItemMotorVo[rows];
						vo[rowindex - 1] = new ItemMotorVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex <= 4; columnindex++) {
							// 셀값을 읽는다
							HSSFCell cell = row.getCell(columnindex);
							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:

									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = cell.getBooleanCellValue() + "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {
								case 0:
									vo[rowindex - 1].setItemCd(value);
									break;
								case 1:
									vo[rowindex - 1].setItemRev(value);
									break;
								case 2:
									vo[rowindex - 1].setPrcssCd(value);
									break;
								case 3:
									vo[rowindex - 1].setPartCd(value);
									break;
								case 4:
									vo[rowindex - 1].setPartRev(value);
									break;
								}
							}
						}

						if (!"".equals(vo[rowindex - 1].getItemCd()) && !"".equals(vo[rowindex - 1].getItemRev())
								&& !"".equals(vo[rowindex - 1].getPrcssCd()) && !"".equals(vo[rowindex - 1].getPartCd())
								&& !"".equals(vo[rowindex - 1].getPartRev())) {
							list.add(vo[rowindex - 1]);
						}
					}
				}

				logger.info("list size = " + list.size());

				return list;
			} else {
				logger.info(filename);

				fis = new FileInputStream(filename);
				workbook2 = new XSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				XSSFSheet sheet = workbook2.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 1; rowindex < rows; rowindex++) {
					// 행을 읽는다
					XSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						/*
						 * // 셀데이터 확인 로직 추가 21-02-25 //셀 데이터 확인 boolean checkCell = false; //셀 데이터 전체가
						 * 공백일경우 체크 for(columnindex=0;columnindex<=14;columnindex++){ XSSFCell
						 * cell=row.getCell(columnindex); //셀 데이터 전체가 공백일경우 체크
						 * System.out.println(rowindex); switch (cell.getCellType()){ //공백일경우 다음셀 확인
						 * case BLANK: break; //공백이 아닐경우 체크로직 중단 default: checkCell=true; break; } //공백이
						 * 아닌셀이 발견될경우 체크로직 중단 if(checkCell) { break; } } //전체 공백인경우 메인 row 루프 중단
						 * if(!checkCell) { break; } // 셀데이터 확인 로직 추가 21-02-25
						 */
						// 셀의 수
						ItemMotorVo[] vo = new ItemMotorVo[rows];
						vo[rowindex - 1] = new ItemMotorVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex <= 4; columnindex++) {
							// 셀값을 읽는다
							XSSFCell cell = row.getCell(columnindex);

							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								logger.info("" + cell.getCellType());

								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:
									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = cell.getBooleanCellValue() + "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {

								case 0:
									vo[rowindex - 1].setItemCd(value);
									break;
								case 1:
									vo[rowindex - 1].setItemRev(value);
									break;
								case 2:
									vo[rowindex - 1].setPrcssCd(value);
									break;
								case 3:
									vo[rowindex - 1].setPartCd(value);
									break;
								case 4:
									vo[rowindex - 1].setPartRev(value);
									break;
								}
							}
						}

						if (!"".equals(vo[rowindex - 1].getItemCd()) && !"".equals(vo[rowindex - 1].getItemRev())
								&& !"".equals(vo[rowindex - 1].getPrcssCd()) && !"".equals(vo[rowindex - 1].getPartCd())
								&& !"".equals(vo[rowindex - 1].getPartRev())) {
							list.add(vo[rowindex - 1]);
						}
					}
				}

				logger.info("list size = " + list.size());

			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if (workbook != null) {
					workbook.close();
				}
				if (workbook2 != null) {
					workbook2.close();
				}
				if (fis != null) {
					fis.close();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		logger.info("엑셀 list" + list);
		return list;
	}

	// EBOM 엑셀 업로드
	public List<ItemMotorVo> eBomFileload(String filename, Logger logger) throws IOException {
		logger.info("filename = " + filename);
		int pos = filename.lastIndexOf(".");
		String ext = filename.substring(pos + 1);
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		XSSFWorkbook workbook2 = null;
		List<ItemMotorVo> list = new ArrayList<ItemMotorVo>();
		try {
			if (ext.equals("xls")) {
				fis = new FileInputStream(filename);
				workbook = new HSSFWorkbook(fis);

				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				HSSFSheet sheet = workbook.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 1; rowindex < rows; rowindex++) {
					// 행을 읽는다
					HSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						// 셀의 수
						ItemMotorVo[] vo = new ItemMotorVo[rows];
						vo[rowindex - 1] = new ItemMotorVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex <= 2; columnindex++) {
							// 셀값을 읽는다
							HSSFCell cell = row.getCell(columnindex);
							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:

									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = cell.getBooleanCellValue() + "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {
								case 0:
									vo[rowindex - 1].setPartCd(value.replaceAll(",", ""));
									break;
								case 1:
									vo[rowindex - 1].setPartRev(value);
									break;
								case 2:
									try {
										vo[rowindex - 1].setPartConsumpt(Float.parseFloat(value.replaceAll(",", "")));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setPartConsumpt(0);
									}
									break;
								}
							}
						}

						if (!"".equals(vo[rowindex - 1].getItemCd()) && !"".equals(vo[rowindex - 1].getItemRev())
								&& !"".equals(vo[rowindex - 1].getPrcssCd()) && !"".equals(vo[rowindex - 1].getPartCd())
								&& !"".equals(vo[rowindex - 1].getPartRev())) {
							list.add(vo[rowindex - 1]);
						}
					}
				}

				logger.info("list size = " + list.size());

				return list;
			} else {
				logger.info(filename);

				fis = new FileInputStream(filename);
				workbook2 = new XSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				XSSFSheet sheet = workbook2.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 1; rowindex < rows; rowindex++) {
					// 행을 읽는다
					XSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						/*
						 * // 셀데이터 확인 로직 추가 21-02-25 //셀 데이터 확인 boolean checkCell = false; //셀 데이터 전체가
						 * 공백일경우 체크 for(columnindex=0;columnindex<=14;columnindex++){ XSSFCell
						 * cell=row.getCell(columnindex); //셀 데이터 전체가 공백일경우 체크
						 * System.out.println(rowindex); switch (cell.getCellType()){ //공백일경우 다음셀 확인
						 * case BLANK: break; //공백이 아닐경우 체크로직 중단 default: checkCell=true; break; } //공백이
						 * 아닌셀이 발견될경우 체크로직 중단 if(checkCell) { break; } } //전체 공백인경우 메인 row 루프 중단
						 * if(!checkCell) { break; } // 셀데이터 확인 로직 추가 21-02-25
						 */
						// 셀의 수
						ItemMotorVo[] vo = new ItemMotorVo[rows];
						vo[rowindex - 1] = new ItemMotorVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex <= 2; columnindex++) {
							// 셀값을 읽는다
							XSSFCell cell = row.getCell(columnindex);

							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								logger.info("" + cell.getCellType());

								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:
									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = cell.getBooleanCellValue() + "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {

								case 0:
									vo[rowindex - 1].setPartCd(value.replaceAll(",", ""));
									break;
								case 1:
									vo[rowindex - 1].setPartRev(value);
									break;
								case 2:
									try {
										vo[rowindex - 1].setPartConsumpt(Float.parseFloat(value.replaceAll(",", "")));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setPartConsumpt(0);
									}
									break;
								}
							}
						}

						if (!"".equals(vo[rowindex - 1].getItemCd()) && !"".equals(vo[rowindex - 1].getItemRev())
								&& !"".equals(vo[rowindex - 1].getPrcssCd()) && !"".equals(vo[rowindex - 1].getPartCd())
								&& !"".equals(vo[rowindex - 1].getPartRev())) {
							list.add(vo[rowindex - 1]);
						}
					}
				}

				logger.info("list size = " + list.size());

			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if (workbook != null) {
					workbook.close();
				}
				if (workbook2 != null) {
					workbook2.close();
				}
				if (fis != null) {
					fis.close();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		logger.info("엑셀 list" + list);
		return list;
	}

	/*
	 * //부품정보 엑셀 업로드 public List<ItemPartAdmVo> itemPartFileload(String filename,
	 * Logger logger) throws IOException { logger.info("filename = "+ filename); int
	 * pos = filename.lastIndexOf( "." ); String ext = filename.substring( pos + 1
	 * ); FileInputStream fis = null; HSSFWorkbook workbook = null; XSSFWorkbook
	 * workbook2 = null; List<ItemPartAdmVo> list = new ArrayList<ItemPartAdmVo>();
	 * try { if(ext.equals("xls")) { fis= new FileInputStream(filename); workbook=
	 * new HSSFWorkbook(fis);
	 * 
	 * DecimalFormat df = new DecimalFormat();
	 * 
	 * int rowindex=0; int columnindex=0; //시트 수 (첫번째에만 존재하므로 0을 준다) //만약 각 시트를
	 * 읽기위해서는 FOR문을 한번더 돌려준다 HSSFSheet sheet=workbook.getSheetAt(0); //행의 수 int
	 * rows=sheet.getPhysicalNumberOfRows();
	 * 
	 * for(rowindex=1;rowindex<rows;rowindex++){ //행을 읽는다 HSSFRow
	 * row=sheet.getRow(rowindex); Row row2 = row;
	 * 
	 * if(row !=null && !row2.getZeroHeight()){
	 * 
	 * 
	 * //셀의 수 ItemPartAdmVo[] vo = new ItemPartAdmVo[rows]; vo[rowindex-1] = new
	 * ItemPartAdmVo(); int cells=row.getPhysicalNumberOfCells();
	 * for(columnindex=0;columnindex<=12;columnindex++){ //셀값을 읽는다 HSSFCell
	 * cell=row.getCell(columnindex); String value=""; //셀이 빈값일경우를 위한 널체크
	 * if(cell==null){ continue; }else{ //타입별로 내용 읽기 switch (cell.getCellType()){
	 * case FORMULA: value=cell.getCellFormula() + ""; break; case NUMERIC:
	 * 
	 * if(DateUtil.isCellDateFormatted(cell)) { SimpleDateFormat formatter = new
	 * SimpleDateFormat("yyyy-MM-dd"); value =
	 * formatter.format(cell.getDateCellValue()) + ""; } else { double ddata =
	 * cell.getNumericCellValue(); value = df.format(ddata) + ""; }
	 * 
	 * break; case STRING: value=cell.getStringCellValue()+""; break; case BLANK:
	 * value=""; break; case ERROR: value=cell.getErrorCellValue()+""; break; }
	 * 
	 * 
	 * switch(columnindex) { case 0: try {
	 * vo[rowindex-1].setPartCd(value.replaceAll(",","")); }catch
	 * (NumberFormatException e) { vo[rowindex-1].setPartCd(""); } break; case 1:
	 * vo[rowindex-1].setPartNm(value); break; case 2:
	 * vo[rowindex-1].setPartGubun(value); break; case 3:
	 * vo[rowindex-1].setPartType(value); break; case 4:
	 * vo[rowindex-1].setPartRev(value); break; case 5:
	 * vo[rowindex-1].setPartSpec(value); break; case 6: try {
	 * vo[rowindex-1].setInCorpCd(value.replaceAll(",","")); }catch
	 * (NumberFormatException e) { vo[rowindex-1].setInCorpCd(""); } break; case 7:
	 * vo[rowindex-1].setPartUnit(value); break; case 8:
	 * vo[rowindex-1].setBasicDlvDate(value); break; case 9: try {
	 * vo[rowindex-1].setUnitCost(Integer.parseInt(value.replaceAll(",","")));
	 * }catch (NumberFormatException e) { vo[rowindex-1].setUnitCost(0); } // 셀데이터
	 * break; case 10: vo[rowindex-1].setUseYn(value); break; case 11:
	 * vo[rowindex-1].setInspectYn(value); break; case 12:
	 * vo[rowindex-1].setPartDesc(value); break;
	 * 
	 * } }
	 * 
	 * }
	 * 
	 * if(!"".equals(vo[rowindex-1].getPartCd())&&!"".equals(vo[rowindex-1].
	 * getPartRev())){ list.add(vo[rowindex-1]); }
	 * 
	 * 
	 * 
	 * }
	 * 
	 * }
	 * 
	 * 
	 * logger.info("list size = "+ list.size());
	 * 
	 * return list; } else { logger.info(filename);
	 * 
	 * fis= new FileInputStream(filename); workbook2= new XSSFWorkbook(fis);
	 * DecimalFormat df = new DecimalFormat();
	 * 
	 * int rowindex=0; int columnindex=0; //시트 수 (첫번째에만 존재하므로 0을 준다) //만약 각 시트를
	 * 읽기위해서는 FOR문을 한번더 돌려준다 XSSFSheet sheet=workbook2.getSheetAt(0); //행의 수 int
	 * rows=sheet.getPhysicalNumberOfRows();
	 * 
	 * for(rowindex=1;rowindex<rows;rowindex++){ //행을 읽는다 XSSFRow
	 * row=sheet.getRow(rowindex); Row row2 = row;
	 * 
	 * if(row !=null && !row2.getZeroHeight()){
	 * 
	 * 
	 * // 셀데이터 확인 로직 추가 21-02-25 //셀 데이터 확인 boolean checkCell = false; //셀 데이터 전체가
	 * 공백일경우 체크 for(columnindex=0;columnindex<=14;columnindex++){ XSSFCell
	 * cell=row.getCell(columnindex); //셀 데이터 전체가 공백일경우 체크
	 * System.out.println(rowindex); switch (cell.getCellType()){ //공백일경우 다음셀 확인
	 * case BLANK: break; //공백이 아닐경우 체크로직 중단 default: checkCell=true; break; } //공백이
	 * 아닌셀이 발견될경우 체크로직 중단 if(checkCell) { break; } } //전체 공백인경우 메인 row 루프 중단
	 * if(!checkCell) { break; } // 셀데이터 확인 로직 추가 21-02-25
	 * 
	 * //셀의 수 ItemPartAdmVo[] vo = new ItemPartAdmVo[rows]; vo[rowindex-1] = new
	 * ItemPartAdmVo(); int cells=row.getPhysicalNumberOfCells();
	 * for(columnindex=0;columnindex<=12;columnindex++){ //셀값을 읽는다 XSSFCell
	 * cell=row.getCell(columnindex);
	 * 
	 * String value=""; //셀이 빈값일경우를 위한 널체크 if(cell==null){ continue; }else{
	 * logger.info(""+cell.getCellType());
	 * 
	 * //타입별로 내용 읽기 switch (cell.getCellType()){ case FORMULA:
	 * value=cell.getCellFormula() + ""; break; case NUMERIC:
	 * if(DateUtil.isCellDateFormatted(cell)) { SimpleDateFormat formatter = new
	 * SimpleDateFormat("yyyy-MM-dd"); value =
	 * formatter.format(cell.getDateCellValue()) + ""; } else { double ddata =
	 * cell.getNumericCellValue(); value = df.format(ddata) + ""; }
	 * 
	 * break; case STRING: value=cell.getStringCellValue()+""; break; case BLANK:
	 * value=""; break; case ERROR: value=cell.getErrorCellValue()+""; break; }
	 * switch(columnindex) { case 0: try {
	 * vo[rowindex-1].setPartCd(value.replaceAll(",","")); }catch
	 * (NumberFormatException e) { vo[rowindex-1].setPartCd(""); } break; case 1:
	 * vo[rowindex-1].setPartNm(value); break; case 2:
	 * vo[rowindex-1].setPartGubun(value); break; case 3:
	 * vo[rowindex-1].setPartType(value); break; case 4:
	 * vo[rowindex-1].setPartRev(value); break; case 5:
	 * vo[rowindex-1].setPartSpec(value); break; case 6: try {
	 * vo[rowindex-1].setInCorpCd(value.replaceAll(",","")); }catch
	 * (NumberFormatException e) { vo[rowindex-1].setInCorpCd(""); } break; case 7:
	 * vo[rowindex-1].setPartUnit(value); break; case 8:
	 * vo[rowindex-1].setBasicDlvDate(value); break; case 9: try {
	 * vo[rowindex-1].setUnitCost(Integer.parseInt(value.replaceAll(",","")));
	 * }catch (NumberFormatException e) { vo[rowindex-1].setUnitCost(0); } // 셀데이터
	 * break; case 10: vo[rowindex-1].setUseYn(value); break; case 11:
	 * vo[rowindex-1].setInspectYn(value); break; case 12:
	 * vo[rowindex-1].setPartDesc(value); break; } }
	 * 
	 * } if(!"".equals(vo[rowindex-1].getPartCd())&&!"".equals(vo[rowindex-1].
	 * getPartRev())){ list.add(vo[rowindex-1]); }
	 * 
	 * }
	 * 
	 * }
	 * 
	 * 
	 * logger.info("list size = "+ list.size());
	 * 
	 * 
	 * } } catch (FileNotFoundException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } catch (IOException e) { // TODO Auto-generated catch
	 * block e.printStackTrace();
	 * 
	 * } finally { try { // 사용한 자원은 finally에서 해제 if( workbook!= null) {
	 * workbook.close();} if( workbook2!= null) { workbook2.close();} if( fis!=
	 * null) {fis.close();}
	 * 
	 * } catch (IOException e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); } } logger.info("엑셀 list"+list); return list; }
	 * 
	 */
	
	
	
	
	
	//****************월 판매/생산계획 엑셀업로드**********************
	
	// 월판매계획 엑셀업로드
	public List<MonSalesPlanAdmVo> monSalesPlanAdmFileload(String filename, Logger logger) throws IOException {
		logger.info("filename = " + filename);
		int pos = filename.lastIndexOf(".");
		String ext = filename.substring(pos + 1);
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		XSSFWorkbook workbook2 = null;
		List<MonSalesPlanAdmVo> list = new ArrayList<MonSalesPlanAdmVo>();
		try {
			if (ext.equals("xls")) {
				fis = new FileInputStream(filename);
				workbook = new HSSFWorkbook(fis);

				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				HSSFSheet sheet = workbook.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 2; rowindex < rows; rowindex++) {
					// 행을 읽는다
					HSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						// 셀의 수
						MonSalesPlanAdmVo[] vo = new MonSalesPlanAdmVo[rows];
						vo[rowindex - 1] = new MonSalesPlanAdmVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex < 13; columnindex++) {
							// 셀값을 읽는다
							HSSFCell cell = row.getCell(columnindex);
							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:

									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {
								case 1:
									try {
										vo[rowindex - 1].setItemSeq(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemSeq("0");
									}
									break;
								case 2:
									try {
										vo[rowindex - 1].setMainGubunNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMainGubunNm("");
									}
									break;
								case 3:
									try {
										vo[rowindex - 1].setItemCus(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCus("");
									}
									break;
								case 4:
									try {
										vo[rowindex - 1].setItemCusNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCusNm("");
									}
									break;
								case 5:
									try {
										vo[rowindex - 1].setItemCd(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCd("0");
									}
									break;
								case 6:
									try {
										vo[rowindex - 1].setItemNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemNm("0");
									}
									break;
								case 7:
									try {
										vo[rowindex - 1].setM3(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setM3("0");
									}
									break;
								case 8:
									try {
										vo[rowindex - 1].setM2(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setM2("0");
									}
									break;
								case 9:
									try {
										vo[rowindex - 1].setM1(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setM1("0");
									}
									break;
								case 10:
									try {
										vo[rowindex - 1].setSalesAvgQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setSalesAvgQty("0");
									}
									break;
								case 11:
									try {
										vo[rowindex - 1].setTmQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setTmQty("0");
									}
									break;
								case 12:
									try {
										vo[rowindex - 1].setSalesPlanQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setSalesPlanQty("0");
									}
									break;
								}
								
							}
							
							list.add(vo[rowindex - 1]);
						}
					}
				}
				logger.info("list size = " + list.size());

				return list;
			} else {
				logger.info(filename);

				fis = new FileInputStream(filename);
				workbook2 = new XSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				XSSFSheet sheet = workbook2.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 2; rowindex < rows; rowindex++) {
					// 행을 읽는다
					XSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						/*
						 * // 셀데이터 확인 로직 추가 21-02-25 //셀 데이터 확인 boolean checkCell = false; //셀 데이터 전체가
						 * 공백일경우 체크 for(columnindex=0;columnindex<=14;columnindex++){ XSSFCell
						 * cell=row.getCell(columnindex); //셀 데이터 전체가 공백일경우 체크
						 * System.out.println(rowindex); switch (cell.getCellType()){ //공백일경우 다음셀 확인
						 * case BLANK: break; //공백이 아닐경우 체크로직 중단 default: checkCell=true; break; } //공백이
						 * 아닌셀이 발견될경우 체크로직 중단 if(checkCell) { break; } } //전체 공백인경우 메인 row 루프 중단
						 * if(!checkCell) { break; } // 셀데이터 확인 로직 추가 21-02-25
						 */
						// 셀의 수
						MonSalesPlanAdmVo[] vo = new MonSalesPlanAdmVo[rows];
						vo[rowindex - 1] = new MonSalesPlanAdmVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex < 13; columnindex++) {
							// 셀값을 읽는다
							XSSFCell cell = row.getCell(columnindex);

							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								logger.info("" + cell.getCellType());

								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:
									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = cell.getBooleanCellValue() + "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {
								case 1:
									try {
										vo[rowindex - 1].setItemSeq(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemSeq("0");
									}
									break;
								case 2:
									try {
										vo[rowindex - 1].setMainGubunNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMainGubunNm("");
									}
									break;
								case 3:
									try {
										vo[rowindex - 1].setItemCus(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCus("");
									}
									break;
								case 4:
									try {
										vo[rowindex - 1].setItemCusNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCusNm("");
									}
									break;
								case 5:
									try {
										vo[rowindex - 1].setItemCd(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCd("0");
									}
									break;
								case 6:
									try {
										vo[rowindex - 1].setItemNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemNm("0");
									}
									break;
								case 7:
									try {
										vo[rowindex - 1].setM3(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setM3("0");
									}
									break;
								case 8:
									try {
										vo[rowindex - 1].setM2(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setM2("0");
									}
									break;
								case 9:
									try {
										vo[rowindex - 1].setM1(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setM1("0");
									}
									break;
								case 10:
									try {
										vo[rowindex - 1].setSalesAvgQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setSalesAvgQty("0");
									}
									break;
								case 11:
									try {
										vo[rowindex - 1].setTmQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setTmQty("0");
									}
									break;
								case 12:
									try {
										vo[rowindex - 1].setSalesPlanQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setSalesPlanQty("0");
									}
									break;
								}
							}
						}
						list.add(vo[rowindex - 1]);
					}
				}

				logger.info("list size = " + list.size());

			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if (workbook != null) {
					workbook.close();
				}
				if (workbook2 != null) {
					workbook2.close();
				}
				if (fis != null) {
					fis.close();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		logger.info("엑셀 list" + list);
		return list;
	}
	
	
	// 일판매계획 엑셀업로드
	public List<DaySalesPlanAdmVo> daySalesPlanAdmFileload(String filename, Logger logger) throws IOException {
		logger.info("filename = " + filename);
		int pos = filename.lastIndexOf(".");
		String ext = filename.substring(pos + 1);
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		XSSFWorkbook workbook2 = null;
		List<DaySalesPlanAdmVo> list = new ArrayList<DaySalesPlanAdmVo>();
		try {
			if (ext.equals("xls")) {
				fis = new FileInputStream(filename);
				workbook = new HSSFWorkbook(fis);

				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				HSSFSheet sheet = workbook.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 2; rowindex < rows; rowindex++) {
					// 행을 읽는다
					HSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						// 셀의 수
						DaySalesPlanAdmVo[] vo = new DaySalesPlanAdmVo[rows];
						vo[rowindex - 1] = new DaySalesPlanAdmVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex < 41; columnindex++) {
							// 셀값을 읽는다
							HSSFCell cell = row.getCell(columnindex);
							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:

									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = cell.getBooleanCellValue() + "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {
								case 1:
									try {
										vo[rowindex - 1].setItemSeq(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemSeq("0");
									}
									break;
								case 2:
									try {
										vo[rowindex - 1].setMainGubunNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMainGubunNm("");
									}
									break;
								case 3:
									try {
										vo[rowindex - 1].setItemCus(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCusNm("");
									}
									break;
								case 4:
									try {
										vo[rowindex - 1].setItemCus(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCusNm("");
									}
									break;
								case 5:
									try {
										vo[rowindex - 1].setItemModel(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemModel("0");
									}
									break;
								case 6:
									try {
										vo[rowindex - 1].setItemCd(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCd("0");
									}
									break;
								case 7:
									try {
										vo[rowindex - 1].setItemNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemNm("0");
									}
									break;
								case 8:
									try {
										vo[rowindex - 1].setSalesMonQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setSalesMonQty("0");
									}
									break;
								case 9:
									try {
										vo[rowindex - 1].setSalesSumQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setSalesSumQty("0");
									}
									break;
								case 10:
									try {
										vo[rowindex - 1].setD01(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD01("0");
									}
									break;
								case 11:
									try {
										vo[rowindex - 1].setD02(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD02("0");
									}
									break;
								case 12:
									try {
										vo[rowindex - 1].setD03(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD03("0");
									}
									break;
								case 13:
									try {
										vo[rowindex - 1].setD04(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD04("0");
									}
									break;
								case 14:
									try {
										vo[rowindex - 1].setD05(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD05("0");
									}
									break;
								case 15:
									try {
										vo[rowindex - 1].setD06(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD06("0");
									}
									break;
								case 16:
									try {
										vo[rowindex - 1].setD07(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD07("0");
									}
									break;
								case 17:
									try {
										vo[rowindex - 1].setD08(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD08("0");
									}
									break;
								case 18:
									try {
										vo[rowindex - 1].setD09(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD09("0");
									}
									break;
								case 19:
									try {
										vo[rowindex - 1].setD10(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD10("0");
									}
									break;
								case 20:
									try {
										vo[rowindex - 1].setD11(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD11("0");
									}
									break;
								case 21:
									try {
										vo[rowindex - 1].setD12(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD12("0");
									}
									break;
								case 22:
									try {
										vo[rowindex - 1].setD13(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD13("0");
									}
									break;
								case 23:
									try {
										vo[rowindex - 1].setD14(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD14("0");
									}
									break;
								case 24:
									try {
										vo[rowindex - 1].setD15(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD15("0");
									}
									break;
								case 25:
									try {
										vo[rowindex - 1].setD16(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD16("0");
									}
									break;
								case 26:
									try {
										vo[rowindex - 1].setD17(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD17("0");
									}
									break;
								case 27:
									try {
										vo[rowindex - 1].setD18(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD18("0");
									}
									break;
								case 28:
									try {
										vo[rowindex - 1].setD19(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD19("0");
									}
									break;
								case 29:
									try {
										vo[rowindex - 1].setD20(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD20("0");
									}
									break;
								case 30:
									try {
										vo[rowindex - 1].setD21(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD21("0");
									}
									break;
								case 31:
									try {
										vo[rowindex - 1].setD22(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD22("0");
									}
									break;
								case 32:
									try {
										vo[rowindex - 1].setD23(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD23("0");
									}
									break;
								case 33:
									try {
										vo[rowindex - 1].setD24(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD24("0");
									}
									break;
								case 34:
									try {
										vo[rowindex - 1].setD25(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD25("0");
									}
									break;
								case 35:
									try {
										vo[rowindex - 1].setD26(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD26("0");
									}
									break;
								case 36:
									try {
										vo[rowindex - 1].setD27(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD27("0");
									}
									break;
								case 37:
									try {
										vo[rowindex - 1].setD28(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD28("0");
									}
									break;
								case 38:
									try {
										vo[rowindex - 1].setD29(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD29("0");
									}
									break;
								case 39:
									try {
										vo[rowindex - 1].setD30(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD30("0");
									}
									break;
								case 40:
									try {
										vo[rowindex - 1].setD31(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD31("0");
									}
									break;
								}
							}
							
							list.add(vo[rowindex - 1]);
						}
					}
				}
				logger.info("list size = " + list.size());

				return list;
			} else {
				logger.info(filename);

				fis = new FileInputStream(filename);
				workbook2 = new XSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				XSSFSheet sheet = workbook2.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 2; rowindex < rows; rowindex++) {
					// 행을 읽는다
					XSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						/*
						 * // 셀데이터 확인 로직 추가 21-02-25 //셀 데이터 확인 boolean checkCell = false; //셀 데이터 전체가
						 * 공백일경우 체크 for(columnindex=0;columnindex<=14;columnindex++){ XSSFCell
						 * cell=row.getCell(columnindex); //셀 데이터 전체가 공백일경우 체크
						 * System.out.println(rowindex); switch (cell.getCellType()){ //공백일경우 다음셀 확인
						 * case BLANK: break; //공백이 아닐경우 체크로직 중단 default: checkCell=true; break; } //공백이
						 * 아닌셀이 발견될경우 체크로직 중단 if(checkCell) { break; } } //전체 공백인경우 메인 row 루프 중단
						 * if(!checkCell) { break; } // 셀데이터 확인 로직 추가 21-02-25
						 */
						// 셀의 수
						DaySalesPlanAdmVo[] vo = new DaySalesPlanAdmVo[rows];
						vo[rowindex - 1] = new DaySalesPlanAdmVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex < 41; columnindex++) {
							// 셀값을 읽는다
							XSSFCell cell = row.getCell(columnindex);

							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								logger.info("" + cell.getCellType());

								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:
									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = cell.getBooleanCellValue() + "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {

								case 1:
									try {
										vo[rowindex - 1].setItemSeq(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemSeq("0");
									}
									break;
								case 2:
									try {
										vo[rowindex - 1].setMainGubunNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMainGubunNm("");
									}
									break;
								case 3:
									try {
										vo[rowindex - 1].setItemCus(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCusNm("");
									}
									break;
								case 4:
									try {
										vo[rowindex - 1].setItemCus(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCusNm("");
									}
									break;
								case 5:
									try {
										vo[rowindex - 1].setItemModel(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemModel("0");
									}
									break;
								case 6:
									try {
										vo[rowindex - 1].setItemCd(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCd("0");
									}
									break;
								case 7:
									try {
										vo[rowindex - 1].setItemNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemNm("0");
									}
									break;
								case 8:
									try {
										vo[rowindex - 1].setSalesMonQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setSalesMonQty("0");
									}
									break;
								case 9:
									try {
										vo[rowindex - 1].setSalesSumQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setSalesSumQty("0");
									}
									break;
								case 10:
									try {
										vo[rowindex - 1].setD01(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD01("0");
									}
									break;
								case 11:
									try {
										vo[rowindex - 1].setD02(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD02("0");
									}
									break;
								case 12:
									try {
										vo[rowindex - 1].setD03(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD03("0");
									}
									break;
								case 13:
									try {
										vo[rowindex - 1].setD04(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD04("0");
									}
									break;
								case 14:
									try {
										vo[rowindex - 1].setD05(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD05("0");
									}
									break;
								case 15:
									try {
										vo[rowindex - 1].setD06(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD06("0");
									}
									break;
								case 16:
									try {
										vo[rowindex - 1].setD07(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD07("0");
									}
									break;
								case 17:
									try {
										vo[rowindex - 1].setD08(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD08("0");
									}
									break;
								case 18:
									try {
										vo[rowindex - 1].setD09(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD09("0");
									}
									break;
								case 19:
									try {
										vo[rowindex - 1].setD10(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD10("0");
									}
									break;
								case 20:
									try {
										vo[rowindex - 1].setD11(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD11("0");
									}
									break;
								case 21:
									try {
										vo[rowindex - 1].setD12(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD12("0");
									}
									break;
								case 22:
									try {
										vo[rowindex - 1].setD13(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD13("0");
									}
									break;
								case 23:
									try {
										vo[rowindex - 1].setD14(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD14("0");
									}
									break;
								case 24:
									try {
										vo[rowindex - 1].setD15(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD15("0");
									}
									break;
								case 25:
									try {
										vo[rowindex - 1].setD16(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD16("0");
									}
									break;
								case 26:
									try {
										vo[rowindex - 1].setD17(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD17("0");
									}
									break;
								case 27:
									try {
										vo[rowindex - 1].setD18(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD18("0");
									}
									break;
								case 28:
									try {
										vo[rowindex - 1].setD19(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD19("0");
									}
									break;
								case 29:
									try {
										vo[rowindex - 1].setD20(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD20("0");
									}
									break;
								case 30:
									try {
										vo[rowindex - 1].setD21(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD21("0");
									}
									break;
								case 31:
									try {
										vo[rowindex - 1].setD22(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD22("0");
									}
									break;
								case 32:
									try {
										vo[rowindex - 1].setD23(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD23("0");
									}
									break;
								case 33:
									try {
										vo[rowindex - 1].setD24(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD24("0");
									}
									break;
								case 34:
									try {
										vo[rowindex - 1].setD25(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD25("0");
									}
									break;
								case 35:
									try {
										vo[rowindex - 1].setD26(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD26("0");
									}
									break;
								case 36:
									try {
										vo[rowindex - 1].setD27(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD27("0");
									}
									break;
								case 37:
									try {
										vo[rowindex - 1].setD28(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD28("0");
									}
									break;
								case 38:
									try {
										vo[rowindex - 1].setD29(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD29("0");
									}
									break;
								case 39:
									try {
										vo[rowindex - 1].setD30(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD30("0");
									}
									break;
								case 40:
									try {
										vo[rowindex - 1].setD31(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD31("0");
									}
									break;
								}
							}
						}
						list.add(vo[rowindex - 1]);
					}
				}

				logger.info("list size = " + list.size());

			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if (workbook != null) {
					workbook.close();
				}
				if (workbook2 != null) {
					workbook2.close();
				}
				if (fis != null) {
					fis.close();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		logger.info("엑셀 list" + list);
		return list;
	}
	
	
	
	
	// 월생산 엑셀업로드
	public List<MonProdPlanAdmVo> monProdPlanAdmFileload(String filename, Logger logger) throws IOException {
		logger.info("filename = " + filename);
		int pos = filename.lastIndexOf(".");
		String ext = filename.substring(pos + 1);
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		XSSFWorkbook workbook2 = null;
		List<MonProdPlanAdmVo> list = new ArrayList<MonProdPlanAdmVo>();
		try {
			if (ext.equals("xls")) {
				fis = new FileInputStream(filename);
				workbook = new HSSFWorkbook(fis);

				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				HSSFSheet sheet = workbook.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 2; rowindex < rows; rowindex++) {
					// 행을 읽는다
					HSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						// 셀의 수
						MonProdPlanAdmVo[] vo = new MonProdPlanAdmVo[rows];
						vo[rowindex - 1] = new MonProdPlanAdmVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex < 13; columnindex++) {
							// 셀값을 읽는다
							HSSFCell cell = row.getCell(columnindex);
							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:

									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = cell.getBooleanCellValue() + "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {
								case 0:
									try {
										vo[rowindex - 1].setItemSeq(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemSeq("0");
									}
									break;
								case 1:
									try {
										vo[rowindex - 1].setMainGubunNm(value);
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMainGubunNm("");
									}
									break;
								case 2:
									try {
										vo[rowindex - 1].setConfirmYnNm(value);
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setConfirmYnNm("");
									}
									break;
								case 3:
									try {
										vo[rowindex - 1].setItemCusNm(value);
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCusNm("");
									}
									break;
								case 4:
									try {
										vo[rowindex - 1].setItemCd(value);
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCd("");
									}
									break;
								case 5:
									try {
										vo[rowindex - 1].setItemNm(value);
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemNm("");
									}
									break;
								case 6:
									try {
										vo[rowindex - 1].setItemWorkplace(value);
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemWorkplace("");
									}
									break;
								case 7:
									try {
										vo[rowindex - 1].setInitStockQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setInitStockQty("0");
									}
									break;
								case 8:
									try {
										vo[rowindex - 1].setSafyStockQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setSafyStockQty("0");
									}
									break;
								case 9:
									try {
										vo[rowindex - 1].setInitStockQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setInitStockQty("0");
									}
									break;
								case 10:
									try {
										vo[rowindex - 1].setSalesOrderQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setSalesOrderQty("0");
									}
									break;
								case 11:
									try {
										vo[rowindex - 1].setProdTotalQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setProdTotalQty("0");
									}
									break;
								case 12:
									try {
										vo[rowindex - 1].setUnitCost(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setUnitCost("0");
									}
									break;
								}
							}
							
							list.add(vo[rowindex - 1]);
						}
					}
				}
				logger.info("list size = " + list.size());

				return list;
			} else {
				logger.info(filename);

				fis = new FileInputStream(filename);
				workbook2 = new XSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				XSSFSheet sheet = workbook2.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 2; rowindex < rows; rowindex++) {
					// 행을 읽는다
					XSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						/*
						 * // 셀데이터 확인 로직 추가 21-02-25 //셀 데이터 확인 boolean checkCell = false; //셀 데이터 전체가
						 * 공백일경우 체크 for(columnindex=0;columnindex<=14;columnindex++){ XSSFCell
						 * cell=row.getCell(columnindex); //셀 데이터 전체가 공백일경우 체크
						 * System.out.println(rowindex); switch (cell.getCellType()){ //공백일경우 다음셀 확인
						 * case BLANK: break; //공백이 아닐경우 체크로직 중단 default: checkCell=true; break; } //공백이
						 * 아닌셀이 발견될경우 체크로직 중단 if(checkCell) { break; } } //전체 공백인경우 메인 row 루프 중단
						 * if(!checkCell) { break; } // 셀데이터 확인 로직 추가 21-02-25
						 */
						// 셀의 수
						MonProdPlanAdmVo[] vo = new MonProdPlanAdmVo[rows];
						vo[rowindex - 1] = new MonProdPlanAdmVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex < 13; columnindex++) {
							// 셀값을 읽는다
							XSSFCell cell = row.getCell(columnindex);

							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								logger.info("" + cell.getCellType());

								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:
									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = cell.getBooleanCellValue() + "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {

								case 0:
									try {
										vo[rowindex - 1].setItemSeq(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemSeq("0");
									}
									break;
								case 1:
									try {
										vo[rowindex - 1].setMainGubunNm(value);
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMainGubunNm("");
									}
									break;
								case 2:
									try {
										vo[rowindex - 1].setConfirmYnNm(value);
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setConfirmYnNm("");
									}
									break;
								case 3:
									try {
										vo[rowindex - 1].setItemCusNm(value);
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCusNm("");
									}
									break;
								case 4:
									try {
										vo[rowindex - 1].setItemCd(value);
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCd("");
									}
									break;
								case 5:
									try {
										vo[rowindex - 1].setItemNm(value);
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemNm("");
									}
									break;
								case 6:
									try {
										vo[rowindex - 1].setItemWorkplace(value);
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemWorkplace("");
									}
									break;
								case 7:
									try {
										vo[rowindex - 1].setInitStockQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setInitStockQty("0");
									}
									break;
								case 8:
									try {
										vo[rowindex - 1].setSafyStockQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setSafyStockQty("0");
									}
									break;
								case 9:
									try {
										vo[rowindex - 1].setInitStockQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setInitStockQty("0");
									}
									break;
								case 10:
									try {
										vo[rowindex - 1].setSalesOrderQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setSalesOrderQty("0");
									}
									break;
								case 11:
									try {
										vo[rowindex - 1].setProdTotalQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setProdTotalQty("0");
									}
									break;
								case 12:
									try {
										vo[rowindex - 1].setUnitCost(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setUnitCost("0");
									}
									break;
								}									
							}
						}
						list.add(vo[rowindex - 1]);
					}
				}

				logger.info("list size = " + list.size());

			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if (workbook != null) {
					workbook.close();
				}
				if (workbook2 != null) {
					workbook2.close();
				}
				if (fis != null) {
					fis.close();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		logger.info("엑셀 list" + list);
		return list;
	}
	
	
	
	// 일생산계획 엑셀업로드
	public List<DayProdPlanAdmVo> dayProdPlanAdmFileload(String filename, Logger logger) throws IOException {
		logger.info("filename = " + filename);
		int pos = filename.lastIndexOf(".");
		String ext = filename.substring(pos + 1);
		FileInputStream fis = null;
		HSSFWorkbook workbook = null;
		XSSFWorkbook workbook2 = null;
		List<DayProdPlanAdmVo> list = new ArrayList<DayProdPlanAdmVo>();
		try {
			if (ext.equals("xls")) {
				fis = new FileInputStream(filename);
				workbook = new HSSFWorkbook(fis);

				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				HSSFSheet sheet = workbook.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 2; rowindex < rows; rowindex++) {
					// 행을 읽는다
					HSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						// 셀의 수
						DayProdPlanAdmVo[] vo = new DayProdPlanAdmVo[rows];
						vo[rowindex - 1] = new DayProdPlanAdmVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex < 39; columnindex++) {
							// 셀값을 읽는다
							HSSFCell cell = row.getCell(columnindex);
							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:

									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = cell.getBooleanCellValue() + "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {
								case 0:
									try {
										vo[rowindex - 1].setMainGubunNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMainGubunNm("0");
									}
									break;
								case 1:
									try {
										vo[rowindex - 1].setItemSeq(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemSeq("0");
									}
									break;
								case 2:
									try {
										vo[rowindex - 1].setItemCus(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCus("0");
									}
									break;
								case 3:
									try {
										vo[rowindex - 1].setItemCusNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCusNm("0");
									}
									break;
								case 4:
									try {
										vo[rowindex - 1].setItemCd(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCd("0");
									}
									break;
								case 5:
									try {
										vo[rowindex - 1].setItemNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemNm("0");
									}
									break;
								case 6:
									try {
										vo[rowindex - 1].setProdMonQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setProdMonQty("0");
									}
									break;
								case 7:
									try {
										vo[rowindex - 1].setProdSumQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setProdSumQty("0");
									}
									break;
								case 8:
									try {
										vo[rowindex - 1].setD01(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD01("0");
									}
									break;
								case 9:
									try {
										vo[rowindex - 1].setD02(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD02("0");
									}
									break;
								case 10:
									try {
										vo[rowindex - 1].setD03(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD03("0");
									}
									break;
								case 11:
									try {
										vo[rowindex - 1].setD04(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD04("0");
									}
									break;
								case 12:
									try {
										vo[rowindex - 1].setD05(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD05("0");
									}
									break;
								case 13:
									try {
										vo[rowindex - 1].setD06(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD06("0");
									}
									break;
								
								case 14:
									try {
										vo[rowindex - 1].setD07(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD07("0");
									}
									break;
								case 15:
									try {
										vo[rowindex - 1].setD08(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD08("0");
									}
									break;
								case 16:
									try {
										vo[rowindex - 1].setD09(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD09("0");
									}
									break;
								case 17:
									try {
										vo[rowindex - 1].setD10(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD10("0");
									}
									break;
								case 18:
									try {
										vo[rowindex - 1].setD11(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD11("0");
									}
									break;
								case 19:
									try {
										vo[rowindex - 1].setD12(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD12("0");
									}
									break;
								case 20:
									try {
										vo[rowindex - 1].setD13(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD13("0");
									}
									break;
								case 21:
									try {
										vo[rowindex - 1].setD14(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD14("0");
									}
									break;
								case 22:
									try {
										vo[rowindex - 1].setD15(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD15("0");
									}
									break;
								case 23:
									try {
										vo[rowindex - 1].setD16(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD16("0");
									}
									break;
								case 24:
									try {
										vo[rowindex - 1].setD17(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD17("0");
									}
									break;
								case 25:
									try {
										vo[rowindex - 1].setD18(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD18("0");
									}
									break;
								case 26:
									try {
										vo[rowindex - 1].setD19(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD19("0");
									}
									break;
								case 27:
									try {
										vo[rowindex - 1].setD20(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD20("0");
									}
									break;
								case 28:
									try {
										vo[rowindex - 1].setD21(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD21("0");
									}
									break;
								case 29:
									try {
										vo[rowindex - 1].setD22(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD22("0");
									}
									break;
								case 30:
									try {
										vo[rowindex - 1].setD23(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD23("0");
									}
									break;
								case 31:
									try {
										vo[rowindex - 1].setD24(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD24("0");
									}
									break;
								case 32:
									try {
										vo[rowindex - 1].setD25(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD25("0");
									}
									break;
								case 33:
									try {
										vo[rowindex - 1].setD26(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD26("0");
									}
									break;
								case 34:
									try {
										vo[rowindex - 1].setD27(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD27("0");
									}
									break;
								case 35:
									try {
										vo[rowindex - 1].setD28(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD28("0");
									}
									break;
								case 36:
									try {
										vo[rowindex - 1].setD29(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD29("0");
									}
									break;
								case 37:
									try {
										vo[rowindex - 1].setD30(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD30("0");
									}
									break;
								case 38:
									try {
										vo[rowindex - 1].setD31(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD31("0");
									}
									break;
								}
							}
							
							list.add(vo[rowindex - 1]);
						}
					}
				}
				logger.info("list size = " + list.size());

				return list;
			} else {
				logger.info(filename);

				fis = new FileInputStream(filename);
				workbook2 = new XSSFWorkbook(fis);
				DecimalFormat df = new DecimalFormat();

				int rowindex = 0;
				int columnindex = 0;
				// 시트 수 (첫번째에만 존재하므로 0을 준다)
				// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
				XSSFSheet sheet = workbook2.getSheetAt(0);
				// 행의 수
				int rows = sheet.getPhysicalNumberOfRows();

				for (rowindex = 2; rowindex < rows; rowindex++) {
					// 행을 읽는다
					XSSFRow row = sheet.getRow(rowindex);
					Row row2 = row;

					if (row != null && !row2.getZeroHeight()) {

						/*
						 * // 셀데이터 확인 로직 추가 21-02-25 //셀 데이터 확인 boolean checkCell = false; //셀 데이터 전체가
						 * 공백일경우 체크 for(columnindex=0;columnindex<=14;columnindex++){ XSSFCell
						 * cell=row.getCell(columnindex); //셀 데이터 전체가 공백일경우 체크
						 * System.out.println(rowindex); switch (cell.getCellType()){ //공백일경우 다음셀 확인
						 * case BLANK: break; //공백이 아닐경우 체크로직 중단 default: checkCell=true; break; } //공백이
						 * 아닌셀이 발견될경우 체크로직 중단 if(checkCell) { break; } } //전체 공백인경우 메인 row 루프 중단
						 * if(!checkCell) { break; } // 셀데이터 확인 로직 추가 21-02-25
						 */
						// 셀의 수
						DayProdPlanAdmVo[] vo = new DayProdPlanAdmVo[rows];
						vo[rowindex - 1] = new DayProdPlanAdmVo();
						int cells = row.getPhysicalNumberOfCells();
						for (columnindex = 0; columnindex < 40; columnindex++) {
							// 셀값을 읽는다
							XSSFCell cell = row.getCell(columnindex);

							String value = "";
							// 셀이 빈값일경우를 위한 널체크
							if (cell == null) {
								continue;
							} else {
								logger.info("" + cell.getCellType());

								// 타입별로 내용 읽기
								switch (cell.getCellType()) {
								case FORMULA:
									value = cell.getCellFormula() + "";
									break;
								case NUMERIC:
									if (DateUtil.isCellDateFormatted(cell)) {
										SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
										value = formatter.format(cell.getDateCellValue()) + "";
									} else {
										double ddata = cell.getNumericCellValue();
										value = df.format(ddata) + "";
									}

									break;
								case STRING:
									value = cell.getStringCellValue() + "";
									break;
								case BLANK:
									value = cell.getBooleanCellValue() + "";
									break;
								case ERROR:
									value = cell.getErrorCellValue() + "";
									break;
								}

								switch (columnindex) {
								case 0:
									try {
										vo[rowindex - 1].setMainGubunNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setMainGubunNm("0");
									}
									break;
								case 1:
									try {
										vo[rowindex - 1].setItemSeq(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemSeq("0");
									}
									break;
								case 2:
									try {
										vo[rowindex - 1].setItemCus(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCus("0");
									}
									break;
								case 3:
									try {
										vo[rowindex - 1].setItemCusNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCusNm("0");
									}
									break;
								case 4:
									try {
										vo[rowindex - 1].setItemCd(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemCd("0");
									}
									break;
								case 5:
									try {
										vo[rowindex - 1].setItemNm(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setItemNm("0");
									}
									break;
								case 6:
									try {
										vo[rowindex - 1].setProdMonQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setProdMonQty("0");
									}
									break;
								case 7:
									try {
										vo[rowindex - 1].setProdSumQty(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setProdSumQty("0");
									}
									break;
								case 8:
									try {
										vo[rowindex - 1].setD01(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD01("0");
									}
									break;
								case 9:
									try {
										vo[rowindex - 1].setD02(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD02("0");
									}
									break;
								case 10:
									try {
										vo[rowindex - 1].setD03(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD03("0");
									}
									break;
								case 11:
									try {
										vo[rowindex - 1].setD04(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD04("0");
									}
									break;
								case 12:
									try {
										vo[rowindex - 1].setD05(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD05("0");
									}
									break;
								case 13:
									try {
										vo[rowindex - 1].setD06(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD06("0");
									}
									break;
								
								case 14:
									try {
										vo[rowindex - 1].setD07(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD07("0");
									}
									break;
								case 15:
									try {
										vo[rowindex - 1].setD08(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD08("0");
									}
									break;
								case 16:
									try {
										vo[rowindex - 1].setD09(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD09("0");
									}
									break;
								case 17:
									try {
										vo[rowindex - 1].setD10(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD10("0");
									}
									break;
								case 18:
									try {
										vo[rowindex - 1].setD11(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD11("0");
									}
									break;
								case 19:
									try {
										vo[rowindex - 1].setD12(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD12("0");
									}
									break;
								case 20:
									try {
										vo[rowindex - 1].setD13(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD13("0");
									}
									break;
								case 21:
									try {
										vo[rowindex - 1].setD14(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD14("0");
									}
									break;
								case 22:
									try {
										vo[rowindex - 1].setD15(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD15("0");
									}
									break;
								case 23:
									try {
										vo[rowindex - 1].setD16(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD16("0");
									}
									break;
								case 24:
									try {
										vo[rowindex - 1].setD17(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD17("0");
									}
									break;
								case 25:
									try {
										vo[rowindex - 1].setD18(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD18("0");
									}
									break;
								case 26:
									try {
										vo[rowindex - 1].setD19(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD19("0");
									}
									break;
								case 27:
									try {
										vo[rowindex - 1].setD20(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD20("0");
									}
									break;
								case 28:
									try {
										vo[rowindex - 1].setD21(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD21("0");
									}
									break;
								case 29:
									try {
										vo[rowindex - 1].setD22(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD22("0");
									}
									break;
								case 30:
									try {
										vo[rowindex - 1].setD23(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD23("0");
									}
									break;
								case 31:
									try {
										vo[rowindex - 1].setD24(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD24("0");
									}
									break;
								case 32:
									try {
										vo[rowindex - 1].setD25(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD25("0");
									}
									break;
								case 33:
									try {
										vo[rowindex - 1].setD26(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD26("0");
									}
									break;
								case 34:
									try {
										vo[rowindex - 1].setD27(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD27("0");
									}
									break;
								case 35:
									try {
										vo[rowindex - 1].setD28(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD28("0");
									}
									break;
								case 36:
									try {
										vo[rowindex - 1].setD29(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD29("0");
									}
									break;
								case 37:
									try {
										vo[rowindex - 1].setD30(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD30("0");
									}
									break;
								case 38:
									try {
										vo[rowindex - 1].setD31(value.replaceAll(",", ""));
									} catch (NumberFormatException e) {
										vo[rowindex - 1].setD31("0");
									}
									break;
								}									
							}
						}
						list.add(vo[rowindex - 1]);
					}
				}

				logger.info("list size = " + list.size());

			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} finally {
			try {
				// 사용한 자원은 finally에서 해제
				if (workbook != null) {
					workbook.close();
				}
				if (workbook2 != null) {
					workbook2.close();
				}
				if (fis != null) {
					fis.close();
				}

			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		logger.info("엑셀 list" + list);
		return list;
	}

}
