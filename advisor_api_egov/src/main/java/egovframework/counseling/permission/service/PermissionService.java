package egovframework.counseling.permission.service;

import java.util.List;

import egovframework.counseling.permission.service.impl.PermissionReqVO;

public interface PermissionService {

	
	List<PermissionReqVO> selectPermissionRequest(PermissionReqVO permissionReqVO);

	boolean updatePermission(PermissionReqVO permissionReqVO);

	boolean reqPermission(PermissionReqVO permissionReqVO);
	
	

}
