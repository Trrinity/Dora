package com.yan.photographer.service;


import com.yan.common.service.IService;
import com.yan.model.TSchedule;
import com.yan.vo.ScheduleVO;

/**
 * 
 * @author yan 2018年3月18日
 *
 */
public interface IScheduleService extends IService<TSchedule> {

	ScheduleVO getScheduleByPhotographerId(Integer photoer_id, String year, String month);
	

}
