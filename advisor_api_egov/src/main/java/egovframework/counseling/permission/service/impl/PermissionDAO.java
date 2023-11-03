package egovframework.counseling.permission.service.impl;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Repository;


import javax.annotation.Resource;
import java.util.List;

@Repository
public class PermissionDAO {


	private static final Logger logger = LogManager.getLogger(PermissionDAO.class);
	
	@Resource(name = "permissionMapper")
	private PermissionMapper permissionMapper;

	public boolean insertPermissionReq(PermissionReqVO permissionReqVO){
		
		
		
        try {
        	permissionMapper.deletePermissionReq(permissionReqVO);
        	
            int rowsAffected = permissionMapper.insertPermissionReq(permissionReqVO);
            return rowsAffected > 0; // UPDATE 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("NullPointerException : "+ e, e.toString());
        } catch (Exception e) {
            // 예외 처리 로직 작성
        	logger.error("권한신청 입력 : ", e);
        }
		return false;
        
	}
	

	public List<PermissionReqVO> selectPermissionRequest(PermissionReqVO permissionReqVO) {
		
		
       return permissionMapper.selectPermissionReq(permissionReqVO);
        
	}


	public boolean updatePermission(PermissionReqVO permissionReqVO){
		
		
        try {
        	permissionMapper.deletePermissionReq(permissionReqVO);
        	
            int rowsAffected = permissionMapper.updatePermissionRole(permissionReqVO);
            return rowsAffected > 0; // UPDATE 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (NullPointerException  e) {
            // 예외 처리 로직 작성
        	logger.error("NullPointerException : "+ e, e.toString());
        } catch (Exception e) {
            // 예외 처리 로직 작성
        	logger.error("권한신청 입력 : ", e);
        }
		return false;
	}
	


}
