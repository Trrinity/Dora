package com.yan.photographer.service;

import java.util.List;
import java.util.Map;

import com.yan.common.service.IService;
import com.yan.model.TWorks;
import com.yan.vo.WorksVO;

/**
 * 
 * @author yan 2018年3月18日
 *
 */
public interface IWorksService extends IService<TWorks> {

	List<Map<String,Object>> getWorksByPhotographerId(Integer id);

	WorksVO getWorks(Integer id);
	

	
}
