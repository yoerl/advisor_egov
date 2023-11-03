package egovframework.counseling.permission.service.impl;


import java.util.List;

import javax.annotation.Resource;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.counseling.common.service.CommonService;
import egovframework.counseling.common.service.impl.CommonVO;
import egovframework.counseling.permission.service.PermissionService;

@Service("permissionService")
public class PermissionServiceImpl extends EgovAbstractServiceImpl implements PermissionService {

	  @Resource(name = "permissionDAO")
	  private PermissionDAO permissionDAO;
	  
	  @Resource(name = "commonService")
	  private CommonService commonService;
	  

	@Override
	public boolean reqPermission(PermissionReqVO permissionReqVO){
		

		return permissionDAO.insertPermissionReq(permissionReqVO);
	}



	 public List<PermissionReqVO> selectPermissionRequest(PermissionReqVO permissionReqVO) {
		    List<PermissionReqVO> result = this.permissionDAO.selectPermissionRequest(permissionReqVO);
		    for (int i = 0; i < result.size(); i++) {
		      CommonVO cmmonVO = new CommonVO();
		      cmmonVO.setComnCd("roleList");
		      cmmonVO.setComnCdVal(((PermissionReqVO)result.get(i)).getAthrCd());
		      ((PermissionReqVO)result.get(i)).setAthrNm(((CommonVO)this.commonService.selectCommonCode(cmmonVO).get(0)).getComnCdValNm());
		    } 
		    return result;
		  }
	
	@Override
	public boolean updatePermission(PermissionReqVO permissionReqVO){
		
		
		return permissionDAO.updatePermission(permissionReqVO);
	}
	
	
	

	

}
