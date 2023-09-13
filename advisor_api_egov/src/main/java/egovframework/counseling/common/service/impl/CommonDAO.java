package egovframework.counseling.common.service.impl;

import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

@Repository
public class CommonDAO {

	
	@Resource(name = "commonMapper")
	private CommonMapper commonMapper;

	public List<CommonVO> selectAgencyList() throws Exception {
		return commonMapper.selectAgency();
	}
	

	public List<CommonVO> selectCommonData(CommonVO CommonVO) throws Exception {
		
		return commonMapper.selectCommonData(CommonVO);
	}


}
