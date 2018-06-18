package com.yan.photographer.service;

import java.text.ParseException;
import java.util.List;

import com.yan.common.service.IService;
import com.yan.model.TPhotographer;

/**
 * 
 * @author yan 2018年3月18日
 *
 */
public interface IPhotographerService extends IService<TPhotographer> {

	List<String> selectByStartEnd(String start, String end) throws IllegalArgumentException, ParseException;
}
