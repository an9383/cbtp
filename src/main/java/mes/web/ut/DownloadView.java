package mes.web.ut;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {
	
	public void Download(){
        
		setContentType("application/download; charset=utf-8");
         
    }

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		File file = (File)model.get("downloadFile");
		System.out.println("DownloadView --> file.getPath() : " + file.getPath());
        System.out.println("DownloadView --> file.getName() : " + file.getName());
        
        if(file != null) {
            String fileName = file.getName();
            String userAgent = request.getHeader("User-Agent");
            System.out.println(userAgent);
            System.out.println(userAgent.indexOf("Chrome"));
            
            boolean ie = userAgent.indexOf("MSIE") > -1;
            boolean Chrome = userAgent.indexOf("Chrome") > -1;
             
            if(ie){
                fileName = URLEncoder.encode(file.getName(), "utf-8");
            } else if(Chrome) {
            	StringBuffer sb = new StringBuffer();
    			for (int i = 0; i < fileName.length(); i++) {
    				char c = fileName.charAt(i);
    				if (c > '~') {
    					sb.append(URLEncoder.encode("" + c, "UTF-8"));
    				} else {
    					sb.append(c);
    				}
    			}
    			fileName = sb.toString();
            } else {
            	fileName = new String(file.getName().getBytes("UTF-8"),"iso-8859-1");
            }
            
            Enumeration headerNames = request.getHeaderNames();
            
            //while(headerNames.hasMoreElements()) {
            //	   String name = (String)headerNames.nextElement();
            //	   String value = request.getHeader(name);
            //	   System.out.println(value);
            //}
            
            //if(userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1){
            //    fileName = URLEncoder.encode(file.getName(), "utf-8").replaceAll("\\+", "%20");;
            //}else if(userAgent.indexOf("Chrome") > -1) {
            //	StringBuffer sb = new StringBuffer();
            //	for(int i=0; i<file.getName().length(); i++) {
            //		char c = file.getName().charAt(i);
            //		if(c > '~') {
            //			sb.append(URLEncoder.encode(""+c, "UTF-8"));
            //		}else {
            //			sb.append(c);
            //		}
            //	}
            //	fileName = sb.toString();
            //}else {
            //	fileName = new String(file.getName().getBytes("utf-8"));
            //}
            
            System.out.println(fileName);
            String filename = file.getName();
            String ext = filename.substring(filename.lastIndexOf(".") + 1);

            System.out.println("file name : " + filename);
            System.out.println("extension : " + ext);
            response.setContentType(getContentType());
            response.setContentLength((int)file.length());
            
            filename = URLEncoder.encode(filename, "UTF-8");
            filename = URLDecoder.decode(filename, "ISO8859_1");
            response.setHeader("Content-disposition", "attachment; filename="+ filename);
            
            //response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\";");
            response.setHeader("Content-Transfer-Encoding", "binary");
            response.setContentType("application/"+ext);
            
            
            FileInputStream fis = new FileInputStream(file);
			BufferedInputStream bis = new BufferedInputStream(fis);
			ServletOutputStream so = response.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(so);

			byte[] data = new byte[2048];
			int input = 0;
			while ((input = bis.read(data)) != -1) {
				bos.write(data, 0, input);
				bos.flush();
			}

			if (bos != null)
				bos.close();
			if (bis != null)
				bis.close();
			if (so != null)
				so.close();
			if (fis != null)
				fis.close();
			
			file.delete();

            
            //OutputStream out = response.getOutputStream();
            //FileInputStream fis = null;
            //try {
            //    fis = new FileInputStream(file);
            //    FileCopyUtils.copy(fis, out);
            //} catch(Exception e){
            //    e.printStackTrace();
            //}finally{
            //    if(fis != null){
            //        try{
            //            fis.close();
            //        }catch(Exception e){
            //        	e.printStackTrace();
            //        }
            //    }
            //    out.flush();
            //}
            
        }
	}
}
