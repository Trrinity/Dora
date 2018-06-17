package com.yan.admin.service;

import com.yan.common.service.IService;
import com.yan.model.TAdmin;

/**
 *
 * @author yan 2018年3月19日
 *
 */
public interface IAdminService extends IService<TAdmin> {
	
	TAdmin login(TAdmin admin);

}
