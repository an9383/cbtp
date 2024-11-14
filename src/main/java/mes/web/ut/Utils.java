package mes.web.ut;

import java.io.FileInputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.output.ByteArrayOutputStream;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import mes.domain.cm.CommonVo;

/**
 * <b>기능</b> :
 * <p>
 * 날짜 및 시간을 시스템으로부터 연산하는 클래스입니다.
 *
 * @author Administrator
 * @since 1.0
 * @see java.util.Date
 */

public class Utils {

	private static String userId;
	private static String userNm;
	private static String userNumber;

	private static String userDepartmentCd;
	private static String userDepartmentNm;

	private static String OS = System.getProperty("os.name").toLowerCase();
	private static String windowsImgPath = "C:/upload/";
	private static String unixImgPath = "/var/lib/upload/";

	private static String systemErrorMessage = "시스템 오류가 발생했습니다.";

	public static String getUserDepartmentCd() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String sessionDepartment = request.getSession().getAttribute("department").toString();

		if (sessionDepartment == null || "".equals(sessionDepartment)) {
			sessionDepartment = "001";
		}

		return sessionDepartment;
	}

	public static void setUserDepartmentCd(String userDepartmentCd) {
		Utils.userDepartmentCd = userDepartmentCd;
	}

	public static String getUserDepartmentNm() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String sessionUserDepartmentNm = request.getSession().getAttribute("departmentNm").toString();

		if (sessionUserDepartmentNm == null || "".equals(sessionUserDepartmentNm)) {
			sessionUserDepartmentNm = "관리부";
		}
		return sessionUserDepartmentNm;
	}

	public static void setUserDepartmentNm(String userDepartmentNm) {
		Utils.userDepartmentNm = userDepartmentNm;
	}

	/**
	 * <p>
	 * 로그인 사용자아이디 return.
	 *
	 * @param userId
	 * @return userId
	 *
	 */

	public static String getUserId() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String sessionUserId = request.getSession().getAttribute("userId").toString();
		if (sessionUserId == null || "".equals(sessionUserId)) {
			sessionUserId = "regId";
		}
		return sessionUserId;
	}

	public static void setUserId(String uid) {
		userId = uid;
	}

	/**
	 * <p>
	 * 로그인 사용자명 return.
	 *
	 * @param userNm
	 * @return userNm
	 *
	 */

	public static String getUserNm() {
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String sessionUserNm = request.getSession().getAttribute("userNm").toString();

		if (sessionUserNm == null || "".equals(sessionUserNm)) {
			sessionUserNm = "관리자";
		}
		return sessionUserNm;
	}

	public static void setUserNm(String uNm) {
		userNm = uNm;
	}

	/**
	 * <p>
	 * 로그인 사용자번호 return.
	 *
	 * @param userNm
	 * @return userNm
	 *
	 */

	public static String getUserNumber() {
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		String sessionUserNumber = request.getSession().getAttribute("userNumber").toString();

		if (sessionUserNumber == null || "".equals(sessionUserNumber)) {
			sessionUserNumber = "0003";
		}
		return sessionUserNumber;
	}

	public static void setUserNumber(String uNumber) {
		userNumber = uNumber;
	}

	public static String getPath() {
		if (OS.indexOf("win") >= 0) {
			return windowsImgPath;
		} else {
			return unixImgPath;
		}
	}

	public static byte[] imageToByteArray(String filePath) throws Exception {
		byte[] returnValue = null;

		ByteArrayOutputStream baos = null;
		FileInputStream fis = null;

		try {
			baos = new ByteArrayOutputStream();
			fis = new FileInputStream(filePath);

			byte[] buf = new byte[2048];
			int read = 0;

			while ((read = fis.read(buf, 0, buf.length)) != -1) {
				baos.write(buf, 0, read);
			}

			returnValue = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (baos != null) {
				baos.close();
			}
			if (fis != null) {
				fis.close();
			}
		}

		return returnValue;
	}

	public static String byteArrayToBinaryString(byte[] b) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < b.length; ++i) {
			sb.append(byteToBinaryString(b[i]));
		}
		return sb.toString();
	}

	public static String byteToBinaryString(byte n) {
		StringBuilder sb = new StringBuilder("00000000");
		for (int bit = 0; bit < 8; bit++) {
			if (((n >> bit) & 1) > 0) {
				sb.setCharAt(7 - bit, '1');
			}
		}
		return sb.toString();
	}

	/**
	 * 바이너리 스트링을 바이트배열로 변환
	 * 
	 * @param s
	 * @return
	 */
	public static byte[] binaryStringToByteArray(String s) {
		int count = s.length() / 8;
		byte[] b = new byte[count];
		for (int i = 1; i < count; ++i) {
			String t = s.substring((i - 1) * 8, i * 8);
			b[i - 1] = binaryStringToByte(t);
		}
		return b;
	}

	/**
	 * 바이너리 스트링을 바이트로 변환
	 * 
	 * @param s
	 * @return
	 */
	public static byte binaryStringToByte(String s) {
		byte ret = 0, total = 0;
		for (int i = 0; i < 8; ++i) {
			ret = (s.charAt(7 - i) == '1') ? (byte) (1 << i) : 0;
			total = (byte) (ret | total);
		}
		return total;
	}

	public static String getErrorMessage() {
		return systemErrorMessage;
	}

	/*
	 * @Component("fileUtils") public class FileUtils { private static final String
	 * filePath = "C:\\upload\\bbs\\"; // 파일이 저장될 위치
	 * 
	 * public List<Map<String, Object>> parseInsertFileInfo(BbsVo bbsVo,
	 * MultipartHttpServletRequest mpRequest) throws Exception{
	 * 
	 * 
	 * Iterator은 데이터들의 집합체? 에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스입니다. List나 배열은 순차적으로 데이터의
	 * 접근이 가능하지만, Map등의 클래스들은 순차적으로 접근할 수가 없습니다. Iterator을 이용하여 Map에 있는 데이터들을
	 * while문을 이용하여 순차적으로 접근합니다.
	 * 
	 * 
	 * Iterator<String> iterator = mpRequest.getFileNames();
	 * 
	 * MultipartFile multipartFile = null; String originalFileName = null; String
	 * originalFileExtension = null; String storedFileName = null;
	 * 
	 * List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
	 * Map<String, Object> listMap = null;
	 * 
	 * int bno = bbsVo.getBbsNo();
	 * 
	 * File file = new File(filePath); if(file.exists() == false) { file.mkdirs(); }
	 * 
	 * while(iterator.hasNext()) { multipartFile =
	 * mpRequest.getFile(iterator.next()); if(multipartFile.isEmpty() == false) {
	 * originalFileName = multipartFile.getOriginalFilename(); originalFileExtension
	 * = originalFileName.substring(originalFileName.lastIndexOf("."));
	 * storedFileName = getRandomString() + originalFileExtension;
	 * 
	 * file = new File(filePath + storedFileName); multipartFile.transferTo(file);
	 * listMap = new HashMap<String, Object>(); listMap.put("BNO", bno);
	 * listMap.put("ORG_FILE_NAME", originalFileName);
	 * listMap.put("STORED_FILE_NAME", storedFileName); listMap.put("FILE_SIZE",
	 * multipartFile.getSize()); list.add(listMap); } } return list; } }
	 */

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	// pivot문 조건 날짜
	public static String getPivotString(CommonVo commonVo) throws Exception {

		String[] monthStr = commonVo.getMonthStr().toString().split(",");
		String monthStr2 = "";
		int i = 0;
		for (String m : monthStr) {
			if (i == 0) {
				monthStr2 = "[" + m + "]";
			} else {
				monthStr2 += ",[" + m + "]";
			}
			i++;
		}
		return monthStr2;
	}

	public static void getDateList(CommonVo commonVo) throws Exception {

		String[] monthStr = commonVo.getMonthStr().toString().split(",");
		String monthStr2 = "";
		int i = 0;
		for (String m : monthStr) {
			commonVo.getDateList().add(DateUtil.changeDateFormat(m));
		}
	}

	public static String convert2UnderscoreCase(String camelStr) {

		String regex = "([a-z])([A-Z]+)";
		String replacement = "$1_$2";
		return camelStr.replaceAll(regex, replacement).toUpperCase();
	}

}