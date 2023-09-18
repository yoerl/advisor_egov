package egovframework.counseling.permission.service;

import java.util.List;

import egovframework.counseling.notice.service.impl.NoticeVO;
import egovframework.counseling.permission.service.impl.PermissionReqVO;
import egovframework.counseling.permission.service.impl.UserAthrReqVO;
import egovframework.counseling.user.service.impl.UserInfoVO;

public interface PermissionService {

	
	List<PermissionReqVO> selectPermissionRequest(PermissionReqVO permissionReqVO) throws Exception;

	boolean updatePermission(PermissionReqVO permissionReqVO) throws Exception;

	boolean reqPermission(PermissionReqVO permissionReqVO) throws Exception;
	
	

}
