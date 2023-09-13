package egovframework.counseling.permission.service.impl;

import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository
public class PermissionDAO {

	
	@Resource(name = "permissionMapper")
	private PermissionMapper permissionMapper;

	public boolean insertPermissionReq(PermissionReqVO permissionReqVO) throws Exception {
		
		
		
        try {
        	permissionMapper.deletePermissionReq(permissionReqVO);
        	
            int rowsAffected = permissionMapper.insertPermissionReq(permissionReqVO);
            return rowsAffected > 0; // UPDATE 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (Exception e) {
            // 예외 처리 로직 작성
            e.printStackTrace();
            throw e; // 예외를 상위로 던집니다.
        }
        
	}
	

	public List<PermissionReqVO> selectPermissionRequest(PermissionReqVO permissionReqVO) throws Exception {
		
		
	List<PermissionReqVO> result = permissionMapper.selectPermissionReq(permissionReqVO);
       return result;
        
	}


	public boolean updatePermission(PermissionReqVO permissionReqVO) throws Exception {
		
		
        try {
        	permissionMapper.deletePermissionReq(permissionReqVO);
        	
            int rowsAffected = permissionMapper.updatePermissionRole(permissionReqVO);
            return rowsAffected > 0; // UPDATE 쿼리가 성공하면 true, 그렇지 않으면 false 반환
        } catch (Exception e) {
            // 예외 처리 로직 작성
            e.printStackTrace();
            throw e; // 예외를 상위로 던집니다.
        }
	}
	


}
