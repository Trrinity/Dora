package com.yan.spots.service;

import java.util.List;

import com.yan.common.service.IService;
import com.yan.model.TSpots;

/**
 * 
 * @author hzc 2017年2月12日
 *
 */
public interface ISpotsService extends IService<TSpots> {
	
	List<TSpots> getAllSpots();
}
