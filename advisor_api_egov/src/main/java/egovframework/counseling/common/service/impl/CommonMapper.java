package egovframework.counseling.common.service.impl;


import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;


@Mapper("commonMapper")
public interface CommonMapper  {


    public List<CommonVO> selectAgency() throws Exception;

    public List<CommonVO> selectCommonData(CommonVO commonVO) throws Exception;
    
}

