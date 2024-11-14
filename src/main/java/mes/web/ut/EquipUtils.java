package mes.web.ut;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.SocketAddress;
import java.net.SocketException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EquipUtils {
	
	private static final Logger logger = LoggerFactory.getLogger(EquipUtils.class);
	  
	/*
	 * @Component public class EncryptionUtil {    
	 * 
	 * public static String cip; private static int cport;
	 * 
	 * @Value("${equip.cip}") public void setCip(String value) { cip = value; }
	 * 
	 * @Value("${equip.cport}") public void setCport(int value) { cport = value; }
	 * 
	 * 
	 * }
	 */
	
	
	//private static String 	cip = "49.167.30.110";
	//private static int 		cport = 8000;
	private static String cip = "192.168.0.10";
	private static int 	cport = 8001;
	
	private static int 		cimeout = 200;

	
	
	public static byte[] hexStringToByteArray(String s) {
		
	    int len = s.length();
	    byte[] data = new byte[len / 2];

	    for (int i = 0; i < len; i += 2) {
	        data[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4)
	                             + Character.digit(s.charAt(i+1), 16));
	    }

	    return data;
	}
	 
	public static String byteArrayToHexString(byte[] bytes){ 
		
		StringBuilder sb = new StringBuilder(); 
		for(byte b : bytes){ 
			sb.append(String.format("%02X", b&0xff)); 
		} 
		
		return sb.toString(); 
	}
																	
	public static int getCount(int id) {     
		
		
		logger.error("deviceNum :"+ id);
		logger.error("cip : "+ cip);
		logger.error("cport : "+ cport);
		int count = -1; 
	   	String sId = String.format("%02X",id);
	   	String cmd = sId + "030000";
	   	
	   	byte[] crc16 = new CRC16Modbus().getCRC16Modbus(hexStringToByteArray(cmd));
	   	cmd = "3C" + cmd + byteArrayToHexString(crc16) + "3E";
	    
	   	logger.info("getCount cmd : "+ cmd);
	   	
	    byte[] data = hexStringToByteArray(cmd);
        Socket socket = new Socket();
        SocketAddress address = new InetSocketAddress(cip, cport);

        try {
        	socket.connect(address, cimeout);
        	socket.setSoTimeout(cimeout);
        	
	        OutputStream os = socket.getOutputStream();
	        InputStream is = socket.getInputStream();
	        os.write(data);
	        os.flush();
	        //os.close();
	        
            byte[] bytes = new byte[1024];
            int readByteCount = is.read(bytes);
            
            String rcvData = ""; 
            
            if(readByteCount == 8) {
            	//rcvData = new String(bytes, 0, readByteCount, "UTF-8");
            	rcvData = byteArrayToHexString(bytes);
                String hCount = rcvData.substring(6,10);
                count = Integer.parseInt(hCount, 16); 
                logger.info("received count : " + readByteCount + ", data : "+ rcvData.substring(0,readByteCount*2) + ", count : "+ count);
            } else {
            	logger.info("received error count : " + readByteCount);
            }
            
            delayForClosing(100);
            
            //socket.close();
        } catch (SocketException e) { 
        	//e.printStackTrace();
        	logger.info("SocketException");
        } catch (IOException e) { 
        	e.printStackTrace(); 
        } finally { 

        	try { 
        		socket.close();
        		//logger.info("socket close count : "+ count);
        	} catch (IOException e) { 
        		e.printStackTrace(); 
        	}
        }
    	return count;
    }
	    
    public static boolean setCount(int id, int count) {
    	boolean ret = false;
    	
    	String sId = String.format("%02X",id);
    	String sCount = String.format("%04X", count);

    	String cmd = sId + "02" + sCount;
		   	
	   	byte[] crc16 = new CRC16Modbus().getCRC16Modbus(hexStringToByteArray(cmd));
	   	cmd = "3C" + cmd + byteArrayToHexString(crc16) + "3E";
	   	
	   	logger.info("setCount cmd : "+ cmd);
	   	
	   	
        byte[] data = hexStringToByteArray(cmd);

        Socket socket = new Socket();
        SocketAddress address = new InetSocketAddress(cip, cport);

        try {
        	socket.connect(address, cimeout);
        	socket.setSoTimeout(cimeout);
        	
	        OutputStream os = socket.getOutputStream();
	        InputStream is = socket.getInputStream();
	        os.write(data);
	        os.flush();
		        
            byte[] bytes = new byte[1024];
            int readByteCount = is.read(bytes);
            
            String rcvData = ""; 
            
            if(readByteCount > 0) {
            	rcvData = byteArrayToHexString(bytes);
            }
            
            logger.info("received count : " + readByteCount + ", data : "+ rcvData.substring(0,readByteCount*2));
            logger.info("rcvData : " + rcvData + "readByteCount : " + readByteCount);
            logger.info("rcvData.substring(0,7) : " + rcvData.substring(0,7));
         
            if(rcvData.substring(0,readByteCount*2).equals("2380002A") || rcvData.substring(0,7).equals("2301030")) {
            	ret = true;
            }
            
            //ret = true;
            
            delayForClosing(100);
            //socket.close();
            
        } catch (SocketException e) { 
        	e.printStackTrace(); 
        } catch (IOException e) { 
        	e.printStackTrace(); 
        } finally { 
        	logger.info("ret : "+ ret);
        	try { 
        		socket.close(); 
        	} catch (IOException e) { 
        		e.printStackTrace(); 
        	}
        }

        return ret;
    }
    
    
    public static int getEquipCount(int id) {     
		
		
		logger.error("deviceNum :"+ id);
		logger.error("cip : "+ cip);
		logger.error("cport : "+ cport);
		int count = -1; 
	   	String sId = String.format("%02X",id);
	   	String cmd = sId + "070000";
	   	
	   	byte[] crc16 = new CRC16Modbus().getCRC16Modbus(hexStringToByteArray(cmd));
	   	cmd = "3C" + cmd + byteArrayToHexString(crc16) + "3E";
	    
	   	logger.info("getCount cmd : "+ cmd);
	   	
	    byte[] data = hexStringToByteArray(cmd);
        Socket socket = new Socket();
        SocketAddress address = new InetSocketAddress(cip, cport);

        try {
        	socket.connect(address, cimeout);
        	socket.setSoTimeout(cimeout);
        	
	        OutputStream os = socket.getOutputStream();
	        InputStream is = socket.getInputStream();
	        os.write(data);
	        os.flush();
	        //os.close();
	        
            byte[] bytes = new byte[1024];
            int readByteCount = is.read(bytes);
            
            String rcvData = ""; 
            logger.info("readByteCount:"+readByteCount);
            if(readByteCount == 8) {
            	//rcvData = new String(bytes, 0, readByteCount, "UTF-8");
            	rcvData = byteArrayToHexString(bytes);
                String hCount = rcvData.substring(6,10);
                count = Integer.parseInt(hCount, 16); 
                logger.info("received count : " + readByteCount + ", data : "+ rcvData.substring(0,readByteCount*2) + ", count : "+ count);
            } else {
            	logger.info("received error count : " + readByteCount);
            }
            
            delayForClosing(100);
            
            //socket.close();
        } catch (SocketException e) { 
        	//e.printStackTrace();
        	logger.info("SocketException");
        } catch (IOException e) { 
        	e.printStackTrace(); 
        } finally { 

        	try { 
        		socket.close();
        		//logger.info("socket close count : "+ count);
        	} catch (IOException e) { 
        		e.printStackTrace(); 
        	}
        }
    	return count;
    }

	public static boolean setEquipCount(int id, int count) {     
		
		
		boolean ret = false;
    	
    	String sId = String.format("%02X",id);
    	String sCount = String.format("%04X", count);

    	logger.info(sCount);
    	String cmd = sId + "06" + sCount;
		   	
	   	byte[] crc16 = new CRC16Modbus().getCRC16Modbus(hexStringToByteArray(cmd));
	   	cmd = "3C" + cmd + byteArrayToHexString(crc16) + "3E";
	   	
	   	logger.info("setCount cmd : "+ cmd);
	   	
	   	
        byte[] data = hexStringToByteArray(cmd);

        Socket socket = new Socket();
        SocketAddress address = new InetSocketAddress(cip, cport);

        try {
        	socket.connect(address, cimeout);
        	socket.setSoTimeout(cimeout);
        	
	        OutputStream os = socket.getOutputStream();
	        InputStream is = socket.getInputStream();
	        os.write(data);
	        os.flush();
		        
            byte[] bytes = new byte[1024];
            int readByteCount = is.read(bytes);
            
            String rcvData = ""; 
            
            if(readByteCount > 0) {
            	rcvData = byteArrayToHexString(bytes);
            }
            
            logger.info("received count : " + readByteCount + ", data : "+ rcvData.substring(0,readByteCount*2));
            logger.info("rcvData : " + rcvData + "readByteCount : " + readByteCount);
            logger.info("rcvData.substring(0,7) : " + rcvData.substring(0,7));
         
            if(rcvData.substring(0,readByteCount*2).equals("2380002A") || rcvData.substring(0,7).equals("2301030")) {
            	ret = true;
            }
            
            //ret = true;
            
            delayForClosing(100);
            //socket.close();
            
        } catch (SocketException e) { 
        	e.printStackTrace(); 
        } catch (IOException e) { 
        	e.printStackTrace(); 
        } finally { 
        	logger.info("ret : "+ ret);
        	try { 
        		socket.close(); 
        	} catch (IOException e) { 
        		e.printStackTrace(); 
        	}
        }

        return ret;
    }

    public static void delayForClosing(int delayCnt) {

   		try {
   			Thread.sleep(delayCnt);
   		} catch (InterruptedException e) {
   			e.printStackTrace();
   		}
   		
   		return;
    }
    	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		cip = "192.168.0.10";
		cport = 8001;
		
		//EquipUtils.setCount(1,80);
		EquipUtils.getCount(1);
		
		EquipUtils.setEquipCount(1, 3);
		int count = EquipUtils.getEquipCount(1);
		logger.info("count:"+count);
		
		//EquipUtils.getCount(2);
		//EquipUtils.getCount(3);
		//EquipUtils.setCount(1, 25);
		
		//EquipUtils.setCount(1, 35);
		//EquipUtils.setCount(1, 25);
		//EquipUtils.setCount(2, 11);
		//EquipUtils.setCount(3, 21);
		
	}

}

