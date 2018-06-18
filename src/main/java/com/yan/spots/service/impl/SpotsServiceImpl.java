package com.yan.spots.service.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.yan.common.service.BaseService;
import com.yan.model.TSpots;
import com.yan.spots.service.ISpotsService;

import tk.mybatis.mapper.entity.Example;

/**
 * 
 * @author yan 2018年3月18日
 *
 */
@Service(value = "spotsService")
public class SpotsServiceImpl extends BaseService<TSpots> implements ISpotsService {

	@Override
	public List<TSpots> getAllSpots() {
		Example example = new Example(TSpots.class);
		example.createCriteria().andCondition("status=",0);
		
		return mapper.selectByExample(example);
	}

	
}
