package mes.web.ut;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Blob;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileUtil {
	
	//자바 java.io.File 객체를 java.sql.Blob 객체로 변환하는 코드.
	public static Blob convertFileToBlob(File file) throws Exception {
	    Blob blob = null;
	    FileInputStream inputStream = null;
	    try {
	        byte[] byteArray = new byte[(int) file.length()];
	        inputStream = new FileInputStream(file);
	        inputStream.read(byteArray);
	        blob = new javax.sql.rowset.serial.SerialBlob(byteArray); 
	    } catch (Exception e) {
	        throw e;
	    } finally {
	        try {
	            if (inputStream != null) {
	                inputStream.close();
	            }
	        } catch (Exception e) {
	            inputStream = null;
	        } finally {
	            inputStream = null;
	        }
	    }
	    return blob;
	}
	
	//MultipartFile To File
	public static File convertToMultipartFile(MultipartFile multipartFile) throws Exception {
	    File file = new File(multipartFile.getOriginalFilename());
	    file.createNewFile();
	    FileOutputStream fos = new FileOutputStream(file);
	    fos.write(multipartFile.getBytes());
	    fos.close();
	    return file;
	}
	
	//JDK 7 - FileOutputStream + try-with-resources
	public static void writeBytesToFile(String fileOutput, byte[] bytes)
        throws IOException {

        try (FileOutputStream fos = new FileOutputStream(fileOutput)) {
            fos.write(bytes);
        }

    }

    //JDK 7, NIO, Files.write
	public static void writeBytesToFileNio(String fileOutput, byte[] bytes)
        throws IOException {

        Path path = Paths.get(fileOutput);
        Files.write(path, bytes);

    }

    // Apache Commons IO
	public static void writeBytesToFileApache(String fileOutput, byte[] bytes)
        throws IOException {

        FileUtils.writeByteArrayToFile(new File(fileOutput), bytes);

    }
}