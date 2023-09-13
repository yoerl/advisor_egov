package egovframework.counseling.permission.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.counseling.common.service.CommonService;
import egovframework.counseling.notice.service.NoticeService;
import egovframework.counseling.notice.service.impl.NoticeVO;
import egovframework.counseling.permission.service.PermissionService;
import egovframework.counseling.user.service.impl.UserInfoVO;
import egovframework.example.sample.service.impl.SampleDAO;


@Service("permissionService")
public class PermissionServiceImpl extends EgovAbstractServiceImpl implements PermissionService {

	@Resource(name = "permissionDAO")
	private PermissionDAO permissionDAO;
	
	

	@Override
	public boolean reqPermission(PermissionReqVO permissionReqVO) throws Exception {
		
		boolean result = permissionDAO.insertPermissionReq(permissionReqVO);
		// TODO Auto-generated method stub
		

		return result;
	}



	@Override
	public List<PermissionReqVO> selectPermissionRequest(PermissionReqVO permissionReqVO) throws Exception {
		// TODO Auto-generated method stub
		
		List<PermissionReqVO> result  = permissionDAO.selectPermissionRequest(permissionReqVO);
		
		return result;
	}
	
	@Override
	public boolean updatePermission(PermissionReqVO permissionReqVO) throws Exception {
		// TODO Auto-generated method stub
		
		
		
		boolean result = permissionDAO.updatePermission(permissionReqVO);
		// TODO Auto-generated method stub
		

		return result;
	}
	
	
	

	

}
