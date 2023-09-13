package egovframework.counseling.permission.service.impl;


import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;


@Mapper("permissionMapper")
public interface PermissionMapper  {


	public int insertPermissionReq(PermissionReqVO permissionReqVO) throws Exception;
	public int deletePermissionReq(PermissionReqVO permissionReqVO) throws Exception;
	public List<PermissionReqVO> selectPermissionReq(PermissionReqVO permissionReqVO);
	public int updatePermissionRole(PermissionReqVO permissionReqVO);

	
	
}

