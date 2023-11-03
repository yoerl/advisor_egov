package egovframework.counseling.setting.service.impl;



import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.Gson;

import egovframework.counseling.permission.service.impl.PermissionVO;
import egovframework.counseling.remote.service.impl.RemoteDAO;
import egovframework.counseling.setting.service.SettingService;

@Service("settingService")
public class SettingServiceImpl extends EgovAbstractServiceImpl implements SettingService {



	private static final Logger logger = LogManager.getLogger(SettingServiceImpl.class);
	
   @Resource(name = "settingDAO")
   private SettingDAO settingDAO;
   
   /**
    * 환경설정 조회
    */
   @Override
   public SettingVO selectSetting(SettingVO settingVO) {
	   return settingDAO.selectSetting(settingVO);
   }
   
   
   @Transactional(rollbackFor = Exception.class)
   public boolean inserfont(SettingVO settingVO){

	   return settingDAO.insetfont(settingVO);
   }
   
   /**
    * 폰트사이즈 등록
    */
   @Transactional(rollbackFor = Exception.class)
   public boolean insertFontSize(SettingVO settingVO) {

	   return settingDAO.insertFontSize(settingVO);
   }
   
	/**
	 * 성능 조회
	 */

   
   public String checkPerformance(SettingVO settingVO) {
     ArrayList<String> memoryList = new ArrayList<>();
     ArrayList<String> cpuList = new ArrayList<>();
     ArrayList<String> diskList = new ArrayList<>();

  // Declare resources outside the try-catch block to ensure proper cleanup
  Process mp = null;
  InputStream inputStream = null;
  InputStreamReader streamReader = null;
  BufferedReader br = null;

  try {
      String realarg = "free | grep ^Mem | awk '{print sprintf(\"%.2f%\", $3*100/$2)}'";
      String[] cmd = { "/bin/bash", "-c", realarg };
      mp = Runtime.getRuntime().exec(cmd);
      inputStream = mp.getInputStream();
      streamReader = new InputStreamReader(inputStream);
      br = new BufferedReader(streamReader);

      String ms;
      while ((ms = br.readLine()) != null) {
          memoryList.add(ms);
      }

      mp.waitFor();
  } catch (IOException e) {
      // 예외 처리 로직 작성
      logger.error("IOException: " + e.getMessage(), e);
  } catch (InterruptedException e) {
      // 예외 처리 로직 작성
      logger.error("InterruptedException: " + e.getMessage(), e);
  } finally {
      // Ensure proper resource cleanup in case of exceptions
      if (br != null) {
          try {
              br.close();
          } catch (IOException e) {
              logger.error("IOException while closing BufferedReader: " + e.getMessage(), e);
          }
      }
      if (streamReader != null) {
          try {
              streamReader.close();
          } catch (IOException e) {
              logger.error("IOException while closing InputStreamReader: " + e.getMessage(), e);
          }
      }
      if (inputStream != null) {
          try {
              inputStream.close();
          } catch (IOException e) {
              logger.error("IOException while closing InputStream: " + e.getMessage(), e);
          }
      }
      if (mp != null) {
          mp.destroy();
      }
  }
  
  
  

//Declare resources outside the try-catch block to ensure proper cleanup
Process cp = null;
InputStream inputStream2 = null;
InputStreamReader streamReader2 = null;
BufferedReader br2 = null;

try {
   String[] cmd = { "/bin/bash", "-c", "mpstat | tail -1 | awk '{print 100-$NF}'" };
   cp = Runtime.getRuntime().exec(cmd);
   inputStream2 = cp.getInputStream();
   streamReader2 = new InputStreamReader(inputStream2);
   br2 = new BufferedReader(streamReader2);

   String cs;
   while ((cs = br2.readLine()) != null) {
       cpuList.add(cs);
   }

   cp.waitFor();
} catch (IOException e) {
   // 예외 처리 로직 작성
   logger.error("IOException: " + e.getMessage(), e);
} catch (InterruptedException e) {
   // 예외 처리 로직 작성
   logger.error("InterruptedException: " + e.getMessage(), e);
} finally {
   // Ensure proper resource cleanup in case of exceptions
   if (br2 != null) {
       try {
           br2.close();
       } catch (IOException e) {
           logger.error("IOException while closing BufferedReader: " + e.getMessage(), e);
       }
   }
   if (streamReader2 != null) {
       try {
           streamReader2.close();
       } catch (IOException e) {
           logger.error("IOException while closing InputStreamReader: " + e.getMessage(), e);
       }
   }
   if (inputStream2 != null) {
       try {
           inputStream2.close();
       } catch (IOException e) {
           logger.error("IOException while closing InputStream: " + e.getMessage(), e);
       }
   }
   if (cp != null) {
       cp.destroy();
   }
}

     

//Declare resources outside the try-catch block to ensure proper cleanup
Process dp = null;
InputStream inputStream3 = null;
InputStreamReader streamReader3 = null;
BufferedReader br3 = null;

try {
 String[] cmd = { "/bin/bash", "-c", "df -h -T | grep dev/sd | awk '{sum += $6} END { print sum; }';" };
 dp = Runtime.getRuntime().exec(cmd);
 inputStream3 = dp.getInputStream();
 streamReader3 = new InputStreamReader(inputStream3);
 br3 = new BufferedReader(streamReader3);

 String ds;
 while ((ds = br3.readLine()) != null) {
     diskList.add(ds);
 }

 dp.waitFor();
} catch (IOException e) {
 // 예외 처리 로직 작성
 logger.error("IOException: " + e.getMessage(), e);
} catch (InterruptedException e) {
 // 예외 처리 로직 작성
 logger.error("InterruptedException: " + e.getMessage(), e);
} finally {
 // Ensure proper resource cleanup in case of exceptions
 if (br3 != null) {
     try {
         br3.close();
     } catch (IOException e) {
         logger.error("IOException while closing BufferedReader: " + e.getMessage(), e);
     }
 }
 if (streamReader3 != null) {
     try {
         streamReader3.close();
     } catch (IOException e) {
         logger.error("IOException while closing InputStreamReader: " + e.getMessage(), e);
     }
 }
 if (inputStream3 != null) {
     try {
         inputStream3.close();
     } catch (IOException e) {
         logger.error("IOException while closing InputStream: " + e.getMessage(), e);
     }
 }
 if (dp != null) {
     dp.destroy();
 }
}

		Gson gson = new Gson();
		
		PermissionVO perfomanceVO = new PermissionVO();
		perfomanceVO.setCpu(((String)cpuList.get(0)).toString().replace("%", ""));
		perfomanceVO.setDisk(((String)diskList.get(0)).toString().replace("%", ""));
		perfomanceVO.setMemory(((String)memoryList.get(0)).toString().replace("%", ""));
		String resultJson = gson.toJson(perfomanceVO);
		return resultJson;
   
   		}
   }
